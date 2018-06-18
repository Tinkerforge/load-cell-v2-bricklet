EESchema Schematic File Version 2
LIBS:tinkerforge
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
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Load Cell Bricklet"
Date "2018-01-11"
Rev "2.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2018, B.Nordmeyer <bastian@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	1900 3100 1650 3100
Wire Wire Line
	1300 3850 1300 3750
Wire Wire Line
	1650 3200 1750 3200
Wire Wire Line
	1750 3200 1750 2900
$Comp
L CON-SENSOR2 P1
U 1 1 4C5FCF27
P 1300 3300
F 0 "P1" H 1450 3700 60  0000 C CNN
F 1 "CON-SENSOR" V 1450 3300 60  0000 C CNN
F 2 "kicad-libraries:CON-SENSOR2" H 1300 3300 60  0001 C CNN
F 3 "" H 1300 3300 60  0001 C CNN
	1    1300 3300
	-1   0    0    -1  
$EndComp
Text Notes 550  7700 0    40   ~ 0
Copyright Tinkerforge GmbH 2018.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
$Comp
L DRILL U4
U 1 1 4C6050A5
P 10650 6150
F 0 "U4" H 10700 6200 60  0001 C CNN
F 1 "DRILL" H 10650 6150 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 10650 6150 60  0001 C CNN
F 3 "" H 10650 6150 60  0001 C CNN
	1    10650 6150
	1    0    0    -1  
$EndComp
$Comp
L DRILL U5
U 1 1 4C6050A2
P 10650 6350
F 0 "U5" H 10700 6400 60  0001 C CNN
F 1 "DRILL" H 10650 6350 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 10650 6350 60  0001 C CNN
F 3 "" H 10650 6350 60  0001 C CNN
	1    10650 6350
	1    0    0    -1  
$EndComp
$Comp
L DRILL U7
U 1 1 4C60509F
P 11000 6350
F 0 "U7" H 11050 6400 60  0001 C CNN
F 1 "DRILL" H 11000 6350 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 11000 6350 60  0001 C CNN
F 3 "" H 11000 6350 60  0001 C CNN
	1    11000 6350
	1    0    0    -1  
$EndComp
$Comp
L DRILL U6
U 1 1 4C605099
P 11000 6150
F 0 "U6" H 11050 6200 60  0001 C CNN
F 1 "DRILL" H 11000 6150 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 11000 6150 60  0001 C CNN
F 3 "" H 11000 6150 60  0001 C CNN
	1    11000 6150
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P5
U 1 1 4C604EF8
P 9800 4450
F 0 "P5" V 9750 4450 40  0000 C CNN
F 1 "AKL_5_2" V 9850 4450 40  0000 C CNN
F 2 "kicad-libraries:AKL_5_2" H 9800 4450 60  0001 C CNN
F 3 "" H 9800 4450 60  0001 C CNN
	1    9800 4450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 4C5FCF5E
P 1900 3200
F 0 "#PWR01" H 1900 3200 30  0001 C CNN
F 1 "GND" H 1900 3130 30  0001 C CNN
F 2 "" H 1900 3200 60  0001 C CNN
F 3 "" H 1900 3200 60  0001 C CNN
	1    1900 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 4C5FCF4F
P 1300 3850
F 0 "#PWR02" H 1300 3850 30  0001 C CNN
F 1 "GND" H 1300 3780 30  0001 C CNN
F 2 "" H 1300 3850 60  0001 C CNN
F 3 "" H 1300 3850 60  0001 C CNN
	1    1300 3850
	1    0    0    -1  
$EndComp
$Comp
L 3V3 #PWR03
U 1 1 54E7A48D
P 1750 2900
F 0 "#PWR03" H 1750 3000 40  0001 C CNN
F 1 "3V3" H 1750 3025 40  0000 C CNN
F 2 "" H 1750 2900 60  0000 C CNN
F 3 "" H 1750 2900 60  0000 C CNN
	1    1750 2900
	1    0    0    -1  
$EndComp
$Comp
L HX711 U3
U 1 1 55118F29
P 7750 3900
F 0 "U3" H 8050 4500 60  0000 C CNN
F 1 "HX711" H 8100 3350 60  0000 C CNN
F 2 "kicad-libraries:SOP16L" H 6500 5650 60  0001 C CNN
F 3 "" H 6500 5650 60  0000 C CNN
	1    7750 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 4700 7850 4500
Wire Wire Line
	7650 4700 7650 4500
$Comp
L CONN_2 P4
U 1 1 4F0090C2
P 9800 3850
F 0 "P4" V 9750 3850 40  0000 C CNN
F 1 "AKL_5_2" V 9850 3850 40  0000 C CNN
F 2 "kicad-libraries:AKL_5_2" H 9800 3850 60  0001 C CNN
F 3 "" H 9800 3850 60  0001 C CNN
	1    9800 3850
	1    0    0    -1  
$EndComp
NoConn ~ 7550 3300
$Comp
L INDUCT L2
U 1 1 5511A5AF
P 10450 1400
F 0 "L2" V 10530 1400 50  0000 C CNN
F 1 "FB0603-2" V 10350 1400 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 10450 1400 60  0001 C CNN
F 3 "" H 10450 1400 60  0000 C CNN
	1    10450 1400
	0    1    1    0   
$EndComp
$Comp
L C C9
U 1 1 5511AA6E
P 10900 1600
F 0 "C9" V 10750 1550 50  0000 L CNN
F 1 "1µF" V 11050 1500 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 10900 1600 60  0001 C CNN
F 3 "" H 10900 1600 60  0001 C CNN
	1    10900 1600
	1    0    0    -1  
$EndComp
$Comp
L AGND #PWR04
U 1 1 5511AC8D
P 7850 4700
F 0 "#PWR04" H 7850 4700 40  0001 C CNN
F 1 "AGND" H 7850 4630 50  0000 C CNN
F 2 "" H 7850 4700 60  0000 C CNN
F 3 "" H 7850 4700 60  0000 C CNN
	1    7850 4700
	1    0    0    -1  
$EndComp
$Comp
L AGND #PWR05
U 1 1 5511AD62
P 7650 4700
F 0 "#PWR05" H 7650 4700 40  0001 C CNN
F 1 "AGND" H 7650 4630 50  0000 C CNN
F 2 "" H 7650 4700 60  0000 C CNN
F 3 "" H 7650 4700 60  0000 C CNN
	1    7650 4700
	1    0    0    -1  
$EndComp
$Comp
L AGND #PWR06
U 1 1 5511AE56
P 10900 1900
F 0 "#PWR06" H 10900 1900 40  0001 C CNN
F 1 "AGND" H 10900 1830 50  0000 C CNN
F 2 "" H 10900 1900 60  0000 C CNN
F 3 "" H 10900 1900 60  0000 C CNN
	1    10900 1900
	1    0    0    -1  
$EndComp
NoConn ~ 1650 3000
Wire Wire Line
	10000 1800 10900 1800
Connection ~ 10900 1800
Wire Wire Line
	10200 1400 10000 1400
Wire Wire Line
	10000 1400 10000 1300
Connection ~ 10900 1400
Wire Wire Line
	8350 2900 8350 3450
$Comp
L GND #PWR07
U 1 1 5511B5FA
P 10000 1900
F 0 "#PWR07" H 10000 1900 30  0001 C CNN
F 1 "GND" H 10000 1830 30  0001 C CNN
F 2 "" H 10000 1900 60  0001 C CNN
F 3 "" H 10000 1900 60  0001 C CNN
	1    10000 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 1900 10000 1800
$Comp
L C C7
U 1 1 5511B80D
P 8150 2400
F 0 "C7" V 8000 2350 50  0000 L CNN
F 1 "100nF" V 8300 2300 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 8150 2400 60  0001 C CNN
F 3 "" H 8150 2400 60  0001 C CNN
	1    8150 2400
	0    1    1    0   
$EndComp
$Comp
L C C8
U 1 1 5511B95F
P 8550 3150
F 0 "C8" V 8400 3100 50  0000 L CNN
F 1 "100nF" V 8700 3050 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 8550 3150 60  0001 C CNN
F 3 "" H 8550 3150 60  0001 C CNN
	1    8550 3150
	1    0    0    -1  
$EndComp
NoConn ~ 8350 4250
Wire Wire Line
	10900 1800 10900 1900
Wire Wire Line
	10900 1400 10700 1400
Wire Wire Line
	10900 1300 10900 1400
$Comp
L AGND #PWR08
U 1 1 5511C6CC
P 7100 3400
F 0 "#PWR08" H 7100 3400 40  0001 C CNN
F 1 "AGND" H 7100 3330 50  0000 C CNN
F 2 "" H 7100 3400 60  0000 C CNN
F 3 "" H 7100 3400 60  0000 C CNN
	1    7100 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3300 7100 3300
Wire Wire Line
	7100 3300 7100 3400
$Comp
L AGND #PWR09
U 1 1 5511CA1C
P 8550 3450
F 0 "#PWR09" H 8550 3450 40  0001 C CNN
F 1 "AGND" H 8550 3380 50  0000 C CNN
F 2 "" H 8550 3450 60  0000 C CNN
F 3 "" H 8550 3450 60  0000 C CNN
	1    8550 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2950 8550 2950
Connection ~ 8350 2950
Wire Wire Line
	8550 3450 8550 3350
$Comp
L C C6
U 1 1 5511CCEA
P 8150 2000
F 0 "C6" V 8000 1950 50  0000 L CNN
F 1 "100nF" V 8300 1900 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 8150 2000 60  0001 C CNN
F 3 "" H 8150 2000 60  0001 C CNN
	1    8150 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	7800 1950 7800 3300
Wire Wire Line
	7800 2000 7950 2000
Wire Wire Line
	7900 1950 7900 3300
Wire Wire Line
	7900 2400 7950 2400
$Comp
L 3V3 #PWR010
U 1 1 5511CF10
P 7900 1950
F 0 "#PWR010" H 7900 2050 40  0001 C CNN
F 1 "3V3" H 7900 2075 40  0000 C CNN
F 2 "" H 7900 1950 60  0000 C CNN
F 3 "" H 7900 1950 60  0000 C CNN
	1    7900 1950
	1    0    0    -1  
$EndComp
Connection ~ 7900 2400
Connection ~ 7800 2000
$Comp
L AGND #PWR011
U 1 1 5511D04B
P 8550 2500
F 0 "#PWR011" H 8550 2500 40  0001 C CNN
F 1 "AGND" H 8550 2430 50  0000 C CNN
F 2 "" H 8550 2500 60  0000 C CNN
F 3 "" H 8550 2500 60  0000 C CNN
	1    8550 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 2400 8550 2400
Wire Wire Line
	8550 2000 8550 2500
Wire Wire Line
	8350 2000 8550 2000
Connection ~ 8550 2400
NoConn ~ 7500 4500
Wire Wire Line
	9100 4050 8350 4050
Wire Wire Line
	9100 3750 9100 4050
Wire Wire Line
	9100 3950 9450 3950
Wire Wire Line
	8350 3750 9100 3750
Connection ~ 9100 3950
Wire Wire Line
	8350 3950 8600 3950
Wire Wire Line
	8600 3950 8600 3850
Wire Wire Line
	8600 3850 9200 3850
Wire Wire Line
	9200 3850 9200 3650
Wire Wire Line
	9200 3750 9450 3750
Wire Wire Line
	9200 3650 8350 3650
Connection ~ 9200 3750
$Comp
L AGND #PWR012
U 1 1 5511EE4F
P 9450 4650
F 0 "#PWR012" H 9450 4650 40  0001 C CNN
F 1 "AGND" H 9450 4580 50  0000 C CNN
F 2 "" H 9450 4650 60  0000 C CNN
F 3 "" H 9450 4650 60  0000 C CNN
	1    9450 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 4650 9450 4550
Wire Wire Line
	9450 4350 9450 4250
$Comp
L FAN4860 U2
U 1 1 551AC3BA
P 5550 5700
F 0 "U2" H 5300 5950 60  0000 C CNN
F 1 "FAN4860" H 5900 5400 60  0000 C CNN
F 2 "kicad-libraries:UMLP_22" H 5550 5700 60  0001 C CNN
F 3 "" H 5550 5700 60  0000 C CNN
	1    5550 5700
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L1
U 1 1 551AC79D
P 4700 5700
F 0 "L1" H 4700 5800 40  0000 C CNN
F 1 "1µH" H 4700 5650 40  0000 C CNN
F 2 "kicad-libraries:C0805" H 4700 5700 60  0001 C CNN
F 3 "" H 4700 5700 60  0000 C CNN
	1    4700 5700
	1    0    0    -1  
$EndComp
Text Notes 4450 6300 0    60   ~ 0
z.B. LQM21PN1R0MC0
$Comp
L C C3
U 1 1 551AD036
P 4000 5800
F 0 "C3" V 3850 5750 50  0000 L CNN
F 1 "2.2µF" V 4150 5700 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 4000 5800 60  0001 C CNN
F 3 "" H 4000 5800 60  0001 C CNN
	1    4000 5800
	-1   0    0    1   
$EndComp
Wire Wire Line
	5100 5700 5000 5700
Wire Wire Line
	4400 5700 4300 5700
Wire Wire Line
	4300 5700 4300 5600
Wire Wire Line
	4000 5600 5100 5600
$Comp
L AGND #PWR013
U 1 1 551ADDB5
P 5600 6150
F 0 "#PWR013" H 5600 6150 40  0001 C CNN
F 1 "AGND" H 5600 6080 50  0000 C CNN
F 2 "" H 5600 6150 60  0000 C CNN
F 3 "" H 5600 6150 60  0000 C CNN
	1    5600 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 6050 5650 6050
Wire Wire Line
	5600 6050 5600 6150
Connection ~ 5600 6050
$Comp
L C C4
U 1 1 551ADFBA
P 6350 5800
F 0 "C4" V 6200 5750 50  0000 L CNN
F 1 "4.7µF" V 6500 5700 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 6350 5800 60  0001 C CNN
F 3 "" H 6350 5800 60  0001 C CNN
	1    6350 5800
	-1   0    0    1   
$EndComp
$Comp
L AGND #PWR014
U 1 1 551AE430
P 4000 6150
F 0 "#PWR014" H 4000 6150 40  0001 C CNN
F 1 "AGND" H 4000 6080 50  0000 C CNN
F 2 "" H 4000 6150 60  0000 C CNN
F 3 "" H 4000 6150 60  0000 C CNN
	1    4000 6150
	1    0    0    -1  
$EndComp
$Comp
L AGND #PWR015
U 1 1 551AE45F
P 6350 6150
F 0 "#PWR015" H 6350 6150 40  0001 C CNN
F 1 "AGND" H 6350 6080 50  0000 C CNN
F 2 "" H 6350 6150 60  0000 C CNN
F 3 "" H 6350 6150 60  0000 C CNN
	1    6350 6150
	1    0    0    -1  
$EndComp
Connection ~ 4300 5600
Wire Wire Line
	4000 6150 4000 6000
Wire Wire Line
	6350 6150 6350 6000
$Comp
L 3V3 #PWR016
U 1 1 551AE69F
P 4000 5550
F 0 "#PWR016" H 4000 5650 40  0001 C CNN
F 1 "3V3" H 4000 5675 40  0000 C CNN
F 2 "" H 4000 5550 60  0000 C CNN
F 3 "" H 4000 5550 60  0000 C CNN
	1    4000 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 5550 4000 5600
Connection ~ 4000 5600
Wire Wire Line
	6000 5700 6150 5700
Wire Wire Line
	6150 5700 6150 5600
Wire Wire Line
	6000 5600 6750 5600
Connection ~ 6150 5600
$Comp
L +5V #PWR017
U 1 1 551AECBF
P 6750 5450
F 0 "#PWR017" H 6750 5540 20  0001 C CNN
F 1 "+5V" H 6750 5540 30  0000 C CNN
F 2 "" H 6750 5450 60  0000 C CNN
F 3 "" H 6750 5450 60  0000 C CNN
	1    6750 5450
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 551AED85
P 6750 5800
F 0 "C5" V 6600 5750 50  0000 L CNN
F 1 "100nF" V 6900 5700 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 6750 5800 60  0001 C CNN
F 3 "" H 6750 5800 60  0001 C CNN
	1    6750 5800
	1    0    0    -1  
$EndComp
$Comp
L AGND #PWR018
U 1 1 551AEE7E
P 6750 6150
F 0 "#PWR018" H 6750 6150 40  0001 C CNN
F 1 "AGND" H 6750 6080 50  0000 C CNN
F 2 "" H 6750 6150 60  0000 C CNN
F 3 "" H 6750 6150 60  0000 C CNN
	1    6750 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 6150 6750 6000
Connection ~ 6350 5600
Wire Wire Line
	6750 5600 6750 5450
Connection ~ 6750 5600
Wire Wire Line
	5100 5800 4250 5800
Wire Wire Line
	4250 5800 4250 5600
Connection ~ 4250 5600
$Comp
L +5V #PWR019
U 1 1 551B03E5
P 10000 1300
F 0 "#PWR019" H 10000 1390 20  0001 C CNN
F 1 "+5V" H 10000 1390 30  0000 C CNN
F 2 "" H 10000 1300 60  0000 C CNN
F 3 "" H 10000 1300 60  0000 C CNN
	1    10000 1300
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR020
U 1 1 551B07F7
P 10900 1300
F 0 "#PWR020" H 10900 1430 20  0001 C CNN
F 1 "+5VA" H 10900 1400 30  0000 C CNN
F 2 "" H 10900 1300 60  0000 C CNN
F 3 "" H 10900 1300 60  0000 C CNN
	1    10900 1300
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR021
U 1 1 551B08AC
P 7800 1950
F 0 "#PWR021" H 7800 2080 20  0001 C CNN
F 1 "+5VA" H 7800 2050 30  0000 C CNN
F 2 "" H 7800 1950 60  0000 C CNN
F 3 "" H 7800 1950 60  0000 C CNN
	1    7800 1950
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR022
U 1 1 551B09DF
P 8350 2900
F 0 "#PWR022" H 8350 3030 20  0001 C CNN
F 1 "+5VA" H 8350 3000 30  0000 C CNN
F 2 "" H 8350 2900 60  0000 C CNN
F 3 "" H 8350 2900 60  0000 C CNN
	1    8350 2900
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR023
U 1 1 551D629B
P 9450 4250
F 0 "#PWR023" H 9450 4380 20  0001 C CNN
F 1 "+5VA" H 9450 4350 30  0000 C CNN
F 2 "" H 9450 4250 60  0000 C CNN
F 3 "" H 9450 4250 60  0000 C CNN
	1    9450 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3100 1900 3200
$Comp
L XMC1XXX24 U1
U 1 1 5A577142
P 4350 1400
F 0 "U1" H 4200 1800 60  0000 C CNN
F 1 "XMC1100" H 4350 1000 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 4500 2150 60  0001 C CNN
F 3 "" H 4500 2150 60  0000 C CNN
	1    4350 1400
	1    0    0    -1  
$EndComp
$Comp
L XMC1XXX24 U1
U 2 1 5A5771EB
P 4350 2500
F 0 "U1" H 4200 3050 60  0000 C CNN
F 1 "XMC1100" H 4350 1950 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 4500 3250 60  0001 C CNN
F 3 "" H 4500 3250 60  0000 C CNN
	2    4350 2500
	1    0    0    -1  
$EndComp
$Comp
L XMC1XXX24 U1
U 3 1 5A577260
P 4350 3400
F 0 "U1" H 4200 3650 60  0000 C CNN
F 1 "XMC1100" H 4350 3150 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 4500 4150 60  0001 C CNN
F 3 "" H 4500 4150 60  0000 C CNN
	3    4350 3400
	1    0    0    -1  
$EndComp
$Comp
L XMC1XXX24 U1
U 4 1 5A577308
P 4350 4250
F 0 "U1" H 4200 4700 60  0000 C CNN
F 1 "XMC1100" H 4350 3800 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 4500 5000 60  0001 C CNN
F 3 "" H 4500 5000 60  0000 C CNN
	4    4350 4250
	1    0    0    -1  
$EndComp
Text GLabel 6350 3650 0    60   Output ~ 0
DOUT
Text GLabel 6350 3950 0    60   Input ~ 0
PD_SCK
Text GLabel 6850 4100 0    60   Input ~ 0
RATE
Wire Wire Line
	6850 4100 7150 4100
Text GLabel 3900 2150 0    60   Output ~ 0
RATE
Text GLabel 3900 2450 0    60   Output ~ 0
PD_SCK
Text GLabel 3900 2250 0    60   Input ~ 0
DOUT
Wire Wire Line
	6850 3700 7150 3700
Wire Wire Line
	7150 3900 6850 3900
$Comp
L C C2
U 1 1 5A578DCE
P 3900 1350
F 0 "C2" V 3750 1300 50  0000 L CNN
F 1 "100nF" V 4050 1250 50  0000 L CNN
F 2 "kicad-libraries:C0603F" H 3900 1350 60  0001 C CNN
F 3 "" H 3900 1350 60  0001 C CNN
	1    3900 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 5A579062
P 3900 1750
F 0 "#PWR024" H 3900 1750 30  0001 C CNN
F 1 "GND" H 3900 1680 30  0001 C CNN
F 2 "" H 3900 1750 60  0001 C CNN
F 3 "" H 3900 1750 60  0001 C CNN
	1    3900 1750
	1    0    0    -1  
$EndComp
$Comp
L 3V3 #PWR025
U 1 1 5A57912B
P 3900 1000
F 0 "#PWR025" H 3900 1100 40  0001 C CNN
F 1 "3V3" H 3900 1125 40  0000 C CNN
F 2 "" H 3900 1000 60  0000 C CNN
F 3 "" H 3900 1000 60  0000 C CNN
	1    3900 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 1000 3900 1150
Wire Wire Line
	4000 1100 3900 1100
Connection ~ 3900 1100
Wire Wire Line
	3900 1750 3900 1550
Wire Wire Line
	4000 1700 3900 1700
Connection ~ 3900 1700
Wire Wire Line
	4000 1600 3900 1600
Connection ~ 3900 1600
$Comp
L R_PACK4 RP1
U 1 1 5A5795AD
P 2150 3650
F 0 "RP1" H 2150 4100 50  0000 C CNN
F 1 "82" H 2150 3600 50  0000 C CNN
F 2 "kicad-libraries:4X0402" H 2150 3650 50  0001 C CNN
F 3 "" H 2150 3650 50  0000 C CNN
	1    2150 3650
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5A5797D4
P 1750 3800
F 0 "C1" V 1600 3750 50  0000 L CNN
F 1 "220pF" V 1900 3700 50  0000 L CNN
F 2 "kicad-libraries:C0402F" H 1750 3800 60  0001 C CNN
F 3 "" H 1750 3800 60  0001 C CNN
	1    1750 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 5A579A1B
P 1750 4050
F 0 "#PWR026" H 1750 4050 30  0001 C CNN
F 1 "GND" H 1750 3980 30  0001 C CNN
F 2 "" H 1750 4050 60  0001 C CNN
F 3 "" H 1750 4050 60  0001 C CNN
	1    1750 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4050 1750 4000
Wire Wire Line
	1650 3600 1950 3600
Wire Wire Line
	1950 3500 1650 3500
Wire Wire Line
	1650 3400 1950 3400
Wire Wire Line
	1950 3300 1650 3300
Connection ~ 1750 3600
Text GLabel 2450 3300 2    60   Output ~ 0
S-CS
Text GLabel 2450 3400 2    60   Output ~ 0
S-CLK
Text GLabel 2450 3500 2    60   Output ~ 0
S-MOSI
Text GLabel 2450 3600 2    60   Input ~ 0
S-MISO
Wire Wire Line
	2450 3600 2350 3600
Wire Wire Line
	2450 3500 2350 3500
Wire Wire Line
	2350 3400 2450 3400
Wire Wire Line
	2450 3300 2350 3300
Text GLabel 3900 2750 0    60   Input ~ 0
S-CS
Text GLabel 3900 2850 0    60   Input ~ 0
S-CLK
Text GLabel 3900 2950 0    60   Input ~ 0
S-MOSI
Text GLabel 3900 3900 0    60   Output ~ 0
S-MISO
Wire Wire Line
	3900 2750 4000 2750
Wire Wire Line
	4000 2850 3900 2850
Wire Wire Line
	4000 2950 3900 2950
Wire Wire Line
	3900 3900 4000 3900
$Comp
L CONN_01X01 P3
U 1 1 5A57B13E
P 3400 4000
F 0 "P3" H 3400 4100 50  0000 C CNN
F 1 "Debug" V 3500 4000 50  0000 C CNN
F 2 "kicad-libraries:DEBUG_PAD" H 3400 4000 50  0001 C CNN
F 3 "" H 3400 4000 50  0000 C CNN
	1    3400 4000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4000 4000 3600 4000
$Comp
L CONN_01X02 P2
U 1 1 5A57B58D
P 2900 4250
F 0 "P2" H 2900 4400 50  0000 C CNN
F 1 "Boot" V 3000 4250 50  0000 C CNN
F 2 "kicad-libraries:SolderJumper" H 2900 4250 50  0001 C CNN
F 3 "" H 2900 4250 50  0000 C CNN
	1    2900 4250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR027
U 1 1 5A57B642
P 3100 4350
F 0 "#PWR027" H 3100 4350 30  0001 C CNN
F 1 "GND" H 3100 4280 30  0001 C CNN
F 2 "" H 3100 4350 60  0001 C CNN
F 3 "" H 3100 4350 60  0001 C CNN
	1    3100 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4350 3100 4300
Wire Wire Line
	3100 4200 4000 4200
$Comp
L LED D1
U 1 1 5A57BA74
P 2750 2550
F 0 "D1" H 2700 2650 50  0000 C CNN
F 1 "green" H 2900 2650 50  0000 C CNN
F 2 "kicad-libraries:D0603F" H 2750 2550 50  0001 C CNN
F 3 "" H 2750 2550 50  0000 C CNN
	1    2750 2550
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5A57BEF5
P 3250 2550
F 0 "R1" V 3150 2550 50  0000 C CNN
F 1 "1k" V 3250 2550 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 3250 2550 60  0001 C CNN
F 3 "" H 3250 2550 60  0000 C CNN
	1    3250 2550
	0    1    1    0   
$EndComp
$Comp
L 3V3 #PWR028
U 1 1 5A57C1B5
P 2550 2500
F 0 "#PWR028" H 2550 2600 40  0001 C CNN
F 1 "3V3" H 2550 2625 40  0000 C CNN
F 2 "" H 2550 2500 60  0000 C CNN
F 3 "" H 2550 2500 60  0000 C CNN
	1    2550 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 2550 4000 2550
Wire Wire Line
	3000 2550 2950 2550
Wire Wire Line
	2550 2500 2550 2650
$Comp
L LED D2
U 1 1 5A57C5BC
P 2750 2650
F 0 "D2" H 2700 2550 50  0000 C CNN
F 1 "blue" H 2900 2550 50  0000 C CNN
F 2 "kicad-libraries:D0603F" H 2750 2650 50  0001 C CNN
F 3 "" H 2750 2650 50  0000 C CNN
	1    2750 2650
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5A57C6AA
P 3250 2650
F 0 "R2" V 3330 2650 50  0000 C CNN
F 1 "1k" V 3250 2650 50  0000 C CNN
F 2 "kicad-libraries:R0603F" H 3250 2650 60  0001 C CNN
F 3 "" H 3250 2650 60  0000 C CNN
	1    3250 2650
	0    1    1    0   
$EndComp
Text Notes 4850 2950 0    60   ~ 0
SPI Slave/CH0\nP0.13 : USIC0_CH0-DX2F : SEL\nP0.14 : USIC0_CH0-DX1A : CLK\nP0.15 : USIC0_CH0-DX0B : MOSI\nP2.0 : USIC0_CH0-DOUT0 : MISO
Text Notes 4850 2300 0    60   ~ 0
SPI Master/CH1\nP0.6 : USIC0_CH1-DX0C : DIN\nP0.8 : USIC0_CH1-SCLKOUT : CLK
Wire Wire Line
	3900 2150 4000 2150
Wire Wire Line
	4000 2250 3900 2250
Wire Wire Line
	4000 2450 3900 2450
Wire Wire Line
	2950 2650 3000 2650
Connection ~ 2550 2550
Wire Wire Line
	4000 2650 3500 2650
$Comp
L R_PACK4 RP2
U 1 1 5A57FF92
P 6650 4000
F 0 "RP2" H 6650 4450 50  0000 C CNN
F 1 "82" H 6650 4200 50  0000 C CNN
F 2 "kicad-libraries:4X0402" H 6650 4000 50  0001 C CNN
F 3 "" H 6650 4000 50  0000 C CNN
	1    6650 4000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6350 3650 6450 3650
Wire Wire Line
	6350 3950 6450 3950
Wire Wire Line
	6850 3900 6850 3950
Wire Wire Line
	6850 3700 6850 3650
$EndSCHEMATC
