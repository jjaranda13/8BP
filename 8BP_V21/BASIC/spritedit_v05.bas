10 MEMORY &4000
20 DEFINT a-z
30 buffer=&4000: REM buffer de copia de pantalla (16k hasta 32k)
40 CALL &BC02: REM inicializa paleta a valor por defecto
50 MODE 1
60 BORDER 7
70 INK 1,24
80 PEN 1:PRINT "       SIMPRITE: simple sprite editor"
90 PRINT "" 
100 PRINT ""
110 PRINT "    ---- CONTROLES EDICION----"
120 PRINT "     1,2 : tinta -/+"
130 PRINT "     qaop : mueve cursor pixel"
140 PRINT "     space: pinta"
150 PRINT "     h: flip horizontal"
160 PRINT "     v: flip vertical"
170 PRINT "     c: clear sprite"
180 PRINT "     b: imprime bytes (asm) en printer"
190 PRINT "     r: reload &4000
200 PRINT "    -------------------------"
210 PRINT " Antes de empezar puedes cargar un sprite ensamblandolo en la direccion &4000"
220 PRINT " No ensambles ancho y alto, solo los bytes del dibujo.
230 PRINT " "
240 PRINT " La paleta la puedes cambiar pero debera ser la misma en tu programa"
250 INPUT "default paleta?(Y/N)",p$ 
260 INPUT "ancho (par)?", ancho
270 INPUT "alto?",alto
275 INPUT "color de fondo?", fondo
280 MODE 0: GOSUB 2030:PEN AMARILLO
290 REM voy a inicializar la paleta
300 IF p$="N" OR p$="n" THEN GOSUB 1840
301 INK 0,fondo
310 anchob=ancho/2: altob=alto
320 FOR y=0 TO altob-1
330 FOR x=0 TO anchob-1
340 REM dirorig = buffer + (INT(y / 8) * 80) + (INT (y MOD 8) * 2048) +x
350 dirorig = buffer + y*anchob+x
360 dirdest = &C000  + (INT (y / 8) * 80) + (INT(y MOD 8) * 2048) +x
370 POKE dirdest, PEEK(dirorig)
380 NEXT
390 NEXT
400 REM for y=399 to 199 step -(alto+1)*2
410 PLOT 1,399-alto*2,AMARILLO: DRAW (ancho)*4,399-alto*2
420 PLOT (ancho)*4,399:DRAW (ancho)*4,399-alto*2
430 REM next
440 FOR x=0 TO 15
450 PEN x
460 LOCATE x+1,20: PRINT CHR$(143)
470 NEXT
480 PEN AMARILLO:LOCATE 1,21:PRINT "ancho:";ancho;" ";"alto:";alto
490 LOCATE 1,10:
500 PRINT "1,2 : tinta -/+"
510 PRINT "qaop : mueve "
520 PRINT "space: pinta"
530 PRINT "h: flip horizontal"
540 PRINT "v: flip vertical"
550 PRINT "c: clear sprite"
560 PRINT "b: imprime bytes "
565 PRINT "r: reload &4000"     
570 TCOUNT =0
580 REM bloque principal del programa de edicion
590 REM -----------------------------------------------------
600 tinta=1:tintant=tinta
610 LOCATE tinta+1,19:PRINT CHR$(245)
620 x=0:y=399
630 tintant=TEST(x,y)
640 PLOT x,y,15
650 xa=x:ya=y
660 b$=INKEY$
670 T=TEST (X,Y) 
680 TCOUNT =TCOUNT -1: IF TCOUNT <0 THEN TCOUNT=10: IF T=0 THEN T=15 ELSE T=0
690 PLOT x,y,T : CALL &BD19
700 IF b$="" GOTO 660      
710 SOUND 1,100,7,7:CALL &BD19: REM por si compilas para que no se acelere
720 IF b$="p" THEN IF x<(ancho-1)*4 THEN x=x+4: REM en mode 0 es 4, en mode 1 es 2
730 IF b$="o" THEN IF x>0 THEN x=x-4    
740 IF b$="q" THEN IF y<399 THEN y=y+2:  REM en cualquier mode es 2
750 IF b$="a" THEN IF y >399-(alto-1)*2 THEN y=y-2      
760 IF b$=" " THEN tintant=tinta      
770 LOCATE tinta+1,19:PRINT " " 
780 IF b$="1" THEN tinta=tinta-1:IF tinta<0 THEN tinta=0
790 IF b$="2" THEN tinta=tinta+1:IF tinta>15 THEN tinta=15
800 IF b$="h" THEN GOSUB 1130
810 IF b$="v" THEN GOSUB 1430
820 IF b$="c" THEN GOSUB 1720
830 IF b$="b" THEN GOSUB 950
835 IF b$="r" THEN GOTO 320
840 LOCATE tinta+1,19:PRINT CHR$(245)
850 REM LOCATE 1,23:PRINT "tecla:";b$
860 PLOT xa,ya, tintant
870 row=200-INT((y+1)/2): col=INT(x/8)
880 dirdest=buffer + row*anchob+col
890 dirorig=&C000 + (INT(row / 8) * 80) + (INT(row MOD 8) * 2048) +col
900 POKE dirdest,PEEK(dirorig)
910  REM LOCATE 1,24 :PRINT HEX$(dirorig); " "; HEX$(dirdest);" ";row; " ";y
920 LOCATE 1,22 :PRINT "X:";col;" ";"Y=";row
930 LOCATE 1,23 :PRINT "BYTE:";PEEK(dirorig):REM  HEX$(dirorig);"=";PEEK(dirorig)
940 GOTO 630
950 REM --volcado de bytes a la impresora en lenguaje asm ---------------
960 REM MODE 1
970 LOCATE 1,24:PRINT "sprite printing..."
980 PRINT #8,";------ BEGIN SPRITE --------"
990 PRINT #8,"db"; anchob ;"; ancho"
1000 PRINT #8,"db"; altob ;"; alto"
1010 FOR yp=0 TO altob-1
1020 PRINT #8,"db";
1030 FOR xp=0 TO anchob-1
1040 REM dir=buffer + (INT (y / 8) * 80) + (INT (y MOD 8) * 2048) +x
1050 dir=buffer + yp*anchob+xp
1060 IF xp=0 THEN PRINT #8,PEEK(dir); ELSE PRINT #8,",";PEEK(dir);
1070 NEXT
1080 PRINT #8
1090 NEXT
1100 PRINT #8,";------ END SPRITE --------"
1110 LOCATE 1,24: PRINT " sprite printed!"
1120 RETURN
1130 REM ---------flip H------------------------
1140 LOCATE 1,25: input "espejo izq?[Y/N]",e$: if  e$="Y" or e$="y" then mitad=(anchob)/2 else mitad=0
1141 LOCATE 1,25:PRINT "flipping H..."
1150 REM volcamos el sprite de buffer en pantalla flipeando
1160 FOR yf=0 TO altob-1
1170 FOR xf=0 TO anchob-1 -mitad
1180 REM dirorig = buffer + (INT(yf / 8) * 80) + (INT (yf MOD 8) * 2048) +xf
1190 dirorig = buffer + yf*anchob+xf
1200 dirdest = &C000  + (INT (yf / 8) * 80) + (INT(yf MOD 8) * 2048) + (anchob-1-xf)
1210 a=(PEEK(dirorig) AND &X10101010)
1220 b=(PEEK(dirorig) AND &X01010101)
1230 a=a*2:b=b/2
1240 byte=(a OR b)
1250 REM locate 10,25 :print byte :rem "X:";xf;"Y";yf
1260 POKE dirdest, byte
1270 REM locate 10,25 :print byte :rem "X:";xf;"Y";yf
1280 NEXT
1290 NEXT
1300 REM ahora volcamos el sprite de pantalla en el buffer
1310 LOCATE 1,25: PRINT "buffering..:"
1320 FOR yf=0 TO altob-1
1330 FOR xf=0 TO anchob-1
1340 dirorig = &C000 + (INT(yf / 8) * 80) + (INT (yf MOD 8) * 2048) +xf
1350 REM dirdest = buffer  + (INT (yf / 8) * 80) + (INT(yf MOD 8) * 2048) + xf
1360 dirdest = buffer  + yf*anchob+xf
1370 POKE dirdest, PEEK(dirorig)
1380 REM locate 10,25 :print "X:";xf;"Y";yf
1390 NEXT
1400 NEXT
1410 LOCATE 1,25: PRINT "flipping ok        "
1420 RETURN


1430 REM ---------flip V------------------------
1440 LOCATE 1,25: input "espejo ?[Y/N]",e$: if  e$="Y" or e$="y" then mitad=(altob)/2 else mitad=0
1441 LOCATE 1,25: PRINT "flipping V..."
1450 REM volcamos el sprite de buffer en pantalla flipeando
1460 FOR yf=0+mitad TO altob-1 
1470 FOR xf=0 TO anchob-1
1480 REM dirorig = buffer + (INT((altob-1-yf) / 8) * 80) + (INT ((altob-1-yf) MOD 8) * 2048) +xf
1490 dirorig = buffer + (altob-1-yf)*anchob+xf
1500 dirdest = &C000  + (INT (yf / 8) * 80) + (INT(yf MOD 8) * 2048) + xf
1510 a=(PEEK(dirorig) AND &X10101010)
1520 b=(PEEK(dirorig) AND &X01010101)
1530 REM a=a/2:b=b*2
1540 byte=(a OR b)
1550 REM locate 10,25 :print byte :rem "X:";xf;"Y";yf
1560 POKE dirdest, byte
1570 REM locate 10,25 :print byte :rem "X:";xf;"Y";yf
1580 NEXT
1590 NEXT
1600 REM ahora volcamos el sprite de pantalla en el buffer
1610 LOCATE 1,25: PRINT "buffering..:"
1620 FOR yf=0 TO altob-1
1630 FOR xf=0 TO anchob-1
1640 dirorig = &C000 + (INT(yf / 8) * 80) + (INT (yf MOD 8) * 2048) +xf
1650 dirdest = buffer  + yf*anchob+xf: REM (INT (yf / 8) * 80) + (INT(yf MOD 8) * 2048) + xf
1660 POKE dirdest, PEEK(dirorig)
1670 REM locate 10,25 :print "X:";xf;"Y";yf
1680 NEXT
1690 NEXT
1700 LOCATE 1,25: PRINT "flipping ok        "
1710 RETURN
1720 REM ------------ CLEAR SPRITE -------------------
1730 LOCATE 1,25: PRINT "clearing.."
1740 FOR yf=0 TO altob-1
1750 FOR xf=0 TO anchob-1
1760 dirorig = &C000 + (INT(yf / 8) * 80) + (INT (yf MOD 8) * 2048) +xf
1770 dirdest = buffer  + yf*anchob+xf: REM (INT (yf / 8) * 80) + (INT(yf MOD 8) * 2048) + xf
1780 POKE dirdest, 0:POKE dirorig,0
1790 REM locate 10,25 :print "X:";xf;"Y";yf
1800 NEXT
1810 NEXT
1820 LOCATE 1,25: PRINT "clearing  ok  "
1830 RETURN
1840 REM ---------- PALETA alternativa MODE 0------------------
1850 INK 0,1: REM AZUL
1860 INK 1,0: REM negro
1870 INK 2,2 : REM AZUL CLARO
1880 INK 3,14: REM CYAN CLARO
1890 INK 4,20: REM AZUL PALIDO
1900 INK 5,26: REM BLANCO
1910 INK 6,4: REM MAGENTA
1920 INK 7,6: REM ROJO
1930 INK 8,8: REM MAGENTA CLARO
1940 INK 9,16: REM ROSA
1950 INK 10,13: REM GRIS
1960 INK 11,10 :REM CYAN
1970 INK 12,9: REM VERDE 
1980 INK 13,18 : REM VERDE CLARO
1990 INK 14,22 : REM VERDE PALIDO
2000 INK 15, 24: REM AMARILLO INTENSO
2010 AMARILLO=15
2020 RETURN
2030 REM ---------- PALETA default MODE 0------------------
2040 INK 0,1: REM AZUL
2050 INK 1,24: REM negro
2060 INK 2,20 : REM AZUL CLARO
2070 INK 3,6: REM CYAN CLARO
2080 INK 4,26: REM AZUL PALIDO
2090 INK 5,0: REM BLANCO
2100 INK 6,2: REM MAGENTA
2110 INK 7,8: REM ROJO
2120 INK 8,10: REM MAGENTA CLARO
2130 INK 9,12: REM ROSA
2140 INK 10,14: REM GRIS
2150 INK 11,16 :REM CYAN
2160 INK 12,18: REM VERDE 
2170 INK 13,22 : REM VERDE CLARO
2180 INK 14,0,24 : REM VERDE PALIDO
2190 INK 15, 11,16: REM AMARILLO INTENSO
2200 AMARILLO=1
2210 RETURN