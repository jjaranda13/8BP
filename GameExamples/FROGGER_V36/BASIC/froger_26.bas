10 MEMORY 23999
20 CALL &6B78:CALL &BC02
21 on break gosub 3000
30 MODE 1:BORDER 9:|SETLIMITS,0,80,0,200:|3D,0
40 DEFINT A-Z
50 '---sounds
60 ENT 1,10,-100,3:'mosca
70 ENV 1,1,15,1,15,-1,1:'boing
80 ENT 2,20,-125,1:'boing
90 ENT 3,100,5,3:'muerte
100 '--- PRESENTACION
110 INK 0,0:PAPER 0:PEN 2:LOCATE 14,2: PRINT "FROGGER ETERNO"
120 PEN 1:LOCATE 1,5:PRINT "A fully 100% BASIC game created with 8BP"
130 LOCATE 4,4:PRINT "by Jose Javier Garcia Aranda 2019"
140 LOCATE 2,7:PRINT "8BP: The ultimate RSX library for games";
150 INK 2,22:PEN 2:PRINT "":PRINT "     www.github.com/jjaranda13/8BP"
160 PRINT "     www.8bitsdepoder.blogspot.com"
170 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:'reset
180 b$=INKEY$:IF b$<>"" THEN 180
190 ' --- hall of fame
200 DIM pts(11): DIM name$(11):'scores
210 GOSUB 2040:'read score table
220 INK 3,7:PEN 3:LOCATE 16,12:PRINT "Hall of fame":LOCATE 15,13:PRINT "--------------"
230 p=1:FOR i=0 TO 9: LOCATE 1,i+14:PEN p:PRINT ,name$(i),pts(i):p=1+(p MOD 3):NEXT
231 |MUSIC,0,6
240 b$=INKEY$:IF b$="" THEN 240 ELSE 250
250 '--- global vars
251 |MUSICOFF
260 frogup1=16:frogup2=17:stone=18:stone2=19:water=20:sand=21
270 moneda=23:tortugas=31:muro=32:hojas2=33:hojas4=34: river=35
280 tronco=30: mosca=36:watermosca=37:frogger=38
290 DIM c$(25):'layout
300 INK 0,0: INK 1,11: INK 2,22: INK 3,22
310 collider%=32:collided%=32:|COLSPALL,@collider%,@collided%
320 maxdemora=10:tmax=60
330 xc(0)=64:xc(1)=12:xc(2)=64:xc(3)=12:xc(4)=64
340 yc(0)=104:yc(1)=120:yc(2)=136:yc(3)=152:yc(4)=168
350 r(0)=4:r(1)=9:r(2)=6:r(3)=5:r(4)=8
360 '---init game
370 lives=3: level=0:score=0:dificultad=30
380 'game logic
390 mosca(0)=1:mosca(1)=1:mosca(2)=1:mosca(3)=1:moscas=0:t=tmax
400 WHILE (lives>0 AND moscas<4)
410 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:'reset
420 CLS:GOSUB 540
430 WEND
440 IF moscas<4 THEN 520
450 IF dificultad>15 THEN dificultad=dificultad-5
460 'clean buffer teclado
470 b$=INKEY$:IF b$<>"" THEN 470
480 CLS:PEN 2: LOCATE 12,10:PRINT "CONGRATULATIONS!"
490  LOCATE 11,12:PRINT "READY FOR LEVEL :";(30-dificultad)/5
500 PEN 1: LOCATE 14,20:PRINT "PRESS ANY KEY"
510 b$=INKEY$:IF b$="" THEN 510
520 IF lives>0 THEN 390
530 GOTO 1800
540 '--- setup frog
550 |SETUPSP,31,0,1+64+32:'colider,transp,printable
560 |SETUPSP,31,9,frogup1
570 y=200-16:x=32
580 '--- marcadores
590 |SETLIMITS,0,80,0,200
600 |SETUPSP,0,0,1:|SETUPSP,0,9,frogger:|PRINTSP,0,0,0
610 |SETUPSP,0,0,1:|SETUPSP,0,9,23:|PRINTSP,0,172,4:|PRINTSP,0,172,68:|SETUPSP,0,0,0
620 PEN 1:LOCATE 2,5: PRINT "LIVES": LOCATE 35,5:PRINT "TIME": PEN 2: LOCATE 35,6:PRINT t
630 LOCATE 2,9: PEN 1:PRINT "SCORE": LOCATE 3,10:PEN 2:PRINT score
640 LOCATE 35,9: PEN 1:PRINT "LEVEL": PEN 2:LOCATE 36,10:PRINT (30-dificultad)/5
650 FOR i=0 TO LIVES-1:|PRINTSP,31,40,i*4:NEXT
660 '---layout
670 col%=0:|COLAY,67,31,@col%
680 |SETUPSP,6,9,stone:|SETUPSP,7,9,water:|SETUPSP,8,9,stone2:|SETUPSP,9,9,sand
690 c$(0) ="   DDDDDDDDDDDDDD   "
700 c$(1) ="   DDBDDBDDBDDBDD   "
710 c$(2) ="   DDBDDBDDBDDBDD   "
720 c$(3) ="   DBBBBBBBBBBBBD   "
730 c$(4) ="   DBBBBBBBBBBBBD   "
740 c$(5) ="   DBBBBBBBBBBBBD   "
750 c$(6) ="   DBBBBBBBBBBBBD   "
760 c$(7) ="   DBBBBBBBBBBBBD   "
770 c$(8) ="   DBBBBBBBBBBBBD   "
780 c$(9) ="   DBBBBBBBBBBBBD   "
790 c$(10)="   DBBBBBBBBBBBBD   "
800 c$(11)="   DAAAAAAAAAAAAD   "
810 c$(12)="   DCCCCCCCCCCCCD   "
820 c$(13)="   D            D   "
830 c$(14)="   D            D   "
840 c$(15)="   D            D   "
850 c$(16)="   D            D   "
860 c$(17)="   D            D   "
870 c$(18)="   D            D   "
880 c$(19)="   D            D   "
890 c$(20)="   D            D   "
900 c$(21)="   D            D   "
910 c$(22)="   D            D   "
920 c$(23)="   DAAAAAAAAAAAAD   "
930 c$(24)="   DCCCCCCCCCCCCD   "
940 |SETLIMITS,16,64,0,200
950 FOR i=0 TO 24:|LAYOUT,i,0,@c$(i):NEXT:'print layout
960 PLOT 31*4+2,0,2:DRAW 31*4+2,400
970 PLOT 640-32*4,0,2:DRAW 640-32*4,400
980 '--- setup river ---
990 |SETUPSP,4,0,128+8+2+1:|SETUPSP,4,9,tronco:|SETUPSP,4,15,10:|LOCATESP,4,24,0:'tronco 1a
1000 |SETUPSP,5,0,139:|SETUPSP,5,9,tronco:|SETUPSP,5,15,10:|LOCATESP,5,24,0:|ROUTESP,5,82:'tronco 1b
1010 |SETUPSP,6,0,139:|SETUPSP,6,9,tronco:|SETUPSP,6,15,12:|LOCATESP,6,40,60:'tronco2a
1020 |SETUPSP,7,0,139:|SETUPSP,7,9,tronco:|SETUPSP,7,15,12:|LOCATESP,7,40,60:|ROUTESP,7,30:'tronco2b
1030 |SETUPSP,8,0,139:|SETUPSP,8,9,tortugas:|SETUPSP,8,15,15:|LOCATESP,8,72,30:'turtles 4a
1040 |SETUPSP,9,0,139:|SETUPSP,9,9,tortugas:|SETUPSP,9,15,15:|LOCATESP,9,72,60:'turtles 4b
1050 |SETUPSP,10,0,139:|SETUPSP,10,9,hojas4:|SETUPSP,10,15,17:|LOCATESP,10,56,0:|ROUTESP,10,26:'hojas4 3a
1060 |SETUPSP,11,0,139:|SETUPSP,11,9,hojas2:|SETUPSP,11,15,17:|LOCATESP,11,56,0:|ROUTESP,11,0:'hojas2 3b
1070 |SETUPSP,0,0,2:|SETUPSP,0,9,river:|LOCATESP,0,72+4,16:'rio 4
1080 |SETUPSP,1,0,2:|SETUPSP,1,9,river:|LOCATESP,1,56+4,16:'rio 3
1090 |SETUPSP,2,0,2:|SETUPSP,2,9,river:|LOCATESP,2,40+4,16:'rio 2
1100 |SETUPSP,3,0,2:|SETUPSP,3,9,river:|LOCATESP,3,24+4,16:'rio 1
1110 |SETUPSP,20,0,2:|SETUPSP,20,9,muro:|LOCATESP,20,24,8:'MURO L
1120 |SETUPSP,21,0,2:|SETUPSP,21,9,muro:|LOCATESP,21,24,64:'MURO R
1130 IF mosca(0) THEN |SETUPSP,22,0,2:|SETUPSP,22,9,mosca:|LOCATESP,22,8,20:|PRINTSP,22: ELSE |PRINTSP,31,8,20:'MOSCA 1
1140 IF mosca(1) THEN |SETUPSP,23,0,2:|SETUPSP,23,9,mosca:|LOCATESP,23,8,32:|PRINTSP,23: ELSE |PRINTSP,31,8,32:'MOSCA 2
1150 IF mosca(2) THEN |SETUPSP,24,0,2:|SETUPSP,24,9,mosca:|LOCATESP,24,8,44:|PRINTSP,24: ELSE |PRINTSP,31,8,44:'MOSCA 3
1160 IF mosca(3) THEN |SETUPSP,25,0,2:|SETUPSP,25,9,mosca:|LOCATESP,25,8,56:|PRINTSP,25: ELSE |PRINTSP,31,8,56:'MOSCA 4
1180 y=200-16:x=32:|LOCATESP,31,y,x:ciclo=0
1190 |PRINTSPALL,0,0,0,0:|COLSP,34,3,3:|COLSPALL,@collider%,@collided%
1200 |COLSP,32,0,25:'mas alla del 25 no hay colisionables
1201 '--- game cycle
1210 ciclo=ciclo+1: |AUTOALL,1:|PRINTSPALL:|COLSPALL
1220 IF demora THEN demora=demora-1
1230 IF demora GOTO 1260
1240 GOSUB 1600
1260 IF ciclo MOD dificultad THEN 1280
1270 GOSUB 1550
1280 IF ciclo AND 31 THEN 1300
1290 t=t-1:LOCATE 35,6:PRINT t: IF t=0 THEN t=tmax: GOTO 1520
1300 IF PEEK(27147)<90 THEN 1320
1310 |LOCATESP,8,72,60:|LOCATESP,9,72,90:'recoloca turtle
1320 IF collider<32 THEN 1340
1330 GOTO 1210
1340 '--- collision routine
1350 IF collided>11 THEN 1440
1370 IF collided<4 THEN if demora<2 then 1510 else 1210:'rio
1371 'hemos subido a un tronco.
1380 IF (demora+arrastre) THEN 1210
1390 IF collided<6 THEN |SETUPSP,31,0,233:|SETUPSP,31,15,14:arrastre=1:GOTO 1210:'tronco R slow
1400 IF collided<8 THEN |SETUPSP,31,0,233:|SETUPSP,31,15,13:arrastre=1:GOTO 1210:'tronco L fast
1410 IF collided<10 THEN |SETUPSP,31,0,233:|SETUPSP,31,15,16:arrastre=1:GOTO 1210:'turtles L slow
1420 IF collided<12 THEN |SETUPSP,31,0,233:|SETUPSP,31,15,18:arrastre=1:GOTO 1210:'hojas R fast
1430 GOTO 1210
1440 'colision con mosca o con enemigo
1450 IF collided<22 THEN 1520:'check mosca
1460 |SETUPSP,collided,9,watermosca:|PRINTSP,collided:|SETUPSP,collided,0,0
1470 SOUND 1,638,30,15,0,1: mosca(collided-22)=0
1480 score=score+10:LOCATE 3,10:PEN 2:PRINT score
1490 WHILE demora :|AUTOALL,1:|PRINTSPALL: demora=demora-1:WEND:'termina salto
1500 moscas=moscas+1:IF moscas=4 THEN RETURN ELSE GOTO 1180
1510 'colision enemigo
1520 SOUND 1,142,100,15,0,3:FOR i=1 TO 20:BORDER 7:CALL &BD19:|PRINTSPALL,0,0,0,0,0:BORDER 0:CALL &BD19:NEXT
1530 lives=lives-1:RETURN 
1540 '--- new car
1550 car=1+car AND 7:'max simultaneos cars = 8
1560 carsp=car+12:'12 en adelante. 12+7=19, el 20 ya esta libre
1570 p=(p+1 + RND*5) MOD 5:'pista
1580 |SETUPSP,carsp,9,16:|SETUPSP,carsp,0,139:|SETUPSP,carsp,15,r(p):|LOCATESP,carsp,yc(p),xc(p)
1590 RETURN
1600 '--- keyboard control
1610 y=PEEK(27497):x=PEEK(27499)
1620 IF INKEY(67) THEN 1660:'el ajuste de x a multiplo de 4 es necesario por si salto en horizontal dentro de un tronco
1630 |MOVER,31,-16,0:|COLAY,31,@col%:|MOVER,31,16,0:IF col% THEN RETURN
1640 POKE 27499,(x+1) AND 252:SOUND 1,638,0,0,1
1650 |SETUPSP,31,0,233:|SETUPSP,31,15,0:demora=maxdemora:arrastre=0:RETURN
1660 IF INKEY(69) THEN 1710:'el ajuste de x a multiplo de 4 es ...
1670 IF y>=180 THEN RETURN
1680 |MOVER,31,16,0:|COLAY,31,@col%:|MOVER,31,-16,0:IF col% THEN RETURN
1690 POKE 27499,(x+1) AND 252:SOUND 1,638,0,0,1
1700 |SETUPSP,31,0,233:|SETUPSP,31,15,1:demora=maxdemora:arrastre=0:RETURN
1710 IF INKEY(27) THEN 1750:'el ajuste de x a multiplo de 4 es ...
1720 |MOVER,31,0,4:|COLAY,31,@col%:|MOVER,31,0,-4:IF col% THEN RETURN
1730 POKE 27499,(x+1) AND 252:SOUND 1,638,0,0,1
1740 |SETUPSP,31,0,233:|SETUPSP,31,15,2:demora=maxdemora:arrastre=0:RETURN
1750 IF INKEY(34) THEN RETURN:'el ajuste de x a multiplo de 4 es ...
1760 |MOVER,31,0,-4:|COLAY,31,@col%:|MOVER,31,0,4:IF col% THEN RETURN
1770 POKE 27499,(x+1) AND 252:SOUND 1,638,0,0,1
1780 |SETUPSP,31,0,233:|SETUPSP,31,15,3:demora=maxdemora:arrastre=0:RETURN
1800 '--- FIN JUEGO & CHECK HIGH SCORE
1810 INK 0,0:BORDER 5: INK 2,15:INK 1,20:|MUSICOFF
1820 j=10:FOR i=9 TO 0 STEP -1:IF score>pts(i) THEN j=i:NEXT
1830 IF j=10 THEN RUN:'end game & start
1840 FOR i=8 TO j STEP -1:pts(i+1)=pts(i):name$(i+1)=name$(i):NEXT:'update table
1850 b$=INKEY$:IF b$<>"" THEN 1850
1860 MODE 1:BORDER 5: INK 3,8:LOCATE 6,8:PEN 3: PRINT "CONGRATULATIONS! NEW HIGH SCORE"
1870 |SETUPSP,0,0,1:|SETUPSP,0,9,coin:|PRINTSP,0,170,0:|PRINTSP,0,170,72
1880 LOCATE 14,10:PEN 2:PRINT "ENTER YOUR NAME"
1890 LOCATE 17,13:PEN 2:PRINT"--------"
1900 LOCATE 15,12:PEN 1:INPUT name$(j): name$(j)=MID$(name$(j),1,8)
1910 pts(j)=score
1920 '--- WRITE SCORE TABLE
1930 dir=&966a:FOR i=0 TO 9: k=1
1950 FOR j=dir TO dir +7
1960 dato$=MID$(name$(i),k,1): IF dato$=""  THEN dato$=" "
1970 dato=ASC(dato$)
1980 POKE j,dato:k=k+1:NEXT j
1990 dir=dir+8
2000 |POKE,dir,pts(i)
2010 dir=dir+2
2020 NEXT i
2030 RUN
2040 '--- READ SCORE TABLE
2050 dir=&966a:FOR i=0 TO 9: name$(i)=""
2070 FOR j=dir TO dir +7
2080 letra=PEEK (j): name$(i)=name$(i)+CHR$(letra)
2090 NEXT j: dir=dir+8
2100 pts(i)=0:|PEEK,dir,@pts(i):dir=dir+2
2110 NEXT i
2120 RETURN
3000 |MUSICOFF