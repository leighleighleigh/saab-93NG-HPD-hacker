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
Wire Wire Line
	2800 3300 2750 3300
Wire Wire Line
	2800 2300 2750 2300
Wire Notes Line
	2450 2050 3950 2050
Wire Notes Line
	3950 4150 2450 4150
Wire Notes Line
	2450 4150 2450 2050
Wire Notes Line
	3950 2050 3950 4150
Text GLabel 3550 2300 2    50   Input ~ 0
RXA_CMOS
Text GLabel 3550 2700 2    50   Input ~ 0
TXA_CMOS
Text GLabel 3550 3700 2    50   Input ~ 0
TXB_CMOS
Text GLabel 3550 3300 2    50   Input ~ 0
RXB_CMOS
Text Notes 2450 2000 0    50   ~ 0
CAN INTERFACE
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
Text GLabel 1550 2300 0    50   Input ~ 0
GND
Text GLabel 1850 2700 2    50   Input ~ 0
RXA
Text GLabel 1850 2600 2    50   Input ~ 0
TXA
Text GLabel 1850 2500 2    50   Input ~ 0
RXB
Text GLabel 1850 2400 2    50   Input ~ 0
TXB
Text GLabel 1550 2400 0    50   Input ~ 0
VDD_3.3V
Text GLabel 1550 2200 0    50   Input ~ 0
VDD_5V
Text GLabel 1550 2500 0    50   Input ~ 0
GND
Text Notes 4250 4300 0    50   ~ 0
IMPLEMENTATION AS PER NXP SEMICONDUCTORS\nhttps://cdn-shop.adafruit.com/datasheets/AN10441.pdf
Text GLabel 2750 2600 0    50   Input ~ 0
CANL_A
Text GLabel 2750 2700 0    50   Input ~ 0
CANH_A
Text GLabel 2750 3600 0    50   Input ~ 0
CANL_B
Text GLabel 2750 3700 0    50   Input ~ 0
CANH_B
Text GLabel 1550 2600 0    50   Input ~ 0
CANL_A
Text GLabel 1550 2700 0    50   Input ~ 0
CANH_A
Text GLabel 1550 2800 0    50   Input ~ 0
CANL_B
Text GLabel 1550 2900 0    50   Input ~ 0
CANH_B
Text Notes 7050 6850 0    50   ~ 0
SIMPLE CAN INTERFACE WITH\nLOGIC LEVEL SHIFTING.\nINTENTED TO INTERFACE WITH ESP32 MICROCONTROLLER OR SIMILAR.
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J1
U 1 1 5E564141
P 1700 3800
F 0 "J1" H 1750 4417 50  0000 C CNN
F 1 "Conn_02x10_Counter_Clockwise" H 1750 4326 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x10_P2.54mm_Vertical" H 1700 3800 50  0001 C CNN
F 3 "~" H 1700 3800 50  0001 C CNN
	1    1700 3800
	1    0    0    -1  
$EndComp
$EndSCHEMATC
