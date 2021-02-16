EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
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
L TPA2006D1DRBR:TPA2006D1DRBR U?
U 1 1 6026AF34
P 5500 3300
AR Path="/6026AF34" Ref="U?"  Part="1" 
AR Path="/6026A3BE/6026AF34" Ref="U3"  Part="1" 
AR Path="/60276BEA/6026AF34" Ref="U5"  Part="1" 
F 0 "U3" H 6900 3687 60  0000 C CNN
F 1 "TPA2006D1DRBR" H 6900 3581 60  0000 C CNN
F 2 "footprints:TPA2006D1DRBR" H 6900 3540 60  0001 C CNN
F 3 "" H 5500 3300 60  0000 C CNN
	1    5500 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 6027011E
P 8300 3300
AR Path="/6026A3BE/6027011E" Ref="#PWR06"  Part="1" 
AR Path="/60276BEA/6027011E" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 8300 3050 50  0001 C CNN
F 1 "GND" V 8305 3172 50  0000 R CNN
F 2 "" H 8300 3300 50  0001 C CNN
F 3 "" H 8300 3300 50  0001 C CNN
	1    8300 3300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 60270A57
P 8300 3500
AR Path="/6026A3BE/60270A57" Ref="#PWR07"  Part="1" 
AR Path="/60276BEA/60270A57" Ref="#PWR012"  Part="1" 
F 0 "#PWR012" H 8300 3250 50  0001 C CNN
F 1 "GND" V 8305 3372 50  0000 R CNN
F 2 "" H 8300 3500 50  0001 C CNN
F 3 "" H 8300 3500 50  0001 C CNN
	1    8300 3500
	0    -1   -1   0   
$EndComp
NoConn ~ 5500 3400
Text HLabel 9050 3600 2    50   Input ~ 0
VDD
Text HLabel 8300 3400 2    50   Output ~ 0
SPKR+
Text HLabel 8300 3700 2    50   Output ~ 0
SPKR-
Text HLabel 3800 3150 1    50   Input ~ 0
VDD
$Comp
L power:GND #PWR05
U 1 1 6027124D
P 3800 4150
AR Path="/6026A3BE/6027124D" Ref="#PWR05"  Part="1" 
AR Path="/60276BEA/6027124D" Ref="#PWR010"  Part="1" 
F 0 "#PWR010" H 3800 3900 50  0001 C CNN
F 1 "GND" H 3805 3977 50  0000 C CNN
F 2 "" H 3800 4150 50  0001 C CNN
F 3 "" H 3800 4150 50  0001 C CNN
	1    3800 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 6027187C
P 3100 3500
AR Path="/6026A3BE/6027187C" Ref="#PWR03"  Part="1" 
AR Path="/60276BEA/6027187C" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 3100 3250 50  0001 C CNN
F 1 "GND" V 3105 3372 50  0000 R CNN
F 2 "" H 3100 3500 50  0001 C CNN
F 3 "" H 3100 3500 50  0001 C CNN
	1    3100 3500
	0    1    1    0   
$EndComp
Text HLabel 5500 3300 0    50   Input ~ 0
~SHUTDOWN
Text HLabel 3100 3700 0    50   Input ~ 0
LINEIN+
Text HLabel 3100 3600 0    50   Input ~ 0
LINEIN-
Text HLabel 3100 3800 0    50   Input ~ 0
SEL
Text HLabel 4400 3800 2    50   Input ~ 0
LINEOUT+
Text HLabel 4400 3600 2    50   Input ~ 0
LINEOUT-
Text HLabel 3700 4150 3    50   Input ~ 0
MUTE
$Comp
L Device:C C2
U 1 1 60273CC0
P 3550 2900
AR Path="/6026A3BE/60273CC0" Ref="C2"  Part="1" 
AR Path="/60276BEA/60273CC0" Ref="C3"  Part="1" 
F 0 "C2" V 3298 2900 50  0000 C CNN
F 1 "0.1uF" V 3389 2900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3588 2750 50  0001 C CNN
F 3 "~" H 3550 2900 50  0001 C CNN
	1    3550 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 2900 3700 3150
$Comp
L power:GND #PWR04
U 1 1 60274CA1
P 3400 2900
AR Path="/6026A3BE/60274CA1" Ref="#PWR04"  Part="1" 
AR Path="/60276BEA/60274CA1" Ref="#PWR09"  Part="1" 
F 0 "#PWR09" H 3400 2650 50  0001 C CNN
F 1 "GND" V 3405 2772 50  0000 R CNN
F 2 "" H 3400 2900 50  0001 C CNN
F 3 "" H 3400 2900 50  0001 C CNN
	1    3400 2900
	0    1    1    0   
$EndComp
Text Label 5200 3500 0    50   ~ 0
SLO+
$Comp
L FSA2275UMX:FSA2275UMX U?
U 1 1 6026AF3A
P 3750 3650
AR Path="/6026AF3A" Ref="U?"  Part="1" 
AR Path="/6026A3BE/6026AF3A" Ref="U2"  Part="1" 
AR Path="/60276BEA/6026AF3A" Ref="U4"  Part="1" 
F 0 "U2" H 3675 4706 50  0000 C CNN
F 1 "FSA2275UMX" H 3675 4615 50  0000 C CNN
F 2 "footprints:FSA2275" H 3750 3650 50  0001 C CNN
F 3 "" H 3750 3650 50  0001 C CNN
	1    3750 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3500 5500 3500
Wire Wire Line
	5500 3600 5050 3600
Wire Wire Line
	5050 3600 5050 3700
Wire Wire Line
	5050 3700 4400 3700
Text Label 5200 3600 0    50   ~ 0
SLO-
$Comp
L Device:C C7
U 1 1 6034D245
P 9050 3750
AR Path="/60276BEA/6034D245" Ref="C7"  Part="1" 
AR Path="/6026A3BE/6034D245" Ref="C6"  Part="1" 
F 0 "C6" H 9165 3796 50  0000 L CNN
F 1 "1uF" H 9165 3705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9088 3600 50  0001 C CNN
F 3 "~" H 9050 3750 50  0001 C CNN
	1    9050 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 3600 9050 3600
$Comp
L power:GND #PWR0105
U 1 1 6034E328
P 9050 3900
AR Path="/60276BEA/6034E328" Ref="#PWR0105"  Part="1" 
AR Path="/6026A3BE/6034E328" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0105" H 9050 3650 50  0001 C CNN
F 1 "GND" H 9055 3727 50  0000 C CNN
F 2 "" H 9050 3900 50  0001 C CNN
F 3 "" H 9050 3900 50  0001 C CNN
	1    9050 3900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
