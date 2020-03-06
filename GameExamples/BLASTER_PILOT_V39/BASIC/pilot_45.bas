10 MEMORY 21999
20 ON BREAK GOSUB 40
30 GOTO 50
40 |MUSIC: END
50 CALL &6B78
60 ENV 1,15,-1,1  
70 ENT 1,10,10,2 
80 FOR i=42540 TO 42619 STEP 2: POKE i,RND*200:POKE i+1,16+RND*80:NEXT
90 DEFINT a-z
100 |MUSIC
110 IF PEEK(&39)=57 THEN model=464 ELSE model=6128
111 if peek (41480)>0 then 120 else |MUSIC,0,0,0,6
112 if inkey(47)+inkey(76)=-2 then 112 else poke 41480,1:|MUSIC
120 DIM vx(12):DIM vy(12)
130 '--- INICIALIZACIONES ---

140 'velocidades de scroll segun imagen nave v(img)
150 vx(0)=0:vy(0)=2:vx(1)=-1:vy(1)=2:vx(2)=-1:vy(2)=1:vx(3)=-1:vy(3)=0
160 vx(4)=-1:vy(4)=-1:vx(5)=-1:vy(5)=-2:vx(6)=0:vy(6)=-2:vx(7)=1:vy(7)=-2
170 vx(8)=1:vy(8)=-1:vx(9)=1:vy(9)=0:vx(10)=1:vy(10)=1:vx(11)=1:vy(11)=2

180 DIM ex(12):DIM ey(12):'posiciones de enemigos segun direccion (=imagen) nave
190 ex(0)=44:ex(1)=80:ex(2)=80:ex(3)=80:ex(9)=4:ex(10)=4:ex(11)=4
200 ex(6)=44:ex(5)=80:ex(4)=80:ex(8)=4:ex(7)=4
210 ey(0)=-24:ey(1)=0:ey(2)=50:ey(3)=94:ey(9)=94:ey(10)=50:ey(11)=0
220 ey(6)=200:ey(5)=200:ey(4)=144:ey(8)=144:ey(7)=200


250 'secuencias de tipos de enemigo
260 seq(0)=12:seq(1)=13:seq(2)=14:seq(3)=16:seq(4)=18
270 'teclas->tarea->imagen target 
280 DIM target(12):target(1)=3:target(5)=1:target(4)=0:target(8)=6:target(2)=9:target(6)=11:target(10)=7:target(9)=5
290 ' direcciones sprites
300 DIM dirsp(31): FOR i=0 TO 30:dirsp(i)=27000+i*16:NEXT
310 py=0:px=0:'posicion de un enemigo para reubicar
320 ' --- nautas en cada nivel (y,x). el mundo mide ( -524 ,-600)hasta (575,600)
330 DIM naut[6*6]:'6 levels, 6 datos
340 l=0:naut[l*6+0]=100:naut[l*6+1]=160:naut[l*6+2]=220:naut[l*6+3]=-60:naut[l*6+4]=-90:naut[l*6+5]=-40:'level 0
350 l=1:naut[l*6+0]=400:naut[l*6+1]=200:naut[l*6+2]=300:naut[l*6+3]=250:naut[l*6+4]=-300:naut[l*6+5]=-300:'level 1
351 l=2:naut[l*6+0]=400:naut[l*6+1]=200:naut[l*6+2]=300:naut[l*6+3]=-400:naut[l*6+4]=0:naut[l*6+5]=-100:'level 2
352 l=3:naut[l*6+0]=400:naut[l*6+1]=400:naut[l*6+2]=50:naut[l*6+3]=50:naut[l*6+4]=-200:naut[l*6+5]=-200:'level 3
353 l=4:naut[l*6+0]=400:naut[l*6+1]=200:naut[l*6+2]=50:naut[l*6+3]=-300:naut[l*6+4]=-200:naut[l*6+5]=-400:'level 4
355 l=5:naut[l*6+0]=-500:naut[l*6+1]=-500:naut[l*6+2]=550:naut[l*6+3]=0:naut[l*6+4]=-300:naut[l*6+5]=550:'level 5

360 ' enemigos en cada nivel, a partir de 23000
370 DIM ene(5*2*32):n0=&59D8:'enemigos de los 5 niveles a partir de 23000
370 DIM ene(5*2*32):n0=&55f0:'enemigos de los 5 niveles a partir de 22000
380 GOSUB 1680: MODE 0: GOSUB 1740:MODE 0: BORDER 0
390 FOR j=0 TO 31:|SETUPSP,j,0,0:NEXT:|3D,0:|PRINTSPALL,0,0,1,0:'reset sprites
391 |COLSP,34,2,2
400 |SETUPSP,31,9,16:|LOCATESP,31,94,38+8:|SETUPSP,31,0,33:'nave
410 img=0: x=80:y=200:cy=vy(img):cx=vx(img)
420 cor=0:cod=0:|COLSPALL,@cor,@cod: x=80:y=200
430 GOSUB 1380:'time reset
460 '--- BUCLE PRINCIPAL ---
470 lives=3:level=0:sxa=0:sya=0
'470 lives=3:level=2:sxa=0:sya=0:input level
479 nautas=3:nauts(0)=1:nauts(1)=1:nauts(2)=1:' status 8,9 y 10. es la tinta
480 mode 0:|SETUPSP,0,9,42:|PRINTSP,0,30,24:|PRINTSP,0,160,40:|PRINTSP,0,50,65:sx=sxa:sy=sya and 254
481 cad$="READY LEVEL "+str$(level):gosub 1420:yt=0:|PRINTAT,1,80,34,@cad$:' paint marcadores
482 |STARS,0,10,4,4,0:|STARS,10,10,8,2,0:|STARS,20,10,1,1,0
483 if inkey(FR) then 482
484 window 5,20,1,25:paper 0:cls:window 1,20,1,25
485 if level<2 then interval=15 else interval=7
486 seq(0)=12:if level>4 then seq(0)=15
490 GOSUB 570:|MUSIC:IF lives=0 THEN 5280
500 IF nautas>0 THEN 480:'nos han matado
501 sxa=0:sya=0:'next level
503 gosub 2000:'bonus
510 if level<5 then level=level+1:nauts(0)=1:nauts(1)=1:nauts(2)=1 else IF lives=0 THEN 5280 else 503:' status 8,9 y 10. es la tinta
530 GOTO 479
560 '--- END BUCLE PPAL ---
570 '---  INIT JUEGO ---
590 |MAP2SP,1:temp=14 :'tiempo de vida
591 FOR j=0 TO 30:|SETUPSP,j,0,0:NEXT:'reset
600 |SETUPSP,20,0,16:|LOCATESP,20,0,0:'sprite virtual para poscion nave
601 ' imagenes de disparos
602 FOR i=26 TO 30:|SETUPSP,i,9,30: |SETUPSP,i-5,9,32:NEXT:f=25

610 ' creacion nautas
620 FOR i=8 TO 10: |SETUPSP,i,0,128+8+21+2:|LOCATESP,i,naut[level*6+(i-8)*2],naut[level*6+(i-8)*2+1]:|SETUPSP,i,7,11:|SETUPSP,i,15,12:
630 nauty(i-8)=110- naut[level*6+(i-8)*2]/10
640 nautx(i-8)=60+naut[level*6+(i-8)*2+1]/10
641 if nauts(i-8)=0 then |SETUPSP,i,0,0
650 NEXT
660 j=0:FOR d=n0 +level*64 TO n0+(level+1)*64:ene(j)=PEEK(d): j=j+1:NEXT
670 FOR i=11 TO 19:|SETUPSP,i,0,0:NEXT:'reset enemigos
680 cod=32:cor=32:|SETUPSP,31,9,16:|LOCATESP,31,94,38+8:|SETUPSP,31,0,1+32:img=0:cy=vy(0):cx=vx(0):'nave
690 |MUSIC,1,0,0,6:mus=1:'start music
691 |MOVERALL,sya,sxa
700 |MAP2SP,y,x:GOTO 1190:'paint scanner

710 ' --- ciclo de juego ---
720 c=c+1
730 x=x-cx:y=y+cy+cy
740 IF c AND 1 THEN 800 ELSE t=0
750 IF x<=0 THEN x=80+x:GOTO 780:' scroll H ctrl
760 IF x>159 THEN x=x-80

780 IF INKEY(RI) THEN 790 ELSE t=1:GOTO 920
790 IF INKEY(LE) THEN 920 ELSE t=2:GOTO 920

800 IF y<4 THEN y=200+y:GOTO 820:' scroll V ctrl
810 IF y>396 THEN y=y-200

820 IF INKEY(UP) THEN 830 ELSE t=t+4:GOTO 840
830 IF INKEY(DW) THEN 840 ELSE t=t+8
840 IF t THEN 860 ELSE 920

850 '--seleccion de imagen y velocidad ---
860 it=target(t)-img:IF it THEN 870 ELSE 920
870 IF it>0 THEN IF it<6 THEN img=img+1:GOTO 890 ELSE img=img+11:GOTO 890
880 IF it<-6 THEN img=img+1 ELSE img=img+11
890 img=img MOD 12:|SETUPSP,31,9,16+img
890 img=img MOD 12:call &70f4,31,9,16+img

900 cy=vy(img):cx=vx(img)
910 ' --- disparos nave ---
920 IF INKEY(FR) THEN 990 
930 IF PEEK(dirsp(f+1)) THEN 990
940 f=f+1:|SETUPSP,f,15,img:|SETUPSP,f,0,169:|LOCATESP,f,100,48:|ROUTESP,f
940 f=f+1:call &70f4,f,15,img:call &70f4,f,0,169:call &6c71,f,100,48:call &6606,f

950 f2=f-5:|SETUPSP,f2,15,img:|SETUPSP,f2,0,137:|LOCATESP,f2,100,48
950 f2=f-5:call &70f4,f2,15,img:call &70f4,f2,0,137:call &6c71,f2,100,48

960 SOUND 4,100,15,10,,1
970 IF f=30 THEN f=25

980 '--- scroll,colisions,print
990 |MAP2SP,y,x:|STARS,0,5,2,cy,cx
990 CALL &64A8,y,x:call &742f,0,5,2,cy,cx
990 CALL &64A8,y,x
1000 CALL &71c5,1:CALL &62BC:CALL &75a4
1000 |AUTOALL,1:|PRINTSPALL:|COLSPALL
1000 CALL &71c5,1:CALL &62BC:CALL &75a4
1009'--- rutina colisiones
1010 IF cod<11 THEN IF cor=31 THEN |SETUPSP,cod,7,17:SOUND 4,0,15,15,,1:pts=pts+100:c$=STR$(pts):|PRINTAT,0,72,2,@c$:nauts(cod-8)=0:GOSUB 1630:IF nautas =0 THEN 1790 ELSE GOTO 1030 ELSE GOTO 1030:' naut
1020 IF cod<19 THEN |SETUPSP,cod,7,9:|SETUPSP,cod,0,5:IF cor<31 THEN |SETUPSP,cor,0,0:SOUND 4,0,15,15,,1:pts=pts+10:c$=STR$(pts):|PRINTAT,0,72,2,@c$ ELSE 1320:'ene

1030 |MOVERALL,cy,cx
1030 CALL &76e3,cy,cx

1040 '--- creacion de enemigos y scanner ---
1050 IF c AND interval THEN 1140
1060 e=11+ e MOD 8:d=dirsp(e):IF PEEK(d) THEN 1140:' el candidato esta vivo

1070 '--- hay que crear enemigo
1080 lt=lt+1:lt=lt MOD 32:indx=lt*2:IF ene(indx)=0 THEN 1181
1090 tipo=ene(indx+1)
1100 p=p+1:p=p AND 3:img2=img-1+p:IF img2>12 THEN img2=img2-12 ELSE IF img2<0 THEN img2=12+img2:'p es una entre 4 posiciones (0,1,2,3)
1110 posex=ex(img2):posey=ey(img2):' posicion depende de la imagen nave con 4 variaciones. hay 12 posiciones posibles

1130 |LOCATESP,e,ey(img2),ex(img2):|SETUPSP,e,7,seq(ene(indx+1)):|SETUPSP,e,0,159:|SETUPSP,e,15,13+tipo*12+img:GOTO 1181
1130 call &6c71,e,ey(img2),ex(img2):call &70f4,e,7,seq(ene(indx+1)):call &70f4,e,0,159:call &70f4,e,15,13+tipo*12+img:GOTO 1181

1139 '-- llegamos aqui si el sprite esta vivo o si no toca
1140 if c and 15 then 720
1141 |PEEK,d+1,@py:IF py<-20 THEN |POKE,d,0:GOTO 1181
1150 IF py>220 THEN |POKE,d,0:GOTO 1181
1160 |PEEK,d+3,@px:IF px>100 THEN |POKE,d,0:GOTO 1181
1170 IF px<0 THEN |POKE,d,0


1180 '-- paint scanner ---
1181 |STARS,10,10,1,0,0 :if c and 31 then 720
1181 call &742f,10,10,1,0,0 :if c and 31 then 720
1190 |PEEK,27321,@sy:|PEEK,27323,@sx:'nave
1200 PLOT nautx(0),nauty(0),nauts(0)
1210 PLOT nautx(1),nauty(1),nauts(1)
1220 PLOT nautx(2),nauty(2),nauts(2)

1230 IF sx <-524 THEN sx=-524 ELSE IF sx>574 THEN sx=574
1240 IF sy>600 THEN sy=600 ELSE IF sy<-600 THEN sy=-600
1250 PLOT dx,dy,0:dx=64-sx/10:dy=100+sy/10:PLOT dx,dy,4
1260 IF INKEY(38) THEN 1290
1270 IF mus THEN |MUSIC:mus=0 ELSE mus=1:|MUSIC,1,0,0,6
1280 '--- tiempo ---
1290 IF c AND 127 THEN 720
1300 temp=temp-1: IF temp THEN |SETLIMITS,0,80,0,199:|SETUPSP,0,9,36:|PRINTSP,0,107,temp:|SETLIMITS,16,80,0,199 ELSE 1320:'muerte
1310 GOTO 720
1320 goto 1030:'inmunidad
1320 j=0:'---muerte
1330 |MUSIC:|SETUPSP,31,7,9:|SETUPSP,31,0,5:|LOCATESP,31,94,44
1340 FOR i=0 TO 11:|SETUPSP,i,9,42:|SETUPSP,i,15,i:|SETUPSP,i,0,128+8+1:|LOCATESP,i,100,48:|ROUTESP,i,4:NEXT
1350 FOR i=12 TO 23:|SETUPSP,i,9,41:|SETUPSP,i,15,i-12:|SETUPSP,i,0,128+8+1:|LOCATESP,i,100,48:NEXT
1351 sxa=sx:sya=sy

1360 FOR i=0 TO 40:|PRINTSPALL:|AUTOALL,1:SOUND 4,i,3,14,,1:NEXT
1370 lives=lives-1:RETURN :'GOTO 1230
1380 '--- timer reset
1390 IF (model=6128) THEN POKE &B8B4,0:POKE &B8B5,0:POKE &B8B6,0:POKE &B8B7,0:A=TIME:REM CPC 6128
1400 IF (model=464) THEN POKE &B187,0: POKE &B188,0: POKE &B189,0: POKE &B18A,0 :' CPC 464
1410 RETURN
1420 '---marcadores
1430 WINDOW 1,4,1,25: PAPER 12: CLS:WINDOW 1,40,1,25
1440 PLOT 4,170,4:DRAW 116,170:DRAW 116,186:DRAW 4,186:DRAW 4,170:'caja tiempo
1450 FOR i=8 TO 114 STEP 2: PLOT i,172,9:DRAW i,184:NEXT:'fill tiempo
1460 c$="BLASTER":|PRINTAT,1,20,1,@c$
1470 c$="PILOT":|PRINTAT,1,26,3,@c$
1480 PLOT 0,340,14:DRAW 60,324:DRAW 124,340
1490 PLOT 0,338,8:DRAW 60,322:DRAW 124,338
1500 FOR i=100 TO 156:PLOT 4,i*2,0:DRAW 116,i*2:NEXT
1510 PLOT 4,312,7:DRAW 4,200:DRAW 116,200,5
1520 PLOT 15*8+4,0,7:DRAW 15*8+4,400
1521 c$=STR$(pts):|PRINTAT,0,72,2,@c$
1530 |SETLIMITS,0,80,0,200:
1530 |SETLIMITS,0,80,0,199

1540 |SETUPSP,0,9,16:FOR i=1 TO lives:|PRINTSP,0,54,i*4-2:NEXT
1541 c$="LEVEL"+str$(level):|PRINTAT,0,45,1,@c$
1550 |SETUPSP,0,9,33:|SETUPSP,0,0,65:|PRINTSP,0,183,2
1560 |SETUPSP,0,0,65:|SETUPSP,0,9,34:|PRINTSP,0,4,2:|SETUPSP,0,9,35:|PRINTSP,0,4,8:'alas
1570 FOR i=20 TO 80:PLOT 4,i*2,0:DRAW 116,i*2:NEXT

1580 |SETUPSP,0,9,46:|SETUPSP,0,0,1:FOR i=1 TO 3:|PRINTSP,0,82,i*4-2:NEXT:'nautas
1590 |SETUPSP,0,9,45::FOR i=1 TO 3-nautas:|PRINTSP,0,82,i*4-2:NEXT:'nautas
1600 |SETLIMITS,16,80,0,199
1610 RETURN
1620 ' rutina nautas color
1630 |SETLIMITS,0,80,0,200
1640 |SETUPSP,0,9,45:|SETUPSP,0,0,1:|PRINTSP,0,82,(4-nautas)*4-2
1650 nautas=nautas-1
1660 |SETLIMITS,16,80,0,199
1661 if temp<11 then temp=temp+3
1670 RETURN
1680 '---presentacion
1690 MODE 0: CALL &BC02: border 0
1692 gosub 1740:ink 1,0:ink 2,14

1694 c$="SPONSORED BY:":|PRINTAT,0,170,0,@c$:|SETLIMITS,0,80,0,200
1694 c$="SPONSORED BY AUA":|PRINTAT,0,170,0,@c$:|SETLIMITS,0,80,0,200
1696 c$="AUAMSTRAD.ES":|PRINTAT,0,177,0,@c$

1697 c$="JJGA":|PRINTAT,0,185,70,@c$:c$="2020":|PRINTAT,0,192,70,@c$
1698 |SETLIMITS,0,80,8,165
1698 |SETUPSP,1,9,47:|PRINTSP,1,180,2
1698 |SETUPSP,31,9,33:|PRINTSP,31,165,68
'1699 |SETUPSP,31,9,47:|PRINTSP,31,165,2
1700 tag:plot -10,0,12:move 4*32+4,396:print "BLASTER PILOT";:tagoff:pen 10:LOCATE 5,1:PRINT chr$(22);chr$(1);"BLASTER PILOT";chr$(22);chr$(0)
1701 c$="A GAME MADE IN BASIC WITH 8BP":|PRINTAT,0,16,10,@c$
1702 c$="8BP: THE ULTIMATE RSX FOR GAMES":|PRINTAT,0,23,8,@c$
1703 c$="SAVE THE 3 ASTRONAUTS AT EACH LEVEL":|PRINTAT,1,36,4,@c$
1704 c$="TAKE CARE OF FUEL AND LOOK THE RADAR!":|PRINTAT,1,43,2,@c$

1705 |SETUPSP,31,7,11:|LOCATESP,31,120,65:|SETUPSP,31,0,128+8+4+3:|SETUPSP,31,15,12
1706 |SETUPSP,30,7,19:|LOCATESP,30,120,15:|SETUPSP,30,0,128+8+4+3:|SETUPSP,30,15,12
1707 c$="GRAPHICS, CODE, MUSIC: JJGA":|PRINTAT,1,53,16,@c$:c$="ON GAME MUSIC THEME: BITCAFFE":|PRINTAT,1,60,14,@c$

1708 c$="PRESS SPACE ":|PRINTAT,0,186,30,@c$
1709 c$="  OR FIRE":|PRINTAT,0,193,30,@c$
1710 |SETUPSP,1,9,42:|PRINTSP,1,100,65:|PRINTSP,1,85,5:|PRINTSP,1,115,10: plot 194,250,8:draw 464,250:draw 466,80:draw 194,80,14:draw 194,248
1711 gosub 4500
1712 FOR y=0 TO 9: |PRINTAT,0,(y+10)*8,25,@name$(y):c$=STR$(scr(y)):|PRINTAT,0,(y+10)*8,45,@c$:NEXT:|MUSIC,0,0,1,6:'start music


1713 |STARS,0,20,3,2,0:|STARS,20,20,11,1,0
1714 |AUTOALL,1:|PRINTSPALL,0,0,1,0
1720 K=INKEY(47):J=INKEY(76): IF k+j=-2 THEN 1713 ELSE IF K=0 THEN GOSUB 4000 ELSE GOSUB 4100
1721 |SETLIMITS,16,80,0,200:|STARS,0,40,0,20,20:|MUSIC
1730 RETURN
1740 'paleta
1750 INK  0 , 0:INK  1 , 11 :INK  2 , 20 :INK  3 , 20 :INK  4 , 26 :INK  5 , 26 :INK  6 , 13 
1760 INK  7 , 13 :INK  8 , 15 :INK  9 , 15 :INK  10 , 8 :INK  11 , 8 :INK  12 , 4 
1770 INK  13 , 4 :INK  14 , 6 :INK  15 , 6 
1780 RETURN
1790 '--- LEVEL COMPLETE---
1791 |MUSIC:locate 11,4:PEN 1:print "LEVEL":locate 9,5:print "COMPLETE!"
1792 for i=0 to 100
1793 sound 1,1000-i*10,1,15
1794 border i mod 16
1795 next
1800 border 0
1810 RETURN


2000 '--- fase bonus ---
2001 'setup phase
2002 mode 0:temp=14 :'tiempo de vida

'2003 level=5
2004 ptsa=pts
2010 gosub 1420:'marcadores

2011 |SETUPSP,0,9,42:|PRINTSP,0,20,34:|PRINTSP,0,50,44:|PRINTSP,0,20,54:if level<5 then c$="PHASE BONUS " else c$="KILL THE BOSS":|SETUPSP,0,9,48:|PRINTSP,0,100,42
2012 yt=0:|PRINTAT,1,80,34,@c$
2013 |STARS,0,10,4,0,3:|STARS,10,10,8,0,2:|STARS,20,10,1,0,1
2014 if inkey(FR) then 2013
2015 window 5,20,1,25:paper 0:cls:window 1,20,1,25


2020 ' imagenes de disparos
2030 FOR i=26 TO 30:|SETUPSP,i,9,30: |SETUPSP,i-5,9,32:NEXT:f=25
2040 FOR i=0 TO 19:|SETUPSP,i,0,0:NEXT:'reset enemigos
2050 cod=32:cor=32:|SETUPSP,31,9,16:|LOCATESP,31,94,38+8:|SETUPSP,31,0,1+32:img=0:'nave
2055 e=1:cor=0:cod=0:|COLSPALL,@cor,@cod:|PRINTSPALL,0,0,1,0
2056 if level<5 then 2060
2057|SETUPSP,16,9,48:|SETUPSP,16,0,128+8+1+2:|SETUPSP,16,15,73:|locatesp,16,20,32:malo=0

2060 '--- ciclo de juego ---
2070 c=c+1
2080 IF c AND 1 THEN 2110 ELSE t=0
2090 IF INKEY(RI) THEN 2100 ELSE t=1:GOTO 2220
2100 IF INKEY(LE) THEN 2220 ELSE t=2:GOTO 2220
2110 IF INKEY(UP) THEN 2120 ELSE t=t+4:GOTO 2130
2120 IF INKEY(DW) THEN 2130 ELSE t=t+8
2130 IF t THEN 2150 ELSE 2220

2140 '--seleccion de imagen y velocidad ---
2150 it=target(t)-img:IF it THEN 2180 ELSE 2220
2180 IF it>0 THEN IF it<6 THEN img=img+1:GOTO 2200 ELSE img=img+11:GOTO 2200
2190 IF it<-6 THEN img=img+1 ELSE img=img+11
2200 img=img MOD 12:call &70f4,31,9,16+img

2210  ' --- disparos nave ---
2220 IF INKEY(FR) THEN 2290 
2230 IF PEEK(dirsp(f+1)) THEN 2290
2240 f=f+1:|SETUPSP,f,15,img:|SETUPSP,f,0,169:|LOCATESP,f,100,48:|ROUTESP,f
2250 f2=f-5:|SETUPSP,f2,15,img:|SETUPSP,f2,0,137:|LOCATESP,f2,100,48
2260 SOUND 4,100,15,10,,1
2270 IF f=30 THEN f=25

2280 '--- auto,print ,colisions
2290 CALL &71c5,1:CALL &62BC:CALL &75a4

2310 IF cod<16 THEN |SETUPSP,cod,7,9:|SETUPSP,cod,0,5:IF cor<31 THEN |SETUPSP,cor,0,0:SOUND 4,0,15,15,,1:pts=pts+10:c$=STR$(pts):|PRINTAT,0,72,2,@c$ ELSE 2371:'ene
2311 if cod=16 then border 24:malo=malo+1:sound 6,3000,5,14,,,1:border 0:if malo=10 then 3000

2320'creacion enemigos
2329 if c and 7 then 2070 else |STARS,10,10,1,0,0
2330 e=e+1:if e=19 then e=0
2330 e=1+e mod 15

2338 r=rnd*11
2339 if level<5 then |SETUPSP,e,7,12:|SETUPSP,e,0,143 else |SETUPSP,e,9,31:|SETUPSP,e,0,139
2339 if level<5 then call &70f4,e,7,12:call &70f4,e,0,143 else call &70f4,e,9,31:call &70f4,e,0,139



2340 |SETUPSP,e,15,r+13:|SETUPSP,e,0,143
2340 |SETUPSP,e,15,r+13
2340 call &70f4,e,15,r+13
2350 |LOCATESP,e,ey(r),ex(r)
2350 call &6c71,e,ey(r),ex(r)

2360 goto 2070

2371 temp=temp-1: IF temp THEN |SETLIMITS,0,80,0,200:|SETUPSP,0,9,36:|PRINTSP,0,107,temp:|SETLIMITS,16,80,0,200 ELSE 2500:'muerte
2380 goto 2070


2500 if level <5 then if ptsa<pts+200 then if lives <3 then lives=lives+1: locate 8,20: pen 3:print "EXTRA LIFE!"
2501 if level=5 then lives=lives-1
2510 goto 1792


3000'--- final ---
3001 maloy=peek (27257):malox=peek (27259):vx=-2:vy=-3
3010 for i=0 to 30
3011 vx=rnd*4-2 
3012 vy=rnd*6-3
3013 if vx=0 and vy=0 then 3011
3020 |SETUPSP,i,9,28:|SETUPSP,i,5,vy,vx:|LOCATESP,i,maloy+rnd*8,malox+rnd*6:|SETUPSP,i,0,8+1
3030 next
3040 for i=0 to 100
3050|AUTOALL:|PRINTSPALL
3051 sound 6,i*30,2,14,,,1
3060 next

'3070 goto 5280
3080 '--- fin
3090 window 5,20,1,25:cls: for i=0 to 31:|SETUPSP,i,0,0:next:c$="WELL DONE !":|PRINTAT,0,95,38,@c$
3091 for i=1 to 10 
3100 |SETUPSP,i,7,11:|SETUPSP,i,0,128+8+4+1:|SETUPSP,i,15,61:|LOCATESP,i,30,53:|ROUTESP,i,i*17:next
3101 |MUSIC,0,0,1,6
3110 |AUTOALL,1:|PRINTSPALL,0,0,1,0
3111 K=INKEY(47):J=INKEY(76): IF k+j=-2 THEN 3110 ELSE 5280
3120 goto 3110


4000'--- SET QAOP ---
4010 UP=67:LE=34:RI=27:DW=69:FR=47:RETURN
4100'---SET joy
4110 UP=72:LE=74:RI=75:DW=73:FR=76:RETURN

4500 '--- READ SCORE TABLE
4510 dir=&A3D4:FOR i=0 TO 9: name$(i)=""
4520 FOR j=dir TO dir +7
4530 letra=PEEK (j): name$(i)=name$(i)+CHR$(letra)
4540 NEXT j: dir=dir+8
4550 scr(i)=0:|PEEK,dir,@scr(i):dir=dir+2
4560 NEXT i
4570 RETURN

5280 '--- FIN JUEGO & CHECK HIGH SCORE
5290 INK 0,0:BORDER 5: INK 2,15:INK 1,20:|MUSIC
5300 j=10:FOR i=9 TO 0 STEP -1:IF pts>scr(i) THEN j=i:NEXT
5310 IF j=10 THEN RUN:'end game & start
5320 FOR i=8 TO j STEP -1:scr(i+1)=scr(i):name$(i+1)=name$(i):NEXT:'update table
5330 b$=INKEY$:IF b$<>"" THEN 5330
5340 MODE 1:BORDER 5: INK 3,8:LOCATE 6,8:PEN 3: PRINT "CONGRATULATIONS! NEW HIGH SCORE"
5350 LOCATE 14,10:PEN 2:PRINT "ENTER YOUR NAME"
5360 LOCATE 17,13:PEN 2:PRINT"--------"
5370 LOCATE 15,12:PEN 1:INPUT name$(j): name$(j)=MID$(name$(j),1,8):name$(j)=UPPER$(name$(j))
5380 scr(j)=pts
5390 '--- WRITE SCORE TABLE
5400 dir=&A3D4:FOR i=0 TO 9: k=1
5410 FOR j=dir TO dir +7
5420 dato$=MID$(name$(i),k,1): IF dato$=""  THEN dato$=" "
5430 dato=ASC(dato$)
5440 POKE j,dato:k=k+1:NEXT j
5450 dir=dir+8
5460 |POKE,dir,scr(i)
5470 dir=dir+2
5480 NEXT i
5490 LOCATE 15,23:PRINT "PRESS SPACE":RUN
5490 RUN





