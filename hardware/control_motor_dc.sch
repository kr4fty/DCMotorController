EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:switches
LIBS:L293D
LIBS:control_motor_dc-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Control para motores DC, feedback por encoder"
Date "2017-05-29"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA328P-PU U2
U 1 1 58F7DD14
P 4000 4300
F 0 "U2" H 3250 5550 50  0000 L BNN
F 1 "ATMEGA328P-PU" H 4400 2900 50  0000 L BNN
F 2 "Housings_DIP:DIP-28_W7.62mm" H 4000 4300 50  0001 C CIN
F 3 "" H 4000 4300 50  0001 C CNN
	1    4000 4300
	1    0    0    -1  
$EndComp
$Comp
L BARREL_JACK J1
U 1 1 58F7DEA7
P 3100 1800
F 0 "J1" H 3100 1995 50  0000 C CNN
F 1 "BARREL_JACK" H 3100 1645 50  0000 C CNN
F 2 "Connect:JACK_ALIM" H 3100 1800 50  0001 C CNN
F 3 "" H 3100 1800 50  0001 C CNN
	1    3100 1800
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 58F7DFC6
P 3800 1900
F 0 "R1" V 3880 1900 50  0000 C CNN
F 1 "1K" V 3800 1900 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 3730 1900 50  0001 C CNN
F 3 "" H 3800 1900 50  0001 C CNN
	1    3800 1900
	1    0    0    -1  
$EndComp
$Comp
L LED D1
U 1 1 58F7E04A
P 3800 2300
F 0 "D1" H 3800 2400 50  0000 C CNN
F 1 "LED" H 3800 2200 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 3800 2300 50  0001 C CNN
F 3 "" H 3800 2300 50  0001 C CNN
	1    3800 2300
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR01
U 1 1 58F7E0D7
P 3450 2600
F 0 "#PWR01" H 3450 2350 50  0001 C CNN
F 1 "GND" H 3450 2450 50  0000 C CNN
F 2 "" H 3450 2600 50  0001 C CNN
F 3 "" H 3450 2600 50  0001 C CNN
	1    3450 2600
	1    0    0    -1  
$EndComp
$Comp
L LM7805 U1
U 1 1 58F7E0F7
P 4550 1750
F 0 "U1" H 4700 1554 50  0000 C CNN
F 1 "LM7805" H 4550 1950 50  0000 C CNN
F 2 "Favio:TO-220_Vertical-fav" H 4550 1750 50  0001 C CNN
F 3 "" H 4550 1750 50  0001 C CNN
	1    4550 1750
	1    0    0    -1  
$EndComp
$Comp
L CP C1
U 1 1 58F7E16B
P 4100 2150
F 0 "C1" H 4125 2250 50  0000 L CNN
F 1 "100uF/25V" H 3950 2050 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D5.0mm_P2.50mm" H 4138 2000 50  0001 C CNN
F 3 "" H 4100 2150 50  0001 C CNN
	1    4100 2150
	1    0    0    -1  
$EndComp
$Comp
L CP C2
U 1 1 58F7E1EC
P 5100 2150
F 0 "C2" H 5125 2250 50  0000 L CNN
F 1 "100uF/16V" H 4900 2050 50  0000 L CNN
F 2 "Capacitors_ThroughHole:CP_Radial_D5.0mm_P2.00mm" H 5138 2000 50  0001 C CNN
F 3 "" H 5100 2150 50  0001 C CNN
	1    5100 2150
	1    0    0    -1  
$EndComp
$Comp
L Crystal Y1
U 1 1 58F7E537
P 5600 4000
F 0 "Y1" H 5600 4150 50  0000 C CNN
F 1 "16Mhz" H 5600 3850 50  0000 C CNN
F 2 "Crystals:Crystal_HC52-6mm_Vertical" H 5600 4000 50  0001 C CNN
F 3 "" H 5600 4000 50  0001 C CNN
	1    5600 4000
	0    1    1    0   
$EndComp
$Comp
L C C3
U 1 1 58F7E70A
P 5900 3800
F 0 "C3" H 5925 3900 50  0000 L CNN
F 1 "22pF" H 5925 3700 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5938 3650 50  0001 C CNN
F 3 "" H 5900 3800 50  0001 C CNN
	1    5900 3800
	0    1    1    0   
$EndComp
$Comp
L C C4
U 1 1 58F7E78A
P 5900 4200
F 0 "C4" H 5925 4300 50  0000 L CNN
F 1 "22pF" H 5925 4100 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 5938 4050 50  0001 C CNN
F 3 "" H 5900 4200 50  0001 C CNN
	1    5900 4200
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 58F7E9CF
P 5700 4650
F 0 "R2" V 5780 4650 50  0000 C CNN
F 1 "10K" V 5700 4650 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5630 4650 50  0001 C CNN
F 3 "" H 5700 4650 50  0001 C CNN
	1    5700 4650
	0    1    1    0   
$EndComp
Text GLabel 5150 1700 2    43   Input ~ 0
+5V
Text GLabel 2850 3200 0    43   Input ~ 0
+5V
Text GLabel 5900 4650 2    43   Input ~ 0
+5V
$Comp
L GND #PWR02
U 1 1 58F7F38D
P 6150 4250
F 0 "#PWR02" H 6150 4000 50  0001 C CNN
F 1 "GND" H 6150 4100 50  0000 C CNN
F 2 "" H 6150 4250 50  0001 C CNN
F 3 "" H 6150 4250 50  0001 C CNN
	1    6150 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 58F7F492
P 2950 5600
F 0 "#PWR03" H 2950 5350 50  0001 C CNN
F 1 "GND" H 2950 5450 50  0000 C CNN
F 2 "" H 2950 5600 50  0001 C CNN
F 3 "" H 2950 5600 50  0001 C CNN
	1    2950 5600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 58FA0437
P 6050 5000
F 0 "#PWR04" H 6050 4750 50  0001 C CNN
F 1 "GND" H 6050 4850 50  0000 C CNN
F 2 "" H 6050 5000 50  0001 C CNN
F 3 "" H 6050 5000 50  0001 C CNN
	1    6050 5000
	1    0    0    -1  
$EndComp
$Comp
L SW_Push SW1
U 1 1 58FA07F8
P 5800 4900
F 0 "SW1" H 5850 5000 50  0000 L CNN
F 1 "Reset" H 5800 4840 50  0000 C CNN
F 2 "Buttons_Switches_ThroughHole:SW_PUSH_6mm" H 5800 5100 50  0001 C CNN
F 3 "" H 5800 5100 50  0001 C CNN
	1    5800 4900
	1    0    0    -1  
$EndComp
Text GLabel 3800 1650 1    43   Input ~ 0
+12V
$Comp
L GND #PWR05
U 1 1 5908AA99
P 6750 2250
F 0 "#PWR05" H 6750 2000 50  0001 C CNN
F 1 "GND" H 6750 2100 50  0000 C CNN
F 2 "" H 6750 2250 50  0001 C CNN
F 3 "" H 6750 2250 50  0001 C CNN
	1    6750 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5908AB63
P 8650 2250
F 0 "#PWR06" H 8650 2000 50  0001 C CNN
F 1 "GND" H 8650 2100 50  0000 C CNN
F 2 "" H 8650 2250 50  0001 C CNN
F 3 "" H 8650 2250 50  0001 C CNN
	1    8650 2250
	1    0    0    -1  
$EndComp
Text GLabel 6500 2850 0    43   Input ~ 0
+12V
Text GLabel 8500 1650 1    43   Input ~ 0
+5V
Text GLabel 6850 1800 0    43   Input ~ 0
D10
Text GLabel 8550 2850 2    43   Input ~ 0
D11/MOSI
$Comp
L CONN_02X03 J5
U 1 1 590A0E37
P 7100 5350
F 0 "J5" H 7100 5550 50  0000 C CNN
F 1 "ICSP" H 7100 5150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 7100 4150 50  0001 C CNN
F 3 "" H 7100 4150 50  0001 C CNN
	1    7100 5350
	1    0    0    -1  
$EndComp
Text GLabel 5050 3600 2    43   Input ~ 0
D12/MISO
Text GLabel 5050 3500 2    43   Input ~ 0
D11/MOSI
Text GLabel 5050 3700 2    43   Input ~ 0
D13/SCK
Text GLabel 6800 5250 0    43   Input ~ 0
D12/MISO
Text GLabel 7400 5350 2    43   Input ~ 0
D11/MOSI
Text GLabel 6800 5350 0    43   Input ~ 0
D13/SCK
Text GLabel 7400 5250 2    43   Input ~ 0
+5V
Text GLabel 6800 5450 0    43   Input ~ 0
RST
Text GLabel 7400 5450 2    43   Input ~ 0
GND
Text GLabel 5500 4650 1    43   Input ~ 0
RST
Text GLabel 5050 4800 2    43   Input ~ 0
D0/Rx
Text GLabel 5050 4900 2    43   Input ~ 0
D1/Tx
Text GLabel 5050 5000 2    43   Input ~ 0
D2
Text GLabel 5050 5100 2    43   Input ~ 0
D3
Text GLabel 5050 5200 2    43   Input ~ 0
D4
Text GLabel 5050 5300 2    43   Input ~ 0
D5
Text GLabel 5050 5400 2    43   Input ~ 0
D6
Text GLabel 5050 5500 2    43   Input ~ 0
D7
Text GLabel 5050 3200 2    43   Input ~ 0
D8
Text GLabel 5050 3300 2    43   Input ~ 0
D9
Text GLabel 5050 3400 2    43   Input ~ 0
D10
Text GLabel 5050 4050 2    43   Input ~ 0
A0
Text GLabel 5050 4150 2    43   Input ~ 0
A1
Text GLabel 5050 4250 2    43   Input ~ 0
A2
Text GLabel 5050 4350 2    43   Input ~ 0
A3
Text GLabel 5050 4450 2    43   Input ~ 0
A4
Text GLabel 5050 4550 2    43   Input ~ 0
A5
Text GLabel 6850 1950 0    43   Input ~ 0
D6
Text GLabel 8550 1950 2    43   Input ~ 0
D9
$Comp
L C C5
U 1 1 59230BFA
P 6100 2250
F 0 "C5" H 6125 2350 50  0000 L CNN
F 1 "0.1uF" H 6125 2150 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 6138 2100 50  0001 C CNN
F 3 "" H 6100 2250 50  0001 C CNN
	1    6100 2250
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 59230DC4
P 8950 2250
F 0 "C8" H 8975 2350 50  0000 L CNN
F 1 "0.1uF" H 8975 2150 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 8988 2100 50  0001 C CNN
F 3 "" H 8950 2250 50  0001 C CNN
	1    8950 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 59230F20
P 6100 2400
F 0 "#PWR07" H 6100 2150 50  0001 C CNN
F 1 "GND" H 6000 2400 50  0000 C CNN
F 2 "" H 6100 2400 50  0001 C CNN
F 3 "" H 6100 2400 50  0001 C CNN
	1    6100 2400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 59230F73
P 6100 2850
F 0 "#PWR08" H 6100 2600 50  0001 C CNN
F 1 "GND" H 6000 2850 50  0000 C CNN
F 2 "" H 6100 2850 50  0001 C CNN
F 3 "" H 6100 2850 50  0001 C CNN
	1    6100 2850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 59231083
P 8950 2850
F 0 "#PWR09" H 8950 2600 50  0001 C CNN
F 1 "GND" H 8850 2850 50  0000 C CNN
F 2 "" H 8950 2850 50  0001 C CNN
F 3 "" H 8950 2850 50  0001 C CNN
	1    8950 2850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 592310D6
P 8950 2400
F 0 "#PWR010" H 8950 2150 50  0001 C CNN
F 1 "GND" H 8850 2400 50  0000 C CNN
F 2 "" H 8950 2400 50  0001 C CNN
F 3 "" H 8950 2400 50  0001 C CNN
	1    8950 2400
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 59230CD7
P 6100 2700
F 0 "C6" H 6125 2800 50  0000 L CNN
F 1 "0.1uF" H 6125 2600 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 6138 2550 50  0001 C CNN
F 3 "" H 6100 2700 50  0001 C CNN
	1    6100 2700
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 59230D37
P 8950 2700
F 0 "C7" H 8975 2800 50  0000 L CNN
F 1 "0.1uF" H 8975 2600 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 8988 2550 50  0001 C CNN
F 3 "" H 8950 2700 50  0001 C CNN
	1    8950 2700
	1    0    0    -1  
$EndComp
$Comp
L L293D U3
U 1 1 59088CF9
P -1450 9500
F 0 "U3" H 7350 17350 60  0000 C CNN
F 1 "L293D" H 7600 16000 60  0000 C CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" H -1450 9500 60  0001 C CNN
F 3 "" H -1450 9500 60  0001 C CNN
	1    -1450 9500
	1    0    0    -1  
$EndComp
$Comp
L C C9
U 1 1 59237203
P 6600 3050
F 0 "C9" H 6625 3150 50  0000 L CNN
F 1 "0.1uF" H 6625 2950 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 6638 2900 50  0001 C CNN
F 3 "" H 6600 3050 50  0001 C CNN
	1    6600 3050
	1    0    0    -1  
$EndComp
Text GLabel 6000 2100 0    43   Input ~ 0
M11
Text GLabel 9050 2100 2    43   Input ~ 0
M22
$Comp
L CONN_02X03 J3
U 1 1 5924BEC9
P 9000 3900
F 0 "J3" H 9000 4100 50  0000 C CNN
F 1 "Motor1" H 9000 3700 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x03_Pitch2.54mm" H 9000 2700 50  0001 C CNN
F 3 "" H 9000 2700 50  0001 C CNN
	1    9000 3900
	1    0    0    -1  
$EndComp
Text GLabel 9400 3800 2    43   Input ~ 0
+5V
Text GLabel 8600 4000 0    43   Input ~ 0
GND
Text GLabel 9400 4000 2    43   Input ~ 0
A2
Text GLabel 6000 2550 0    43   Input ~ 0
M12
Text GLabel 6850 2700 0    43   Input ~ 0
D5
Text GLabel 8550 2700 2    43   Input ~ 0
D8
Text GLabel 9050 2550 2    43   Input ~ 0
M21
Text GLabel 8600 3900 0    43   Input ~ 0
M11
$Comp
L GND #PWR011
U 1 1 5923317B
P 9350 1800
F 0 "#PWR011" H 9350 1550 50  0001 C CNN
F 1 "GND" H 9350 1650 50  0000 C CNN
F 2 "" H 9350 1800 50  0001 C CNN
F 3 "" H 9350 1800 50  0001 C CNN
	1    9350 1800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 5923325E
P 6600 3250
F 0 "#PWR012" H 6600 3000 50  0001 C CNN
F 1 "GND" H 6600 3100 50  0000 C CNN
F 2 "" H 6600 3250 50  0001 C CNN
F 3 "" H 6600 3250 50  0001 C CNN
	1    6600 3250
	1    0    0    -1  
$EndComp
$Comp
L C C10
U 1 1 59254A7E
P 8900 1800
F 0 "C10" H 8925 1900 50  0000 L CNN
F 1 "0.1uF" H 8925 1700 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D3.8mm_W2.6mm_P2.50mm" H 8938 1650 50  0001 C CNN
F 3 "" H 8900 1800 50  0001 C CNN
	1    8900 1800
	0    -1   -1   0   
$EndComp
Text GLabel 9400 3900 2    43   Input ~ 0
A3
Text GLabel 8600 3800 0    43   Input ~ 0
M12
Text Label 9200 3900 0    43   ~ 0
PD1B
Text Label 9200 4000 0    43   ~ 0
PD1A
Text Label 8750 3900 2    43   ~ 0
M11
Text Label 8750 3800 2    43   ~ 0
M12
Text Label 7050 1800 2    43   ~ 0
ENA1
Text Label 7050 1950 2    43   ~ 0
IN11
Text Label 7050 2700 2    43   ~ 0
IN12
Text Label 7050 2100 2    43   ~ 0
M11
Text Label 7050 2550 2    43   ~ 0
M12
Text Label 8500 2850 2    43   ~ 0
ENA2
Text Label 8500 2700 2    43   ~ 0
IN21
Text Label 8500 1950 2    43   ~ 0
IN22
Text Label 8500 2550 2    43   ~ 0
M21
Text Label 8500 2100 2    43   ~ 0
M22
$Comp
L CONN_01X04 J6
U 1 1 592867EA
P 9150 5350
F 0 "J6" H 9150 5600 50  0000 C CNN
F 1 "Serial" V 9250 5350 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 9150 5350 50  0001 C CNN
F 3 "" H 9150 5350 50  0001 C CNN
	1    9150 5350
	1    0    0    1   
$EndComp
Text GLabel 8750 5200 0    43   Input ~ 0
GND
Text GLabel 8750 5400 0    43   Input ~ 0
D0/Rx
Text GLabel 8750 5500 0    43   Input ~ 0
D1/Tx
$Comp
L CONN_02X04 J2
U 1 1 59289741
P 7250 3950
F 0 "J2" H 7250 4200 50  0000 C CNN
F 1 "Control de entrada" H 7150 3700 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x04_Pitch2.54mm" H 7250 2750 50  0001 C CNN
F 3 "" H 7250 2750 50  0001 C CNN
	1    7250 3950
	1    0    0    -1  
$EndComp
Text GLabel 6800 3800 0    43   Input ~ 0
D3
Text GLabel 6800 3900 0    43   Input ~ 0
D13/SCK
Text GLabel 6800 4000 0    43   Input ~ 0
GND
Text GLabel 7700 3800 2    43   Input ~ 0
D2
Text GLabel 7700 3900 2    43   Input ~ 0
RST
Text GLabel 7700 4000 2    43   Input ~ 0
D12/MISO
Text Label 7000 3800 2    43   ~ 0
STEP2
Text Label 7000 3900 2    43   ~ 0
DIR2
Text Label 7500 3800 0    43   ~ 0
STEP1
Text Label 7500 3900 0    43   ~ 0
RESET
Text Label 7550 4000 0    43   ~ 0
DIR1
Text GLabel 7700 4100 2    43   Input ~ 0
A5
Text GLabel 6800 4100 0    43   Input ~ 0
GND
Text Label 7500 4100 0    43   ~ 0
ENAB
$Comp
L LED D2
U 1 1 5929BABC
P 7300 4450
F 0 "D2" H 7300 4550 50  0000 C CNN
F 1 "LED" H 7300 4350 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 7300 4450 50  0001 C CNN
F 3 "" H 7300 4450 50  0001 C CNN
	1    7300 4450
	-1   0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5929BBC3
P 7550 4300
F 0 "R3" V 7630 4300 50  0000 C CNN
F 1 "470" V 7550 4300 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7480 4300 50  0001 C CNN
F 3 "" H 7550 4300 50  0001 C CNN
	1    7550 4300
	1    0    0    1   
$EndComp
Text GLabel 7150 4450 0    43   Input ~ 0
+5V
Wire Wire Line
	3400 1700 4150 1700
Wire Wire Line
	3800 1650 3800 1750
Connection ~ 3800 1700
Wire Wire Line
	3800 2050 3800 2150
Wire Wire Line
	3400 1800 3450 1800
Wire Wire Line
	3450 1800 3450 2600
Wire Wire Line
	3400 1900 3450 1900
Connection ~ 3450 1900
Wire Wire Line
	3800 2450 3800 2500
Wire Wire Line
	3450 2500 5100 2500
Connection ~ 3450 2500
Wire Wire Line
	5100 2500 5100 2300
Connection ~ 3800 2500
Wire Wire Line
	4550 2000 4550 2500
Connection ~ 4550 2500
Wire Wire Line
	4100 2300 4100 2500
Connection ~ 4100 2500
Wire Wire Line
	4100 2000 4100 1700
Connection ~ 4100 1700
Wire Wire Line
	5100 1700 5100 2000
Connection ~ 5100 1700
Wire Wire Line
	2850 3200 3100 3200
Wire Wire Line
	5000 4650 5550 4650
Wire Wire Line
	5600 3800 5600 3850
Wire Wire Line
	5600 4200 5600 4150
Connection ~ 5600 4200
Wire Wire Line
	6050 3800 6150 3800
Wire Wire Line
	6150 4200 6050 4200
Wire Wire Line
	3100 5400 2950 5400
Wire Wire Line
	2950 5400 2950 5600
Wire Wire Line
	3100 5500 2950 5500
Connection ~ 2950 5500
Wire Wire Line
	2950 3800 3100 3800
Wire Wire Line
	2950 3200 2950 3800
Connection ~ 2950 3200
Wire Wire Line
	3100 3500 2950 3500
Connection ~ 2950 3500
Wire Wire Line
	6150 3800 6150 4250
Connection ~ 6150 4200
Wire Wire Line
	6050 4900 6050 5000
Wire Wire Line
	6000 4900 6050 4900
Wire Wire Line
	6950 1800 6850 1800
Wire Wire Line
	6850 2250 6850 2400
Wire Wire Line
	6850 2400 6950 2400
Wire Wire Line
	6500 2850 6950 2850
Wire Wire Line
	8550 2400 8450 2400
Wire Wire Line
	8550 2250 8550 2400
Wire Wire Line
	6850 5250 6800 5250
Wire Wire Line
	6850 5350 6800 5350
Wire Wire Line
	6850 5450 6800 5450
Wire Wire Line
	7350 5450 7400 5450
Wire Wire Line
	7350 5350 7400 5350
Wire Wire Line
	7350 5250 7400 5250
Wire Wire Line
	5000 3600 5050 3600
Wire Wire Line
	5000 3500 5050 3500
Wire Wire Line
	5000 3700 5050 3700
Wire Wire Line
	5850 4650 5900 4650
Wire Wire Line
	5500 4650 5500 4900
Connection ~ 5500 4650
Wire Wire Line
	5000 4800 5050 4800
Wire Wire Line
	5000 4900 5050 4900
Wire Wire Line
	5000 5000 5050 5000
Wire Wire Line
	5000 5100 5050 5100
Wire Wire Line
	5000 5200 5050 5200
Wire Wire Line
	5000 5300 5050 5300
Wire Wire Line
	5000 5400 5050 5400
Wire Wire Line
	5000 5500 5050 5500
Wire Wire Line
	5000 4050 5050 4050
Wire Wire Line
	5000 4150 5050 4150
Wire Wire Line
	5000 4250 5050 4250
Wire Wire Line
	5000 4350 5050 4350
Wire Wire Line
	5000 4450 5050 4450
Wire Wire Line
	5000 4550 5050 4550
Wire Wire Line
	5000 3200 5050 3200
Wire Wire Line
	5000 3300 5050 3300
Wire Wire Line
	5000 3400 5050 3400
Wire Wire Line
	4950 1700 5150 1700
Wire Wire Line
	8450 2250 8650 2250
Wire Wire Line
	6750 2250 6950 2250
Wire Wire Line
	8500 1650 8500 1800
Wire Wire Line
	6600 2900 6600 2850
Connection ~ 6600 2850
Wire Wire Line
	8450 2100 9050 2100
Connection ~ 8950 2100
Connection ~ 8550 2250
Connection ~ 6850 2250
Wire Wire Line
	6000 2550 6950 2550
Connection ~ 6100 2550
Wire Wire Line
	6000 2100 6950 2100
Connection ~ 6100 2100
Wire Wire Line
	8450 2550 9050 2550
Connection ~ 8950 2550
Connection ~ 8500 1800
Wire Wire Line
	8450 1800 8750 1800
Wire Wire Line
	6600 3250 6600 3200
Wire Wire Line
	9050 1800 9350 1800
Wire Wire Line
	8550 2700 8450 2700
Wire Wire Line
	8550 2850 8450 2850
Wire Wire Line
	8450 1950 8550 1950
Wire Wire Line
	8750 5200 8950 5200
Wire Wire Line
	8950 5300 8850 5300
Wire Wire Line
	8850 5300 8850 5200
Connection ~ 8850 5200
Wire Wire Line
	8950 5400 8750 5400
Wire Wire Line
	8950 5500 8750 5500
Wire Wire Line
	7000 3800 6800 3800
Wire Wire Line
	7000 3900 6800 3900
Wire Wire Line
	7000 4000 6800 4000
Wire Wire Line
	7700 3800 7500 3800
Wire Wire Line
	7700 3900 7500 3900
Wire Wire Line
	7700 4000 7500 4000
Wire Wire Line
	7700 4100 7500 4100
Wire Wire Line
	7000 4100 6800 4100
Wire Wire Line
	7450 4450 7550 4450
Wire Wire Line
	7550 4150 7550 4100
Connection ~ 7550 4100
Wire Wire Line
	5000 3800 5750 3800
Connection ~ 5600 3800
Wire Wire Line
	5350 4200 5750 4200
Wire Wire Line
	5350 4200 5350 3900
Wire Wire Line
	5350 3900 5000 3900
Wire Wire Line
	5500 4900 5600 4900
Text Notes 7350 1350 0    60   ~ 0
DC motor drive
Text Notes 6500 3650 0    60   ~ 0
Pins de Control para el driver
Text Notes 6400 5050 0    60   ~ 0
Puerto ICP para flasheo del micro
Text Notes 8550 3650 0    60   ~ 0
Conector del Motor 1
Text Notes 8550 4350 0    60   ~ 0
Conector del Motor 2
Text Notes 8600 5050 0    60   ~ 0
Depuración
Text Notes 3900 1250 0    60   ~ 0
DC in
Wire Wire Line
	6950 1950 6850 1950
Wire Wire Line
	6950 2700 6850 2700
Wire Wire Line
	8750 3800 8600 3800
Wire Wire Line
	9250 3800 9400 3800
Wire Wire Line
	9250 3900 9400 3900
Wire Wire Line
	8750 3900 8600 3900
Wire Wire Line
	8750 4000 8600 4000
Wire Wire Line
	9400 4000 9250 4000
$Comp
L CONN_02X03 J4
U 1 1 593AC281
P 9000 4600
F 0 "J4" H 9000 4800 50  0000 C CNN
F 1 "Motor2" H 9000 4400 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x03_Pitch2.54mm" H 9000 3400 50  0001 C CNN
F 3 "" H 9000 3400 50  0001 C CNN
	1    9000 4600
	1    0    0    -1  
$EndComp
Text GLabel 9400 4500 2    43   Input ~ 0
+5V
Text GLabel 8600 4700 0    43   Input ~ 0
GND
Text GLabel 9400 4700 2    43   Input ~ 0
A0
Text GLabel 8600 4600 0    43   Input ~ 0
M21
Text GLabel 9400 4600 2    43   Input ~ 0
A1
Text GLabel 8600 4500 0    43   Input ~ 0
M22
Text Label 9200 4600 0    43   ~ 0
PD2B
Text Label 9200 4700 0    43   ~ 0
PD2A
Text Label 8750 4600 2    43   ~ 0
M21
Text Label 8750 4500 2    43   ~ 0
M22
Wire Wire Line
	8750 4500 8600 4500
Wire Wire Line
	9250 4500 9400 4500
Wire Wire Line
	9250 4600 9400 4600
Wire Wire Line
	8750 4600 8600 4600
Wire Wire Line
	8750 4700 8600 4700
Wire Wire Line
	9400 4700 9250 4700
$EndSCHEMATC
