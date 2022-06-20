10 'PACO EL HOMBRE. 8BP 2022
12 memory 17499
13 CALL &6B78:|MUSIC
20 DEFINT A-Z:MODE 1:INK 1,24:INK 2,15:INK 3,11: INK 0,0: BORDER 0
21 If peek(&39)=57 then cpc=464 else cpc=6128
40 ENT 1,5,-100,3
50 DIM cache(190):x=40
60 FOR y=8 TO 190
70 cache(y)= &A438 + INT(y/8)*20:' direccion de layout. ojo 20/8 = 3 por el redondeo INT
70 cache(y)= &A438 + INT((y and 248)/8)*20:' direccion de layout.
80 NEXT
90 'VARIABLES GLOBALES
100 '====================
110 DIM L$(25)
120 hi=0:|PEEK,42038,@hi:flaghi=0:target=141:lasthi=hi:
130 level=1: vidas=4: newlevel=1:scr=0
131 music=0
141 '--- PRESENTACION ---
142 '======================
143 ink 1,15:ink 3,24:ink 2,14:ink 0,0
150 MODE 1:LOCATE 14,8: PEN 1: PRINT "PACO, EL HOMBRE"
151 locate 10,10:print "Paco es un pobre hombre"
153 locate 11,11:print "El sentido de su vida"
154 locate 13,12:print "es recoger cocos"
155 locate 6,14: pen 3:PRINT "CONTROLS: QAOP + M (music or FX)";
156 cad$="HI-SCORE:":|PRINTAT,0,150,30,@cad$:cad$=STR$(hi):|PRINTAT,0,150,47,@cad$
156 cad$="HI-SCORE:":|PRINTAT,0,115,30,@cad$:cad$=STR$(hi):|PRINTAT,0,115,47,@cad$
157 locate 1,23: pen 2:PRINT "8BP: THE ULTIMATE RSX LIBRARY FOR GAMES";
158 locate 30,25: pen 3:PRINT "JJGA 2022";
159 locate 4,17: print "level 1 BASIC & MASSIVE LOGICS (ML)"
160 locate 4,18: print "level 2 BASIC & EXTRA ML"
161 locate 4,19: print "level 3 COMPILED CYCLE & ML"
162 locate 4,20: print "level 4 COMPILED CYCLE & EXTRA ML"

163 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:' limpieza
170 FOR i=0 TO 3: |SETUPSP,i,0,128+8+1:NEXT
180 |SETUPSP,0,15,9:|LOCATESP,0,20,20:'P
190 |SETUPSP,1,15,10:|LOCATESP,1,41,31:'A
200 |SETUPSP,2,15,11:|LOCATESP,2,8,48:'C
210 |SETUPSP,3,15,12:|LOCATESP,3,8,56:'O
220 FOR i=0 TO 100:|AUTOALL,1:|PRINTSPALL,0,0,0,0:NEXT
230 FOR i=0 TO 10:|SETUPSP,i,0,128+64+8+1:|LOCATESP,i,20+(13*i)MOD 80,20+(i*13) MOD 50:|SETUPSP,i,15,5+(i MOD 4):NEXT

230 FOR i=0 TO 15:|SETUPSP,i,0,128+64+8+1:|LOCATESP,i,200 ,0:|SETUPSP,i,15,13:NEXT
231 |SETLIMITS,0,80,0,100
232 |MUSIC,0,0,0,6
233 level=1: ly=17: locate 3,ly:print ">"
234 '--- bucle eleccion fase ---
240 |AUTOALL:|PRINTSPALL: j=j+1:if j<8 then 261 else j=0
241 i=i+1: if i>=16 then i=0: 
250 |LOCATESP,i,-16,15+rnd*45
261 b$=inkey$: if b$=" " then 271
262 if b$="q" then if ly>17 then locate 3,ly:print " ":ly=ly-1:level=level-1:locate 3,ly:print ">"
263 if b$="a" then if ly<20 then locate 3,ly:print " ":ly=ly+1:level=level+1:locate 3,ly:print ">"
270 GOTO 240
271 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:' limpieza
272 cls:ink 0,0:ink 1,24: ink 2,14:ink 3,13
273 |MUSIC
274 dant=0
280 '--- BUCLE PROGRAMA PRINCIPAL ---
290 '================================
291 c=0:co=0:lastop=-1:newr=0:op=0: GOSUB 450:'construccion nivel y recolocacion
292 if level=1 then ink 3,11:ink 2,15
293 if level=2 then ink 3,15:ink 2,14
294 if level=3 then ink 3,14:ink 2,7
295 if level >3 then ink 3,10:ink 2,22
301 if music then |MUSIC,0,0,0,6
302 GOSUB 1070:'reset timer
310 IF level=1 THEN GOSUB 1120:goto 320 'ciclo basic
311 if level=2 THEN GOSUB 1120:goto 320 'ciclo basic precomputed
312 if level=3 THEN GOSUB 3000:goto 320 'ciclo C 
313 IF level>3 THEN GOSUB 3000:goto 320 'ciclo C precomputed
320 IF vidas=0 THEN 340:'fin 
330 GOTO 291
340 '---game over ---
350 PEN 2:LOCATE 16,14:PRINT "  GAME  "
360 LOCATE 16,15:PRINT "  OVER  "
370 IF flaghi=0 THEN 400 ELSE |POKE,42038,scr:|PEEK,42038,@hi
380 LOCATE 5,6:PEN 1:PRINT " CONGRATULATIONS: NEW HI-SCORE"
390 |POKE,42038,scr:|PEEK,42038,@hi
400 b$=INKEY$:IF b$<>"" THEN 400 
410 FOR i=1 TO 5000:NEXT
420 b$=INKEY$:IF b$="" THEN 420 
430 GOTO 120
440 '---construccion nivel---
450 FOR i=16 TO 43:|SETUPSP,i-16,9,i:NEXT:' imagenes de construccion
460 |SETUPSP,31,9,16
470 |SETLIMITS,0,76,0,200
480 L$(0)= "=AAAAAAAADAAAAAAAA> "
490 L$(1)= "F        O        E "
500 L$(2)= "F;;;;;;;;O;;;;;;;;E "
510 L$(3)= "F<RS<ROS<Q<ROS<RS<E "
520 L$(4)= "F                 E "
530 L$(5)= "F;;;;;;;;;;;;;;;;;E "
540 L$(6)= "F KL P<ROOOS<P KL E "
550 L$(7)= "F;MN;O   O   O;MN;E "
560 L$(8)= "F    O;;;O;;;O    E "
570 L$(9)= "F;;;;OOS<Q<ROO;;;;E "
580 L$(10)="?BBG O       O HBB@ "
590 L$(11)="   F;O;;;;;;;O;E    "
600 L$(12)="AAAI<Q<HBBBG<Q<JAAAA"
610 L$(13)="       E   F        "
620 L$(14)=";;;;;;;E   F;;;;;;; ":'el ultimo esta fuera de limits
630 L$(15)="BBBG<P<JAAAI<P<HBBBB"
640 L$(16)="   F O       O E    "
650 L$(17)="   F;O;;; ;;;O;E    "
660 L$(18)="=AAI<O<ROOOS<O<JAA> "
670 L$(19)="F    O   O   O    E "
680 L$(20)="F;;;;O;;;O;;;O;;;;E "
690 L$(21)="F<RS<Q<P<Q<P<Q<RS<E "
700 L$(22)="F      O   O      E "
710 L$(23)="F;;;;;;O;;;O;;;;;;E "
720 L$(24)="?BBBBBBCBBBCBBBBBB@ "
730 IF newlevel THEN CLS:FOR y=0 TO 24: |LAYOUT,y,0,@L$(y):NEXT: ' solo la primera vez
740 newlevel=0
750 |SETLIMITS,0,80,0,200
760 |SETUPSP,31,9,45: FOR i=1 TO 5:|PRINTSP,31,i*16,74:NEXT
770 |SETUPSP,31,9,41: FOR i=1 TO vidas:|PRINTSP,31,i*16,74:NEXT
780 |SETLIMITS,0,76,0,200
790 col=0
800 FOR i=0 TO 31 :|SETUPSP,i,0,0:NEXT:'reset
810 |AUTOALL,1:|PRINTSPALL,0,0,0,0:|COLAY,62, @col,31' config
820 |LOCATESP,31,16*8,36:|SETUPSP,31,0,128+32+8+1:|SETUPSP,31,15,4:|PRINTSP,31:'quieto

830 'setup fantasmas
840 FOR n=0 TO 3: dfx(n)=27003+(27+n)*16:NEXT:'x
850 FOR n=0 TO 3: dfy(n)=27001+(27+n)*16:NEXT:'y
860 GOSUB 880: GOTO 930
870 'colocacion fantasmas y paco
880 |LOCATESP,27,1*8,4:|SETUPSP,27,0,128+64+2+8+1:|SETUPSP,27,15,5:|SETUPSP,27,9,43:rf(0)=5'derecha
890 |LOCATESP,28,1*8,4*17:|SETUPSP,28,0,128+64+2+8+1:|SETUPSP,28,15,6:|SETUPSP,28,9,43:rf(1)=6'izq


900 |LOCATESP,29,22*8,4*17-1:|SETUPSP,29,0,128+64+2+8+1:|SETUPSP,29,15,6:|SETUPSP,29,9,43:rf(2)=6'izq
910 |LOCATESP,30,22*8,4+1:|SETUPSP,30,0,128+64+2+8+1:|SETUPSP,30,15,5:|SETUPSP,30,9,43:rf(3)=5'derecha
920 |SETUPSP,31,9,42:|LOCATESP,31,16*8,36:|SETUPSP,31,0,128+32+8+1:|SETUPSP,31,15,4:dir=5:|PRINTSP,31
921 RETURN
930 ' sprites tunel
'940 |SETUPSP,26,0,2:|SETUPSP,26,9,41:|LOCATESP,26,13*8,80
940 |SETUPSP,26,0,2:|SETUPSP,26,9,41:|LOCATESP,26,13*8,78
950 |SETUPSP,25,0,2:|SETUPSP,25,9,41:|LOCATESP,25,13*8,-8
960 ' cofig colision
980 |COLSP,32,25,30:cod=32:|COLSP,33,@cod
990 |COLSP,34,0,0
1000 dir=5:|PRINTSP,31:'|COLAY,31
1010 cad$="HI:":|PRINTAT,0,0,10,@cad$:cad$=STR$(lasthi)
1020 |PRINTAT,0,0,14,@cad$:
1030 cad$="SCORE:":|PRINTAT,0,0,50,@cad$:cad$=STR$(scr):|PRINTAT,0,0,60,@cad$
1040 GOSUB 1070:cad$="FPS":|PRINTAT,0,180,74,@cad$
1040 cad$="FPS":|PRINTAT,0,180,74,@cad$
1050 c=0:x=PEEK(27499):y=PEEK(27497):GOTO 1080
1060 'rutina reset timer
1070 if cpc>464 then POKE &B8B4,0: POKE &B8B5,0: POKE &B8B6,0: POKE &B8B7,0:RETURN ' 6128
1071 POKE &b187,0: POKE &b188,0: POKE &b189,0: POKE &b18a,0:RETURN ' 464
1072' rutina mensaje ready
1080 GOSUB 1910:c=0:GOSUB 1070:a=TIME 'ready?
1090 RETURN

1100 '--- CICLO DE JUEGO ---
1110 '======================
1120 'ciclo de juego n=0-> teclado + xy, n=1->colision fantasmas, n=2->colision layout , n=3-->deteccion puntos + xy
1130 c=c+1:n=c AND 3 
1140 CALL &71CE :'|AUTOALL
1150 IF n AND 1 THEN 1340 :' colision fantasmas(n=1) y puntos (n=3)
1160 IF n THEN 1190 ELSE 1260: 'teclado (n=0) y colay (n=2)
1170 '--- rutina recolocacion --- (n=2)
1171 '=================================

1190 CALL &71FD,31:IF col THEN 1200 ELSE 1490 :'COLAY
1200 |SETUPSP,31,15,4: ON dir GOTO 1220,1230,1240 :' ruta 4 es parado
1210 |MOVER,31,0,-1:GOTO 1490
1220 |MOVER,31,0,1:GOTO 1490
1230 |MOVER,31,4,0:GOTO 1490
1240 |MOVER,31,-4,0:GOTO 1490
1250 '---rutina teclado --- (n=0))
1251 '============================
1260 IF c AND 63 THEN 1270 ELSE FPS=0.5+64*300/(TIME - A):cfps$=STR$(FPS):|PRINTAT,0,190,73,@cfps$:GOSUB 1070:A=TIME
1260 IF c AND 63 THEN 1270 ELSE FPS=0.5+64*300/(TIME - A):cfps$=STR$(FPS):|PRINTAT,0,190,73,@cfps$:A=TIME
1270 IF dir THEN IF INKEY(27)=0 THEN CALL &753C,31,0,1:CALL &71FD,31:CALL &753C,31,0,-1:IF col=0 THEN |SETUPSP,31,15,0: dir=0:GOTO 1490 ELSE 1490
1280 IF dir <>1 THEN IF INKEY(34)=0 THEN CALL &753C,31,0,-1:CALL &71FD,31:CALL &753C,31,0,1:IF col=0 THEN |SETUPSP,31,15,1: dir=1:GOTO 1490 else 1490
1290 IF dir <>2 THEN IF INKEY(67)=0 THEN CALL &753C,31,-1,0:CALL &71FD,31:CALL &753C,31,1,0:IF col=0 THEN |SETUPSP,31,15,2: dir=2:GOTO 1490 ELSE 1490
1300 IF dir <3 THEN IF INKEY(69)=0 THEN CALL &753C,31, 1,0:CALL &71FD,31:CALL &753C,31,-1,0: IF col=0 THEN |SETUPSP,31,15,3: dir=3:GOTO 1490 else 1490
1310 GOTO 1490
1320 '--- detecta puntos (n=3) y colision fantasmas (n=1)
1321 '===================================================
1330 ' deteccion puntos tiene en cuenta dir para no borrar el punto sin comerlo o comerlo sin borrarlo
1340 IF n=1 THEN CALL &73A8,31:IF cod<32 THEN 1810 ELSE 1490' colision cada 4 frames (n=1)
1340 locate 1,2:print n:IF n=1 THEN CALL &73A8,31:IF cod<32 THEN 1810 ELSE 1490' colision cada 4 frames (n=1)
1350 |PEEK,27499,@x:y=PEEK(27497)
1360 ON dir GOTO 1370,1380,1390 
1369 y2=y+8:x2=x+2:GOTO 1400
1370 y2=y+8:x2=x:GOTO 1400
1380 y2=y:x2=x:GOTO 1400
1390 y2=y+12:x2=x
1400 d=cache(y2)+x2/4
'1400 d=cache(y2)+(x2/4)+q
1410 dato=PEEK(d)
1411 if inkey(38)=0 then if music then music=0:|MUSIC else music=1:|MUSIC,0,0,0,6
'1412 if dant<>(d-&a438) then print (d-&a438);y2;",";x;",";dir;dato: dant=d-&a438
'1420 IF dato<61 THEN IF dato>32 THEN 1440 ELSE 1490
1420 IF dato<60 THEN IF dato>32 THEN 1440 ELSE 1490
1430 '--rutina incremento puntos---
1440 POKE d,32:scr=scr+1:cad$=STR$(scr):|PRINTAT,0,0,60,@cad$: if music then 1450 else SOUND 4,400,10,15,0,1
'1441 'if dant<>(d-&a438) then print (d-&a438);y2;",";x;",";dir: dant=d-&a438
'1442 locate 1,1:print d,dato, chr$(dato)
1450 IF scr=target THEN 2060
1460 IF hi>scr THEN 1490 ELSE 1470
1470 LOCATE 18,14:PEN 2:PRINT "NEW":LOCATE 16,15::PRINT "HI-SCORE":hi=30000:flaghi=1
1480 '--- rutina fantasmas---(cada frame)
1481 '====================================
1490 id=27+n
1490 locate 1,1:print n: input l:goto 4000
1490 goto 4000
1490 locate 1,1:print n: input l:goto 5000
1490 if level=2 then 5000 else id=27+n

1500 IF rf(n)<7 THEN xf=PEEK(dfx(n)):IF xf AND 3 THEN 1780 ELSE ELSE 1650:'acelera un poco. dir fant x
1510 IF rf(n)>5 THEN 1590
1520 newr=1+newr AND 3
1530 ON newr GOTO 1550,1560:'ruta 5 (derecha) 
1540 CALL &753C,id,0,1:CALL &71FD,id:CALL &753C,id,0,-1: IF col THEN 1550 ELSE 1780:' sigue
1550 CALL &753C,id,-1,0:CALL &71FD,id:CALL &753C,id,1,0: IF col THEN 1560 ELSE rf(n)=7:CALL &70FD,id,15,7:GOTO 1780
1560 CALL &753C,id,1,0:CALL &71FD,id:CALL &753C,id,-1,0: IF col THEN 1570 ELSE rf(n)=8:CALL &70FD,id,15,8:GOTO 1780
1570 IF xf >75 THEN |MOVER,id,0,-80:GOTO 1780
1580 GOTO 1540
1590 IF xf<200 THEN newr=1+newr AND 3 ELSE |MOVER,id,0,80:GOTO 1780
1600 ON newr GOTO 1620,1630: 'rutas 6 izq
1610 CALL &753C,id,0,-1:CALL &71FD,id:CALL &753C,id,0,1: IF col=0 THEN 1780:' sigue
1620 CALL &753C,id,-1,0:CALL &71FD,id:CALL &753C,id,1,0: IF col=0 THEN rf(n)=7:CALL &70FD,id,15,7:GOTO 1780
1630 CALL &753C,id,1,0:CALL &71FD,id:CALL &753C,id,-1,0: IF col=0 THEN rf(n)=8:CALL &70FD,id,15,8:GOTO 1780
1640 GOTO 1610
1650 yf=PEEK(dfy(n)):IF yf AND 7 THEN 1780 ELSE IF rf(n)=8 THEN 1720 
1660 newr=1+newr AND 3
1670 ON newr GOTO 1690,1700: 'rutas 7 up
1680 CALL &753C,id,-1,0:CALL &71FD,id:CALL &753C,id,1,0: IF col=0 THEN 1780:' sigue
1690 CALL &753C,id,0,1:CALL &71FD,id:CALL &753C,id,0,-1: IF col=0 THEN rf(n)=5:CALL &70FD,id,15,5:GOTO 1780
1700 CALL &753C,id,0,-1:CALL &71FD,id:CALL &753C,id,0,1: IF col=0 THEN rf(n)=6:CALL &70FD,id,15,6:GOTO 1780
1710 GOTO 1680
1720 newr=1+newr AND 3
1730 ON newr GOTO 1750,1760: 'rutas 7 down
1740 CALL &753C,id,1,0:CALL &71FD,id:CALL &753C,id,-1,0: IF col=0 THEN 1780:' sigue
1750 CALL &753C,id,0,1:CALL &71FD,id:CALL &753C,id,0,-1: IF col=0 THEN rf(n)=5:CALL &70FD,id,15,5:GOTO 1780
1760 CALL &753C,id,0,-1:CALL &71FD,id:CALL &753C,id,0,1: IF col=0 THEN rf(n)=6:CALL &70FD,id,15,6:GOTO 1780
1770 GOTO 1740
1780 CALL &62A6:'printspall
1790 GOTO 1130:'inicio ciclo
1800 '--- rutina colision y muerte---
1801 '===============================
1810 IF cod<27 THEN IF cod=26 THEN |MOVER,31,0,-80:GOTO 1490 ELSE |MOVER,31,0,80:GOTO 1490
1820 |SETUPSP,31,7,1:|SETUPSP,31,0,5:
1821 if music then |MUSIC
1822 clevel=clevel+c
1830 FOR i=0 TO 50:|ANIMA,31:|PRINTSP,31: 'da vueltas
1840 SOUND 1,i*10,1,10:FOR j=0 TO 50:NEXT
1850 NEXT
1860 'borra paco y fantasmas
1870 FOR i=27 TO 31:|SETUPSP,i,9,45:|PRINTSP,i:NEXT
1880 vidas=vidas-1 
1890 RETURN 
1900 '---mensaje ready? ---
1910 PEN 1:LOCATE 16,14:PRINT "LEVEL";level
1920 LOCATE 16,15:PRINT " READY? ";
1930 b$=INKEY$: IF b$<>"" THEN 1930
1940 b$=INKEY$: IF b$="" THEN 1940
1950 LOCATE 16,14:PRINT "        ";
1960 LOCATE 16,15:PRINT "        ";
1970 RETURN 
1980 ' --- debug mapa (esta rutina no es parte del juego ---
1990 CLS:y=1:FOR i= &A438 TO &A438 + 499 STEP 20: x=1: PRINT y;
2000 FOR j= i TO i+19 
2010 dato=PEEK(j)
2020 PRINT CHR$(dato);
2030 NEXT j
2040 PRINT
2050 y=y+1:NEXT i
2051 end
2060 '---fin level---
2061 '===============
2070 'se ha alcanzado el target
2071 |MUSIC: clevel=clevel+c
2072 LOCATE 16,14:PRINT " BONUS  ";
2073 LOCATE 16,15:PRINT " 0      ";
2074 ink 3,13,26: for i=2000 to 100 step -50: sound 6,i,7,12,1,1:next: ink 3,13
2075 for i = clevel to 2500 step 10:'deberia ser la suma de c pues al morir c se reinicia. o bien no reiniciarlo
2076 scr=scr+10: LOCATE 16,15:PRINT i-clevel:sound 1,100,1,12
2077 next: clevel=0
2078 for i=1 to 1000:next
2080 target=scr+141: newlevel=1: level=level+1
2090 RETURN

3000'---ciclo en C
3001'=============
3010 'pasamos direcciones de variables para poder escribirlas desde c
3020 |POKE,17900,@scr
3030 |POKE,17902,@target
3031 |POKE,17904,@music
3032 |POKE,17906,@hi
3033 |POKE,17908,@flaghi
3034 if level>=4 then |POKE,17914,1 else |POKE,17914,0
'3035 |poke,17916,cpc
3040 call &4d0d:'llamada al ciclo compilado
3050 'recogida resultados
3055 |peek,17912,@c:'ciclos consumidos
3060 result=0:|peek,17910,@result:' muerte (0) o target alcanzado (1)
3070 if result =0 then 1820 ' muerte
3071 if result =1 then 2060 ' fin nivel


4999 'decisiones precomputadas logica fantasmas
5000 if op<8 then op=peek (&9c40+co) else op=op-1:CALL &62A6:GOTO 1130
5001 co=co+1:if co=2000 then 1820:'muerte (co=2000 ->6712 ciclos)
5002 if op>6 then CALL &62A6:GOTO 1130
5010 id=27+n:if op>4 then CALL &70FD,id,15,op:CALL &62A6:GOTO 1130 '5 y 6 
5011 on op goto 5020,5030
5012 if op=3 then |MOVER,id,0,-80:CALL &62A6:GOTO 1130 '3
5013 |MOVER,id,0,80:CALL &62A6:GOTO 1130 '4
5020 CALL &70FD,id,15,7:CALL &62A6:GOTO 1130 '1
5030 CALL &70FD,id,15,8:CALL &62A6:GOTO 1130 '2

' *************ESTE CODIGO SE USA PARA GRABAR DECISIONES. NO VA EN EL LISTADO FINAL *************************************
' =======================================================================================================================
' antes de ejecutar usando esto hay que limpiar con for i=16000 to 17000:poke i,0:next
' y para usarlo hay que reemplazar la linea --> 1490 goto 4000
4000' rutina fantasmas para guardar decisiones
4490 id=27+n: 
'0 = no hacer nada. AL final he usado el 7 
'1 = cambio ruta up
'2 = cambio ruta dw
'3 = mover -80
'4 = mover 80
'5 = cambio ruta dere
'6 = cambio ruta iz
4500 IF rf(n)<7 THEN xf=PEEK(dfx(n)):IF xf AND 3 THEN op=0:goto 4780 ELSE ELSE 4650:'acelera un poco. dir fant x
4510 IF rf(n)>5 THEN 4590
4520 newr=1+newr AND 3
4530 ON newr GOTO 4550,4560:'ruta 5 (derecha) 
4540 CALL &753C,id,0,1:CALL &71FD,id:CALL &753C,id,0,-1: IF col THEN 4550 ELSE op=0:goto 4780:' sigue
4550 CALL &753C,id,-1,0:CALL &71FD,id:CALL &753C,id,1,0: IF col THEN 4560 ELSE rf(n)=7:CALL &70FD,id,15,7:op=1:GOTO 4780
4560 CALL &753C,id,1,0:CALL &71FD,id:CALL &753C,id,-1,0: IF col THEN 4570 ELSE rf(n)=8:CALL &70FD,id,15,8:op=2:GOTO 4780
4570 IF xf >75 THEN |MOVER,id,0,-80:op=3:GOTO 4780
4580 GOTO 4540
4590 IF xf<200 THEN newr=1+newr AND 3 ELSE |MOVER,id,0,80:op=4:GOTO 4780
4600 ON newr GOTO 4620,4630: 'rutas 6 izq
4610 CALL &753C,id,0,-1:CALL &71FD,id:CALL &753C,id,0,1: IF col=0 THEN op=0: goto 4780:' sigue
4620 CALL &753C,id,-1,0:CALL &71FD,id:CALL &753C,id,1,0: IF col=0 THEN rf(n)=7:CALL &70FD,id,15,7:op=1:GOTO 4780
4630 CALL &753C,id,1,0:CALL &71FD,id:CALL &753C,id,-1,0: IF col=0 THEN rf(n)=8:CALL &70FD,id,15,8:op=2:GOTO 4780
4640 GOTO 4610
4650 yf=PEEK(dfy(n)):IF yf AND 7 THEN op=0:goto 4780 ELSE IF rf(n)=8 THEN 4720 
4660 newr=1+newr AND 3
4670 ON newr GOTO 4690,4700: 'rutas 7 up
4680 CALL &753C,id,-1,0:CALL &71FD,id:CALL &753C,id,1,0: IF col=0 THEN op=0: goto 4780:' sigue
4690 CALL &753C,id,0,1:CALL &71FD,id:CALL &753C,id,0,-1: IF col=0 THEN rf(n)=5:CALL &70FD,id,15,5:op=5:GOTO 4780
4700 CALL &753C,id,0,-1:CALL &71FD,id:CALL &753C,id,0,1: IF col=0 THEN rf(n)=6:CALL &70FD,id,15,6:op=6:GOTO 4780
4710 GOTO 4680
4720 newr=1+newr AND 3
4730 ON newr GOTO 4750,4760: 'rutas 7 down
4740 CALL &753C,id,1,0:CALL &71FD,id:CALL &753C,id,-1,0: IF col=0 THEN op=0:goto 4780:' sigue
4750 CALL &753C,id,0,1:CALL &71FD,id:CALL &753C,id,0,-1: IF col=0 THEN rf(n)=5:CALL &70FD,id,15,5:op=5:GOTO 4780
4760 CALL &753C,id,0,-1:CALL &71FD,id:CALL &753C,id,0,1: IF col=0 THEN rf(n)=6:CALL &70FD,id,15,6:op=6:GOTO 4780
4770 GOTO 4740

4780 op=peek (16000+c):locate 1,1:print c,op,n:CALL &62A6:
4780 if op=0 then if lastop=0 then poke 16000+co,peek(16000+co)+7 : goto 4782
4780 if op=0 then if lastop=0 then if (peek(16000+co))< 248 then poke 16000+co,peek(16000+co)+7 : goto 4782 
4781 poke 16000+co,op: co=co+1
4782 lastop=op:if co=500 then end else CALL &62A6:'printspall
4790 GOTO 1130:'init ciclo

4780 if op=0 then op=7
'4781 locate 1,1:print op,lastop:input aa
4782 if op=7 then if op=lastop then poke (&9c40+co-1),(peek(&9c40+co-1)+1) : goto 4784
4783 poke (&9c40+co),op: co=co+1
4784 lastop=op:locate 1,10:print id;" ",op:CALL &62A6: if co=500 then end
4784 lastop=op:CALL &62A6: if co=2000 then end
4790 GOTO 1130:'inicio ciclo





