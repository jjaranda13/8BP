10 MEMORY 19999
20 DEFINT a-z
30 buffer=20000: REM buffer de copia de pantalla 
40 CALL &BC02: REM inicializa paleta a valor por defecto
41 RESTORE 4130:GOSUB 4000:' carga rutina get INK     
50 MODE 1
80 PEN 1:PRINT "    SPEDIT: Sprite Editor v11.0" 
90 PRINT "" 
110 PRINT "    ---- CONTROLES EDICION----"
120 PRINT "     1,2 : tinta -/+"
130 PRINT "     qaop : mueve cursor pixel"
140 PRINT "     space: pinta"
150 PRINT "     h: flip horizontal"
160 PRINT "     v: flip vertical"
170 PRINT "     c: clear sprite"
180 PRINT "     b: imprime bytes (asm) en printer"
181 PRINT "     i: imprime paleta en printer"
190 PRINT "     r: reload 20000"
195 PRINT "     z, x: cambia color de tinta"
196 PRINT "     t: RESET"
200 PRINT "    -------------------------"
210 PRINT "Antes de empezar puedes cargar un spriteensamblandolo en la direccion 20000."
220 PRINT "No ensambles ancho y alto,solo los bytesdel dibujo."
230 PRINT " la paleta custom esta en la linea 1840"
240 PRINT " La paleta la puedes cambiar pero debera ser la misma en tu programa."
241 PRINT "Selecciona paleta (1,2,3,4)"
242 PRINT " 1:default   2:custom  >=3:overwrite"
243 INPUT p$
260 INPUT "ancho (par)?", ancho
270 INPUT "alto?",alto
275 IF p$<"3" THEN INPUT "color de fondo?", fondo 
276 INPUT "mode?" ,modo
280 MODE modo: GOSUB 2030:PEN blanco:'AMARILLO    
281 IF modo=0 THEN incx=4 ELSE incx=2:blanco=1:PEN blanco
282 BORDER fondo
290 REM voy a inicializar la paleta
291 IF p$="3" THEN GOSUB 2300: ' paleta de tipo sobreescritura para 8BP
292 IF p$="4" THEN GOSUB 5000: ' paleta de tipo sobreescritura para 8BP
293 IF p$="5" THEN GOSUB 6000: ' paleta de tipo sobreescritura para 8BP
300 IF p$="2" THEN GOSUB 1840: ' paleta custom
301 IF p$<"3" THEN INK 0,fondo
310 altob=alto:anchob=ancho/2: if modo=1 then anchob=ancho/4
320 FOR y=0 TO altob-1
321 dirorigy = buffer + y*anchob
322 dirdesty= &C000  + (INT (y / 8) * 80) + (INT(y MOD 8) * 2048) 
330 FOR x=0 TO anchob-1
340 REM dirorig = buffer + (INT(y / 8) * 80) + (INT (y MOD 8) * 2048) +x
350 dirorig = dirorigy+x
360 dirdest =dirdesty+x
370 POKE dirdest, PEEK(dirorig)
380 NEXT
390 NEXT
400 REM for y=399 to 199 step -(alto+1)*2
410 PLOT 1,399-alto*2,AMARILLO: DRAW (ancho)*incx,399-alto*2    
420 PLOT (ancho)*incx,399:DRAW (ancho)*incx,399-alto*2   
430 REM next
431 if modo =0 then totaltintas=15 else totaltintas=3
440 FOR x=0 TO totaltintas
450 PEN x
460 LOCATE x+1,20: PRINT CHR$(143)
470 NEXT
471 BORDER 13
480 PEN blanco:LOCATE 1,21:PRINT "ancho:";ancho;" ";"alto:";alto
490 LOCATE 1,9
500 PRINT "1,2 : tinta -/+"
510 PRINT "qaop : mueve "
520 PRINT "space: pinta"
530 PRINT "h: flip horizontal"
540 PRINT "v: flip vertical"
550 PRINT "c: clear sprite"
560 PRINT "b: imprime bytes "
565 PRINT "r: reload 20000"   
567 PRINT "z,x: tinta. t:RESET"
568 PRINT "i: print paleta"
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
710 REM SOUND 1,100,7,7:CALL &BD19: REM por si compilas para que no se acelere
720 IF b$="p" THEN IF x<(ancho-1)*incx THEN x=x+incx: REM en mode 0 es 4, en mode 1 es 2        
730 IF b$="o" THEN IF x>0 THEN x=x-incx
740 IF b$="q" THEN IF y<399 THEN y=y+2:  REM en cualquier mode es 2
750 IF b$="a" THEN IF y >399-(alto-1)*2 THEN y=y-2      
760 IF b$=" " THEN tintant=tinta      
770 LOCATE tinta+1,19:PRINT " " 
780 IF b$="1" THEN tinta=tinta-1:IF tinta<0 THEN tinta=0
781 IF b$="1" AND tinta>2 AND (p$>"3") THEN tinta=tinta-1
790 IF b$="2" THEN tinta=tinta+1:IF tinta>totaltintas THEN tinta=totaltintas
791 IF b$="2" AND tinta>2 AND (p$>"3" ) THEN tinta=tinta+1:IF tinta>14 THEN tinta=14
800 IF b$="h" THEN GOSUB 1130
810 IF b$="v" THEN GOSUB 1430
820 IF b$="c" THEN GOSUB 1720
825 IF b$="t" THEN GOSUB 1720:GOTO 10
830 IF b$="b" THEN GOSUB 950
835 IF b$="r" THEN GOTO 320
836 IF b$="x" THEN cosa=cosa+1:IF cosa=27 THEN cosa=26 ELSE INK tinta,cosa: IF (p$="3" OR p$="4") AND tinta>1 THEN  INK tinta+1,cosa 
837 IF b$="z" THEN cosa=cosa-1:IF cosa=-1 THEN cosa=0 ELSE INK tinta,cosa:IF (p$="3" OR p$="4") AND tinta >1 THEN INK tinta+1,cosa
838 IF b$="i" THEN GOSUB 3000
839 LOCATE 1,24:PRINT"Num. tinta: ";cosa
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
935 REM LOCATE 1,24:PRINT"Num. tinta: ";cosa
940 GOTO 630
950 REM --volcado de bytes a la impresora en lenguaje asm ---------------
960 REM MODE 1
970 LOCATE 1,24:PRINT "sprite printing..."
980 PRINT #8,";------ BEGIN IMAGE --------"
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
1100 PRINT #8,";------ END IMAGE --------"
1110 LOCATE 1,24: PRINT " sprite printed!"
1120 RETURN
1130 REM ---------flip H------------------------
1140 LOCATE 1,25: INPUT "espejo izq?[Y/N]",e$: IF  e$="Y" OR e$="y" THEN mitad=(anchob)/2 ELSE mitad=0
1141 LOCATE 1,25:PRINT "flipping H..."
1150 REM volcamos el sprite de buffer en pantalla flipeando
1160 FOR yf=0 TO altob-1
1161 dirorigy = buffer + yf*anchob
1162 dirdesty = &C000  + (INT (yf / 8) * 80) + (INT(yf MOD 8) * 2048) 
1170 FOR xf=0 TO anchob-1 -mitad
1180 REM dirorig = buffer + (INT(yf / 8) * 80) + (INT (yf MOD 8) * 2048) +xf
1190 dirorig = dirorigy + xf
1200 dirdest = dirdesty + (anchob-1-xf)
1201 if modo=0 then 1210
1202 a=(PEEK(dirorig) AND (128+8)):'pix 1
1203 b=(PEEK(dirorig) AND (64+4)):'pix 2
1204 c=(PEEK(dirorig) AND (32+2)):'pix 3
1205 d=(PEEK(dirorig) AND (16+1)):'pix 4
1206 byte=d*8+c*2+b/2+a/8
1207 goto 1260

1210 a=(PEEK(dirorig) AND 170):'pixel izq
1220 b=(PEEK(dirorig) AND 85):'pixel derecho
1230 REM a=a*2:b=b/2
1231 a=a/2:b=b*2: 'con esto les hemos dado la vuelta iz->der y der->iz
1240 byte=(a OR b)
1250 REM locate 10,25 :print byte :rem "X:";xf;"Y";yf
1260 POKE dirdest, byte
1270 REM locate 10,25 :print byte :rem "X:";xf;"Y";yf
1280 NEXT
1290 NEXT
1300 REM ahora volcamos el sprite de pantalla en el buffer
1310 LOCATE 1,25: PRINT "buffering..:"
1320 FOR yf=0 TO altob-1
1321 dirorigy = &C000 + (INT(yf / 8) * 80) + (INT (yf MOD 8) * 2048)
1322 dirdesty = buffer  + yf*anchob
1330 FOR xf=0 TO anchob-1
1340 dirorig = dirorigy+xf
1350 REM dirdest = buffer  + (INT (yf / 8) * 80) + (INT(yf MOD 8) * 2048) + xf
1360 dirdest = dirdesty+xf
1370 POKE dirdest, PEEK(dirorig)
1380 REM locate 10,25 :print "X:";xf;"Y";yf
1390 NEXT
1400 NEXT
1410 LOCATE 1,25: PRINT "flipping ok        "
1420 RETURN
1430 REM ---------flip V------------------------
1440 LOCATE 1,25: INPUT "espejo ?[Y/N]",e$: IF  e$="Y" OR e$="y" THEN mitad=(altob)/2 ELSE mitad=0
1441 LOCATE 1,25: PRINT "flipping V..."
1450 REM volcamos el sprite de buffer en pantalla flipeando
1460 FOR yf=0+mitad TO altob-1 
1461 dirorigy = buffer + (altob-1-yf)*anchob    
1462 dirdesty = &C000  + (INT (yf / 8) * 80) + (INT(yf MOD 8) * 2048) 
1470 FOR xf=0 TO anchob-1
1480 REM dirorig = buffer + (INT((altob-1-yf) / 8) * 80) + (INT ((altob-1-yf) MOD 8) * 2048) +xf
1490 dirorig = dirorigy+xf
1500 dirdest = dirdesty+ xf
1510 a=(PEEK(dirorig) AND 170)
1520 b=(PEEK(dirorig) AND 85)
1530 REM a=a/2:b=b*2
1540 byte=(a OR b)
1541 byte=PEEK(dirorig)
1550 REM locate 10,25 :print byte :rem "X:";xf;"Y";yf
1560 POKE dirdest, byte
1570 REM locate 10,25 :print byte :rem "X:";xf;"Y";yf
1580 NEXT
1590 NEXT
1600 REM ahora volcamos el sprite de pantalla en el buffer
1610 LOCATE 1,25: PRINT "buffering..:"
1620 FOR yf=0 TO altob-1
1621 dirorigy = &C000 + (INT(yf / 8) * 80) + (INT (yf MOD 8) * 2048) 
1622 dirdesty = buffer  + yf*anchob
1630 FOR xf=0 TO anchob-1
1640 dirorig = dirorigy+xf
1650 dirdest = dirdesty+xf: REM (INT (yf / 8) * 80) + (INT(yf MOD 8) * 2048) + xf
1660 POKE dirdest, PEEK(dirorig)
1670 REM LOCATE 10,24 :PRINT "X:";xf;"Y";yf  
1680 NEXT
1690 NEXT
1700 LOCATE 1,25: PRINT "flipping ok        "
1710 RETURN
1720 REM ------------ CLEAR SPRITE -------------------
1730 LOCATE 1,25: PRINT "clearing.."
1740 FOR yf=0 TO altob-1
1741 dirorigy = &C000 + (INT(yf / 8) * 80) + (INT (yf MOD 8) * 2048) 
1742 dirdesty = buffer  + yf*anchob
1750 FOR xf=0 TO anchob-1
1760 dirorig = dirorigy +xf
1770 dirdest = dirdesty+xf: REM (INT (yf / 8) * 80) + (INT(yf MOD 8) * 2048) + xf
1780 POKE dirdest, 0:POKE dirorig,0
1790 REM locate 10,25 :print "X:";xf;"Y";yf
1800 NEXT
1810 NEXT
1820 LOCATE 1,24: PRINT "clearing  ok  "  
1830 RETURN
1840 REM ---------- PALETA alternativa MODE 0------------------
1850 INK 0,13: REM AZUL
1860 INK 1,9: REM negro
1870 INK 2,0 : REM AZUL CLARO
1880 INK 3,0: REM CYAN CLARO
1890 INK 4,26: REM AZUL PALIDO
1900 INK 5,26: REM BLANCO
1910 INK 6,6: REM MAGENTA
1920 INK 7,6: REM ROJO
1930 INK 8,5: REM MAGENTA CLARO
1940 INK 9,19: REM ROSA
1950 INK 10,24: REM GRIS
1960 INK 11,24 :REM CYAN
1970 INK 12,11: REM VERDE 
1980 INK 13,20 : REM VERDE CLARO
1990 INK 14,15 : REM VERDE PALIDO
2000 INK 15, 15: REM AMARILLO INTENSO
2010 AMARILLO=15: blanco=5
2020 RETURN
2030 REM ---------- PALETA default MODE 0------------------
2040 INK 0,1: REM AZUL
2050 INK 1,24: REM amarillo
2060 INK 2,20 : REM AZUL CLARO
2070 INK 3,6: REM CYAN CLARO
2080 INK 4,26: REM blanco
2090 INK 5,0: REM negro
2100 INK 6,2: REM MAGENTA
2110 INK 7,8: REM ROJO
2120 INK 8,10: REM MAGENTA CLARO
2130 INK 9,12: REM amarillo oscuro
2140 INK 10,14: REM GRIS
2150 INK 11,16 :REM CYAN
2160 INK 12,18: REM VERDE 
2170 INK 13,22 : REM VERDE CLARO
2180 INK 14,0,24 : REM VERDE PALIDO
2190 INK 15, 11,16: REM AMARILLO INTENSO
2200 AMARILLO=1:blanco=4
2210 RETURN
2300 REM ---------- PALETA sprites transparentes MODE 0------------------
2301 INK 0,11: REM azul claro
2302 INK 1,15: REM naranja
2303 INK 2,0 : REM negro
2304 INK 3,0: 
2305 INK 4,26: REM blanco
2306 INK 5,26: 
2307 INK 6,6: REM rojo
2308 INK 7,6: 
2309 INK 8,18: REM verde
2310 INK 9,18: 
2311 INK 10,24: REM amarillo
2312 INK 11,24 :
2313 INK 12,4: REM magenta
2314 INK 13,4 : 
2315 INK 14,16 : REM naranja
2316 INK 15, 16: 
2317 AMARILLO=10: blanco=4
2420 RETURN
3000 LOCATE 1,24:PRINT "Palete printing..."
3010 PRINT #8,"' ------ BEGIN PALETA --------"
3011 valor%=0
3012 FOR i=0 TO 15
3013 CALL 23900,i,@valor%
3020 PRINT #8,"INK "; i ;","; valor%
3021 NEXT
3100 PRINT #8,"' ------ END PALETA --------"
3110 RETURN
4000 ' RUTINA GET INK 
4001 ' ---------------
4100 FOR dir=23900 TO 23914
4110 READ dato:POKE dir,dato
4120 NEXT: RETURN
4130 DATA &dd,&7e,&02,&cd,&35,&bc,&78,&dd,&6e,&00,&dd,&66,&01,&77,&c9
4999 ' ------ BEGIN PALETA --------
5000 INK  0 , 2 
5001 INK  1 , 14 
5002 INK  2 , 23 
5003 INK  3 , 23 
5004 INK  4 , 26 
5005 INK  5 , 26 
5006 INK  6 , 6 
5007 INK  7 , 6 
5008 INK  8 , 18 
5009 INK  9 , 18 
5010 INK  10 , 24 
5011 INK  11 , 24 
5012 INK  12 , 0 
5013 INK  13 , 0 
5014 INK  14 , 16 
5015 INK  15 , 16 
5016 RETURN
6000 ' ------ BEGIN PALETA --------
6010 INK  0 , 13 
6020 INK  1 , 18 
6030 INK  2 , 0 
6040 INK  3 , 0 
6050 INK  4 , 26 
6060 INK  5 , 26 
6070 INK  6 , 6 
6080 INK  7 , 6 
6090 INK  8 , 9 
6100 INK   9 , 9 
6110 INK  10 , 24 
6120 INK  11 , 24 
6130 INK  12 , 20 
6140 INK  13 , 20 
6150 INK  14 , 16 
6160 INK  15 , 16 
6170 RETURN
6180 ' ------ END PALETA --------