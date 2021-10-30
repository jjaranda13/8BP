10 clear:MEMORY 18499
15 DEFINT A-Z
20 CALL &6B78
30 |MUSIC,0,0,0,6
31 i=0:|peek,42542,@i:
32 if i=0 then b$=INKEY$:IF b$="" THEN 32
33 |MUSIC
40 MODE 0:GOSUB 2130:BORDER 0:'tintas
60 IF PEEK(&39)=57 THEN model=464 ELSE model=6128
70 CLG 12:PAPER 12
80 TAG:PLOT -10,-1,3: MOVE 6*32-4,25*16-2:PRINT "NOM WARS";:TAGOFF
81 PAPER 2:PEN 5:LOCATE 7,1: PRINT CHR$(22)+CHR$(1);"NOM WARS";CHR$(22)+CHR$(0);
82 plot 400,100:draw 600,100:draw 600,160:draw 400,160,1:draw 400,100,1
90 c$="LA GUERRA DEL NOM":|PRINTAT,0,10,23,@c$
100 c$="SOLO LOS VALIENTES LUCHAN":|PRINTAT,0,30,16,@c$
110 c$="2021. HA LLEGADO TU MOMENTO":|PRINTAT,0,38,13,@c$
120 c$="DESTRUYE EL NUEVO ORDEN MUNDIAL":|PRINTAT,0,48,8,@c$
130 c$="Y UNETE A LA FIESTA CLANDESTINA":|PRINTAT,0,56,8,@c$
140 c$="JOYSTIC OR":|PRINTAT,0,128,4,@c$
150 c$="KEYS: QAOP SPACE":|PRINTAT,0,136,4,@c$
170 c$="FIRE: START":|PRINTAT,0,152,4,@c$
171 c$="HI-SCORE":|PRINTAT,0,128,56,@c$
172 HISCORE=0:|peek,42540,@HISCORE:c$=STR$(HISCORE):|PRINTAT,0,136,56,@c$
173|SETUPSP,0,9,18:|PRINTSP,0,90,57:|SETUPSP,0,9,19:|PRINTSP,0,90,62

180 INK 0,0: INK 15,24:INK 10,13:|SETUPSP,0,9,17
190 col=32:cor=32:|COLSPALL,@cor,@col
200 x=40:y=20*8:FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT
210 i=28:j=29:'disparo y bomba
220 pot=10:'tabulacion score
221 xene=0:yene=0
240 po(1)=0:po(4)=2:po(3)=4:po(5)=6:po(2)=8:po(8)=10:po(6)=12:po(7)=14
250 DIM seq(16):seq(0)=1:seq(1)=2:seq(2)=2:seq(3)=2:seq(4)=3:seq(5)=4:seq(6)=4:seq(7)=4:seq(8)=5
260 seq(9)=6:seq(10)=6:seq(11)=6:seq(12)=7:seq(13)=8:seq(14)=8:seq(15)=8
270 DIM dirsp(32): FOR i=0 TO 32: dirsp(i)=27000+i*16:NEXT
280 DIM enecount(8): FOR i=0 TO 8: enecount(i)=0:NEXT
290 dir=0:|SETUPSP,31,7,seq(dir):t=0
300 INK 0,0: INK 15,24:INK 10,13:|SETUPSP,0,9,17:|SETUPSP, 0,15,48:|SETUPSP, 0,0,1+8+128:|LOCATESP,0,74,10
310 |MUSIC,0,0,0,6: FOR i=1 TO 300:NEXT
'310 FOR i=1 TO 300:NEXT
320 b$=INKEY$: IF b$<>"" THEN 320
330 |PRINTSPALL,0,0,0,1:|AUTOALL,1
340 b$=INKEY$:IF b$="" THEN 330
341 if b$=" " then up=67:fr=47:der=27:dw=69:iz=34:goto 350
342 if b$="X" then up=72:fr=76:der=75:dw=73:iz=74:goto 350
343 goto 330


350 '-- GAME LOGIC
360 |MUSIC:vidas=5:level=0:PAPER 0:CLS:GOSUB 2130
361 mid=0:'mitad de nivel. en version c esto puede ser un poke
370 puntos=0:newhs=0:poke 42540,puntos
371 inmune=0
'372 level=3

380 |SETUPSP,31,0,64+32+1:y=16*8:|LOCATESP,31,y,x
381 |poke,42540,puntos:poke 42545,vidas:poke 42544,level
390 |MUSIC,0,0,1,6
'390 |MUSIC
391 BORDER 0:CLG 12:c$=STR$(vidas):c$="LIVES"+c$:|PRINTAT,0,80,34,@c$:
400 c$=STR$(level+1):c$="LEVEL"+c$:|PRINTAT,0,90,34,@c$:
401 c$=STR$(PUNTOS):c$="SCORE"+c$:|PRINTAT,0,100,34,@c$:
402 if newhs then c$="CONGRATULATIONS. NEW HISCORE!":|PRINTAT,0,120,14,@c$:newhs=0
403 |SETUPSP,0,9,18:|PRINTSP,0,55,35:|SETUPSP,0,9,19:|PRINTSP,0,55,40
410 b$=INKEY$: IF b$<>"" THEN 410
411 if level=3 then ink 0,13
420 IF INKEY(fr) THEN 410 ELSE MODE 0:BORDER 0:|SETUPSP,31,0,64+32+1:y=16*8:x=40:|LOCATESP,31,y,x: FOR i=0 TO 30:|SETUPSP,i,0,0:NEXT
430 IF vidas THEN CLG 12:WINDOW 3,18,1,25:CLS:WINDOW 1,20,1,25:|SETLIMITS,8,72,0,200:GOSUB 480:'game cycle

440 FOR i=1 TO 500:NEXT
441 |PEEK,42542,@puntos:if puntos<=HISCORE then 450
442 |POKE,42540,PUNTOS:hiscore=puntos:newhs=1

'443 if vidas then 450
'444 BORDER 0:CLG 12:c$="CONGRATULATIONS. NEW HISCORE!":|PRINTAT,0,120,14,@c$:newhs=0
'445 b$=INKEY$: IF b$<>"" THEN 445


450 IF level=4 then gosub 5000:level=0
451 if vidas THEN 390
460 RUN
480 '--LEVEL CONFIG
490 |SETLIMITS,0,80,0,200:|SETUPSP,0,9,16
510 FOR i=1 TO vidas:|PRINTSP,0,12+i*20,2:NEXT
521 c$="FASE":|PRINTAT,0,144,0,@c$
522 c$=str$(level+1):|PRINTAT,0,154,0,@c$
530 |SETLIMITS,8,72,0,200
531 evdir=0:|PEEK,42550+level*6,@evdir
532 lbm=0:|PEEK,42552+level*6,@lbm
533 lem=0:|PEEK,42554+level*6,@lem
534 Nbanda= level*8+16
540 |UMAP,lbm,lem,0,9999,0,99
541 m=0:if mid then |PEEK,(42568+level*4+2),@m:|PEEK,42568+level*4,@evdir
541 m=0:if mid then |PEEK,(42574+level*4+2),@m:|PEEK,42574+level*4,@evdir
542 nextm=m
550 |MAP2SP,3:|MAP2SP,m,0:|PRINTSPALL,0,0,1,0:|COLSP,32,0,22:|AUTOALL,1
560 puntos$=STR$(puntos):|PRINTAT,0,8,4-tabu,@puntos$
579 evtipo=0
580 nextm=0:|PEEK,evdir,@nextm
580 |PEEK,evdir,@nextm
590 scroll =0:modo=0:c=3:' c=3 para que no coincidan los disp enemigos con los eventos basados en m
600 banda=0:muertos=0:j=0:enesp=0:k=0
610 |MUSIC,0,0,2,6
620 GOSUB 2190:a=TIME
630 '-- GAME CYCLE

640 c=c+1

'650 '--FPS COMPUTO
660 IF (c AND 7) THEN 710
660 IF (c AND 7) THEN 720

'670 b=TIME: IF b>a THEN fps=7*3000/(b-a):f1=fps/10:f2=1+fps MOD 10: C$=STR$(F1)+"."+RIGHT$(STR$(f2),1):|PRINTAT,0,195,-2,@c$:u=fre(" "):if a <9999 then a=TIME else gosub 2190:a=time
680 GOSUB 1990:'creacion de disp enemigo
690 IF banda THEN IF c AND 15 THEN 740 ELSE GOSUB 1880:GOTO 740
'700 '-- control de eventos basados en m (m es la posicion del mapa) 3*8=24. la resolucion es salto m = 24 (cada 8 ciclos)

'710 IF m AND 7 THEN 740  finalmnete he decidido ahorrar esto pues el siguiente if pesa similar (algo mas pero se ejecuta siempre pues m va de 3 en 3 )
720 IF m=nextm THEN GOSUB 1500 :'ejecucion del evento
'730 '-- CONTROLES .UP es el mas complejo
740 IF INKEY(up) THEN 840 ELSE IF y THEN 750 ELSE 880
750 t=1:IF y>120 THEN 820
'760 'con scroll si y =120
770 IF scroll THEN 820
'780 'con scroll

790 IF modo THEN IF x>31 THEN IF x<42 THEN m=m+3:|MAP2SP,m,0:|MOVERALL,3,0:GOTO 880
790 IF modo THEN IF x>31 THEN IF x<42 THEN m=m+3:call &6499,m,0:call &76f0,3,0:GOTO 880

800 |MOVER,31,-3,0:|COLSP,31:IF col=32 THEN m=m+3:|Map2sp,m,0:|moverall,3,0:GOTO 880 ELSE |mover,31,3,0:GOTO 880
800 Call &753e,31,-3,0:call &73ac,31:IF col=32 THEN m=m+3:call &6499,m,0:call &76f0,3,0:GOTO 880 ELSE call &753e,31,3,0:GOTO 880
800 Call &753e,31,-3,0:call &73ac,31:IF col>22 THEN m=m+3:call &6499,m,0:call &76f0,3,0:GOTO 880 ELSE call &753e,31,3,0:GOTO 880

'810 'sin scroll
820 IF modo THEN IF x>31 THEN IF x<42 THEN y=y-2:GOTO 880 
830 |MOVER,31,-2,0:|COLSP,31:IF col=32 THEN y=y-2:GOTO 880 ELSE |MOVER,31,2,0:GOTO 880
830 |MOVER,31,-2,0:|COLSP,31:IF col>22 THEN y=y-2:GOTO 880 ELSE |MOVER,31,2,0:GOTO 880
830 call &753e,31,-2,0:call &73ac,31:IF col=32 THEN y=y-2:GOTO 880 ELSE call &753e,31,2,0:GOTO 880
830 call &753e,31,-2,0:call &73ac,31:IF col>22 THEN y=y-2:GOTO 880 ELSE call &753e,31,2,0:GOTO 880
840 IF INKEY(dw) THEN 880 
850 t=2:IF modo THEN IF y <180 THEN IF x>31 AND x<42 THEN y=y+2: GOTO 880 ELSE |MOVER,31,2,0:|COLSP,31:IF col=32 THEN y=y+2:GOTO 880 ELSE |MOVER,31,-2,0:GOTO 880
850 t=2:IF modo THEN IF y <180 THEN IF x>31 AND x<42 THEN y=y+2: GOTO 880 ELSE call &753e,31,2,0:call &73ac,31:IF col=32 THEN y=y+2:GOTO 880 ELSE call &753e,31,-2,0:GOTO 880
850 t=2:IF modo THEN IF y <180 THEN IF x>31 AND x<42 THEN y=y+2: GOTO 880 ELSE call &753e,31,2,0:call &73ac,31:IF col>22 THEN y=y+2:GOTO 880 ELSE call &753e,31,-2,0:GOTO 880
860 IF y<180 THEN |MOVER,31,2,0:|COLSP,31: IF col=32 THEN y=y+2 ELSE |MOVER,31,-2,0
860 IF y<180 THEN call &753e,31,2,0:call &73ac,31: IF col=32 THEN y=y+2 ELSE |MOVER,31,-2,0
860 IF y<180 THEN call &753e,31,2,0:call &73ac,31: IF col>22 THEN y=y+2 ELSE |MOVER,31,-2,0
'870 'dere e izq no necesitan corregir el mover pues despues hay un locate
880 IF INKEY(der) THEN 910 ELSE t=t+3:IF x < 65 THEN 890 ELSE 960
890 IF modo THEN IF x>31 THEN IF x<41 THEN x=x+1:GOTO 960
900 |MOVER,31,0,1: |COLSP,31: IF col=32 THEN x=x+1:GOTO 960 ELSE 960
900 call &753e,31,0,1:call &73ac,31: IF col=32 THEN x=x+1:GOTO 960 ELSE 960
900 call &753e,31,0,1:call &73ac,31: IF col>22 THEN x=x+1:GOTO 960 ELSE 960
910 IF INKEY(iz) THEN 950 ELSE t=t+6:IF x>8 THEN 920 ELSE 950

920 IF modo THEN IF x>33 THEN IF x<42 THEN x=x-1:GOTO 960

930 |MOVER,31,0,-1:|COLSP,31: IF col=32 THEN x=x-1
930 call &753e,31,0,-1:call &73ac,31: IF col=32 THEN x=x-1
930 call &753e,31,0,-1:call &73ac,31: IF col>22 THEN x=x-1
'940 '-- DIR computation
950 IF t THEN 960 ELSE 1070
960 dif=dir-po(t):t=0
'961 locate 1,12:print dif
970 IF dif THEN 980 ELSE 1040
980 IF dif<0 THEN IF dif<-8 THEN dir=dir-1:GOTO 1010 ELSE dir=dir+1:GOTO 1020
990 IF dif>8 THEN dir=1+dir AND 15:GOTO 1020
1000 dir=dir-1
1010 dir=dir AND 15
1020 |SETUPSP,31,7,seq(dir)
1020 call &7101,31,7,seq(dir)
'1030 '-- ANIMA & LOCATE JOE
'1040 |ANIMA,31
1040 CALL &6FCC,31
'1050 |LOCATESP,31,y,x 
1050 CALL &6C71,31,y,x
'1060 '-- FIRE CONTROL
1070 IF INKEY(fr) THEN IF pres THEN pres=0:bomb=0:GOTO 1160 ELSE 1160
1080 IF pres THEN bomb=bomb+1:IF bomb<8 THEN 1160 ELSE 1430
1090 dis= 23 + dis MOD 6
'1100 '-- FIRE CREACION
1110 |SETUPSP,dis,15,dir
1110 call &7101,dis,15,dir
1120 |LOCATESP,dis,y+4,x+2
1120 call &6c71,dis,y+4,x+2
1130 |SETUPSP,dis,0,233
1130 call &7101,dis,0,233
1140 pres=1

'1150 '-- MODOS 0=normal, 1=puente
1160 |AUTOALL:IF modo THEN 1200
1160 call &71d2:IF modo THEN 1200
'1170 '-- modo 0 normal
1180 |PRINTSPALL:GOTO 1230
1180 call &62a1:GOTO 1230
'1190 '-- modo 1 puente
1200 IF m>pfin1 THEN |SETLIMITS,8,72,0,m+p2 ELSE |SETLIMITS,8,72,m+p1,200
1200 IF m>pfin1 THEN call &6870,8,72,0,m+p2 ELSE call &6870,8,72,m+p1,200
1210 |PRINTSP,31:|SETLIMITS,8,72,0,200:|PRINTSPALL
1210 call &6c94,31:call &6870,8,72,0,200:call &62a1
'1220 '-- RUTINA COLISION
1230 IF c AND 1 THEN |COLSPALL:IF cor=32 THEN 640 ELSE ELSE cor=32:GOTO 640
1230 IF c AND 1 THEN call &75b1:IF cor=32 THEN 640 ELSE ELSE cor=32:GOTO 640
1240 IF cor=31 THEN 1360 ELSE IF cor<29 THEN |SETUPSP,cor,0,69:|SETUPSP,cor,7,9:'fire
1240 IF cor=31 THEN 1360 ELSE IF cor<29 THEN call &7101,cor,0,69:call &7101,cor,7,9:'fire
1250 IF col<15 THEN 640 :'disparo a decorado (<11) o disp (<15)
'1260 'si es soldado (tiene ruta) hay que poner animacion 15
1270 puntos=puntos+5:IF puntos=pot THEN tabu=tabu+2:pot=pot*10
1280 puntos$=STR$(puntos):|PRINTAT,0,8,4-tabu,@puntos$
1280 puntos$=STR$(puntos):call &6064,0,8,4-tabu,@puntos$
1290 IF PEEK(dirsp(col))<128 THEN 1320
1300 |SETUPSP,col,7,15:|SETUPSP,col,0,85:IF banda THEN muertos=muertos+1 : IF muertos=Nbanda THEN level=level+1:|POKE, 42542,PUNTOS:RETURN
1300 call &7101,col,7,15:call &7101,col,0,85:IF banda THEN muertos=muertos+1 : IF muertos=Nbanda THEN level=level+1:call &6944,42542,PUNTOS:mid=0:RETURN
1310 GOTO 640
1320 IF cor<29 THEN enecount(col-15)=enecount(col-15)-1:IF enecount(col-15) THEN 640
1330 |SETUPSP,col,7,10
1330 call &7101,col,7,10
1340 |SETUPSP,col,0,85
1340 call &7101,col,0,85
1350 GOTO 640
1360 IF col<11 THEN 640
'1370 '-- muerte joe 
1380 IF inmune THEN 640
1381 |SETUPSP,col,0,65
1390 vidas=vidas-1:|MUSIC:|SETUPSP,31,0,64:FOR i=y TO y+25: SOUND 1,i*5,5,14
1400 BORDER 7: |AUTOALL:|PRINTSPALL:|SETLIMITS,8,72,y,y+25:|PRINTSP,31,i,x:|SETLIMITS,8,72,0,200:NEXT
1401 |POKE,42542,PUNTOS:
1402 if m>800 then mid=1 
1403 RETURN
'1410 GOTO 640
'1420 '-- RUTINA BOMBA
1430 j=29 + j MOD 2: IF PEEK(dirsp(j)) THEN 1160
1440 |SETUPSP,j,15,16
1440 call &7101,j,15,16
1450 |LOCATESP,j,y,x+1
1450 call &6c71,j,y,x+1
1460 |SETUPSP,j,0,128+64+8+1+16:'no colisionador
1460  call &7101,j,0,128+64+8+1+16
1460 |SETUPSP,j,0,217:'no colisionador
1460 call &7101,j,0,217
1470 bomb=0
1480 GOTO 1160

1490 '-- EVENT ROUTINE
1500 |PEEK,evdir+2,@evtipo: ON evtipo GOTO 1530,1570,1600,1620,1880,1790,1650
'1510 ' puente(1), finpuente(2),ink(3),finalscroll(4),banda(5),fijo (6),movil notransp (7)
'1520 '-- tipo 1 evento puente
1530 modo=1:|SETUPSP,31,0,64: 
1540 pini=0:|PEEK,evdir+4,@pini:pfin1=pini+44:pfin2=pfin1+80:p2=-pfin1+112:p1=-pini+120:
1550 evdir=evdir +6:GOTO 1760
'1560 '-- tipo 2 evento fin de puente
1570 IF y=120 THEN |SETLIMITS,8,72,0,200:|SETUPSP,31,0,64+32+1:modo=0: evdir=evdir +4:GOTO 1760
1580 RETURN
'1590 '-- tipo 3 evento ink
1600 tinta=0:|PEEK,evdir+4,@tinta:INK 1,tinta: evdir=evdir +6:GOTO 1760
'1610 '-- tipo 4 evento finscroll
1620 scroll=1:|MAP2SP,2:|MAP2SP,m,0:evdir=evdir +4:
1630 GOTO 1760
'1640 '-- tipo 7 evento enemigo movil nazi
1650 enesq=0:|PEEK,evdir+4,@enesq:'macroseq
1650 enesq=0:call &6931,evdir+4,@enesq:'macroseq
1660 eney=0:enex=0:|PEEK,evdir+6,@eney:|PEEK,evdir+8,@enex:
1660 eney=0:enex=0:call &6931,evdir+6,@eney:call &6931,evdir+8,@enex:
1670 ener=0:|PEEK,evdir+10,@ener:'ruta
1670 ener=0:call &6931,evdir+10,@ener:'ruta
1680 tr=0:|PEEK,evdir+12,@tr:'transp
1680 tr=0:call &6931,evdir+12,@tr:'transp
1690 enesp=15+ enesp MOD 8 :'8 ene del 15 al 22
1700 |SETUPSP,enesp,5,1:|SETUPSP,enesp,7,enesq:
1700 call &7101,enesp,5,1:call &7101,enesp,7,enesq:
1710 |LOCATESP,enesp,eney,enex
1710 call &6c71,enesp,eney,enex
1720 |SETUPSP,enesp,0,159+tr
1720 call &7101,enesp,0,159+tr
1730 |SETUPSP,enesp,15,ener
1730 call &7101,enesp,15,ener
1740 evdir=evdir+14
'1750 '-- fin evento y prepara siguiente
1760 |PEEK,evdir,@nextm
1760 call &6931,evdir,@nextm
1770 RETURN
'1780 '-- tipo 6 evento enemigo fijo 
1790 eneim=0:|PEEK,evdir+4,@eneim:'imagen
1800 enesp=15+ enesp MOD 8:'8 enemigos del 15 al 22
1810 |PEEK,evdir+6,@enecount(enesp-15):'disparos para morir
1820 eney=0:enex=0:|PEEK,evdir+8,@eney:|PEEK,evdir+10,@enex
1830 |SETUPSP,enesp,9,eneim
1840 |LOCATESP,enesp,eney,enex
1850 |SETUPSP,enesp,0,1+16+64+2
1860 evdir=evdir+12:GOTO 1760
'1870 '-- tipo 5 banda
1880 IF banda=0 THEN FOR i=15 TO 22:|SETUPSP,i,0,0:NEXT: rb=26: muertos=0:m=m+1
1890 IF banda> Nbanda-1 THEN RETURN ELSE IF banda-muertos =8 THEN RETURN 
1900 enesp=15+ enesp MOD 8:'8 enemigos del 15 al 22
1910 IF PEEK (dirsp(enesp)) THEN RETURN ELSE banda=banda+1
1920 |SETUPSP,enesp,5,1:|SETUPSP,enesp,7,32
1920 call &7101,enesp,5,1:call &7101,enesp,7,32
1930 |LOCATESP,enesp,0,40
1930 call &6c71,enesp,0,40
1940 |SETUPSP,enesp,0,223
1940 call &7101,enesp,0,223
1950 rb= rb+1:IF rb=31 THEN rb=26
1960 |SETUPSP,enesp,15,rb
1960 call &7101,enesp,15,rb
1970 RETURN:'no cambio evdir



'1980 '-- rutina disp enemigo. disparos del 11 al 14 
1990 k=11+ k MOD 4
2000 IF PEEK(dirsp(k)) THEN RETURN
2010 enek=15+ enek MOD 8: direk=dirsp(enek)
2020 IF PEEK(direk) THEN 2030 ELSE RETURN
2030 |PEEK, direk+1,@yene:xene=PEEK(direk+3)
2030 call &6931, direk+1,@yene:xene=PEEK(direk+3)
2040 |SETUPSP,k,0,128+64+8+2+1
2040 call &7101,k,0,203
2050 |LOCATESP,k,yene,xene:offr=31
2050 call &6c71,k,yene,xene:offr=31
2060 IF x<xene THEN offr=offr+8:IF y<yene THEN offr=offr+4 ELSE ELSE IF y>yene THEN offr=offr+4
2070 rk=1 +rk MOD 4
2080 |SETUPSP,k,15,offr+rk
2080 call &7101,k,15,offr+rk
2090 RETURN


2120 '-- BEGIN PALETA
2130 INK 0,12:INK 1,13:INK 2,15:INK 3,15:INK 4,24:INK 5,24:INK 6,21:INK 7,21
2140 INK 8,9:INK 9,9:INK 10,2:INK 11,2:INK 12,0:INK 13,0:INK 14,3:INK 15,3 
2150 INK 1,13: PEN 4
2160 RETURN
2170 END
'2180 '-- reset timer
2190 IF model=6128 THEN POKE &B8B4,0: POKE &B8B5,0: POKE &B8B6,0: POKE &B8B7,0:RETURN
2200 IF model=464 THEN POKE &B187,0: POKE &B188,0: POKE &B189,0: POKE &B18a,0:RETURN
5000 '-- mission complete
5010 |MUSIC:mode 1:ink 0,0:ink 1,24: pen 1: ink 2,15:pen 2: ink 3,22
5020 LOCATE 13,1:print "CONGRATULATIONS !":pen 1
5025 LOCATE 2,5:print "YOU HAVE DESTROYED THE NEW WORLD ORDER"
5030 LOCATE 7,7:print "THANKS FOR PROTECT FREEDOM"
5040 LOCATE 10,9:print "NO POPULATION REDUCTION"
5050 LOCATE 13,10:print "NO MIND CONTROL"
5051 pen 3:LOCATE 1,11:print "Sleeping well,no bad dreams,no paranoia"
5060 for i=1 to 640 step 30:plot i,150,2:draw -320-640+i*4,0:next: plot 0,150:draw 640,150
5061 k=0:for i=150 to 0 step -1:k=k+10:i=i-k:plot 0,i:draw 640,i:next
5062 |SETUPSP,0,9,20:|SETUPSP,0,0,1:|PRINTSP,0,98,36
5063 |MUSIC,0,0,0,6
5065 for i=1 to 10000:next
5070 IF INKEY(fr) then 5070:else mode 0: gosub 2130:clg 12:return

