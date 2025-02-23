# == DO NOT EDIT THE FOLLOWING LINES for the Raspberry Pi Pico VS Code Extension to work ==
if(WIN32)
    set(USERHOME $ENV{USERPROFILE})
else()
    set(USERHOME $ENV{HOME})
endif()
set(sdkVersion 1.5.1)
set(toolchainVersion 13_3_Rel1)
set(picotoolVersion 2.1.0)
set(picoVscode ${USERHOME}/.pico-sdk/cmake/pico-vscode.cmake)
if (EXISTS ${picoVscode})
    include(${picoVscode})
endif()
# ====================================================================================

cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Define o caminho do SDK
set(PICO_SDK_PATH ${CMAKE_CURRENT_SOURCE_DIR}/../pico-sdk)

set(PICO_BOARD pico_w CACHE STRING "Board type")

include(pico_sdk_import.cmake)

project(microphone_matrix C CXX ASM)

pico_sdk_init()

add_executable(microphone_matrix
    microphone_matrix.c
    inc/ssd1306_i2c.c
)

target_include_directories(microphone_matrix PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}
    ${CMAKE_CURRENT_LIST_DIR}/inc
)

pico_generate_pio_header(microphone_matrix ${CMAKE_CURRENT_LIST_DIR}/ws2818b.pio)

target_link_libraries(microphone_matrix 
    pico_stdlib 
    hardware_adc 
    hardware_dma
    hardware_pio
    hardware_i2c
    hardware_pwm
    pico_cyw43_arch_lwip_threadsafe_background
)

pico_enable_stdio_usb(microphone_matrix 1)
pico_enable_stdio_uart(microphone_matrix 1)

pico_add_extra_outputs(microphone_matrix)
