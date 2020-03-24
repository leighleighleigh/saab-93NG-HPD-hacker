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
L local_symbols:SC16IS752IPW_SPI U1
U 1 1 5E1EA07F
P 8100 2900
F 0 "U1" H 8125 3815 50  0000 C CNN
F 1 "SC16IS752IPW" H 8125 3724 50  0000 C CNN
F 2 "Package_SO:TSSOP-28_4.4x9.7mm_P0.65mm" H 8100 2000 50  0001 C CNN
F 3 "https://au.mouser.com/datasheet/2/302/SC16IS752_SC16IS762-1127856.pdf" H 7900 3100 50  0001 C CNN
	1    8100 2900
	1    0    0    -1  
$EndComp
$Comp
L local_symbols:PCA82C250 U3
U 1 1 5E1EEB2A
P 3900 3100
F 0 "U3" H 4650 2033 50  0000 C CNN
F 1 "PCA82C250" H 4650 2124 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4650 2550 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/PCA82C251.pdf" H 4650 2550 50  0001 C CNN
	1    3900 3100
	-1   0    0    1   
$EndComp
$Comp
L local_symbols:Conn_02x06_SAAB_SID_HPD ICM1
U 1 1 5E210180
P 1700 2600
F 0 "ICM1" H 1700 3065 50  0000 C CNN
F 1 "ICM_CONN" H 1700 2974 50  0000 C CNN
F 2 "sid-board:SAAB_SID_CONNECTOR_HEADER" H 1450 2600 50  0001 C CNN
F 3 "~" H 1450 2600 50  0001 C CNN
	1    1700 2600
	1    0    0    -1  
$EndComp
$Comp
L local_symbols:Conn_02x06_SAAB_SID_HPD SID1
U 1 1 5E211BEE
P 1700 3600
F 0 "SID1" H 1700 4065 50  0000 C CNN
F 1 "SID_CONN" H 1700 3974 50  0000 C CNN
F 2 "sid-board:SAAB_SID_CONNECTOR_HEADER" H 1450 3600 50  0001 C CNN
F 3 "~" H 1450 3600 50  0001 C CNN
	1    1700 3600
	1    0    0    -1  
$EndComp
Text GLabel 1250 2800 0    50   Input ~ 0
VIN
Text GLabel 1250 2500 0    50   Input ~ 0
GND
Text GLabel 1700 5250 0    50   Input ~ 0
GND
Text GLabel 1400 4950 0    50   Input ~ 0
VIN
Text GLabel 3400 4950 2    50   Input ~ 0
VDD_5V
Text GLabel 1250 3500 0    50   Input ~ 0
GND
Text GLabel 1250 3800 0    50   Input ~ 0
VIN
Wire Wire Line
	1250 2900 1000 2900
Wire Wire Line
	1000 2900 1000 3900
Wire Wire Line
	1000 3900 1250 3900
Wire Wire Line
	1250 3600 950  3600
Wire Wire Line
	950  3600 950  2600
Wire Wire Line
	950  2600 1250 2600
$Comp
L local_symbols:PCA82C250 U4
U 1 1 5E1F1E39
P 3900 4100
F 0 "U4" H 4650 3033 50  0000 C CNN
F 1 "PCA82C250" H 4650 3124 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4650 3550 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/PCA82C251.pdf" H 4650 3550 50  0001 C CNN
	1    3900 4100
	-1   0    0    1   
$EndComp
Text GLabel 2750 2300 0    50   Input ~ 0
GND
Text GLabel 2750 3300 0    50   Input ~ 0
GND
Text GLabel 3550 3500 2    50   Input ~ 0
GND
Text GLabel 3550 2500 2    50   Input ~ 0
GND
Text GLabel 3550 3900 2    50   Input ~ 0
VDD_5V
Text GLabel 3550 2900 2    50   Input ~ 0
VDD_5V
$Comp
L Device:C_Small C1
U 1 1 5E2BAD29
P 3300 5250
F 0 "C1" V 3071 5250 50  0000 C CNN
F 1 "100nF" V 3162 5250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3300 5250 50  0001 C CNN
F 3 "~" H 3300 5250 50  0001 C CNN
	1    3300 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	2800 3300 2750 3300
Wire Wire Line
	7500 2950 7550 2950
Wire Wire Line
	7500 3050 7550 3050
Text GLabel 7700 4050 2    50   Input ~ 0
VDD_5V
Text GLabel 7700 4250 2    50   Input ~ 0
GND
Text GLabel 7700 4150 2    50   Input ~ 0
VDD_3.3V
Text GLabel 7500 3050 0    50   Input ~ 0
GND
Text GLabel 7500 2950 0    50   Input ~ 0
VDD_3.3V
$Comp
L Device:R_Small R1
U 1 1 5E32A99C
P 8700 3650
F 0 "R1" H 8759 3696 50  0000 L CNN
F 1 "1K" H 8759 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8700 3650 50  0001 C CNN
F 3 "~" H 8700 3650 50  0001 C CNN
	1    8700 3650
	1    0    0    -1  
$EndComp
Text GLabel 8700 3750 0    50   Input ~ 0
VDD_3.3V
Wire Wire Line
	2800 2300 2750 2300
Text GLabel 3100 5250 0    50   Input ~ 0
GND
Text GLabel 2000 4950 2    50   Input ~ 0
VDD_3.3V
$Comp
L Regulator_Linear:MCP1703A-3302_SOT223 U2
U 1 1 5E2845BD
P 1700 4950
F 0 "U2" H 1700 5192 50  0000 C CNN
F 1 "MCP1703A-3302_SOT223" H 1700 5101 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 1700 5150 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20005122B.pdf" H 1700 4900 50  0001 C CNN
	1    1700 4950
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:MCP1703A-5002_SOT223 U5
U 1 1 5E285FEA
P 3100 4950
F 0 "U5" H 3100 5192 50  0000 C CNN
F 1 "MCP1703A-5002_SOT223" H 3100 5101 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 3100 5150 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20005122B.pdf" H 3100 4900 50  0001 C CNN
	1    3100 4950
	1    0    0    -1  
$EndComp
Text GLabel 2800 4950 0    50   Input ~ 0
VIN
Text Notes 1400 4650 0    50   ~ 10
3.3V SUPPLY LDO
Text Notes 2800 4650 0    50   ~ 10
5V SUPPLY LDO
Text GLabel 7550 2750 0    50   Input ~ 10
XTAL1
$Comp
L Device:C_Small C4
U 1 1 5E29894F
P 1900 5250
F 0 "C4" V 1671 5250 50  0000 C CNN
F 1 "100nF" V 1762 5250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1900 5250 50  0001 C CNN
F 3 "~" H 1900 5250 50  0001 C CNN
	1    1900 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 4950 2000 5250
Wire Wire Line
	1800 5250 1700 5250
Wire Wire Line
	3100 5250 3200 5250
Wire Wire Line
	3400 5250 3400 4950
Text GLabel 7550 2650 0    50   Input ~ 0
VDD_3.3V
Wire Notes Line
	2450 4550 2450 5350
Wire Notes Line
	1200 5350 1200 4550
Wire Notes Line
	3750 4550 3750 5350
Wire Notes Line
	1200 4550 3750 4550
Wire Notes Line
	1200 5350 3750 5350
Wire Notes Line
	850  2050 2350 2050
Wire Notes Line
	2350 2050 2350 4150
Wire Notes Line
	2350 4150 850  4150
Wire Notes Line
	850  4150 850  2050
Text Notes 900  2000 0    50   ~ 0
SID & ICM\nCONNECTORS
Wire Notes Line
	2450 2050 3950 2050
Wire Notes Line
	3950 4150 2450 4150
Wire Notes Line
	2450 4150 2450 2050
Wire Notes Line
	3950 2050 3950 4150
Wire Wire Line
	2150 2600 2750 2600
Wire Wire Line
	2750 2700 2150 2700
Wire Wire Line
	2150 3600 2750 3600
Wire Wire Line
	2750 3700 2150 3700
Text GLabel 3550 2300 2    50   Input ~ 0
RXA_CMOS
Text GLabel 7550 2550 0    50   Input ~ 0
RXA
Text GLabel 7550 2450 0    50   Input ~ 0
TXA
Text GLabel 3550 2700 2    50   Input ~ 0
TXA_CMOS
Text GLabel 3550 3700 2    50   Input ~ 0
TXB_CMOS
Text GLabel 8700 2850 2    50   Input ~ 0
GND
Text GLabel 8700 2750 2    50   Input ~ 0
TXB
Text GLabel 8700 2650 2    50   Input ~ 0
RXB
Text GLabel 3550 3300 2    50   Input ~ 0
RXB_CMOS
Text Notes 2450 2000 0    50   ~ 0
CAN INTERFACE
Text GLabel 7550 3550 3    50   Input ~ 0
GND
Wire Notes Line
	8150 4350 8150 4000
Wire Notes Line
	8150 4000 9000 4000
Wire Notes Line
	9000 4000 9000 2050
Text Notes 7100 2000 0    50   ~ 0
DUAL UART to SPI INTERFACE
Text Notes 8250 4150 0    50   ~ 0
OSCILLATOR
Text GLabel 8350 4600 3    50   Input ~ 10
XTAL1
Text GLabel 9300 4300 3    50   Input ~ 0
GND
$Comp
L Transistor_FET:BSS138 Q1
U 1 1 5E4A8360
P 6250 3900
F 0 "Q1" H 6454 3946 50  0000 L CNN
F 1 "BSS138" H 6454 3855 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6450 3825 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 6250 3900 50  0001 L CNN
	1    6250 3900
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_FET:BSS138 Q4
U 1 1 5E458EF7
P 5800 3400
F 0 "Q4" H 6004 3446 50  0000 L CNN
F 1 "BSS138" H 6004 3355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6000 3325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 5800 3400 50  0001 L CNN
	1    5800 3400
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_FET:BSS138 Q3
U 1 1 5E459F88
P 5350 2900
F 0 "Q3" H 5554 2946 50  0000 L CNN
F 1 "BSS138" H 5554 2855 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5550 2825 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 5350 2900 50  0001 L CNN
	1    5350 2900
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_FET:BSS138 Q2
U 1 1 5E45B08C
P 4900 2400
F 0 "Q2" H 5104 2446 50  0000 L CNN
F 1 "BSS138" H 5104 2355 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5100 2325 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 4900 2400 50  0001 L CNN
	1    4900 2400
	0    -1   -1   0   
$EndComp
Text GLabel 6250 4100 3    50   Input ~ 0
VDD_3.3V
Wire Wire Line
	4900 2600 4900 3100
Wire Wire Line
	4900 3100 5350 3100
Wire Wire Line
	5350 3100 5350 3600
Wire Wire Line
	5350 3600 5800 3600
Connection ~ 5350 3100
Wire Wire Line
	5800 3600 5800 4100
Wire Wire Line
	5800 4100 6250 4100
Connection ~ 5800 3600
$Comp
L Device:R_Small R3
U 1 1 5E497F86
P 4700 2400
F 0 "R3" H 4759 2446 50  0000 L CNN
F 1 "10k" H 4759 2355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4700 2400 50  0001 C CNN
F 3 "~" H 4700 2400 50  0001 C CNN
	1    4700 2400
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5E498AA1
P 5150 2900
F 0 "R5" H 5209 2946 50  0000 L CNN
F 1 "10k" H 5209 2855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5150 2900 50  0001 C CNN
F 3 "~" H 5150 2900 50  0001 C CNN
	1    5150 2900
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R7
U 1 1 5E49914A
P 5600 3400
F 0 "R7" H 5659 3446 50  0000 L CNN
F 1 "10k" H 5659 3355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5600 3400 50  0001 C CNN
F 3 "~" H 5600 3400 50  0001 C CNN
	1    5600 3400
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 5E499798
P 6050 3900
F 0 "R9" H 6109 3946 50  0000 L CNN
F 1 "10k" H 6109 3855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6050 3900 50  0001 C CNN
F 3 "~" H 6050 3900 50  0001 C CNN
	1    6050 3900
	-1   0    0    1   
$EndComp
Text GLabel 6050 4000 3    50   Input ~ 0
VDD_5V
Wire Wire Line
	6050 4000 5600 4000
Wire Wire Line
	5600 4000 5600 3500
Wire Wire Line
	5600 3500 5150 3500
Wire Wire Line
	5150 3500 5150 3000
Connection ~ 5600 3500
Wire Wire Line
	5150 3000 4700 3000
Wire Wire Line
	4700 3000 4700 2500
Connection ~ 5150 3000
$Comp
L Device:R_Small R6
U 1 1 5E4B0FDE
P 5550 2700
F 0 "R6" H 5609 2746 50  0000 L CNN
F 1 "10k" H 5609 2655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5550 2700 50  0001 C CNN
F 3 "~" H 5550 2700 50  0001 C CNN
	1    5550 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5E4B173C
P 5100 2200
F 0 "R4" H 5159 2246 50  0000 L CNN
F 1 "10k" H 5159 2155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5100 2200 50  0001 C CNN
F 3 "~" H 5100 2200 50  0001 C CNN
	1    5100 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R8
U 1 1 5E4B1DDA
P 6000 3200
F 0 "R8" H 6059 3246 50  0000 L CNN
F 1 "10k" H 6059 3155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6000 3200 50  0001 C CNN
F 3 "~" H 6000 3200 50  0001 C CNN
	1    6000 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R10
U 1 1 5E4B3C09
P 6450 3700
F 0 "R10" H 6509 3746 50  0000 L CNN
F 1 "10k" H 6509 3655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6450 3700 50  0001 C CNN
F 3 "~" H 6450 3700 50  0001 C CNN
	1    6450 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2100 5550 2100
Wire Wire Line
	5550 2100 5550 2600
Wire Wire Line
	5550 2600 6000 2600
Wire Wire Line
	6000 2600 6000 3100
Connection ~ 5550 2600
Wire Wire Line
	6000 3100 6450 3100
Wire Wire Line
	6450 3100 6450 3600
Connection ~ 6000 3100
Wire Wire Line
	6250 4100 6400 4100
Wire Wire Line
	6400 4100 6400 3600
Wire Wire Line
	6400 3600 6450 3600
Connection ~ 6250 4100
Connection ~ 6450 3600
Text GLabel 4700 2300 0    50   Input ~ 0
RXA_CMOS
Text GLabel 5150 2800 0    50   Input ~ 0
TXA_CMOS
Text GLabel 5600 3300 0    50   Input ~ 0
RXB_CMOS
Text GLabel 6050 3800 0    50   Input ~ 0
TXB_CMOS
Text GLabel 5100 2300 2    50   Input ~ 0
RXA
Text GLabel 5550 2800 2    50   Input ~ 0
TXA
Text GLabel 6000 3300 2    50   Input ~ 0
RXB
Text GLabel 6450 3800 2    50   Input ~ 0
TXB
Wire Notes Line
	4200 2050 6700 2050
Wire Notes Line
	6700 2050 6700 4350
Wire Notes Line
	6700 4350 4200 4350
Wire Notes Line
	4200 4350 4200 2050
Text Notes 4200 2000 0    50   ~ 0
CMOS to TTL\n5V TO 3.3V\nBIDIRECTIONAL LEVEL SHIFTER
$Comp
L Device:LED D1
U 1 1 5E524EBA
P 9550 2250
F 0 "D1" H 9543 1995 50  0000 C CNN
F 1 "LED7" H 9543 2086 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 2250 50  0001 C CNN
F 3 "~" H 9550 2250 50  0001 C CNN
	1    9550 2250
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 5E52A67D
P 9550 2350
F 0 "D2" H 9543 2095 50  0000 C CNN
F 1 "LED6" H 9543 2186 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 2350 50  0001 C CNN
F 3 "~" H 9550 2350 50  0001 C CNN
	1    9550 2350
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D3
U 1 1 5E52A91D
P 9550 2450
F 0 "D3" H 9543 2195 50  0000 C CNN
F 1 "LED5" H 9543 2286 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 2450 50  0001 C CNN
F 3 "~" H 9550 2450 50  0001 C CNN
	1    9550 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D4
U 1 1 5E52ACF3
P 9550 2550
F 0 "D4" H 9543 2295 50  0000 C CNN
F 1 "LED4" H 9543 2386 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 2550 50  0001 C CNN
F 3 "~" H 9550 2550 50  0001 C CNN
	1    9550 2550
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D5
U 1 1 5E52AFBB
P 9550 2950
F 0 "D5" H 9543 2695 50  0000 C CNN
F 1 "LED3" H 9543 2786 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 2950 50  0001 C CNN
F 3 "~" H 9550 2950 50  0001 C CNN
	1    9550 2950
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D6
U 1 1 5E52B30B
P 9550 3050
F 0 "D6" H 9543 2795 50  0000 C CNN
F 1 "LED2" H 9543 2886 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 3050 50  0001 C CNN
F 3 "~" H 9550 3050 50  0001 C CNN
	1    9550 3050
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D7
U 1 1 5E52B635
P 9550 3150
F 0 "D7" H 9543 2895 50  0000 C CNN
F 1 "LED1" H 9543 2986 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 3150 50  0001 C CNN
F 3 "~" H 9550 3150 50  0001 C CNN
	1    9550 3150
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D8
U 1 1 5E52B939
P 9550 3250
F 0 "D8" H 9543 2995 50  0000 C CNN
F 1 "LED0" H 9543 3086 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9550 3250 50  0001 C CNN
F 3 "~" H 9550 3250 50  0001 C CNN
	1    9550 3250
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R11
U 1 1 5E53A5B3
P 9300 2250
F 0 "R11" H 9359 2296 50  0000 L CNN
F 1 "1K" H 9359 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9300 2250 50  0001 C CNN
F 3 "~" H 9300 2250 50  0001 C CNN
	1    9300 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R12
U 1 1 5E53AB50
P 9300 2350
F 0 "R12" H 9359 2396 50  0000 L CNN
F 1 "1K" H 9359 2305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9300 2350 50  0001 C CNN
F 3 "~" H 9300 2350 50  0001 C CNN
	1    9300 2350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R13
U 1 1 5E53ADA4
P 9300 2450
F 0 "R13" H 9359 2496 50  0000 L CNN
F 1 "1K" H 9359 2405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9300 2450 50  0001 C CNN
F 3 "~" H 9300 2450 50  0001 C CNN
	1    9300 2450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R14
U 1 1 5E53B004
P 9300 2550
F 0 "R14" H 9359 2596 50  0000 L CNN
F 1 "1K" H 9359 2505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9300 2550 50  0001 C CNN
F 3 "~" H 9300 2550 50  0001 C CNN
	1    9300 2550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R15
U 1 1 5E53B270
P 9300 2950
F 0 "R15" H 9359 2996 50  0000 L CNN
F 1 "1K" H 9359 2905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9300 2950 50  0001 C CNN
F 3 "~" H 9300 2950 50  0001 C CNN
	1    9300 2950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R16
U 1 1 5E53B4E8
P 9300 3050
F 0 "R16" H 9359 3096 50  0000 L CNN
F 1 "1K" H 9359 3005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9300 3050 50  0001 C CNN
F 3 "~" H 9300 3050 50  0001 C CNN
	1    9300 3050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R17
U 1 1 5E53B76C
P 9300 3150
F 0 "R17" H 9359 3196 50  0000 L CNN
F 1 "1K" H 9359 3105 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9300 3150 50  0001 C CNN
F 3 "~" H 9300 3150 50  0001 C CNN
	1    9300 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R18
U 1 1 5E53B9FC
P 9300 3250
F 0 "R18" H 9359 3296 50  0000 L CNN
F 1 "1K" H 9359 3205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9300 3250 50  0001 C CNN
F 3 "~" H 9300 3250 50  0001 C CNN
	1    9300 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8700 2250 9200 2250
Wire Wire Line
	8700 2350 9200 2350
Wire Wire Line
	8700 2450 9200 2450
Wire Wire Line
	8700 2550 9200 2550
Wire Wire Line
	8700 2950 9200 2950
Wire Wire Line
	9200 3050 8700 3050
Wire Wire Line
	8700 3150 9200 3150
Wire Wire Line
	9200 3250 8700 3250
Text GLabel 9700 3350 2    50   Input ~ 0
GND
Wire Wire Line
	9700 3350 9700 3250
Connection ~ 9700 2350
Wire Wire Line
	9700 2350 9700 2250
Connection ~ 9700 2450
Wire Wire Line
	9700 2450 9700 2350
Connection ~ 9700 2550
Wire Wire Line
	9700 2550 9700 2450
Connection ~ 9700 2950
Wire Wire Line
	9700 2950 9700 2550
Connection ~ 9700 3050
Wire Wire Line
	9700 3050 9700 2950
Connection ~ 9700 3150
Wire Wire Line
	9700 3150 9700 3050
Connection ~ 9700 3250
Wire Wire Line
	9700 3250 9700 3150
Wire Notes Line
	9050 2050 9950 2050
Wire Notes Line
	9950 2050 9950 3450
Wire Notes Line
	9950 3450 9050 3450
Wire Notes Line
	9050 3450 9050 2050
Text Notes 9050 2000 0    50   ~ 0
GPIO LED OUTPUT
Text GLabel 7550 3450 0    50   Input ~ 0
CLK
Text GLabel 7550 3350 0    50   Input ~ 0
MISO
Text GLabel 7550 3250 0    50   Input ~ 0
MOSI
Text GLabel 7550 3150 0    50   Input ~ 0
CS
Text GLabel 7200 3950 0    50   Input ~ 0
CLK
Text GLabel 7200 4050 0    50   Input ~ 0
MISO
Text GLabel 7200 4150 0    50   Input ~ 0
MOSI
Text GLabel 7200 4250 0    50   Input ~ 0
CS
$Comp
L Connector_Generic:Conn_02x04_Counter_Clockwise J1
U 1 1 5E4709DB
P 7400 4050
F 0 "J1" H 7450 4367 50  0000 C CNN
F 1 "SPI+IRQ+POWER" H 7450 4276 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x04_P2.54mm_Vertical" H 7400 4050 50  0001 C CNN
F 3 "~" H 7400 4050 50  0001 C CNN
	1    7400 4050
	1    0    0    -1  
$EndComp
Text GLabel 8700 3550 2    50   Input ~ 0
IRQ
Text GLabel 7700 3950 2    50   Input ~ 0
IRQ
Wire Notes Line
	6900 4350 6900 2050
Wire Notes Line
	6900 4350 8150 4350
Wire Notes Line
	6900 2050 9000 2050
$Comp
L local_symbols:S53305-16.000-X X1
U 1 1 5E7AFB1C
P 8850 4500
F 0 "X1" H 8850 4350 50  0000 C CNN
F 1 "S53305-16.000-X" H 8850 4450 50  0000 C CNN
F 2 "sid-board:S53305-16.000-X" H 8850 4500 50  0001 C CNN
F 3 "" H 8850 4500 50  0001 C CNN
	1    8850 4500
	-1   0    0    1   
$EndComp
Text GLabel 8350 4300 3    50   Input ~ 0
VDD_3.3V
Text GLabel 9300 4600 3    50   Input ~ 0
VDD_3.3V
Wire Notes Line
	8250 4200 9400 4200
Wire Notes Line
	9400 4200 9400 5050
Wire Notes Line
	9400 5050 8250 5050
Wire Notes Line
	8250 5050 8250 4200
$EndSCHEMATC
