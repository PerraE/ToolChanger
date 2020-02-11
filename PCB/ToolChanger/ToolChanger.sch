EESchema Schematic File Version 4
EELAYER 26 0
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
L Toolchanger:STM32L-Discovery U1
U 1 1 5E3F5449
P 5150 3450
F 0 "U1" H 5175 985 50  0000 C CNN
F 1 "STM32L-Discovery" H 5175 1076 50  0000 C CNN
F 2 "_footprint:STM32L-Discovery" H 4950 3800 50  0001 C CNN
F 3 "" H 4950 3800 50  0001 C CNN
	1    5150 3450
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x26_Male J1
U 1 1 5E3F54FB
P 1450 2600
F 0 "J1" H 1556 3978 50  0000 C CNN
F 1 "Conn_01x26_Male" H 1556 3887 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x13_P2.54mm_Vertical" H 1450 2600 50  0001 C CNN
F 3 "~" H 1450 2600 50  0001 C CNN
	1    1450 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0101
U 1 1 5E3F555C
P 3650 5300
F 0 "#PWR0101" H 3650 5150 50  0001 C CNN
F 1 "+5V" V 3665 5428 50  0000 L CNN
F 2 "" H 3650 5300 50  0001 C CNN
F 3 "" H 3650 5300 50  0001 C CNN
	1    3650 5300
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5E3F55AF
P 2000 4000
F 0 "#PWR0102" H 2000 3850 50  0001 C CNN
F 1 "+5V" H 2015 4173 50  0000 C CNN
F 2 "" H 2000 4000 50  0001 C CNN
F 3 "" H 2000 4000 50  0001 C CNN
	1    2000 4000
	-1   0    0    1   
$EndComp
Wire Wire Line
	2000 3100 1650 3100
Wire Wire Line
	1650 3300 2000 3300
Connection ~ 2000 3300
Wire Wire Line
	2000 3300 2000 3100
Wire Wire Line
	1650 3500 2000 3500
Wire Wire Line
	2000 3300 2000 3500
Connection ~ 2000 3500
Wire Wire Line
	2000 3500 2000 3700
Wire Wire Line
	1650 3700 2000 3700
Connection ~ 2000 3700
Wire Wire Line
	2000 3700 2000 3900
Wire Wire Line
	1650 3900 2000 3900
Connection ~ 2000 3900
Wire Wire Line
	2000 3900 2000 4000
Wire Wire Line
	3650 5300 4000 5300
$Comp
L power:GND #PWR0103
U 1 1 5E3F56C4
P 3650 4700
F 0 "#PWR0103" H 3650 4450 50  0001 C CNN
F 1 "GND" V 3655 4572 50  0000 R CNN
F 2 "" H 3650 4700 50  0001 C CNN
F 3 "" H 3650 4700 50  0001 C CNN
	1    3650 4700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5E3F56F2
P 1800 4200
F 0 "#PWR0104" H 1800 3950 50  0001 C CNN
F 1 "GND" H 1805 4027 50  0000 C CNN
F 2 "" H 1800 4200 50  0001 C CNN
F 3 "" H 1800 4200 50  0001 C CNN
	1    1800 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 2300 1800 2300
Wire Wire Line
	1800 2300 1800 2500
Wire Wire Line
	1650 2500 1800 2500
Connection ~ 1800 2500
Wire Wire Line
	1800 2500 1800 2700
Wire Wire Line
	1650 2700 1800 2700
Connection ~ 1800 2700
Wire Wire Line
	1800 2700 1800 2900
Wire Wire Line
	1650 2900 1800 2900
Connection ~ 1800 2900
Wire Wire Line
	1800 2900 1800 4200
Wire Wire Line
	3650 4700 4000 4700
$Comp
L power:GND #PWR0105
U 1 1 5E3F5DE0
P 3650 5150
F 0 "#PWR0105" H 3650 4900 50  0001 C CNN
F 1 "GND" V 3655 5022 50  0000 R CNN
F 2 "" H 3650 5150 50  0001 C CNN
F 3 "" H 3650 5150 50  0001 C CNN
	1    3650 5150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5E3F5DFD
P 6600 5150
F 0 "#PWR0106" H 6600 4900 50  0001 C CNN
F 1 "GND" V 6605 5022 50  0000 R CNN
F 2 "" H 6600 5150 50  0001 C CNN
F 3 "" H 6600 5150 50  0001 C CNN
	1    6600 5150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5E3F5E20
P 3650 1250
F 0 "#PWR0107" H 3650 1000 50  0001 C CNN
F 1 "GND" V 3655 1122 50  0000 R CNN
F 2 "" H 3650 1250 50  0001 C CNN
F 3 "" H 3650 1250 50  0001 C CNN
	1    3650 1250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5E3F5E47
P 6800 1250
F 0 "#PWR0108" H 6800 1000 50  0001 C CNN
F 1 "GND" V 6805 1122 50  0000 R CNN
F 2 "" H 6800 1250 50  0001 C CNN
F 3 "" H 6800 1250 50  0001 C CNN
	1    6800 1250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6800 1250 6250 1250
Wire Wire Line
	4000 1250 3650 1250
Wire Wire Line
	6600 5150 6250 5150
Wire Wire Line
	4000 5150 3650 5150
Wire Wire Line
	1650 1400 4000 1400
Wire Wire Line
	3700 1500 3700 1550
Wire Wire Line
	3700 1550 4000 1550
Wire Wire Line
	1650 1500 3700 1500
Wire Wire Line
	1650 1600 3650 1600
Wire Wire Line
	3650 1600 3650 1700
Wire Wire Line
	3650 1700 4000 1700
Wire Wire Line
	3550 1700 3550 1850
Wire Wire Line
	3550 1850 4000 1850
Wire Wire Line
	1650 1700 3550 1700
Wire Wire Line
	1650 1800 3400 1800
Wire Wire Line
	3400 1800 3400 2000
Wire Wire Line
	3400 2000 4000 2000
Wire Wire Line
	1650 1900 3300 1900
Wire Wire Line
	3300 1900 3300 2150
Wire Wire Line
	3300 2150 4000 2150
Wire Wire Line
	1650 2000 3150 2000
Wire Wire Line
	3150 2000 3150 2300
Wire Wire Line
	3150 2300 4000 2300
Wire Wire Line
	1650 2100 3000 2100
Wire Wire Line
	3000 2100 3000 2450
Wire Wire Line
	3000 2450 4000 2450
Wire Wire Line
	2900 2200 2900 2600
Wire Wire Line
	2900 2600 4000 2600
Wire Wire Line
	1650 2200 2900 2200
Wire Wire Line
	1650 2400 2800 2400
Wire Wire Line
	2800 2400 2800 2750
Wire Wire Line
	2800 2750 4000 2750
Wire Wire Line
	1650 2600 2700 2600
Wire Wire Line
	2700 2600 2700 2900
Wire Wire Line
	2700 2900 4000 2900
Wire Wire Line
	1650 2800 2600 2800
Wire Wire Line
	2600 2800 2600 3050
Wire Wire Line
	2600 3050 4000 3050
Wire Wire Line
	1650 3000 2500 3000
Wire Wire Line
	2500 3000 2500 3200
Wire Wire Line
	2500 3200 4000 3200
Wire Wire Line
	1650 3200 2400 3200
Wire Wire Line
	2400 3200 2400 3350
Wire Wire Line
	2400 3350 4000 3350
Wire Wire Line
	1650 3400 2300 3400
Wire Wire Line
	2300 3400 2300 3500
Wire Wire Line
	2300 3500 4000 3500
Wire Wire Line
	1650 3600 2200 3600
Wire Wire Line
	2200 3600 2200 3650
Wire Wire Line
	2200 3650 4000 3650
Wire Wire Line
	1650 3800 4000 3800
$Comp
L Connector:Conn_01x10_Male J2
U 1 1 5E40AF4E
P 10000 2200
F 0 "J2" H 9973 2080 50  0000 R CNN
F 1 "Con_Motor" H 9973 2171 50  0000 R CNN
F 2 "Connector_IDC:IDC-Header_2x05_P2.54mm_Vertical" H 10000 2200 50  0001 C CNN
F 3 "~" H 10000 2200 50  0001 C CNN
	1    10000 2200
	-1   0    0    1   
$EndComp
Text GLabel 9500 2500 0    50   Input ~ 0
DIR
Wire Wire Line
	9800 2500 9500 2500
$Comp
L power:GND #PWR0109
U 1 1 5E40CB29
P 9700 2750
F 0 "#PWR0109" H 9700 2500 50  0001 C CNN
F 1 "GND" V 9705 2622 50  0000 R CNN
F 2 "" H 9700 2750 50  0001 C CNN
F 3 "" H 9700 2750 50  0001 C CNN
	1    9700 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 2750 9700 2600
Wire Wire Line
	9700 1800 9800 1800
Wire Wire Line
	9800 2000 9700 2000
Connection ~ 9700 2000
Wire Wire Line
	9700 2000 9700 1800
Wire Wire Line
	9800 2200 9700 2200
Connection ~ 9700 2200
Wire Wire Line
	9700 2200 9700 2000
Wire Wire Line
	9800 2400 9700 2400
Connection ~ 9700 2400
Wire Wire Line
	9700 2400 9700 2200
Wire Wire Line
	9800 2600 9700 2600
Connection ~ 9700 2600
Wire Wire Line
	9700 2600 9700 2400
Text GLabel 9500 2100 0    50   Input ~ 0
PWM
Text GLabel 9500 1700 0    50   Input ~ 0
CURRENT_SENSE
Wire Wire Line
	9800 1700 9500 1700
Wire Wire Line
	9800 2100 9500 2100
Text GLabel 6650 3050 2    50   Input ~ 0
DIR
Wire Wire Line
	6650 3050 6250 3050
Text GLabel 6650 2900 2    50   Input ~ 0
PWM
Wire Wire Line
	6650 2900 6250 2900
Text GLabel 6650 2750 2    50   Input ~ 0
CURRENT_SENSE
Wire Wire Line
	6650 2750 6250 2750
$Comp
L Isolator:PC817 U2
U 1 1 5E431C32
P 8050 3400
F 0 "U2" H 8050 3725 50  0000 C CNN
F 1 "PC817" H 8050 3634 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 7850 3200 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 8050 3400 50  0001 L CNN
	1    8050 3400
	-1   0    0    -1  
$EndComp
$Comp
L Isolator:PC817 U3
U 1 1 5E438A60
P 8050 3750
F 0 "U3" H 8050 4075 50  0000 C CNN
F 1 "PC817" H 8050 3984 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 7850 3550 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 8050 3750 50  0001 L CNN
	1    8050 3750
	-1   0    0    -1  
$EndComp
$Comp
L Isolator:PC817 U4
U 1 1 5E438A82
P 8050 4100
F 0 "U4" H 8050 4425 50  0000 C CNN
F 1 "PC817" H 8050 4334 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 7850 3900 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 8050 4100 50  0001 L CNN
	1    8050 4100
	-1   0    0    -1  
$EndComp
$Comp
L Isolator:PC817 U5
U 1 1 5E438AAA
P 8050 4450
F 0 "U5" H 8050 4775 50  0000 C CNN
F 1 "PC817" H 8050 4684 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 7850 4250 50  0001 L CIN
F 3 "http://www.soselectronic.cz/a_info/resource/d/pc817.pdf" H 8050 4450 50  0001 L CNN
	1    8050 4450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7750 3300 7400 3300
Wire Wire Line
	7400 3300 7400 3350
Wire Wire Line
	7400 3350 6250 3350
Wire Wire Line
	7750 3650 7400 3650
Wire Wire Line
	7400 3650 7400 3500
Wire Wire Line
	7400 3500 6250 3500
Wire Wire Line
	7750 4000 7300 4000
Wire Wire Line
	7300 4000 7300 3650
Wire Wire Line
	7300 3650 6250 3650
Wire Wire Line
	7750 4350 7200 4350
Wire Wire Line
	7200 4350 7200 3800
Wire Wire Line
	7200 3800 6250 3800
$Comp
L power:GND #PWR0110
U 1 1 5E443325
P 7650 4800
F 0 "#PWR0110" H 7650 4550 50  0001 C CNN
F 1 "GND" V 7655 4672 50  0000 R CNN
F 2 "" H 7650 4800 50  0001 C CNN
F 3 "" H 7650 4800 50  0001 C CNN
	1    7650 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4800 7650 4550
Wire Wire Line
	7650 3500 7750 3500
Wire Wire Line
	7750 3850 7650 3850
Connection ~ 7650 3850
Wire Wire Line
	7650 3850 7650 3500
Wire Wire Line
	7750 4200 7650 4200
Connection ~ 7650 4200
Wire Wire Line
	7650 4200 7650 3850
Wire Wire Line
	7750 4550 7650 4550
Connection ~ 7650 4550
Wire Wire Line
	7650 4550 7650 4200
$Comp
L power:GND #PWR0111
U 1 1 5E44F61C
P 8550 4750
F 0 "#PWR0111" H 8550 4500 50  0001 C CNN
F 1 "GND" V 8555 4622 50  0000 R CNN
F 2 "" H 8550 4750 50  0001 C CNN
F 3 "" H 8550 4750 50  0001 C CNN
	1    8550 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3500 8350 3500
Wire Wire Line
	8350 3850 8550 3850
Wire Wire Line
	8350 4200 8550 4200
Wire Wire Line
	8350 4550 8550 4550
$Comp
L Device:LED D1
U 1 1 5E45D08A
P 8900 3300
F 0 "D1" H 8891 3516 50  0000 C CNN
F 1 "LED" H 8891 3425 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 8900 3300 50  0001 C CNN
F 3 "~" H 8900 3300 50  0001 C CNN
	1    8900 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5E45D140
P 8900 3650
F 0 "D2" H 8891 3866 50  0000 C CNN
F 1 "LED" H 8891 3775 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 8900 3650 50  0001 C CNN
F 3 "~" H 8900 3650 50  0001 C CNN
	1    8900 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5E45D16C
P 8900 4000
F 0 "D3" H 8891 4216 50  0000 C CNN
F 1 "LED" H 8891 4125 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 8900 4000 50  0001 C CNN
F 3 "~" H 8900 4000 50  0001 C CNN
	1    8900 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 5E45D19E
P 8900 4350
F 0 "D4" H 8891 4566 50  0000 C CNN
F 1 "LED" H 8891 4475 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 8900 4350 50  0001 C CNN
F 3 "~" H 8900 4350 50  0001 C CNN
	1    8900 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3300 8350 3300
Wire Wire Line
	8350 3650 8750 3650
Wire Wire Line
	8750 4000 8350 4000
$Comp
L Connector_Generic:Conn_01x06 J3
U 1 1 5E46C36B
P 10550 3700
F 0 "J3" H 10630 3692 50  0000 L CNN
F 1 "Conn_01x06" H 10630 3601 50  0000 L CNN
F 2 "Connector_Phoenix_MC_HighVoltage:PhoenixContact_MC_1,5_6-G-5.08_1x06_P5.08mm_Horizontal" H 10550 3700 50  0001 C CNN
F 3 "~" H 10550 3700 50  0001 C CNN
	1    10550 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 4000 9950 4000
$Comp
L power:GND #PWR0112
U 1 1 5E47D073
P 10300 4300
F 0 "#PWR0112" H 10300 4050 50  0001 C CNN
F 1 "GND" V 10305 4172 50  0000 R CNN
F 2 "" H 10300 4300 50  0001 C CNN
F 3 "" H 10300 4300 50  0001 C CNN
	1    10300 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR0113
U 1 1 5E47D0AD
P 10300 3150
F 0 "#PWR0113" H 10300 3000 50  0001 C CNN
F 1 "+24V" H 10315 3323 50  0000 C CNN
F 2 "" H 10300 3150 50  0001 C CNN
F 3 "" H 10300 3150 50  0001 C CNN
	1    10300 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 3150 10300 3500
Wire Wire Line
	10300 3500 10350 3500
Wire Wire Line
	10350 3600 10300 3600
Wire Wire Line
	10300 3600 10300 4300
Wire Wire Line
	8550 3500 8550 3850
Connection ~ 8550 3850
Wire Wire Line
	8550 3850 8550 4200
Connection ~ 8550 4200
Wire Wire Line
	8550 4200 8550 4550
Connection ~ 8550 4550
Wire Wire Line
	8550 4550 8550 4750
Wire Wire Line
	8750 4350 8350 4350
$Comp
L Device:R R1
U 1 1 5E49CDA1
P 9350 3300
F 0 "R1" V 9143 3300 50  0000 C CNN
F 1 "3,3K" V 9234 3300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 9280 3300 50  0001 C CNN
F 3 "~" H 9350 3300 50  0001 C CNN
	1    9350 3300
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5E49CE10
P 9350 3650
F 0 "R2" V 9143 3650 50  0000 C CNN
F 1 "3,3K" V 9234 3650 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 9280 3650 50  0001 C CNN
F 3 "~" H 9350 3650 50  0001 C CNN
	1    9350 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5E49CE44
P 9350 4000
F 0 "R3" V 9143 4000 50  0000 C CNN
F 1 "3,3K" V 9234 4000 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 9280 4000 50  0001 C CNN
F 3 "~" H 9350 4000 50  0001 C CNN
	1    9350 4000
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5E49CE7A
P 9350 4350
F 0 "R4" V 9143 4350 50  0000 C CNN
F 1 "3,3K" V 9234 4350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 9280 4350 50  0001 C CNN
F 3 "~" H 9350 4350 50  0001 C CNN
	1    9350 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	9200 3300 9050 3300
Wire Wire Line
	9050 3650 9200 3650
Wire Wire Line
	9200 4000 9050 4000
Wire Wire Line
	9050 4350 9200 4350
Wire Wire Line
	9500 4350 9950 4350
Wire Wire Line
	9950 4000 9950 4350
Wire Wire Line
	9500 4000 9750 4000
Wire Wire Line
	9750 4000 9750 3900
Wire Wire Line
	9750 3900 10350 3900
Wire Wire Line
	9500 3650 9750 3650
Wire Wire Line
	9750 3800 10350 3800
Wire Wire Line
	9750 3650 9750 3800
Wire Wire Line
	9500 3300 9950 3300
Wire Wire Line
	9950 3300 9950 3700
Wire Wire Line
	9950 3700 10350 3700
Text Notes 6400 3200 0    50   ~ 0
Blue button
Text Notes 9100 1900 0    50   ~ 0
THERMAL_WARN
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 5E4CCD58
P 10600 5000
F 0 "J4" H 10680 4992 50  0000 L CNN
F 1 "Conn_01x02" H 10680 4901 50  0000 L CNN
F 2 "Connector_Phoenix_MC_HighVoltage:PhoenixContact_MC_1,5_2-G-5.08_1x02_P5.08mm_Horizontal" H 10600 5000 50  0001 C CNN
F 3 "~" H 10600 5000 50  0001 C CNN
	1    10600 5000
	1    0    0    -1  
$EndComp
$Comp
L power:+24V #PWR0114
U 1 1 5E4CCDBB
P 10250 4900
F 0 "#PWR0114" H 10250 4750 50  0001 C CNN
F 1 "+24V" H 10265 5073 50  0000 C CNN
F 2 "" H 10250 4900 50  0001 C CNN
F 3 "" H 10250 4900 50  0001 C CNN
	1    10250 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5E4CCDE8
P 10250 5250
F 0 "#PWR0115" H 10250 5000 50  0001 C CNN
F 1 "GND" V 10255 5122 50  0000 R CNN
F 2 "" H 10250 5250 50  0001 C CNN
F 3 "" H 10250 5250 50  0001 C CNN
	1    10250 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 5000 10250 5000
Wire Wire Line
	10250 5000 10250 4900
Wire Wire Line
	10400 5100 10250 5100
Wire Wire Line
	10250 5100 10250 5250
$Comp
L Mechanical:MountingHole H1
U 1 1 5E4DC1A4
P 1650 6650
F 0 "H1" H 1750 6696 50  0000 L CNN
F 1 "MountingHole" H 1750 6605 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 1650 6650 50  0001 C CNN
F 3 "~" H 1650 6650 50  0001 C CNN
	1    1650 6650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5E4DC210
P 1650 6900
F 0 "H2" H 1750 6946 50  0000 L CNN
F 1 "MountingHole" H 1750 6855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 1650 6900 50  0001 C CNN
F 3 "~" H 1650 6900 50  0001 C CNN
	1    1650 6900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5E4DC26C
P 1650 7150
F 0 "H3" H 1750 7196 50  0000 L CNN
F 1 "MountingHole" H 1750 7105 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 1650 7150 50  0001 C CNN
F 3 "~" H 1650 7150 50  0001 C CNN
	1    1650 7150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5E4DC30C
P 1650 7400
F 0 "H4" H 1750 7446 50  0000 L CNN
F 1 "MountingHole" H 1750 7355 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 1650 7400 50  0001 C CNN
F 3 "~" H 1650 7400 50  0001 C CNN
	1    1650 7400
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5E4DCB7F
P 2600 6650
F 0 "H5" H 2700 6696 50  0000 L CNN
F 1 "MountingHole" H 2700 6605 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 2600 6650 50  0001 C CNN
F 3 "~" H 2600 6650 50  0001 C CNN
	1    2600 6650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5E4DCBC9
P 2600 6900
F 0 "H6" H 2700 6946 50  0000 L CNN
F 1 "MountingHole" H 2700 6855 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.5mm" H 2600 6900 50  0001 C CNN
F 3 "~" H 2600 6900 50  0001 C CNN
	1    2600 6900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
