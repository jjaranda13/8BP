1 MEMORY 23999
2 CALL &6B78
3 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:|AUTOALL,0:|PRINTSPALL,0,0,0,0
4 |SETUPSP,31,9,29: |SETUPSP,31,0,1: vy=0:'coche
10 MODE 0
20 DEFINT a-z
31 |LOCATESP,31,160,40: x=40
32 |SETUPSP,30,9,44: |SETUPSP,30,0,17:|LOCATESP,30,-20,10:'cartel
40 CALL &BC02:'default paleta
50 GOSUB 430
60 INK 0,13
70 INK 14,10
80 linestinta=3
90 rangotintas=8
91 ' establecimiento de patron de tintas
100 |RINK,1,3,3,3,3,24,24,24,24
101 |RINK,0
110 y=400
120 ' PAINT ROAD
121 tini=1
130 FOR franjas=1 TO 10
140 FOR t=tini TO rangotintas+tini-1
150 FOR j=1 TO linestinta
160 PLOT 0,y,14:DRAW 136,y
170 PLOT 140,y,t:DRAW 160,y
180 PLOT 480,y,t:DRAW 500,y
190 PLOT 504,y,14:DRAW 640,y  
200 y=y-2
210 NEXT j
220 NEXT
240 NEXT franjas
250 saltob=-16:xc=65: cosa=0
270 REM ciclo de juego
293 IF saltob=-16 THEN 296
294 IF saltob>0 THEN cosa=-salto ELSE  cosa=cosa-1
295 IF cosa<0 THEN |RINK,cosa:vy=3*cosa:posv=posv-3*cosa:|MOVERALL,-vy,0:IF saltob <=0 THEN cosa=2-saltob
296 |PRINTSPALL
351 ciclo=ciclo+1:IF posv>240 THEN posv=-30:|LOCATESP,30,posv,xc:IF xc=10 THEN xc=65 ELSE xc=10 
361 IF INKEY(27)=0 THEN IF x<52 THEN x=x+1:POKE 27499,x:GOTO 370
362 IF INKEY(34)=0 THEN IF x>21 THEN x=x-1:POKE 27499,x
370 IF INKEY(67)=0 THEN IF saltob<16 THEN saltob=saltob+1:salto=saltob/4
380 IF INKEY(69)=0 THEN IF saltob>-16 THEN saltob=saltob-1:salto=saltob/4
390 SOUND 1,6000/(salto+17),1,15
400 GOTO 270
421 REM PALETA
430 INK  0 , 12 
440 INK  1 , 5 
450 INK  2 , 20 
460 INK  3 , 6 
470 INK  4 , 26 
480 INK  5 , 0 
490 INK  6 , 2 
500 INK  7 , 8 
510 INK  8 , 10 
520 INK  9 , 12 
530 INK  10 , 6 
540 INK  11 , 15 
550 INK  12 , 0 
560 INK  13 , 23 
570 INK  14 , 0 
580 INK  15 , 11 
590 RETURN