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
P 6050 3050
F 0 "U1" H 6075 3965 50  0000 C CNN
F 1 "SC16IS752IPW" H 6075 3874 50  0000 C CNN
F 2 "Package_SO:TSSOP-28_4.4x9.7mm_P0.65mm" H 6050 2150 50  0001 C CNN
F 3 "https://au.mouser.com/datasheet/2/302/SC16IS752_SC16IS762-1127856.pdf" H 5850 3250 50  0001 C CNN
	1    6050 3050
	1    0    0    -1  
$EndComp
$Comp
L local_symbols:PCA82C250 U3
U 1 1 5E1EEB2A
P 5050 3100
F 0 "U3" H 5800 2033 50  0000 C CNN
F 1 "PCA82C250" H 5800 2124 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5800 2550 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/PCA82C251.pdf" H 5800 2550 50  0001 C CNN
	1    5050 3100
	-1   0    0    1   
$EndComp
$Comp
L local_symbols:Conn_02x06_SAAB_SID_HPD J1
U 1 1 5E210180
P 2650 2600
F 0 "J1" H 2650 3065 50  0000 C CNN
F 1 "ICM_CONN" H 2650 2974 50  0000 C CNN
F 2 "sid-board:SAAB_SID_CONNECTOR_HEADER" H 2400 2600 50  0001 C CNN
F 3 "~" H 2400 2600 50  0001 C CNN
	1    2650 2600
	1    0    0    -1  
$EndComp
$Comp
L local_symbols:Conn_02x06_SAAB_SID_HPD J2
U 1 1 5E211BEE
P 2650 3600
F 0 "J2" H 2650 4065 50  0000 C CNN
F 1 "SID_CONN" H 2650 3974 50  0000 C CNN
F 2 "sid-board:SAAB_SID_CONNECTOR_HEADER" H 2400 3600 50  0001 C CNN
F 3 "~" H 2400 3600 50  0001 C CNN
	1    2650 3600
	1    0    0    -1  
$EndComp
Text GLabel 2200 2800 0    50   Input ~ 0
VIN
Text GLabel 2200 2500 0    50   Input ~ 0
GND
$Comp
L local_symbols:LM2596MODULE U2
U 1 1 5E29B6B7
P 2650 4700
F 0 "U2" H 2650 4925 50  0000 C CNN
F 1 "LM2596MODULE" H 2650 4834 50  0000 C CNN
F 2 "sid-board:LM2596-MODULE" H 2650 4700 50  0001 C CNN
F 3 "" H 2650 4700 50  0001 C CNN
	1    2650 4700
	1    0    0    -1  
$EndComp
Text GLabel 2150 4850 0    50   Input ~ 0
GND
Text GLabel 3150 4850 2    50   Input ~ 0
GND
Text GLabel 2150 4700 0    50   Input ~ 0
VIN
Text GLabel 3150 4700 2    50   Input ~ 0
VDD_5V
Text GLabel 2200 3500 0    50   Input ~ 0
GND
Text GLabel 2200 3800 0    50   Input ~ 0
VIN
Wire Wire Line
	2200 2900 1950 2900
Wire Wire Line
	1950 2900 1950 3900
Wire Wire Line
	1950 3900 2200 3900
Wire Wire Line
	2200 3600 1900 3600
Wire Wire Line
	1900 3600 1900 2600
Wire Wire Line
	1900 2600 2200 2600
$Comp
L local_symbols:PCA82C250 U4
U 1 1 5E1F1E39
P 5050 4100
F 0 "U4" H 5800 3033 50  0000 C CNN
F 1 "PCA82C250" H 5800 3124 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5800 3550 50  0001 C CNN
F 3 "http://www.nxp.com/documents/data_sheet/PCA82C251.pdf" H 5800 3550 50  0001 C CNN
	1    5050 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	3100 2600 3900 2600
Wire Wire Line
	3900 2700 3100 2700
Wire Wire Line
	3100 3600 3900 3600
Wire Wire Line
	3900 3700 3100 3700
Text GLabel 3900 2300 0    50   Input ~ 0
GND
Text GLabel 3900 3300 0    50   Input ~ 0
GND
Text GLabel 4700 3500 2    50   Input ~ 0
GND
Text GLabel 4700 2500 2    50   Input ~ 0
GND
Text GLabel 4700 3900 2    50   Input ~ 0
VDD_5V
Text GLabel 4700 2900 2    50   Input ~ 0
VDD_5V
$Comp
L Device:C_Small C1
U 1 1 5E2BAD29
P 3500 3000
F 0 "C1" V 3271 3000 50  0000 C CNN
F 1 "100nF" V 3362 3000 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L7.2mm_W2.5mm_P5.00mm_FKS2_FKP2_MKS2_MKP2" H 3500 3000 50  0001 C CNN
F 3 "~" H 3500 3000 50  0001 C CNN
	1    3500 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	3950 2450 3400 2450
Wire Wire Line
	3600 3000 4700 3000
Wire Wire Line
	4700 3000 4700 2900
Wire Wire Line
	3950 3300 3900 3300
Wire Wire Line
	5450 3100 5500 3100
Wire Wire Line
	5450 3200 5450 3700
Wire Wire Line
	6300 3200 6300 3000
Wire Wire Line
	6300 3000 6650 3000
Wire Wire Line
	5450 3200 5500 3200
Connection ~ 5500 3200
Wire Wire Line
	5500 3200 6300 3200
Text GLabel 3800 4700 3    50   Input ~ 0
VDD_5V
Text GLabel 3900 4700 3    50   Input ~ 0
GND
Text GLabel 4850 4700 3    50   Input ~ 0
GND
Text GLabel 4750 4700 3    50   Input ~ 0
VDD_3.3V
Text GLabel 5450 3200 0    50   Input ~ 0
GND
Text GLabel 5450 3100 0    50   Input ~ 0
VDD_3.3V
Wire Wire Line
	5500 3600 5400 3600
Wire Wire Line
	5400 3600 5400 3950
Wire Wire Line
	5400 3950 5650 3950
Wire Wire Line
	5650 3950 5650 4200
Wire Wire Line
	5500 3500 5350 3500
Wire Wire Line
	5350 3500 5350 4000
Wire Wire Line
	5350 4000 5550 4000
Wire Wire Line
	5550 4000 5550 4200
Wire Wire Line
	5500 3400 5300 3400
Wire Wire Line
	5300 3400 5300 4050
Wire Wire Line
	5300 4050 5450 4050
Wire Wire Line
	5450 4050 5450 4200
Wire Wire Line
	5500 3300 5250 3300
Wire Wire Line
	5250 3300 5250 4100
Wire Wire Line
	5250 4100 5350 4100
Wire Wire Line
	5350 4100 5350 4200
$Comp
L Connector:Conn_01x04_Male J5
U 1 1 5E308950
P 5450 4400
F 0 "J5" V 5604 4112 50  0000 R CNN
F 1 "SPI" V 5513 4112 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5450 4400 50  0001 C CNN
F 3 "~" H 5450 4400 50  0001 C CNN
	1    5450 4400
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5E30F0FD
P 3900 4500
F 0 "J3" V 3962 4544 50  0000 L CNN
F 1 "5V/GND" V 4053 4544 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3900 4500 50  0001 C CNN
F 3 "~" H 3900 4500 50  0001 C CNN
	1    3900 4500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5E310D87
P 4850 4500
F 0 "J4" V 4912 4544 50  0000 L CNN
F 1 "3.3V/GND" V 5003 4544 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4850 4500 50  0001 C CNN
F 3 "~" H 4850 4500 50  0001 C CNN
	1    4850 4500
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x05_Male J6
U 1 1 5E325875
P 6100 4200
F 0 "J6" V 6254 3912 50  0000 R CNN
F 1 "UARTAB/IRQ" V 6163 3912 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 6100 4200 50  0001 C CNN
F 3 "~" H 6100 4200 50  0001 C CNN
	1    6100 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5900 2700 5900 4000
Wire Wire Line
	5500 2600 6000 2600
Wire Wire Line
	6000 2600 6000 4000
Wire Wire Line
	6650 2800 6100 2800
Wire Wire Line
	6100 2800 6100 2850
Wire Wire Line
	6650 2900 6200 2900
Wire Wire Line
	6650 3700 6300 3700
Wire Wire Line
	6300 3700 6300 4000
$Comp
L Device:R_Small R1
U 1 1 5E32A99C
P 6650 3800
F 0 "R1" H 6709 3846 50  0000 L CNN
F 1 "1K" H 6709 3755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 6650 3800 50  0001 C CNN
F 3 "~" H 6650 3800 50  0001 C CNN
	1    6650 3800
	1    0    0    -1  
$EndComp
Connection ~ 6650 3700
Text GLabel 6650 3900 2    50   Input ~ 0
VDD_3.3V
Wire Wire Line
	4700 2700 4700 2600
Wire Wire Line
	4700 2600 5500 2600
Connection ~ 5500 2600
Wire Wire Line
	4700 2350 5400 2350
Wire Wire Line
	5400 2350 5400 2700
Wire Wire Line
	5400 2700 5500 2700
Connection ~ 5500 2700
Wire Wire Line
	5500 2700 5900 2700
Wire Wire Line
	6200 2900 6200 2950
Wire Wire Line
	5450 3700 5500 3700
Wire Wire Line
	4700 3700 5050 3700
Wire Wire Line
	5050 3700 5050 2950
Wire Wire Line
	5050 2950 6200 2950
Connection ~ 6200 2950
Wire Wire Line
	6200 2950 6200 4000
Wire Wire Line
	4700 3300 5000 3300
Wire Wire Line
	5000 2850 6100 2850
Wire Wire Line
	5000 2850 5000 3300
Connection ~ 6100 2850
Wire Wire Line
	6100 2850 6100 4000
Wire Wire Line
	3400 2450 3400 3000
Wire Wire Line
	3950 2300 3950 2450
Wire Wire Line
	3950 2300 3900 2300
Wire Wire Line
	4700 2300 4700 2350
$EndSCHEMATC
