# Sistema de Segurança com Raspberry Pi Pico W

Este projeto implementa um sistema de segurança usando um Raspberry Pi Pico W que detecta sons suspeitos e envia alertas via WiFi.

## Componentes

- Raspberry Pi Pico W
- Matriz de LEDs WS2812B (NeoPixel)
- Microfone analógico
- Buzzer
- Display OLED (SSD1306)

## Funcionalidades

1. **Detecção de Som**
   - Monitora continuamente o ambiente usando um microfone analógico
   - Detecta sons acima de um limiar configurável
   - Usa ADC (Analog-to-Digital Converter) para leitura do microfone

2. **Feedback Visual**
   - Matriz de LEDs WS2812B controlada via PIO (Programmable I/O)
   - LEDs acendem em vermelho quando um som suspeito é detectado
   - Display OLED mostra informações do sistema em tempo real

3. **Alerta Sonoro**
   - Buzzer ativa quando um som suspeito é detectado
   - Controlado via PWM para gerar tons de alerta

4. **Comunicação WiFi**
   - Conecta-se automaticamente à rede WiFi configurada
   - Envia alertas via HTTP POST para um servidor
   - Reconecta automaticamente se perder a conexão

5. **Servidor de Alertas**
   - Servidor Python que recebe e registra os alertas
   - Salva logs em arquivo com timestamp
   - Interface HTTP simples para monitoramento

## Configuração

1. Configure as credenciais WiFi em `microphone_matrix.c`:
   ```c
   #define WIFI_SSID "seu_wifi"
   #define WIFI_PASS "sua_senha"
   #define SERVER_IP "ip_do_servidor"
   #define SERVER_PORT 8080
   ```

2. Compile o projeto:
   ```bash
   mkdir build
   cd build
   cmake ..
   make
   ```

3. Carregue o arquivo `build/microphone_matrix.uf2` na Pico W

4. Inicie o servidor:
   ```bash
   python3 alert_server.py
   ```

## Tecnologias Utilizadas

- **PIO (Programmable I/O)**
  - Controle preciso dos LEDs WS2812B
  - Timing crítico para comunicação com NeoPixels

- **DMA (Direct Memory Access)**
  - Transferência eficiente de dados para PIO
  - Reduz overhead do CPU

- **WiFi (CYW43)**
  - Comunicação sem fio via chip CYW43
  - Stack TCP/IP leve (lwIP)

- **Periféricos**
  - ADC para leitura do microfone
  - I2C para display OLED
  - PWM para buzzer
  - PIO para LEDs

## Estrutura do Projeto

```
sistema_seguranca/
├── microphone_matrix.c    # Código principal
├── alert_server.py        # Servidor de alertas
├── ws2818b.pio           # Programa PIO para LEDs
├── inc/                   # Bibliotecas
│   └── ssd1306_i2c.c     # Driver do display OLED
├── CMakeLists.txt        # Configuração do build
└── README.md             # Este arquivo
```

## Autor
Pedro Henrique Muniz de Oliveira
