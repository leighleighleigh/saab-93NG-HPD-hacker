EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L local_symbols:Conn_02x06_SAAB_SID_HPD ICM1
U 1 1 5E210180
P 1400 1400
F 0 "ICM1" H 1400 1865 50  0000 C CNN
F 1 "ICM_CONN" H 1400 1774 50  0000 C CNN
F 2 "sid-board:SAAB_SID_CONNECTOR_HEADER" H 1150 1400 50  0001 C CNN
F 3 "~" H 1150 1400 50  0001 C CNN
	1    1400 1400
	1    0    0    -1  
$EndComp
$Comp
L local_symbols:Conn_02x06_SAAB_SID_HPD SID1
U 1 1 5E211BEE
P 1400 2400
F 0 "SID1" H 1400 2865 50  0000 C CNN
F 1 "SID_CONN" H 1400 2774 50  0000 C CNN
F 2 "sid-board:SAAB_SID_CONNECTOR_HEADER" H 1150 2400 50  0001 C CNN
F 3 "~" H 1150 2400 50  0001 C CNN
	1    1400 2400
	1    0    0    -1  
$EndComp
Text GLabel 1050 1900 2    50   Input ~ 0
VIN
Text GLabel 1050 2050 2    50   Input ~ 0
GND
Wire Wire Line
	950  1700 700  1700
Wire Wire Line
	700  1700 700  2700
Wire Wire Line
	700  2700 950  2700
Wire Wire Line
	950  2400 650  2400
Wire Wire Line
	650  2400 650  1400
Wire Wire Line
	650  1400 950  1400
Text GLabel 3350 1050 2    50   Input ~ 0
GND
Text GLabel 3350 2200 2    50   Input ~ 0
GND
Wire Wire Line
	4800 1800 4850 1800
Wire Wire Line
	4800 1900 4850 1900
Text GLabel 10250 6100 2    50   Input ~ 0
GND
Text GLabel 9750 6100 0    50   Input ~ 0
VDD_3.3V
Text GLabel 4800 1900 0    50   Input ~ 0
GND
Text GLabel 4800 1800 0    50   Input ~ 0
VDD_3.3V
$Comp
L Device:R_Small R1
U 1 1 5E32A99C
P 6000 2500
F 0 "R1" H 6059 2546 50  0000 L CNN
F 1 "1K" H 6059 2455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 2500 50  0001 C CNN
F 3 "~" H 6000 2500 50  0001 C CNN
	1    6000 2500
	1    0    0    -1  
$EndComp
Text GLabel 6000 2600 0    50   Input ~ 0
VDD_3.3V
Text GLabel 3800 5000 2    50   Input ~ 0
VDD_3.3V
$Comp
L Regulator_Linear:MCP1703A-3302_SOT223 U2
U 1 1 5E2845BD
P 3300 5000
F 0 "U2" H 3300 5242 50  0000 C CNN
F 1 "MCP1703A-3302_SOT223" H 3300 5151 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 3300 5200 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20005122B.pdf" H 3300 4950 50  0001 C CNN
	1    3300 5000
	1    0    0    -1  
$EndComp
Text Notes 3000 4700 0    50   ~ 10
3.3V SUPPLY LDO
Text GLabel 4850 1600 0    50   Input ~ 0
XTAL1
Text GLabel 4850 1500 0    50   Input ~ 0
VDD_3.3V
Wire Notes Line
	2250 850  2250 2950
Wire Notes Line
	550  2950 550  850 
Text Notes 600  800  0    50   ~ 0
SID & ICM\nCONNECTORS
Text GLabel 4850 1400 0    50   Input ~ 0
RXA
Text GLabel 4850 1300 0    50   Input ~ 0
TXA
Text GLabel 6000 1700 2    50   Input ~ 0
GND
Text GLabel 6000 1600 2    50   Input ~ 0
TXB
Text GLabel 6000 1500 2    50   Input ~ 0
RXB
Text Notes 2450 800  0    50   ~ 0
CAN INTERFACE
Text GLabel 4850 2400 3    50   Input ~ 0
GND
Wire Notes Line
	6400 2800 6400 850 
Text Notes 4300 800  0    50   ~ 0
DUAL UART to SPI INTERFACE
Text Notes 6500 3100 0    50   ~ 0
OSCILLATOR
Text GLabel 6550 2700 3    50   Input ~ 0
XTAL1
Text GLabel 7500 2400 3    50   Input ~ 0
GND
$Comp
L Device:LED D1
U 1 1 5E524EBA
P 6850 1100
F 0 "D1" H 6843 845 50  0000 C CNN
F 1 "LED7" H 6843 936 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 1100 50  0001 C CNN
F 3 "~" H 6850 1100 50  0001 C CNN
	1    6850 1100
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 5E52A67D
P 6850 1200
F 0 "D2" H 6843 945 50  0000 C CNN
F 1 "LED6" H 6843 1036 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 1200 50  0001 C CNN
F 3 "~" H 6850 1200 50  0001 C CNN
	1    6850 1200
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D3
U 1 1 5E52A91D
P 6850 1300
F 0 "D3" H 6843 1045 50  0000 C CNN
F 1 "LED5" H 6843 1136 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 1300 50  0001 C CNN
F 3 "~" H 6850 1300 50  0001 C CNN
	1    6850 1300
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D4
U 1 1 5E52ACF3
P 6850 1400
F 0 "D4" H 6843 1145 50  0000 C CNN
F 1 "LED4" H 6843 1236 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 1400 50  0001 C CNN
F 3 "~" H 6850 1400 50  0001 C CNN
	1    6850 1400
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D5
U 1 1 5E52AFBB
P 6850 1800
F 0 "D5" H 6843 1545 50  0000 C CNN
F 1 "LED3" H 6843 1636 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 1800 50  0001 C CNN
F 3 "~" H 6850 1800 50  0001 C CNN
	1    6850 1800
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D6
U 1 1 5E52B30B
P 6850 1900
F 0 "D6" H 6843 1645 50  0000 C CNN
F 1 "LED2" H 6843 1736 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 1900 50  0001 C CNN
F 3 "~" H 6850 1900 50  0001 C CNN
	1    6850 1900
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D7
U 1 1 5E52B635
P 6850 2000
F 0 "D7" H 6843 1745 50  0000 C CNN
F 1 "LED1" H 6843 1836 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 2000 50  0001 C CNN
F 3 "~" H 6850 2000 50  0001 C CNN
	1    6850 2000
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D8
U 1 1 5E52B939
P 6850 2100
F 0 "D8" H 6843 1845 50  0000 C CNN
F 1 "LED0" H 6843 1936 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 2100 50  0001 C CNN
F 3 "~" H 6850 2100 50  0001 C CNN
	1    6850 2100
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R18
U 1 1 5E53B9FC
P 7100 1600
F 0 "R18" H 7159 1646 50  0000 L CNN
F 1 "1K" H 7159 1555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7100 1600 50  0001 C CNN
F 3 "~" H 7100 1600 50  0001 C CNN
	1    7100 1600
	0    -1   -1   0   
$EndComp
Text GLabel 7200 1600 3    50   Input ~ 0
GND
Connection ~ 7000 1200
Wire Wire Line
	7000 1200 7000 1100
Connection ~ 7000 1300
Wire Wire Line
	7000 1300 7000 1200
Wire Wire Line
	7000 1400 7000 1300
Connection ~ 7000 1900
Wire Wire Line
	7000 1900 7000 1800
Connection ~ 7000 2000
Wire Wire Line
	7000 2000 7000 1900
Wire Wire Line
	7000 2100 7000 2000
Wire Notes Line
	6450 850  7350 850 
Wire Notes Line
	7350 2250 6450 2250
Wire Notes Line
	6450 2250 6450 850 
Text Notes 6450 800  0    50   ~ 0
GPIO LED OUTPUT
Text GLabel 4850 2300 0    50   Input ~ 0
CLK
Text GLabel 4850 2200 0    50   Input ~ 0
MISO
Text GLabel 4850 2100 0    50   Input ~ 0
MOSI
Text GLabel 4850 2000 0    50   Input ~ 0
CS
Text GLabel 9750 6000 0    50   Input ~ 0
CLK
Text GLabel 9750 5900 0    50   Input ~ 0
MISO
Text GLabel 9750 5800 0    50   Input ~ 0
MOSI
Text GLabel 9750 5700 0    50   Input ~ 0
CS
$Comp
L Connector_Generic:Conn_02x05_Counter_Clockwise J1
U 1 1 5E4709DB
P 9950 5900
F 0 "J1" H 10000 6217 50  0000 C CNN
F 1 "SPI + UART" H 10000 6126 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_2x05_P1.00mm_Vertical" H 9950 5900 50  0001 C CNN
F 3 "~" H 9950 5900 50  0001 C CNN
	1    9950 5900
	1    0    0    -1  
$EndComp
Text GLabel 6000 2400 2    50   Input ~ 0
IRQ
Wire Notes Line
	4300 850  6400 850 
$Comp
L local_symbols:S53305-16.000-X X1
U 1 1 5E7AFB1C
P 7050 2600
F 0 "X1" H 7050 2450 50  0000 C CNN
F 1 "S53305-24.000-X" H 7050 2550 50  0000 C CNN
F 2 "sid-board:S53305-16.000-X" H 7050 2600 50  0001 C CNN
F 3 "" H 7050 2600 50  0001 C CNN
	1    7050 2600
	-1   0    0    1   
$EndComp
Text GLabel 6550 2400 3    50   Input ~ 0
VDD_3.3V
Text GLabel 7500 2700 3    50   Input ~ 0
VDD_3.3V
Wire Notes Line
	6450 2300 7600 2300
Wire Notes Line
	7600 2300 7600 3150
Wire Notes Line
	7600 3150 6450 3150
Wire Notes Line
	6450 3150 6450 2300
Text GLabel 3750 1450 2    50   Input ~ 0
RXA
Text GLabel 3750 1550 2    50   Input ~ 0
TXA
Text GLabel 3750 2600 2    50   Input ~ 0
RXB
Text GLabel 3750 2700 2    50   Input ~ 0
TXB
$Comp
L Interface_CAN_LIN:SN65HVD232 U3
U 1 1 5F341EE8
P 3350 1450
F 0 "U3" H 3350 1931 50  0000 C CNN
F 1 "SN65HVD232" H 3350 1840 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3350 950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn65hvd230.pdf" H 3250 1850 50  0001 C CNN
	1    3350 1450
	-1   0    0    1   
$EndComp
Text GLabel 3350 1750 0    50   Input ~ 0
VDD_3.3V
Text GLabel 3350 2900 0    50   Input ~ 0
VDD_3.3V
Text GLabel 1850 1500 2    50   Input ~ 0
CAN_A_L
Text GLabel 2950 1350 0    50   Input ~ 0
CAN_A_L
Text GLabel 2950 1450 0    50   Input ~ 0
CAN_A_H
Text GLabel 1850 1400 2    50   Input ~ 0
CAN_A_H
Text GLabel 1850 2400 2    50   Input ~ 0
CAN_B_H
Text GLabel 1850 2500 2    50   Input ~ 0
CAN_B_L
Text GLabel 2950 2500 0    50   Input ~ 0
CAN_B_L
Text GLabel 2950 2600 0    50   Input ~ 0
CAN_B_H
$Comp
L Switch:SW_Push SW1
U 1 1 5F3DA732
P 6650 5800
F 0 "SW1" H 6650 6085 50  0000 C CNN
F 1 "SW_EN" H 6650 5994 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_SPST_NO_Alps_SKRK" H 6650 6000 50  0001 C CNN
F 3 "~" H 6650 6000 50  0001 C CNN
	1    6650 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5F3DB8C4
P 7150 5800
F 0 "R4" V 6954 5800 50  0000 C CNN
F 1 "1k" V 7045 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 5800 50  0001 C CNN
F 3 "~" H 7150 5800 50  0001 C CNN
	1    7150 5800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5F3DC1F8
P 6950 5800
F 0 "R2" V 6754 5800 50  0000 C CNN
F 1 "470" V 6845 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6950 5800 50  0001 C CNN
F 3 "~" H 6950 5800 50  0001 C CNN
	1    6950 5800
	0    1    1    0   
$EndComp
$Comp
L RF_Module:ESP32-WROOM-32U U6
U 1 1 5F3FAEB2
P 5300 5050
F 0 "U6" H 5300 6631 50  0000 C CNN
F 1 "ESP32-WROOM-32U" H 5300 6540 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32U" H 5300 3550 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 5000 5100 50  0001 C CNN
	1    5300 5050
	1    0    0    -1  
$EndComp
Text GLabel 6000 3650 2    50   Input ~ 0
GND
Wire Wire Line
	5300 3650 5800 3650
Text GLabel 5300 6450 2    50   Input ~ 0
GND
Text GLabel 7250 5800 2    50   Input ~ 0
VDD_3.3V
Text GLabel 6450 5800 0    50   Input ~ 0
GND
Text GLabel 7050 5800 1    50   Input ~ 0
EN
Text GLabel 4700 3850 0    50   Input ~ 0
EN
$Comp
L Switch:SW_Push SW2
U 1 1 5F41B4C9
P 6650 6200
F 0 "SW2" H 6650 6485 50  0000 C CNN
F 1 "SW_FLASH" H 6650 6394 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_SPST_NO_Alps_SKRK" H 6650 6400 50  0001 C CNN
F 3 "~" H 6650 6400 50  0001 C CNN
	1    6650 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5F41B4CF
P 7150 6200
F 0 "R5" V 6954 6200 50  0000 C CNN
F 1 "1k" V 7045 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 6200 50  0001 C CNN
F 3 "~" H 7150 6200 50  0001 C CNN
	1    7150 6200
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5F41B4D5
P 6950 6200
F 0 "R3" V 6754 6200 50  0000 C CNN
F 1 "470" V 6845 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6950 6200 50  0001 C CNN
F 3 "~" H 6950 6200 50  0001 C CNN
	1    6950 6200
	0    1    1    0   
$EndComp
Text GLabel 7250 6200 2    50   Input ~ 0
VDD_3.3V
Text GLabel 6450 6200 0    50   Input ~ 0
GND
Text GLabel 7050 6200 1    50   Input ~ 0
IO0
Text GLabel 5900 3850 2    50   Input ~ 0
IO0
$Comp
L Connector:USB_B_Micro J2
U 1 1 5F431498
P 10150 4050
F 0 "J2" H 10207 4517 50  0000 C CNN
F 1 "USB_B_Micro" H 10207 4426 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Molex-105017-0001" H 10300 4000 50  0001 C CNN
F 3 "~" H 10300 4000 50  0001 C CNN
	1    10150 4050
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N5819 D10
U 1 1 5F43801F
P 9050 4400
F 0 "D10" H 9050 4184 50  0000 C CNN
F 1 "1N5819" H 9050 4275 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 9050 4225 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88525/1n5817.pdf" H 9050 4400 50  0001 C CNN
	1    9050 4400
	0    -1   -1   0   
$EndComp
Text GLabel 9050 4550 3    50   Input ~ 0
VIN
Text GLabel 10250 3650 1    50   Input ~ 0
GND
Wire Wire Line
	10250 3650 10150 3650
$Comp
L Device:LED_Small D9
U 1 1 5F455DEF
P 6450 4050
F 0 "D9" H 6450 3845 50  0000 C CNN
F 1 "LED_IO2" H 6450 3936 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6450 4050 50  0001 C CNN
F 3 "~" V 6450 4050 50  0001 C CNN
	1    6450 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R6
U 1 1 5F457718
P 6250 4050
F 0 "R6" V 6054 4050 50  0000 C CNN
F 1 "470" V 6145 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6250 4050 50  0001 C CNN
F 3 "~" H 6250 4050 50  0001 C CNN
	1    6250 4050
	0    1    1    0   
$EndComp
Text GLabel 6550 4050 2    50   Input ~ 0
GND
Wire Wire Line
	6150 4050 5900 4050
Text GLabel 3150 3400 2    50   Input ~ 0
GND
Text GLabel 3550 3800 2    50   Input ~ 0
RX_ESP32_CAN
Text GLabel 3550 3900 2    50   Input ~ 0
TX_ESP32_CAN
$Comp
L Interface_CAN_LIN:SN65HVD232 U7
U 1 1 5F4AC516
P 3150 3800
F 0 "U7" H 3150 4281 50  0000 C CNN
F 1 "SN65HVD232" H 3150 4190 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3150 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn65hvd230.pdf" H 3050 4200 50  0001 C CNN
	1    3150 3800
	-1   0    0    1   
$EndComp
Text GLabel 3150 4100 0    50   Input ~ 0
VDD_3.3V
Text GLabel 2750 3700 0    50   Input ~ 0
CAN_L
Text GLabel 2750 3800 0    50   Input ~ 0
CAN_H
Wire Notes Line
	4250 850  4250 4450
Wire Notes Line
	2400 850  2400 4450
Text GLabel 5900 4350 2    50   Input ~ 0
TX_ESP32_CAN
Text GLabel 5900 4250 2    50   Input ~ 0
RX_ESP32_CAN
Wire Notes Line
	2400 850  4250 850 
Wire Notes Line
	2400 4450 4250 4450
Wire Notes Line
	550  850  2250 850 
Wire Notes Line
	550  2950 2250 2950
Wire Notes Line
	6150 6600 4300 6600
Wire Notes Line
	4300 6600 4300 3200
Text Notes 4350 3300 0    50   ~ 0
ESP32 MODULE
Text GLabel 2750 5000 0    50   Input ~ 0
VIN
Wire Wire Line
	2750 5000 3000 5000
$Comp
L Device:C_Small C2
U 1 1 5F3AD68D
P 2750 5250
F 0 "C2" H 2842 5296 50  0000 L CNN
F 1 "1uF" H 2842 5205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 5250 50  0001 C CNN
F 3 "~" H 2750 5250 50  0001 C CNN
	1    2750 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5350 3300 5350
Wire Wire Line
	3300 5350 3300 5300
$Comp
L Device:C_Small C5
U 1 1 5F3B03A3
P 3700 5250
F 0 "C5" H 3792 5296 50  0000 L CNN
F 1 "1uF" H 3792 5205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3700 5250 50  0001 C CNN
F 3 "~" H 3700 5250 50  0001 C CNN
	1    3700 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 5350 3700 5350
Wire Wire Line
	2750 5000 2750 5150
Connection ~ 3300 5350
Wire Wire Line
	3700 5150 3700 5000
Wire Wire Line
	3700 5000 3600 5000
Wire Wire Line
	3700 5000 3800 5000
Connection ~ 3700 5000
Wire Notes Line
	4250 4500 2250 4500
Text GLabel 5300 3650 0    50   Input ~ 0
VDD_3.3V
Wire Notes Line
	4300 2800 6400 2800
Wire Wire Line
	7000 1600 7000 1400
Connection ~ 7000 1400
Wire Wire Line
	7000 1600 7000 1800
Connection ~ 7000 1600
Connection ~ 7000 1800
Wire Wire Line
	6000 1100 6700 1100
Wire Wire Line
	6000 1200 6700 1200
Wire Wire Line
	6000 1300 6700 1300
Wire Wire Line
	6000 1400 6700 1400
Wire Wire Line
	6000 1800 6700 1800
Wire Wire Line
	6000 1900 6700 1900
Wire Wire Line
	6000 2000 6700 2000
Wire Wire Line
	6000 2100 6700 2100
Wire Notes Line
	7350 850  7350 2250
$Comp
L Device:C_Small C6
U 1 1 5F43E696
P 5900 3500
F 0 "C6" V 5671 3500 50  0000 C CNN
F 1 "1uF" V 5762 3500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5900 3500 50  0001 C CNN
F 3 "~" H 5900 3500 50  0001 C CNN
	1    5900 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	6000 3500 6000 3650
Wire Wire Line
	5800 3650 5800 3500
$Comp
L Device:C_Small C3
U 1 1 5F44B61F
P 3250 4100
F 0 "C3" V 3479 4100 50  0000 C CNN
F 1 "1uF" V 3388 4100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3250 4100 50  0001 C CNN
F 3 "~" H 3250 4100 50  0001 C CNN
	1    3250 4100
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5F452337
P 5900 3650
F 0 "C7" V 5671 3650 50  0000 C CNN
F 1 "10uF" V 5762 3650 50  0000 C CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-6032-20_AVX-F_Pad2.25x2.35mm_HandSolder" H 5900 3650 50  0001 C CNN
F 3 "~" H 5900 3650 50  0001 C CNN
	1    5900 3650
	0    1    1    0   
$EndComp
Connection ~ 5800 3650
Text GLabel 3350 4100 2    50   Input ~ 0
GND
$Comp
L Device:C_Small C9
U 1 1 5F462068
P 3450 2900
F 0 "C9" V 3679 2900 50  0000 C CNN
F 1 "1uF" V 3588 2900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3450 2900 50  0001 C CNN
F 3 "~" H 3450 2900 50  0001 C CNN
	1    3450 2900
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5F463FD2
P 3450 1750
F 0 "C8" V 3679 1750 50  0000 C CNN
F 1 "1uF" V 3588 1750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3450 1750 50  0001 C CNN
F 3 "~" H 3450 1750 50  0001 C CNN
	1    3450 1750
	0    -1   -1   0   
$EndComp
Text GLabel 3550 2900 2    50   Input ~ 0
GND
$Comp
L Interface_CAN_LIN:SN65HVD232 U4
U 1 1 5F3722CE
P 3350 2600
F 0 "U4" H 3350 3081 50  0000 C CNN
F 1 "SN65HVD232" H 3350 2990 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3350 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn65hvd230.pdf" H 3250 3000 50  0001 C CNN
	1    3350 2600
	-1   0    0    1   
$EndComp
Text GLabel 3550 1750 2    50   Input ~ 0
GND
Text GLabel 5900 4650 2    50   Input ~ 0
CLK
Text GLabel 5900 4450 2    50   Input ~ 0
MISO
Text GLabel 5900 4550 2    50   Input ~ 0
MOSI
Text GLabel 5900 4750 2    50   Input ~ 0
CS
$Comp
L Transistor_FET:BSS138 Q2
U 1 1 5F4B97ED
P 8850 5850
F 0 "Q2" H 9054 5896 50  0000 L CNN
F 1 "BSS138" H 9054 5805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9050 5775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 8850 5850 50  0001 L CNN
	1    8850 5850
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:BSS138 Q1
U 1 1 5F4B9C1D
P 8200 5850
F 0 "Q1" H 8404 5804 50  0000 L CNN
F 1 "BSS138" H 8404 5895 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8400 5775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 8200 5850 50  0001 L CNN
	1    8200 5850
	0    -1   1    0   
$EndComp
Text GLabel 9050 5950 2    50   Input ~ 0
EN
Text GLabel 8000 5950 0    50   Input ~ 0
IO0
Wire Wire Line
	8400 5950 8400 5650
Wire Wire Line
	8400 5650 8850 5650
Wire Wire Line
	8650 5950 8600 5950
Wire Wire Line
	8600 5950 8600 5600
Wire Wire Line
	8600 5600 8200 5600
Wire Wire Line
	8200 5600 8200 5650
Text GLabel 8850 5650 1    50   Input ~ 0
DTR
Text GLabel 8200 5600 1    50   Input ~ 0
RTS
Text GLabel 7700 4750 3    50   Input ~ 0
RTS
Text GLabel 7900 4750 3    50   Input ~ 0
DTR
Wire Notes Line
	2250 4500 2250 5400
Wire Notes Line
	2250 5400 4250 5400
Wire Notes Line
	4250 5400 4250 4500
$Comp
L Diode:1N5819 D11
U 1 1 5F3915F2
P 900 1900
F 0 "D11" H 900 1684 50  0000 C CNN
F 1 "1N5819" H 900 1775 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 900 1725 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88525/1n5817.pdf" H 900 1900 50  0001 C CNN
	1    900  1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	750  1900 750  1600
Wire Wire Line
	750  1600 950  1600
Wire Wire Line
	750  1900 750  2600
Wire Wire Line
	750  2600 950  2600
Connection ~ 750  1900
Wire Wire Line
	950  1300 600  1300
Wire Wire Line
	600  1300 600  2300
Wire Wire Line
	600  2300 850  2300
Wire Wire Line
	1050 2050 850  2050
Wire Wire Line
	850  2050 850  2300
Connection ~ 850  2300
Wire Wire Line
	850  2300 950  2300
$Comp
L Device:C_Small C1
U 1 1 5F3C3C16
P 4600 2700
F 0 "C1" V 4371 2700 50  0000 C CNN
F 1 "1uF" V 4462 2700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4600 2700 50  0001 C CNN
F 3 "~" H 4600 2700 50  0001 C CNN
	1    4600 2700
	0    1    1    0   
$EndComp
Text GLabel 4700 2700 2    50   Input ~ 0
VDD_3.3V
Text GLabel 4500 2700 0    50   Input ~ 0
GND
Wire Notes Line
	4300 850  4300 2800
Text GLabel 7600 4750 3    50   Input ~ 0
RX_ESP32
Text GLabel 5900 4150 2    50   Input ~ 0
RX_ESP32
Text GLabel 7500 4750 3    50   Input ~ 0
TX_ESP32
Text GLabel 5900 3950 2    50   Input ~ 0
TX_ESP32
$Comp
L Interface_USB:CY7C65213-28PVXI U5
U 1 1 5F4096C8
P 7900 4250
F 0 "U5" H 7950 5231 50  0000 C CNN
F 1 "CY7C65213-28PVXI" H 7950 5140 50  0000 C CNN
F 2 "Package_SO:SSOP-28_5.3x10.2mm_P0.65mm" H 7900 3350 50  0001 C CNN
F 3 "http://www.cypress.com/file/139881/download" H 5400 4750 50  0001 C CNN
	1    7900 4250
	0    -1   -1   0   
$EndComp
Text GLabel 8700 4550 3    50   Input ~ 0
GND
Wire Wire Line
	8700 4150 8700 4250
Connection ~ 8700 4250
Wire Wire Line
	8700 4250 8700 4350
Connection ~ 8700 4350
Wire Wire Line
	8700 4350 8700 4550
Text GLabel 9850 4050 0    50   Input ~ 0
USB_DP
Text GLabel 9850 3950 0    50   Input ~ 0
USB_DM
Text GLabel 7400 3650 1    50   Input ~ 0
USB_DM
Text GLabel 7300 3650 1    50   Input ~ 0
USB_DP
$Comp
L Device:C_Small C4
U 1 1 5F4A26B9
P 8300 4850
F 0 "C4" H 8392 4896 50  0000 L CNN
F 1 "1uF" H 8392 4805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8300 4850 50  0001 C CNN
F 3 "~" H 8300 4850 50  0001 C CNN
	1    8300 4850
	1    0    0    -1  
$EndComp
Text GLabel 8300 4950 3    50   Input ~ 0
GND
Text GLabel 9050 4250 1    50   Input ~ 0
VBUS
Text GLabel 7100 4250 3    50   Input ~ 0
VBUS
Wire Wire Line
	7100 4250 7100 4150
$Comp
L Device:LED D12
U 1 1 5F4CCE75
P 8550 3350
F 0 "D12" H 8543 3095 50  0000 C CNN
F 1 "LED0" H 8543 3186 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8550 3350 50  0001 C CNN
F 3 "~" H 8550 3350 50  0001 C CNN
	1    8550 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R7
U 1 1 5F4DC411
P 8200 3550
F 0 "R7" V 8004 3550 50  0000 C CNN
F 1 "1k" V 8095 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8200 3550 50  0001 C CNN
F 3 "~" H 8200 3550 50  0001 C CNN
	1    8200 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R8
U 1 1 5F4DD357
P 8300 3550
F 0 "R8" V 8104 3550 50  0000 C CNN
F 1 "1k" V 8195 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8300 3550 50  0001 C CNN
F 3 "~" H 8300 3550 50  0001 C CNN
	1    8300 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	8300 3450 8400 3450
Wire Wire Line
	8400 3350 8200 3350
Wire Wire Line
	8200 3350 8200 3450
Text GLabel 8700 3400 2    50   Input ~ 0
VBUS
Wire Wire Line
	8700 3450 8700 3350
$Comp
L Device:LED D13
U 1 1 5F4CA031
P 8550 3450
F 0 "D13" H 8543 3195 50  0000 C CNN
F 1 "LED0" H 8543 3286 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8550 3450 50  0001 C CNN
F 3 "~" H 8550 3450 50  0001 C CNN
	1    8550 3450
	1    0    0    -1  
$EndComp
Wire Notes Line
	6150 6600 6150 6400
Wire Notes Line
	6150 6400 10750 6400
Wire Notes Line
	10750 6400 10750 3200
Wire Notes Line
	4300 3200 10750 3200
$Comp
L local_symbols:SC16IS752IPW_SPI U1
U 1 1 5E1EA07F
P 5400 1750
F 0 "U1" H 5425 2665 50  0000 C CNN
F 1 "SC16IS752IPW" H 5425 2574 50  0000 C CNN
F 2 "Package_SO:TSSOP-28_4.4x9.7mm_P0.65mm" H 5400 850 50  0001 C CNN
F 3 "https://au.mouser.com/datasheet/2/302/SC16IS752_SC16IS762-1127856.pdf" H 5200 1950 50  0001 C CNN
	1    5400 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 4250 9850 4250
Text GLabel 3300 5350 3    50   Input ~ 0
GND
Text GLabel 1150 3700 0    50   Input ~ 0
CAN_H
Text GLabel 1150 3800 0    50   Input ~ 0
CAN_L
$Comp
L Connector:Screw_Terminal_01x02 I-BUS1
U 1 1 5F317B0C
P 1350 3700
F 0 "I-BUS1" H 1430 3692 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 1430 3601 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 1350 3700 50  0001 C CNN
F 3 "~" H 1350 3700 50  0001 C CNN
	1    1350 3700
	1    0    0    -1  
$EndComp
Text GLabel 10250 5900 2    50   Input ~ 0
GND
Text GLabel 10250 5700 2    50   Input ~ 0
GND
Text GLabel 10250 5800 2    50   Input ~ 0
VDD_3.3V
Text GLabel 10250 6000 2    50   Input ~ 0
VDD_3.3V
$EndSCHEMATC
