10 clear:MEMORY 10999
15 DEFINT A-Z
16 i=fre(" ")
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
172 HISCORE=0:|peek,42542,@HISCORE:c$=STR$(HISCORE):|PRINTAT,0,136,56,@c$
173 |SETUPSP,0,9,18:|PRINTSP,0,90,57:|SETUPSP,0,9,19:|PRINTSP,0,90,62

180 INK 0,0: INK 15,24:INK 10,13:|SETUPSP,0,9,17
190 col=32:cor=32:|COLSPALL,@cor,@col
200 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT

300 INK 0,0: INK 15,24:INK 10,13:|SETUPSP,0,9,17:|SETUPSP, 0,15,48:|SETUPSP, 0,0,1+8+128:|LOCATESP,0,74,10
310 |MUSIC,0,0,0,6: FOR i=1 TO 300:NEXT

320 b$=INKEY$: IF b$<>"" THEN 320
330 |PRINTSPALL,0,0,0,1:|AUTOALL,1
340 b$=INKEY$:IF b$="" THEN 330
341 if b$=" " then poke 42546,0:up=67:fr=47:der=27:dw=69:iz=34:goto 350
342 if b$="X" then poke 42546,1:up=72:fr=76:der=75:dw=73:iz=74:goto 350
343 goto 330


350 '-- GAME LOGIC
360 |MUSIC:vidas=5:level=0:PAPER 0:CLS:GOSUB 2130
361 mid=0:|POKE,42548,mid: 'mitad de nivel. 
370 puntos=0:newhs=0
371 poke 42547,0:'inmunidad
372 level=0
380 |SETUPSP,31,0,64+32+1:y=16*8:|LOCATESP,31,y,x:dir=0:|SETUPSP,31,7,1
381 |poke,42540,puntos:poke 42545,vidas:poke 42544,level
390 |MUSIC,0,0,1,6
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
441 |PEEK,42540,@puntos:if puntos<=HISCORE then 443
442 |POKE,42542,PUNTOS:hiscore=puntos:newhs=1
443 level=peek(42544):vidas=peek(42545)
450 IF level=4 then gosub 5000:level=0
451 if vidas THEN 380
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
541 m=0:|PEEK,42548,@mid:if mid then |PEEK,(42568+level*4+2),@m:|PEEK,42568+level*4,@evdir
541 m=0:|PEEK,42548,@mid:if mid then |PEEK,(42574+level*4+2),@m:|PEEK,42574+level*4,@evdir:' en version c esta linea sobra
550 |MAP2SP,3:|MAP2SP,m,0:|PRINTSPALL,0,0,1,0:|COLSP,32,0,22:|AUTOALL,1
610 |MUSIC,0,0,2,6



630 call &3388:return

2120 '-- BEGIN PALETA
2130 INK 0,12:INK 1,13:INK 2,15:INK 3,15:INK 4,24:INK 5,24:INK 6,21:INK 7,21
2140 INK 8,9:INK 9,9:INK 10,2:INK 11,2:INK 12,0:INK 13,0:INK 14,3:INK 15,3 
2150 INK 1,13: PEN 4
2160 RETURN

5000 '-- mission complete
5010 |MUSIC:mode 1:ink 0,0:ink 1,24: pen 1: ink 2,15:pen 2: ink 3,22
5020 LOCATE 13,1:print "CONGRATULATIONS !":pen 1
5025 LOCATE 2,5:print "YOU HAVE DESTROYED THE NEW WORLD ORDER"
5030 LOCATE 7,7:print "THANKS FOR PROTECT FREEDOM"
5040 LOCATE 10,9:print "NO POPULATION REDUCTION"
5050 LOCATE 13,10:print "NO MIND CONTROL"
5051 pen 3:LOCATE 1,11:print "Sleeping well,no bad dreams,no paranoia"
'5011 for i=1 to 640 step 30:plot i,150,2:draw -320-640+i*4,400:next
5060 for i=1 to 640 step 30:plot i,150,2:draw -320-640+i*4,0:next: plot 0,150:draw 640,150
5061 k=0:for i=150 to 0 step -1:k=k+10:i=i-k:plot 0,i:draw 640,i:next
5062 |SETUPSP,0,9,20:|SETUPSP,0,0,1:|PRINTSP,0,98,36
5063 |MUSIC,0,0,0,6
5065 for i=1 to 10000:next
5070 IF INKEY(fr) then 5070:else mode 0: gosub 2130:clg 12:return

