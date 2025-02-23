#include <stdio.h>
#include <math.h>
#include <string.h>
#include "pico/stdlib.h"
#include "hardware/adc.h"
#include "hardware/dma.h"
#include "hardware/i2c.h"
#include "hardware/pwm.h"
#include "hardware/clocks.h"
#include "inc/ssd1306.h"
#include "neopixel.c"
#include "pico/cyw43_arch.h"
#include "lwip/tcp.h"

// Pino e canal do microfone no ADC
#define MIC_CHANNEL 2
#define MIC_PIN (26 + MIC_CHANNEL)

// Parâmetros e macros do ADC
#define ADC_CLOCK_DIV 96.f
#define SAMPLES 200
#define ADC_ADJUST(x) (x * 3.3f / (1 << 12u) - 1.65f)
#define ADC_MAX 3.3f
#define ADC_STEP (3.3f/20.f) // Ajustado para maior sensibilidade

// Pino e número de LEDs da matriz
#define LED_PIN 7
#define LED_COUNT 25

// Configuração do buzzer
#define BUZZER_PIN 21
#define BUZZER_FREQUENCY 1000

// Pinos I2C para o display OLED
const uint I2C_SDA = 14;
const uint I2C_SCL = 15;

#define abs(x) ((x < 0) ? (-x) : (x))

// Canal e configurações do DMA
uint dma_channel;
dma_channel_config dma_cfg;

// Buffer de amostras do ADC
uint16_t adc_buffer[SAMPLES];

// Buffer para o display OLED
uint8_t display_buffer[ssd1306_buffer_length];

// Configurações WiFi
#define WIFI_SSID "VIVOFIBRA-EED1"
#define WIFI_PASS "vJWRHC9B66"
#define SERVER_IP "192.168.15.13"  // IP do seu computador na rede local
#define SERVER_PORT 8080

void sample_mic();
float mic_power();
uint8_t get_intensity(float v);
void clear_display();
void show_message(const char* line1, const char* line2);
void send_alert(const char* message);

// Função para inicializar o PWM no pino do buzzer
void pwm_init_buzzer(uint pin) {
    gpio_set_function(pin, GPIO_FUNC_PWM);
    uint slice = pwm_gpio_to_slice_num(pin);
    
    pwm_config config = pwm_get_default_config();
    pwm_config_set_wrap(&config, 4095);  // Define o valor máximo do contador
    pwm_config_set_clkdiv(&config, clock_get_hz(clk_sys) / (BUZZER_FREQUENCY * 4096)); // Divisor de clock
    
    pwm_init(slice, &config, true);
}

// Função para ativar o buzzer
void buzzer_on(uint pin) {
    uint slice = pwm_gpio_to_slice_num(pin);
    pwm_set_gpio_level(pin, 2048); // 50% duty cycle
    pwm_set_enabled(slice, true);
}

// Função para desativar o buzzer
void buzzer_off(uint pin) {
    uint slice = pwm_gpio_to_slice_num(pin);
    pwm_set_enabled(slice, false);
}

// Função para enviar alerta via HTTP POST
void send_alert(const char* message) {
    // Verifica se o WiFi está conectado
    if (!cyw43_wifi_link_status(&cyw43_state, CYW43_ITF_STA)) {
        printf("WiFi desconectado! Tentando reconectar...\n");
        
        // Tenta reconectar
        while (cyw43_arch_wifi_connect_timeout_ms(WIFI_SSID, WIFI_PASS, CYW43_AUTH_WPA2_AES_PSK, 30000)) {
            printf("Falha ao reconectar. Tentando novamente...\n");
            sleep_ms(1000);
        }
        printf("WiFi reconectado!\n");
    }

    printf("Iniciando envio de alerta...\n");
    
    struct tcp_pcb *pcb = tcp_new();
    if (!pcb) {
        printf("Falha ao criar PCB TCP\n");
        return;
    }
    printf("PCB TCP criado com sucesso\n");

    ip_addr_t server_ip;
    if (!ipaddr_aton(SERVER_IP, &server_ip)) {
        printf("Falha ao converter IP %s\n", SERVER_IP);
        tcp_close(pcb);
        return;
    }
    printf("IP convertido com sucesso: %s\n", SERVER_IP);

    printf("Tentando conectar ao servidor %s:%d...\n", SERVER_IP, SERVER_PORT);
    err_t err = tcp_connect(pcb, &server_ip, SERVER_PORT, NULL);
    if (err != ERR_OK) {
        printf("Falha ao conectar ao servidor: %d\n", err);
        tcp_close(pcb);
        return;
    }
    printf("Conectado ao servidor!\n");

    // Cria a requisição HTTP POST
    char request[512];
    snprintf(request, sizeof(request),
        "POST / HTTP/1.1\r\n"
        "Host: %s\r\n"
        "Content-Type: text/plain\r\n"
        "Content-Length: %d\r\n"
        "Connection: keep-alive\r\n"  // Mantém a conexão aberta
        "\r\n"
        "%s",
        SERVER_IP, strlen(message), message);
    
    printf("Enviando requisição:\n%s\n", request);

    // Envia os dados
    err = tcp_write(pcb, request, strlen(request), TCP_WRITE_FLAG_COPY);
    if (err != ERR_OK) {
        printf("Falha ao enviar dados: %d\n", err);
        tcp_close(pcb);
        return;
    }
    printf("Dados escritos com sucesso\n");

    err = tcp_output(pcb);
    if (err != ERR_OK) {
        printf("Falha ao enviar pacote: %d\n", err);
    } else {
        printf("Pacote enviado com sucesso\n");
    }

    // Aguarda mais tempo para garantir que os dados foram enviados e processados
    sleep_ms(500);  // Aumentado para 500ms

    // Fecha a conexão
    tcp_close(pcb);
    printf("Conexão fechada\n");
    printf("Alerta enviado com sucesso!\n");
}

int main() {
    stdio_init_all();
    sleep_ms(10000);  // Espera 10 segundos para inicializar tudo
    printf("\nIniciando sistema...\n");

    // Inicializa WiFi
    printf("Inicializando WiFi...\n");
    if (cyw43_arch_init()) {
        printf("Falha ao inicializar WiFi\n");
        return 1;
    }
    cyw43_arch_enable_sta_mode();

    // Tenta conectar ao WiFi até conseguir
    printf("Conectando ao WiFi %s...\n", WIFI_SSID);
    while (cyw43_arch_wifi_connect_timeout_ms(WIFI_SSID, WIFI_PASS, CYW43_AUTH_WPA2_AES_PSK, 30000)) {
        printf("Falha ao conectar ao WiFi. Tentando novamente...\n");
        sleep_ms(1000);
    }
    
    // Mostra o IP que recebemos
    const ip4_addr_t *ip = netif_ip4_addr(netif_default);
    printf("WiFi conectado! IP: %d.%d.%d.%d\n", 
           ip4_addr1(ip), ip4_addr2(ip), 
           ip4_addr3(ip), ip4_addr4(ip));

    // Inicializa matriz de LEDs
    printf("Preparando NeoPixel...\n");
    npInit(LED_PIN, LED_COUNT);

    // Inicializa o buzzer
    printf("Preparando Buzzer...\n");
    gpio_init(BUZZER_PIN);
    gpio_set_dir(BUZZER_PIN, GPIO_OUT);
    pwm_init_buzzer(BUZZER_PIN);
    buzzer_off(BUZZER_PIN); // Garante que o buzzer começa desligado

    // Inicializa I2C para o display OLED
    printf("Preparando Display OLED...\n");
    i2c_init(i2c1, ssd1306_i2c_clock * 1000);
    gpio_set_function(I2C_SDA, GPIO_FUNC_I2C);
    gpio_set_function(I2C_SCL, GPIO_FUNC_I2C);
    gpio_pull_up(I2C_SDA);
    gpio_pull_up(I2C_SCL);

    // Processo de inicialização completo do OLED SSD1306
    ssd1306_init();

    // Preparar área de renderização para o display
    struct render_area frame_area = {
        start_column : 0,
        end_column : ssd1306_width - 1,
        start_page : 0,
        end_page : ssd1306_n_pages - 1
    };
    calculate_render_area_buffer_length(&frame_area);

    // Limpa o display e mostra mensagem inicial
    memset(display_buffer, 0, ssd1306_buffer_length);
    render_on_display(display_buffer, &frame_area);
    sleep_ms(100);

    ssd1306_draw_string(display_buffer, 5, 5, "Sistema de");
    ssd1306_draw_string(display_buffer, 5, 20, "Seguranca Ativo");
    render_on_display(display_buffer, &frame_area);
    sleep_ms(100);

    // Preparação do ADC
    printf("Preparando ADC...\n");
    adc_gpio_init(MIC_PIN);
    adc_init();
    adc_select_input(MIC_CHANNEL);

    adc_fifo_setup(
        true,    // Habilita FIFO
        true,    // Habilita DMA request
        1,       // Threshold DMA
        false,   // Sem bit de erro
        false    // Mantém 12-bits
    );

    adc_set_clkdiv(ADC_CLOCK_DIV);
    printf("ADC Configurado!\n");

    // Configuração do DMA
    printf("Preparando DMA...\n");
    dma_channel = dma_claim_unused_channel(true);
    dma_cfg = dma_channel_get_default_config(dma_channel);

    channel_config_set_transfer_data_size(&dma_cfg, DMA_SIZE_16);
    channel_config_set_read_increment(&dma_cfg, false);
    channel_config_set_write_increment(&dma_cfg, true);
    channel_config_set_dreq(&dma_cfg, DREQ_ADC);

    printf("Configurações completas!\n");

    bool alert_shown = false;
    bool alert_locked = false;
    bool alert_sent = false;
    uint8_t last_intensity = 0;
    
    while (true) {
        // Se o alerta estiver travado, mantem os LEDs vermelhos e o buzzer ativo
        if (alert_locked) {
            // Mantém todos os LEDs vermelhos
            for(int i = 0; i < LED_COUNT; i++) {
                npSetLED(i, 80, 0, 0);
            }
            npWrite();
            buzzer_on(BUZZER_PIN);
            sleep_ms(500);
            buzzer_off(BUZZER_PIN);
            sleep_ms(500);

            // Envia o alerta apenas uma vez
            if (!alert_sent) {
                char alert_message[100];
                snprintf(alert_message, sizeof(alert_message), 
                    "Som suspeito detectado! Nivel: %d", last_intensity);
                send_alert(alert_message);
                alert_sent = true;
                printf("Alerta enviado!\n");
            }

            continue;
        }

        // Realiza uma amostragem do microfone
        sample_mic();

        // Calcula a potência média da amostragem
        float avg = mic_power();
        avg = 2.f * abs(ADC_ADJUST(avg));

        uint8_t intensity = get_intensity(avg);

        // Limpa a matriz
        npClear();

        // Define as cores baseadas na intensidade
        uint8_t r = 0, g = 0, b = 0;
        
        if (intensity > 0) {
            if (intensity <= 7) {
                // Som leve - Branco
                r = g = b = 80;
                if (alert_shown) {
                    alert_shown = false;
                    memset(display_buffer, 0, ssd1306_buffer_length);
                    ssd1306_draw_string(display_buffer, 5, 5, "Sistema de");
                    ssd1306_draw_string(display_buffer, 5, 20, "Seguranca Ativo");
                    render_on_display(display_buffer, &frame_area);
                }
            } else if (intensity <= 14) {
                // Som médio - Amarelo
                r = g = 80;
                b = 0;
                if (alert_shown) {
                    alert_shown = false;
                    memset(display_buffer, 0, ssd1306_buffer_length);
                    ssd1306_draw_string(display_buffer, 5, 5, "Sistema de");
                    ssd1306_draw_string(display_buffer, 5, 20, "Seguranca Ativo");
                    render_on_display(display_buffer, &frame_area);
                }
            } else {
                // Som alto - Vermelho e trava o alerta
                r = 80;
                g = b = 0;
                if (!alert_shown) {
                    alert_shown = true;
                    alert_locked = true;  // Trava o alerta
                    alert_sent = false;   // Reseta o controle de envio
                    buzzer_on(BUZZER_PIN); // Ativa o buzzer quando detecta som alto
                    memset(display_buffer, 0, ssd1306_buffer_length);
                    ssd1306_draw_string(display_buffer, 5, 5, "Som Suspeito");
                    ssd1306_draw_string(display_buffer, 5, 20, "Detectado!");
                    render_on_display(display_buffer, &frame_area);
                }
            }

            // Acende todos os LEDs com a cor correspondente
            for(int i = 0; i < LED_COUNT; i++) {
                npSetLED(i, r, g, b);
            }
        }

        // Atualiza a matriz
        npWrite();

        // Debug via serial
        printf("Intensidade: %d, Valor: %.4f, Travado: %d\n", intensity, avg, alert_locked);
        last_intensity = intensity;
        
        sleep_ms(10); // Pequeno delay para estabilidade
    }
}

void sample_mic() {
    adc_fifo_drain();
    adc_run(false);

    dma_channel_configure(dma_channel, &dma_cfg,
        adc_buffer,
        &(adc_hw->fifo),
        SAMPLES,
        true
    );

    adc_run(true);
    dma_channel_wait_for_finish_blocking(dma_channel);
    adc_run(false);
}

float mic_power() {
    float avg = 0.f;
    for (uint i = 0; i < SAMPLES; ++i) {
        avg += adc_buffer[i] * adc_buffer[i];
    }
    avg /= SAMPLES;
    return sqrt(avg);
}

uint8_t get_intensity(float v) {
    uint count = 0;
    while ((v -= ADC_STEP) > 0.f) {
        ++count;
    }
    return count;
}
