10 MODE 1
20 DEFINT a-z
21 CALL &BC02:REM paleta default
22 INK 0,0
30 a=3:b=1:c=3: INK 0,0:INK 1,0:INK 2,0:INK 3,0:BORDER 0
40 SYMBOL AFTER 0
50 SYMBOL 111,&X001111,&X0111111,255,255,255,255,&X0111111,&X001111     
60 SYMBOL 111,0,&X001111,&X0111111,&X0111111,&X0111111,&X0111111,&X001111,0     
70 PEN a
80 PRINT"oooooooooooooooooooooooooooooooooooooooo";:PEN b
90 PRINT"o o o o o o o o o o o o o o o o o o o o ";:PEN a
100 PRINT"oooooooooooooooooooooooooooooooooooooooo";:PEN c
110 PRINT" o   o o  o ooooo  oo  o  o ooooo oooo  ";
120 PRINT" oo oo o  o   o   o  o oo o   o   o     ";
130 PRINT" o o o o  o   o   oooo o oo   o   oo    ";
140 PRINT" o   o o  o   o   o  o o  o   o   o     ";
150 PRINT" o   o  oo    o   o  o o  o   o   oooo  ";:PEN a
160 PRINT"oooooooooooooooooooooooooooooooooooooooo";:PEN b
170 PRINT"o o o o o o o o o o o o o o o o o o o o ";:PEN a
180 PRINT"oooooooooooooooooooooooooooooooooooooooo";:PEN c
190 PRINT" o   o  oo  o  o ooooo  oo  o   o  oo   ";:
200 PRINT" oo oo o  o oo o   o   o  o  o o  o  o  ";
210 PRINT" o o o o  o o oo   o   o  o   o   oooo  ";
220 PRINT" o   o o  o o  o   o   o  o   o   o  o  ";
230 PRINT" o   o  oo  o  o   o    oo    o   o  o  ";:PEN a
240 PRINT"oooooooooooooooooooooooooooooooooooooooo";:PEN b
250 PRINT"o o o o o o o o o o o o o o o o o o o o ";:PEN a
260 PRINT"oooooooooooooooooooooooooooooooooooooooo";:PEN c
270 PRINT"":SYMBOL AFTER 0 
280 PRINT"                is loading ...." 
290 PRINT"" 
300 PRINT"         Jose Javier Garcia Aranda 2016 ";:PEN 2
310 PRINT"               8 Bits de Poder         "; 
320 SYMBOL 111,0,0,&X01111,&X111111,&X111111,&X111111,&X011111,&X01111
330 PRINT CHR$(22)+CHR$(1):' modo transparente 
340 i=i+1 :IF i<2 THEN a=2:b=3:c=1: LOCATE 1,1:GOTO 70
350 SYMBOL AFTER 256
351 CALL &BC02:INK 2,7,14:INK 0,0:BORDER 0
360 MEMORY 26999
370 LOAD "!8bp.lib"    
380 LOAD "!music.bin"   
390 LOAD "!sprites.bin"  
400 RUN "!mont9.bas"     