1 MODE 0
2 MEMORY 19999
11 GOSUB 1420
15 LOAD "!Monty.scr",&C000
20 LOAD "!monty.bin"
30 CLEAR:MEMORY 22000
31 RUN "!monty.bas" 
1420 '---paleta de tintas
1430 INK  0 , 0 
1440 INK  1 , 26
1450 INK  2 ,14
1460 INK  3 , 2
1470 INK  4 ,15
1480 INK  5 , 13
1490 INK  6 , 6
1500 INK  7 ,5
1510 INK  8 , 17
1520 INK  9 ,7
1530 INK  10 ,24
1540 INK  11 ,21
1550 INK  12 ,23
1560 INK  13 ,10
1570 INK  14 ,16
1580 INK  15 ,3
1590 BORDER 0
1600 RETURN