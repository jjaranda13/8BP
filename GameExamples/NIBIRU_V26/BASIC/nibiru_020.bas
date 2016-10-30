10 MEMORY 23999 
20 FOR dir=42540 TO 42618 STEP 2:i=dir-42540:POKE dir,RND*158:POKE dir+1,RND*80:NEXT 
30 FOR dir=42540 TO 42550 STEP 2:i=dir-42540:POKE dir,20+ABS(SIN(i)*110):POKE dir+1,ABS(COS(i)*80):NEXT 
31 CALL &6B78
32 |MUSIC,2,6
33 if inkey(47)<>0 then 33
34 |MUSICOFF
40 MODE 0:CALL &BC02:INK 0,0:' paleta
50 INK 0,0
60 ON BREAK GOSUB 1400
70 CALL &6B78
80 DEFINT a-z
90 nibiru=16
100 fragment=18
110 tile=17:tileov=28
120 dartimg=19
130 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:|AUTOALL,1:|PRINTSPALL,0,1,0
140 ENV 1,11,-1,25:ENT 1,9,49,5,9,-10,15
150 DIM r(32):FOR i=0 TO 32:r(i)=4*SIN(i*i):NEXT
151 gosub 7000:|MUSICOFF:'presentacion

160 mode 0:' inicializacion variables
170 col%=32:sp%=32:|COLSPALL,@sp%,@col%
180 fires=0:mufi=29:'disparos y muerte disparos
190 vidas=3:score=0: dartx=0: darty=0
200 |SETLIMITS,0,80,0,176
210 'rem fases
220 fase=1: CALL &BC02:INK 0,0:' paleta
230 GOSUB 280:'280:'fase 1  pajaros
240 ink 1,13:cadencia=20:GOSUB 400:'pajaros
241 gosub 500:'fase 1a hilera naves
250 GOSUB 600:'fase 1b 2 hileras
260 GOSUB 600:'fase 1b otra vez
261 GOSUB 500:'fase 1a otra vez
262 GOSUB 2500:'fase 2
263 gosub 3500:'fase 2b
264 gosub 4000:' fase 3
270 GOSUB 4900: 'fin
280 ' FASE 1A: PAJAROS ESPACIALES
290 '======================================
300 GOSUB 1620:|COLSP,32,0,27:|colsp,34,1,0
310 ' pokes del mapa del mundo
320 dirmap!=42040:FOR i!=&61A8 TO &620D
330 dato=PEEK(i!):POKE dirmap!,dato:dirmap!=dirmap!+1
340 NEXT
350 |MUSIC,1,6
360 TAGOFF:LOCATE 8,10:PRINT "        ":TAG 
370 |STARS,0,5,2,0,-1:'con parametros solo 1 vez
380 'POKE &B8B4,0:POKE &B8B5,0:POKE &B8B6,0:POKE &B8B7,0:a=TIME
390 cadencia=40: ink 1,12
400 countdown=-4:ov=0: ciclo=0:xo=0
410 'ciclo de juego
420 ' --------------
430 GOSUB 1900
440 |AUTOALL:|PRINTSPALL:|COLSPALL:mc=ciclo AND 1:IF mc THEN |STARS ELSE IF fires THEN GOSUB 760
450 IF col<32 THEN GOSUB 900:IF vivo=0 THEN 290
460 |MAP2SP,yo,ciclo
470 ciclo=ciclo+1:IF mc THEN IF ciclo MOD cadencia=0 THEN IF ciclo < 500 THEN GOSUB 820 ELSE IF ciclo > 580 THEN RETURN
480 if cadencia <40 then c2m=ciclo AND 7:IF c2m=0 THEN GOSUB 1700
490 GOTO 430
500 ' FASE 1B naves en hilera
510 ' ==============================
520 |COLSP,32,10,27:'gosub 1980:'FPS
530 ciclo=0:countdown=-4: ball=0:|STARS,0,5,2,0,-2:'GOSUB 1670
540 |AUTOALL:|PRINTSPALL:|COLSPALL:mc=ciclo AND 1:IF mc THEN |STARS ELSE IF fires THEN GOSUB 760
550 IF col<32 THEN GOSUB 890:IF vivo=0 THEN 290
560 ciclo=ciclo+1:IF ciclo MOD 10 =0 THEN GOSUB 1450:IF ciclo>250 THEN RETURN
570 GOSUB 1900:c2m=ciclo AND 7:IF c2m=0 THEN GOSUB 2000:'1700
580 GOTO 540
590 ' FASE 2B 
600 '===============================
610 ciclo=0:countdown=-4: ball =0:|STARS,0,5,2,0,-2:|COLSP,32,10,27:'GOSUB 1670
620 |AUTOALL:|PRINTSPALL:|COLSPALL:mc=ciclo AND 1:IF mc THEN |STARS ELSE IF fires THEN GOSUB 760
630 IF col<32 THEN GOSUB 900:IF vivo=0 THEN 290
640 IF ciclo MOD 5 =0 THEN GOSUB 1540:IF ciclo>250 THEN RETURN
650 ciclo=ciclo+1:c2m=ciclo AND 7:IF c2m=0 THEN GOSUB 2000
660 GOSUB 1900
670 GOTO 620
680 ' rutina lanza disparo
690 ' ----------------------
700 IF PEEK (27448)=0 THEN fi=28 ELSE IF PEEK (27464)=0 THEN fi=29 ELSE IF PEEK (27480)=0 then fi=30 else return
710 |SETUPSP,fi,7,2:|SETUPSP,fi,5,0,6
710 |SETUPSP,fi,7,15:|SETUPSP,fi,5,0,6
720 |SETUPSP,fi,0,45+ov: |LOCATESP,fi,y+5,x-6: fires=fires+1
730 countdown=ciclo: RETURN
740 ' rutina muerte disparo. solo check uno (massive logic)
750 ' -----------------------------------------------------
760 mufi=mufi MOD 3+1
770 IF PEEK(27435+mufi*16)<86 THEN RETURN 
780 fires=fires-1:|SETUPSP,27+mufi,0,0:|LOCATESP,27+mufi,0,0
790 RETURN   
800 ' creacion de pajaros
810 ' ---------------------------------
820 pajaro=pajaro MOD 5 +1:pajarosp=pajaro+15
830 |LOCATESP,pajarosp,RND*65+15,80 
840 |SETUPSP,pajarosp,0,143  
850 |SETUPSP,pajarosp,7,11
860 |SETUPSP,pajarosp,15,pajaro MOD 3
870 RETURN
880 ' muerte de enemigos y nave
890 ' ----------------------------
900 IF sp=31 THEN GOSUB 1020:RETURN
910 fires=fires-1
920 IF col<10 THEN 960
940 |SETUPSP,col,7,13:score=score+1: if score mod 25=0 then vidas=vidas+1:TAG:MOVE 48,26:print vidas;
950 |SETUPSP,col,0,5+ov
960 |SETUPSP,sp,7,14:'disparo
970 |SETUPSP,sp,0,5+ov
980 col=32:sp=32
990 MOVE 500,26:PRINT score;
1000 RETURN
1010 'MUERTE NAVE
1020 '-----------
1030 rem
1040 BORDER 7,2
1050 |MUSICOFF    
1060 i=15
1070 FOR d=27256 TO 27496 STEP 16 
1080 i=i+1
1090 POKE d,9:|SETUPSP,i,9,fragment
1091 poke d,9+64
1100 |SETUPSP,i,5,r(i),r(i-1)/2
1110 |POKE,d+1,y+r(i-3):|POKE,d+3,x+r(i-4)
1120 NEXT
1130 SOUND 3,145,300,12,1,1,12
1140 FOR i=1 TO 20 :|AUTOALL:|PRINTSPALL:NEXT    
1150 BORDER 1
1160 vidas=vidas-1:vivo=0: if vidas=0 then 7900
1170 RETURN
1180 'rutina pinta marcadores
1190 '-----------------------
1200 |SETLIMITS,0,80,0,200:PLOT 1,400-2*176,1:DRAW 640,400-2*176
1210 if ov=0 then |SETUPSP,0,9,tile else |SETUPSP,0,9,tileov

1220 FOR ym=176 TO 176 STEP 8:FOR m=0 TO 76 STEP 4:|PRINTSP,0,ym,m:NEXT:NEXT
1230 |SETUPSP,0,9,nibiru
1240 |PRINTSP,0,187,28
1241 if ov=0 then |SETUPSP,31,7,1 else |SETUPSP,31,9,25:|SETUPSP,31,0,33+65
1250 |PRINTSP,31,184,0:TAG:MOVE 48,26:print vidas;
1260 |SETLIMITS,0,80,0,175
1270 PLOT 800,0,10:MOVE 500,26:TAG:PRINT score;
1280 RETURN
1290 ' init disparos y nave
1300 '----------------------
1310 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT
1350 |SETUPSP,31,0,33
1360 |SETUPSP,31,7,1  
1370 fires=0:countdown=0
1380 x=40:y=100:|LOCATESP,31,y,x: vivo=1
1390 RETURN
1400 'rutina ON BREAK
1410 ' --------------
1420 |MUSICOFF:MODE 2:INK 0,0:PEN 1:END
1430 ' creacion de nave ball 1A
1440 '-----------------------
1450 IF ball =9 THEN RETURN
1460 ball = ball MOD 10 +1:ballsp=ball+15
1470 |SETUPSP,ballsp,15,3
1480 |SETUPSP,ballsp,0,143 
1490 |SETUPSP,ballsp,7,32
1500 |LOCATESP,ballsp,100,80
1510 RETURN
1520 ' creacion de nave ball 1B
1530 '---------------------------
1540 IF ball =10 THEN RETURN
1550 ball = ball MOD 16 +1:ballsp=15+ball
1560 |SETUPSP,ballsp,0,143 
1570 |SETUPSP,ballsp,7,32
1580 mb=ball AND 1:IF mb THEN |SETUPSP,ballsp,15,3:|LOCATESP,ballsp,120,80 ELSE |LOCATESP,ballsp,40,80:|SETUPSP,ballsp,15,4
1590 RETURN
1600 'inicializaciones
1610 '---------------
1620 CLS:TAGOFF:LOCATE 8,10:PRINT "PHASE ";fase
1630 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:|AUTOALL,1:|PRINTSPALL,0,1,0
1640 GOSUB 1300:' init disparos y nave
1650 GOSUB 1200:' pinta marcadores
1660 RETURN

1680 'disparo de pajaros
1690 '--------------------
1700 firer=firer mod 6+1:'5+1
1710 dirfirer=27000+(firer+15)*16:IF PEEK (dirfirer)=0 THEN RETURN
1720 dart= firer:'dart MOD 6+1
1740 dartx=PEEK(dirfirer+3):IF dartx>80 THEN RETURN else if dartx<x then return
1750 darty=PEEK(dirfirer+1):if darty<0 then darty=0
1751 dartsp=dart+9:|SETUPSP,dartsp,0,11:|SETUPSP,dartsp,7,0
1752 |LOCATESP,dartsp,darty,dartx
1760 IF darty<y+10 THEN vy=1 ELSE IF darty>y-10 THEN vy=-1 ELSE vy=0
1770 IF dartx<x THEN vx=2 ELSE vx=-2
1780 |SETUPSP,dartsp,5,vy,vx
1790 |SETUPSP,dartsp,9,dartimg
1800 RETURN

1840 GOSUB 1300:' init disparos y nave
1850 GOSUB 1200:ciclo=0:xo=0:' pinta marcadores    
1860 IF INKEY(47)=0 THEN |MUSICOFF:RUN
1870 GOTO 1860
1880 ' movimiento nave
1890 '----------------
1900 IF INKEY(27)=0 THEN x=x+1:IF x>70 THEN x=70:GOTO 1920 ELSE POKE 27499,x:GOTO 1920
1910 IF INKEY(34)=0 THEN x=x-1:IF x<1 THEN x=1 ELSE POKE 27499,x
1920 IF INKEY(69)=0 THEN y=y+2:IF y>160 THEN y=160:GOTO 1940 ELSE POKE 27497,y:GOTO 1940
1930 IF INKEY(67)=0 THEN y=y-2:IF y<2 THEN y=2 ELSE POKE 27497,y
1940 IF INKEY(47)=0 THEN  IF fires<3 THEN IF ciclo-countdown>4 THEN GOSUB 700
1950 RETURN
1960 ' print FPS
1970 '------------
1980 b=TIME-a:TAGOFF: LOCATE 1,1:PRINT ciclo*300/b:TAG: RETURN



1998 'disparo inteligente 
1999 '--------------------
2000 firer=firer mod 10+1
2010 dirfirer=27000+(firer+15)*16:IF PEEK (dirfirer)=0 THEN RETURN
2020 |PEEK,dirfirer+3,@dartx:IF dartx>=76 THEN RETURN else if dartx<10 then return 
2030 |PEEK,dirfirer+1,@darty
2040 dart= dart MOD 6+1:dartsp=dart+9
2050 |SETUPSP,dartsp,0,11+ov
2060 |LOCATESP,dartsp,darty,dartx
2070 vy=0:IF darty<y-20 THEN vy=2 ELSE IF darty>y+20 THEN vy=-2 
2075 IF dartx<=x THEN vx=2 ELSE vx=-2
2080 |SETUPSP,dartsp,5,vy,vx
2085 |SETUPSP,dartsp,9,dartimg
2090 RETURN


2498 ' FASE 2
2499'=================
2500 |MUSICOFF:CLS:fase=2: ov=64:GOSUB 1600   
2501 for i=0 to 31:|setupsp,i,0,0:next
2510 GOSUB 5000: |SETUPSP,31,0,97: |SETUPSP,31,9,25
2520 ' pokes del mapa
2530 dirmap!=42040:FOR i!=&620D TO &62A2
2540 dato=PEEK(i!):POKE dirmap!,dato:dirmap!=dirmap!+1
2541 NEXT
2542 ciclo=0:|COLSP,32,10,27:|colsp,34,3,0:|STARS,0,5,2,0,-1:|AUTOALL,1:|PRINTSPALL,1,0  
2543 |MUSIC,0,6
2544 vuelta=0:cadencia=63:' 3 vueltas
2550 'ciclo de juego
2551 '--------------
2560 GOSUB 1900
2570 |AUTOALL:|PRINTSPALL:|COLSPALL:mc=ciclo AND 1:IF mc THEN |STARS ELSE IF fires THEN GOSUB 760
2571 IF col<32 THEN GOSUB 900:IF vivo=0 THEN 2500
2580 |MAP2SP,yo,ciclo
2590 ciclo=ciclo+1: IF ciclo=264 THEN if vuelta < 3 then vuelta=vuelta+1: cadencia=max(15,(cadencia+1)/2-1):ciclo=0:countdown=0: t=t MOD 2+1:INK 1,13+t else return
2591 cm2=ciclo AND cadencia: IF cm2=0 THEN GOSUB 3000 else if ciclo mod 6=0 then gosub 2000 
2600 GOTO 2560

2998 ' creacion ovni
2999 '----------------
3000 ovni=ovni MOD 12 +1: k=k mod 2+1 
3001 ovnisp=ovni +15
3002 if vuelta <2 then imgovni=29: ruta= 5+k else imgovni=26: ruta=5
3003 |SETUPSP,ovnisp, 0, 203:|SETUPSP,ovnisp, 9, imgovni
3004 |SETUPSP,ovnisp, 15,ruta
3005 |LOCATESP,ovnisp,120-ovni*10,80
3006 return 


3498' FASE 2b
3499'===============================
3500 ciclo=0:countdown=0: cadencia=10: ov=0:|STARS,0,5,2,0,-2:|COLSP,32,10,27:|colsp,34,1,0:
3560 GOSUB 1900: ciclo=ciclo+1
3570 |AUTOALL:|PRINTSPALL:|COLSPALL:mc=ciclo AND 1:IF mc THEN |STARS ELSE IF fires THEN GOSUB 760
3571 IF col<32 THEN GOSUB 900:IF vivo=0 THEN 2500:'vuelve a la fase 2
3591 if ciclo<200 then if ciclo mod cadencia=0 THEN GOSUB 3000  else else if ciclo > 280 then return
3600 goto 3560

3998'fase 3
3999'===============================
4000 fase=3:GOSUB 1620:|COLSP,32,0,27:|colsp,34,1,0::ciclo=0: countdown=0
4010 ' pokes del mapa del mundo
4020 dirmap!=42040:FOR i!=&62A2 TO &63bd
4030 dato=PEEK(i!):POKE dirmap!,dato:dirmap!=dirmap!+1
4040 NEXT
4050 |MUSIC,1,6: CALL &BC02:INK 0,0:ink 1,24
4060 TAGOFF:LOCATE 8,10:PRINT "        ":TAG 
4061 for yb=25*2 to 32*2 step 2 :plot 0,yb,2:draw 640,yb:next
4062 for yb=(40*2) to (48*2) step 2 :plot 0,yb,11:draw 640,yb:next
4070 countdown=-4:ov=0: ciclo=0:xo=0: montsp=16: |PRINTSPALL,0,1,0

4071 |SETUPSP,16,0,&x10011: |SETUPSP,16,9,31:|SETUPSP,16,5,0,-1: |LOCATESP,16,200-40-16,0
4075 |SETUPSP,17,0,&x10011: |SETUPSP,17,9,31:|SETUPSP,17,5,0,-1: |LOCATESP,17,200-40-16,40
4076 |SETUPSP,18,0,&x10011: |SETUPSP,18,9,31:|SETUPSP,18,5,0,-2: |LOCATESP,18,200-40-16,80


4100 'ciclo de juego
4120 ' --------------
4130 GOSUB 1900
4140 |AUTOALL:|PRINTSPALL:|COLSPALL:mc=ciclo AND 1:IF mc THEN poke 27256,0: poke 27272,0:poke 27288,0:IF fires THEN GOSUB 760:else else poke 27256,19: poke 27272,19:poke 27288,19:|MOVERALL,0,-1
4150 IF col<32 THEN GOSUB 900:IF vivo=0 THEN 4000
4160 |MAP2SP,0,kx:kx=kx mod 80 +1 : if kx=1 then gosub 4520
4170 ciclo=ciclo+1: 
4180 if ciclo<320 then if ciclo mod 20 =0 then gosub 4600 else if ciclo mod 5=0 then gosub 4300 else else if ciclo >420 then return
4190 GOTO 4130
4298 ' disparo inteligente especial
4299 '------------------------------
4300 firer=firer mod 9+1
4310 dirfirer=27000+(firer+18)*16:IF PEEK (dirfirer)=0 THEN RETURN
4320 goto 2020
4321 return

4500 'montanas paralax
4510 '----------------
4520  |LOCATESP,16,200-40-16,0 
4530  |LOCATESP,17,200-40-16,40
4531  |LOCATESP,18,200-40-16,80
4550 return

4598' moscas
4599'---------
4600 ovni=ovni MOD 9 +1
4601 ovnisp=ovni +18
4602 |SETUPSP,ovnisp, 0, 143:|SETUPSP,ovnisp, 7, 16:|SETUPSP,ovnisp, 15, 8
4603 |LOCATESP,ovnisp,40+rnd*90,80
4604 return



4699 ' disparo gorgo
4700 ydisp=peek(27305)
4710 dart=dart mod 6 +1
4711 dartsp=dart+9
4712 |SETUPSP,dartsp,0,11:|SETUPSP,dartsp,5,0,-3:|SETUPSP,dartsp,9,33
4713 |locatesp,dartsp,ydisp+20,70
4714 return


4898'fase gorgo
4899'===============
4900 |SETUPSP,19,9,32: gorgo=100:|MUSIC,2,6:ciclo=0: countdown=0
4901 |LOCATESP,19,100,80
4902 |SETUPSP,19,0,139
4903 |SETUPSP,19,15,9
4904 GOSUB 1900
4905 |AUTOALL:|PRINTSPALL:|COLSPALL:mc=ciclo AND 1:IF mc THEN poke 27256,0: poke 27272,0:poke 27288,0:IF fires THEN GOSUB 760:else else poke 27256,19: poke 27272,19:poke 27288,19:|MOVERALL,0,-1
4906 IF col<32 THEN GOSUB 4950:IF vivo=0 THEN 4000
4907 |MAP2SP,0,kx:kx=kx mod 80 +1 : if kx=1 then gosub 4520
4908 ciclo=ciclo+1: 
4909 if ciclo mod 10 =0 then gosub 4700 
4910 goto 4904

4950 if col=19 then gorgo=gorgo-1:ink 9,24: call &bd19:ink 9,12: if gorgo=0 then 6000
4951 if sp=31 then gosub 900
4952 return

4999' ------ BEGIN PALETA --------
5000 INK  0 , 0 
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
5016 return


6000 ' FINAL DEL JUEGO
6010 '=================
6020 |MUSICOFF:|SETLIMITS,0,80,20,200-7*8:'asi no se borran decorados

6021 TAGOFF:for i=4 to 18:locate 1,i:print STRING$(20," ");:next
6021 tagoff:window 1,40,4,18:cls:window 1,40,1,25:'mas rapido 
6030 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT
6031 |SETUPSP,19,9,32:|SETUPSP,19,0,1
6032 xgorgo=80
6033 |LOCATESP,19,60,xgorgo:|PRINTSPALL: for i=1 to 200:next
6034 xgorgo=xgorgo-1:if xgorgo>68 then 6033
6060 FOR i=0 to 31
6090 |SETUPSP,i,9,fragment: |SETUPSP,i,0,9
6100 |SETUPSP,i,5,rnd*4-2,rnd*1 -2
6101 |LOCATESP,i,100-rnd*40,70+rnd*20
6110 NEXT
6130 SOUND 3,145,300,12,1,1,12
6140 FOR i=1 TO 100 :|AUTOALL:|PRINTSPALL:NEXT    
6170 LOCATE 8,8:pen 10:PRINT " CONGRATULATIONS!!!"
6180 LOCATE 8,9:PRINT"   GORGO is dead"
6190 LOCATE 8,13:pen 3:PRINT "END OF NIBIRU PLANET"
6191 b$= inkey$: if b$<>"" then  6191
6200 if inkey(47)=0 then 6300 else 6200
6300 cls
6310 |SETUPSP,0,9,34: |PRINTSP,0,80,34: |MUSICOFF
6320 locate 1,20:pen 3:print "  GORGO NEVER die..."
6321 locate 1,23:print "He will strike back!"
6322 FOR i=0 TO 79 STEP 2:POKE i+42540,rnd*110:POKE i+42540+1,30+20*rnd:NEXT 

6327|SETLIMITS,30,50,0,150:|PRINTSP,0,80,34:|MUSIC,2,6:k=0: inc=1
6330 |STARS,0,20,2,0,-1:|STARS,20,20,4,0,1
6331 |PRINTSP,0,80-k,34:k=k+inc:if k=5 then inc=-1: else if k=-5 then inc=1
6332 if inkey(47)=0 then 7900 else 6330

7000' PRESENTACION
7001 ink 3,15: espera=1100:|SETLIMITS,0,80,0,200
7010 mode 1: |MUSICOFF
7020 gosub 7200: plot 1,400,1:draw 60,280:draw 580,280:draw 640,400
7021 gosub 7600
7030 locate 1,10:pen 1:print "    by Jose Javier Garcia Aranda"
7040 PRINT:PRINT "    A 100% BASIC program Made with 8BP"
7050 PRINT "     8BP: The ultimate set of RSX"
7051 PRINT "          commands for games!"
7052 PRINT: pen 2
7060 print "     www.github.com/jjaranda13/8BP"
7080 print "     www.8bitsdepoder.blogspot.com"
7081 PRINT
7082 PRINT: pen 1
7083 'print "   press space to start":'line 19
7084 |SETUPSP,0,9,24000:|SETUPSP,0,0,9
7085 |SETUPSP,1,9,24000:|SETUPSP,1,0,9
7089 PRINT
7090 locate 2,24:print "8BP": locate 30,24:print "2016 JJGA "
7091|MUSIC,2,6: counter=1:x=80
7110 if inkey(47)=0 then |musicoff: goto 160
7112 counter=counter mod espera +1: if counter=1 then 7300
7113 |LOCATESP,0,21*8,x:|LOCATESP,1,21*8,x+80:|PRINTSPALL,0,0,1:x=x MOD 80 -1 
7120 goto 7110
7130 return
7199' IMPRESION DE LAS LETRAS GIGANTES
7200 locate 6,3:pen 1
7201 restore: 
7202 read a: if a=1 then print chr$(143); else if a=5 then print chr$(207);else if a=0 then print " "; else if a=2 then print "": print "     "; else if a=3 then pen 2 else 7204
7203 goto 7202
7204 return
7205 DATA 1,1,1,1,1,0,1,0,0,1,1,1,1,0,0,1,0,0,1,1,1,1,0,0,1,0,0,0,1,2
7210 data 1,0,0,0,1,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,0,1,2 
7220 data 1,0,0,0,1,0,1,0,0,1,1,1,1,1,0,1,0,0,1,1,1,1,1,0,1,1,0,0,1,2,3 
7230 data 1,1,0,0,1,0,1,1,0,1,0,0,0,1,0,1,1,0,1,1,0,0,1,0,1,1,0,0,1,2 
7240 data 1,1,0,0,1,0,1,1,0,1,1,1,1,1,0,1,1,0,1,1,0,0,1,0,1,1,1,1,1,4

7300 gosub 7600:'clear
7310 gosub 7700:'lee tabla
7320 gosub 7800:'print tabla
7321 |MUSIC,0,6
7330 if inkey(47)=0 then |MUSICOFF:goto 160
7331 |LOCATESP,0,21*8,x:|LOCATESP,1,21*8,x+80:|PRINTSPALL,0,0,1:x=x MOD 80 -1 
7340 counter=counter mod espera +1: if counter=1 then 7021
7350 goto 7330

7599' esto es una limpieza de cierto area de pantalla
7600 |MUSICOFF:window 1,40,10,23:cls:window 1,40,1,25:return

7700 'lee SCORE TABLE (100 bytes)
7701 locate 12,10:PEN 2:PRINT "HALL OF FAME": pen 1
7710 locate 1,12:dir=25900
7711 for i=0 to 9: name$(i)="":print "    ";
7720 for j=dir to dir +7:
7730 letra=peek (j): name$(i)=name$(i)+chr$(letra)
7740 next j: dir=dir+8
7750 pts(i)=0:|peek,dir,@pts(i):dir=dir+2
7760 next i
7770 return



7800 ' print SCORE TABLE
7810 locate 1,11:dir=25900
7811 for i=0 to 9: print "      ";
7820 print name$(i);:PRINT STRING$(14,".");:print pts(i);"    "
7860 next i
7861 return



7900 ' rutina de GAME OVER
7901 |MUSICOFF:window 1,40,1,25:cls:window 1,40,1,25:'mas rapido 
7902 TAGOFF:PEN 3:LOCATE 6,10: PRINT "GAME  OVER"
7903 if inkey(47)<>0 then 7903
7904 gosub 7710:'lee tabla en array pts()
7961 idx=10
7962 if (score>pts(idx-1)) then idx =idx-1 else 7964
7963 if idx >0 then  7962
7964 if idx<10 then gosub 8000: 'ordena
7965 if idx<10 then gosub 8500: 'pide nombre y pokea
7966 run


8000' ordena
8010 for i=8 to idx step -1
8020 name$(i+1)=name$(i):pts(i+1)=pts(i)
8030 next
8040 return

8500' pide nombre
8510 b$= inkey$: if b$<>"" then  8510
8600 window 1,40,1,22:cls:window 1,40,1,25:'mas rapido 
8601 locate 1,3:PRINT " ENTER YOUR NAME":locate 4,5:INPUT tu$
8602 tu$=tu$+"          ":tu2$=MID$(tu$,1,8)
8603 rem voy a pokear
8604 name$(idx)=tu2$:pts(idx)=score
8605 dir=25900
8606 for item=0 to 9: j=1
8607 for i=dir to dir+7:poke i,ASC(MID$(name$(item),j,1)):j=j+1:next
8608 dir =dir +8:|POKE,dir,pts(item):dir=dir+2
8609 next
8610 return





