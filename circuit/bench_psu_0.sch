EESchema Schematic File Version 4
LIBS:bench_psu_0-cache
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
L pspice:VSOURCE V1
U 1 1 5E919D77
P 1950 2600
F 0 "V1" H 2178 2646 50  0000 L CNN
F 1 "VSOURCE" H 2178 2555 50  0000 L CNN
F 2 "" H 1950 2600 50  0001 C CNN
F 3 "~" H 1950 2600 50  0001 C CNN
F 4 "V" H 1950 2600 50  0001 C CNN "Spice_Primitive"
F 5 "dc 30 ac 0 pulse(0 30 0 1u)" H 1950 2600 50  0001 C CNN "Spice_Model"
F 6 "Y" H 1950 2600 50  0001 C CNN "Spice_Netlist_Enabled"
	1    1950 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5E919F88
P 8050 3950
F 0 "#PWR04" H 8050 3700 50  0001 C CNN
F 1 "GND" H 8055 3777 50  0000 C CNN
F 2 "" H 8050 3950 50  0001 C CNN
F 3 "" H 8050 3950 50  0001 C CNN
	1    8050 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3100 1950 2900
Text Notes 1250 3800 0    50   ~ 0
.tran 2n 10u
Wire Wire Line
	1950 1750 1950 2300
$Comp
L Device:Q_PNP_Darlington_BCE Q1
U 1 1 5E92EBB6
P 5050 1450
F 0 "Q1" V 5378 1450 50  0000 C CNN
F 1 "Q_PNP_Darlington_BCE" V 5287 1450 50  0000 C CNN
F 2 "" H 5250 1550 50  0001 C CNN
F 3 "~" H 5050 1450 50  0001 C CNN
F 4 "X" H 5050 1450 50  0001 C CNN "Spice_Primitive"
F 5 "TIP147" H 5050 1450 50  0001 C CNN "Spice_Model"
F 6 "Y" H 5050 1450 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/munu/spice/KiCad-Spice-Library/Models/Transistor/BJT/BJTDAR.LIB" H 5050 1450 50  0001 C CNN "Spice_Lib_File"
	1    5050 1450
	0    -1   -1   0   
$EndComp
$Comp
L Device:Q_NPN_BCE Q2
U 1 1 5E92F51D
P 5150 2750
F 0 "Q2" H 5340 2704 50  0000 L CNN
F 1 "Q_NPN_BCE" H 5340 2795 50  0000 L CNN
F 2 "" H 5350 2850 50  0001 C CNN
F 3 "~" H 5150 2750 50  0001 C CNN
F 4 "Q" H 5150 2750 50  0001 C CNN "Spice_Primitive"
F 5 "BC547" H 5150 2750 50  0001 C CNN "Spice_Model"
F 6 "Y" H 5150 2750 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/munu/spice/KiCad-Spice-Library/Models/Transistor/BJT/BJTN.LIB" H 5150 2750 50  0001 C CNN "Spice_Lib_File"
	1    5150 2750
	-1   0    0    1   
$EndComp
$Comp
L Device:Q_NPN_BCE Q3
U 1 1 5E92F5C9
P 5850 3400
F 0 "Q3" H 6040 3354 50  0000 L CNN
F 1 "Q_NPN_BCE" H 6040 3445 50  0000 L CNN
F 2 "" H 6050 3500 50  0001 C CNN
F 3 "~" H 5850 3400 50  0001 C CNN
F 4 "Q" H 5850 3400 50  0001 C CNN "Spice_Primitive"
F 5 "BC547" H 5850 3400 50  0001 C CNN "Spice_Model"
F 6 "Y" H 5850 3400 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/munu/spice/KiCad-Spice-Library/Models/Transistor/BJT/BJTN.LIB" H 5850 3400 50  0001 C CNN "Spice_Lib_File"
	1    5850 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	5050 1650 5050 2050
$Comp
L power:GND #PWR05
U 1 1 5E92FC97
P 5050 3900
F 0 "#PWR05" H 5050 3650 50  0001 C CNN
F 1 "GND" H 5055 3727 50  0000 C CNN
F 2 "" H 5050 3900 50  0001 C CNN
F 3 "" H 5050 3900 50  0001 C CNN
	1    5050 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2950 5050 3900
$Comp
L power:GND #PWR06
U 1 1 5E92FE95
P 5750 3900
F 0 "#PWR06" H 5750 3650 50  0001 C CNN
F 1 "GND" H 5755 3727 50  0000 C CNN
F 2 "" H 5750 3900 50  0001 C CNN
F 3 "" H 5750 3900 50  0001 C CNN
	1    5750 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3600 5750 3900
Wire Wire Line
	5350 2750 5750 2750
Wire Wire Line
	5750 2750 5750 3200
$Comp
L power:VCC #PWR03
U 1 1 5E9309E0
P 4300 1050
F 0 "#PWR03" H 4300 900 50  0001 C CNN
F 1 "VCC" H 4317 1223 50  0000 C CNN
F 2 "" H 4300 1050 50  0001 C CNN
F 3 "" H 4300 1050 50  0001 C CNN
	1    4300 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1050 4300 1350
$Comp
L Device:R R_load1
U 1 1 5E930CF1
P 8050 2800
F 0 "R_load1" H 8120 2846 50  0000 L CNN
F 1 "10" H 8120 2755 50  0000 L CNN
F 2 "" V 7980 2800 50  0001 C CNN
F 3 "~" H 8050 2800 50  0001 C CNN
F 4 "R" H 8050 2800 50  0001 C CNN "Spice_Primitive"
F 5 "10" H 8050 2800 50  0001 C CNN "Spice_Model"
F 6 "Y" H 8050 2800 50  0001 C CNN "Spice_Netlist_Enabled"
	1    8050 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 1350 8050 1350
$Comp
L power:GND #PWR07
U 1 1 5E9318A3
P 6350 3950
F 0 "#PWR07" H 6350 3700 50  0001 C CNN
F 1 "GND" H 6355 3777 50  0000 C CNN
F 2 "" H 6350 3950 50  0001 C CNN
F 3 "" H 6350 3950 50  0001 C CNN
	1    6350 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 3400 6350 3400
Wire Wire Line
	8050 1350 8050 1900
Wire Wire Line
	8050 2950 8050 3950
Wire Wire Line
	4300 1350 4850 1350
Wire Wire Line
	6350 3400 6350 2950
Wire Wire Line
	6350 2000 4300 2000
Wire Wire Line
	4300 2000 4300 1350
Connection ~ 4300 1350
$Comp
L Device:R R_base1
U 1 1 5E932755
P 5050 2200
F 0 "R_base1" H 5120 2246 50  0000 L CNN
F 1 "1k" H 5120 2155 50  0000 L CNN
F 2 "" V 4980 2200 50  0001 C CNN
F 3 "~" H 5050 2200 50  0001 C CNN
F 4 "R" H 5050 2200 50  0001 C CNN "Spice_Primitive"
F 5 "1k" H 5050 2200 50  0001 C CNN "Spice_Model"
F 6 "Y" H 5050 2200 50  0001 C CNN "Spice_Netlist_Enabled"
	1    5050 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2350 5050 2550
Wire Wire Line
	6350 3400 6350 3550
Connection ~ 6350 3400
$Comp
L Device:R R3
U 1 1 5E932C2A
P 6350 2800
F 0 "R3" H 6420 2846 50  0000 L CNN
F 1 "83.7k" H 6420 2755 50  0000 L CNN
F 2 "" V 6280 2800 50  0001 C CNN
F 3 "~" H 6350 2800 50  0001 C CNN
F 4 "R" H 6350 2800 50  0001 C CNN "Spice_Primitive"
F 5 "83.7k" H 6350 2800 50  0001 C CNN "Spice_Model"
F 6 "Y" H 6350 2800 50  0001 C CNN "Spice_Netlist_Enabled"
	1    6350 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 2650 6350 2000
Wire Wire Line
	6350 3850 6350 3950
$Comp
L Device:R R4
U 1 1 5E933A04
P 6350 3700
F 0 "R4" H 6420 3746 50  0000 L CNN
F 1 "2k" H 6420 3655 50  0000 L CNN
F 2 "" V 6280 3700 50  0001 C CNN
F 3 "~" H 6350 3700 50  0001 C CNN
F 4 "R" H 6350 3700 50  0001 C CNN "Spice_Primitive"
F 5 "2k" H 6350 3700 50  0001 C CNN "Spice_Model"
F 6 "Y" H 6350 3700 50  0001 C CNN "Spice_Netlist_Enabled"
	1    6350 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2350 5750 2750
Connection ~ 5750 2750
$Comp
L Device:R R_shunt1
U 1 1 5E93471A
P 8050 2100
F 0 "R_shunt1" H 8120 2146 50  0000 L CNN
F 1 "0.02" H 8120 2055 50  0000 L CNN
F 2 "" V 7980 2100 50  0001 C CNN
F 3 "~" H 8050 2100 50  0001 C CNN
	1    8050 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 2250 8050 2300
Connection ~ 8050 2300
Wire Wire Line
	8050 2300 8050 2550
Connection ~ 8050 1900
Wire Wire Line
	8050 1900 8050 1950
Wire Wire Line
	8050 1900 8550 1900
Wire Wire Line
	8550 1900 8550 2000
Wire Wire Line
	8550 2200 8550 2300
Wire Wire Line
	8550 2300 8050 2300
Wire Wire Line
	9350 2100 9350 1750
Wire Wire Line
	7600 1750 7600 2250
Wire Wire Line
	7600 2250 7350 2250
Wire Wire Line
	7350 3300 7550 3300
Wire Wire Line
	7550 3300 7550 2550
Wire Wire Line
	7550 2550 8050 2550
Connection ~ 8050 2550
Wire Wire Line
	8050 2550 8050 2650
Wire Wire Line
	7350 2450 9550 2450
Wire Wire Line
	7350 3500 9550 3500
Text GLabel 9550 2450 2    50   Input ~ 0
I_SET
Text GLabel 9550 3500 2    50   Input ~ 0
V_SET
Wire Wire Line
	6350 3400 6700 3400
Wire Wire Line
	7600 1750 9350 1750
Wire Wire Line
	6700 2350 5750 2350
$Comp
L pspice:VSOURCE V2
U 1 1 5E949FE8
P 950 2600
F 0 "V2" H 1178 2646 50  0000 L CNN
F 1 "VSOURCE" H 1178 2555 50  0000 L CNN
F 2 "" H 950 2600 50  0001 C CNN
F 3 "~" H 950 2600 50  0001 C CNN
F 4 "V" H 950 2600 50  0001 C CNN "Spice_Primitive"
F 5 "dc 1 ac 0 pulse(0 1 0 10n)" H 950 2600 50  0001 C CNN "Spice_Model"
F 6 "Y" H 950 2600 50  0001 C CNN "Spice_Netlist_Enabled"
	1    950  2600
	1    0    0    -1  
$EndComp
$Comp
L pspice:0 #GND01
U 1 1 5E949FEF
P 950 3300
F 0 "#GND01" H 950 3200 50  0001 C CNN
F 1 "0" H 950 3387 50  0000 C CNN
F 2 "" H 950 3300 50  0001 C CNN
F 3 "~" H 950 3300 50  0001 C CNN
	1    950  3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  3300 950  3100
$Comp
L power:GND #PWR02
U 1 1 5E949FFC
P 1200 3250
F 0 "#PWR02" H 1200 3000 50  0001 C CNN
F 1 "GND" H 1205 3077 50  0000 C CNN
F 2 "" H 1200 3250 50  0001 C CNN
F 3 "" H 1200 3250 50  0001 C CNN
	1    1200 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  3100 1200 3100
Wire Wire Line
	1200 3100 1200 3250
Connection ~ 950  3100
Wire Wire Line
	950  3100 950  2900
Wire Wire Line
	950  1750 950  2300
$Comp
L pspice:VSOURCE V3
U 1 1 5E94B32E
P 2950 2600
F 0 "V3" H 3178 2646 50  0000 L CNN
F 1 "VSOURCE" H 3178 2555 50  0000 L CNN
F 2 "" H 2950 2600 50  0001 C CNN
F 3 "~" H 2950 2600 50  0001 C CNN
F 4 "V" H 2950 2600 50  0001 C CNN "Spice_Primitive"
F 5 "dc 100m ac 0 pulse(0 0.1 0 500n)" H 2950 2600 50  0001 C CNN "Spice_Model"
F 6 "Y" H 2950 2600 50  0001 C CNN "Spice_Netlist_Enabled"
	1    2950 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3100 2950 2900
Wire Wire Line
	2950 1750 2950 2300
Wire Wire Line
	2950 3100 1950 3100
Wire Wire Line
	1950 3100 1200 3100
Connection ~ 1950 3100
Connection ~ 1200 3100
$Comp
L power:VCC #PWR01
U 1 1 5E91A036
P 1950 1750
F 0 "#PWR01" H 1950 1600 50  0001 C CNN
F 1 "VCC" H 1967 1923 50  0000 C CNN
F 2 "" H 1950 1750 50  0001 C CNN
F 3 "" H 1950 1750 50  0001 C CNN
	1    1950 1750
	1    0    0    -1  
$EndComp
Text GLabel 2950 1750 1    50   Input ~ 0
I_SET
Text GLabel 950  1750 1    50   Input ~ 0
V_SET
Wire Wire Line
	9150 2100 9350 2100
$Comp
L Amplifier_Operational:LM358 U3
U 1 1 5E955BC4
P 8850 2100
F 0 "U3" H 8850 2467 50  0000 C CNN
F 1 "LM358" H 8850 2376 50  0000 C CNN
F 2 "" H 8850 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 8850 2100 50  0001 C CNN
F 4 "X" H 8850 2100 50  0001 C CNN "Spice_Primitive"
F 5 "LM358/NS" H 8850 2100 50  0001 C CNN "Spice_Model"
F 6 "Y" H 8850 2100 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "/home/munu/spice/KiCad-Spice-Library/Models/Operational Amplifier/Lm358.mod" H 8850 2100 50  0001 C CNN "Spice_Lib_File"
	1    8850 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2350 6700 3400
Wire Wire Line
	6750 3400 6700 3400
Connection ~ 6700 3400
Wire Wire Line
	6750 2350 6700 2350
Connection ~ 6700 2350
$Comp
L Amplifier_Operational:LM358 U1
U 2 1 5E9584F4
P 7050 2350
F 0 "U1" H 7050 1983 50  0000 C CNN
F 1 "LM358" H 7050 2074 50  0000 C CNN
F 2 "" H 7050 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 7050 2350 50  0001 C CNN
	2    7050 2350
	-1   0    0    1   
$EndComp
$Comp
L Amplifier_Operational:LM358 U1
U 3 1 5E95861C
P 8700 1050
F 0 "U1" H 8658 1096 50  0000 L CNN
F 1 "LM358" H 8658 1005 50  0000 L CNN
F 2 "" H 8700 1050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 8700 1050 50  0001 C CNN
	3    8700 1050
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM358 U1
U 1 1 5E958B17
P 7050 3400
F 0 "U1" H 7050 3033 50  0000 C CNN
F 1 "LM358" H 7050 3124 50  0000 C CNN
F 2 "" H 7050 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 7050 3400 50  0001 C CNN
	1    7050 3400
	-1   0    0    1   
$EndComp
$Comp
L Amplifier_Operational:LM358 U3
U 3 1 5E958C2F
P 9150 1050
F 0 "U3" H 9108 1096 50  0000 L CNN
F 1 "LM358" H 9108 1005 50  0000 L CNN
F 2 "" H 9150 1050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2904-n.pdf" H 9150 1050 50  0001 C CNN
	3    9150 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E9591E7
P 8800 1400
F 0 "#PWR?" H 8800 1150 50  0001 C CNN
F 1 "GND" H 8805 1227 50  0000 C CNN
F 2 "" H 8800 1400 50  0001 C CNN
F 3 "" H 8800 1400 50  0001 C CNN
	1    8800 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 1350 8800 1350
Wire Wire Line
	8800 1350 8800 1400
Wire Wire Line
	8800 1350 9050 1350
Connection ~ 8800 1350
$Comp
L power:VCC #PWR?
U 1 1 5E95B029
P 8800 750
F 0 "#PWR?" H 8800 600 50  0001 C CNN
F 1 "VCC" H 8817 923 50  0000 C CNN
F 2 "" H 8800 750 50  0001 C CNN
F 3 "" H 8800 750 50  0001 C CNN
	1    8800 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 750  8800 750 
Wire Wire Line
	8800 750  9050 750 
Connection ~ 8800 750 
$EndSCHEMATC
