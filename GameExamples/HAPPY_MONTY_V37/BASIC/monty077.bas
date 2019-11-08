10 MEMORY 19999
40 CALL &6B78:|3D,0:|MUSICOFF
41 if peek(&a435)>0 then 50
42 poke &a435,1:|MUSIC,0,6
'42 poke &a435,1:clear:load "monty.bin",20000:CALL &6B78:|3D,0:|MUSICOFF:|MUSIC,0,6
43 if inkey(47)=0 then 50
44 CALL &BD19:GOTO 43
50 DEFINT A-Z:MODE 0:CALL &bc02
51 ent 1,10,-100,3
52 |MUSICOFF
53 if peek(&39)=57 then model=464 else model=6128

60 DIM sptype(31):DIM spx(31):DIM spy(31):DIM sps(31):DIM spr(31)
70 DIM dirsp(33):DIM dirspr(32):FOR sp=0 TO 31:dirsp(sp)=27000+16*sp:dirspr(sp)=27015+16*sp:NEXT
80 DIM corz(6):DIM corx(6): FOR i=0 TO 5:corz(i)=32:corx(i)=32:NEXT:'32 es inocuo pues tiene dirsp=@kk
81 highp%=0:|peek,42038,@highp%:'max score
90 kk=0:dirsp(32)=@kk:'kk es util
91 music=1
100 mx(0)=0:my(0)=0
110 my(1)=0:mx(1)=1:my(2)=0:mx(2)=1:mx(5)=0:my(5)=0:mx(6)=0:my(6)=0:mx(3)=0:my(3)=2:mx(4)=0:my(4)=2:mx(7)=0:my(7)=0:mx(8)=0:my(8)=0
120 vidas=5
130 gosub 1405:'paleta aliens

141 '-- presentacion
142 gosub 3000
143 GOSUB 1420:'paleta
150 '-- LOGICA PRINCIPAL
160 level=0: lastlevel=-1
170 WHILE (vidas>0)
180 IF lastlevel<>level THEN FOR i=0 TO 9:oro(i)=0:NEXT:lastlevel=level: ink 5,5
190 MODE 0
191 alienpal=level mod 10:'paleta de aliens
192 if level=25 then gosub 4000:vidas=0:goto 210
200 bonus=990:GOSUB 910:'build & paint level 
201 if level=0 then locate 6,2:pen 14:print CHR$(22)+CHR$(1);"HAPPY MONTY";CHR$(22);CHR$(0)

203 GOSUB 230:'marcadores

204 lastlevel=level:gosub 280:'run
210 WEND
211 if highp<puntos then highp=puntos:|POKE,42038,highp else 220
212 mode 0: c$="CONGRATULATIONS !":|PRINTAT,0,100,22,@c$
213 c$="NEW HIGH SCORE"+STR$(highp):|PRINTAT,0,116,22,@c$:gosub 3100
214 CALL &BB18
220 RUN
229'--- marcadores
230 |SETUPSP,15,9, 16:FOR i=1 TO vidas:|PRINTSP,15,161,i*5:NEXT
231 if music=1 then d$="ON " else d$="OFF"
232 c$="MUSIC:"+d$:|PRINTAT,0,24*8,0,@c$
240 c$="LEVEL:"+STR$(level):|PRINTAT,0,24*8,28,@c$:c$="FPS:--.-":|PRINTAT,0,24*8,60,@c$
250 c$="SCORE:   HIGH:   BONUS:":|PRINTAT,0,168,32,@c$
251 c$=STR$(puntos):|PRINTAT,0,176,32,@c$:c$=STR$(bonus)+" ":|PRINTAT,0,176,66,@c$:c$=STR$(highp):|PRINTAT,0,176,50,@c$
252 plot 204,24,15:draw 374,24:draw 374,0:draw 204,0:draw 204,24:plot 208,26,4:draw 376,26:draw 376,2

260 RETURN 
280 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:|PRINTSPALL,0,0,1,0:'reset
290 GOSUB 1250:' setup ene,inv,oro y EXIT
300 col=0:|COLAY,@col,31:cor=0:cod=0:|COLSPALL,@cor,@cod
310 |COLSP,34,2,0:|COLSP,32,0,5:|COLSP,31,@cod
320 |LOCATESP,31,y,x:|SETUPSP,31,0,128+32+8+4+1
330 r=0:|SETUPSP,31,15,r
350 if music then |MUSIC,0,6
360 sptype(31)=128:'monty no es un inv. vale cualquier valor
370 tr(0)=-1:tr(1)=5:tr(2)=5:tr(3)=7:tr(4)=7:tr(5)=1:tr(6)=1:tr(7)=3:tr(8)=3:'tareas inversas de rutas para reaccion rapida
380 task=0:c=0
390 gosub 1700:'timer reset

400 '--- ciclo de juego
410 c=c+1:|AUTOALL,1:|PRINTSPALL:|COLSPALL:IF cor=32 THEN 500
410 c=c+1:CALL &719c,1:CALL &62Be:CALL &756f:IF cor=32 THEN 500


430 spt=sptype(cor):rsp=PEEK(dirspr(cod)):IF rsp>14 THEN 460


440 if rsp<12 then IF spt=5 then |SETUPSP,cod,15,rsp+3:corx(cod)=cor:POKE dirsp(corz(cod)),32:POKE dirsp(cor),0:GOTO 480:else 452:'x
440 if rsp<12 then IF spt=5 then call &70cb,cod,15,rsp+3:corx(cod)=cor:POKE dirsp(corz(cod)),32:POKE dirsp(cor),0:GOTO 480:else 452:'x

450 IF spt=4 THEN |SETUPSP,cod,15,rsp-3:corz(cod)=cor:POKE dirsp(corx(cod)),32:POKE dirsp(cor),0:GOTO 480:'z
450 IF spt=4 THEN call &70cb,cod,15,rsp-3:corz(cod)=cor:POKE dirsp(corx(cod)),32:POKE dirsp(cor),0:GOTO 480:'z


451 IF spt=13 THEN |MOVER,cod,0,-1:|PRINTSP,cod:|SETUPSP,cod,15,rsp+6:|MOVER,cod,-2,1:|SETUPSP,cod,7,alienV2(alienpal):|SETUPSP,cor,15,21:GOTO 480:else 474:'l
451 IF spt=13 THEN call &74fc,cod,0,-1:call &6c9f,cod:call &70cb,cod,15,rsp+6:call &74fc,cod,-2,1:call &70cb,cod,7,alienV2(alienpal):call &70cb,cor,15,21:GOTO 480:else 474:'l

452 IF spt=11 THEN |MOVER,cod,0,1:|PRINTSP,cod:|SETUPSP,cod,15,rsp+6:|MOVER,cod,-2,1:|SETUPSP,cod,7,alienV2(alienpal):|SETUPSP,cor,15,21:GOTO 480:'j
452 IF spt=11 THEN call &74fc,cod,0,1:call &6c9f,cod:call &70cb,cod,15,rsp+6:call &74fc,cod,-2,1:call &70cb,cod,7,alienV2(alienpal):call &70cb,cor,15,21:GOTO 480:'j

'colision con 31 o con nodo a ignorar (poniendo 141)
453 goto 474


460 if rsp<18 then IF spt=7 THEN |SETUPSP,cod,15,rsp+3:corx(cod)=cor:POKE dirsp(corz(cod)),32:POKE dirsp(cor),0:GOTO 480:else 473'w
470 IF spt=6 THEN |SETUPSP,cod,15,rsp-3:corz(cod)=cor:POKE dirsp(corx(cod)),32:POKE dirsp(cor),0:GOTO 480:'q

460 if rsp<18 then IF spt=7 THEN call &70cb,cod,15,rsp+3:corx(cod)=cor:POKE dirsp(corz(cod)),32:POKE dirsp(cor),0:GOTO 480:else 473'w
470 IF spt=6 THEN call &70cb,cod,15,rsp-3:corz(cod)=cor:POKE dirsp(corx(cod)),32:POKE dirsp(cor),0:GOTO 480:'q


471 IF spt=10 THEN |SETUPSP,cod,15,rsp-9:|SETUPSP,cod,7,alienH1(alienpal):|MOVER,cod,2,-1:|SETUPSP,cor,15,21:GOTO 475:else 474'i
471 IF spt=10 THEN call &70cb,cod,15,rsp-9:call &70cb,cod,7,alienH1(alienpal):call &74fc,cod,2,-1:call &70cb,cor,15,21:GOTO 475:else 474'i

473 IF spt=12 THEN |SETUPSP,cod,15,rsp-3:|SETUPSP,cod,7,alienH1(alienpal):|MOVER,cod,2,-1:|SETUPSP,cor,15,21:goto 475: 'k
473 IF spt=12 THEN call &70cb,cod,15,rsp-3:call &70cb,cod,7,alienH1(alienpal):call &74fc,cod,2,-1:call &70cb,cor,15,21:goto 475: 'k


474 if cor=31 then gosub 870:return
475 poke dirsp(cod),141

480 |COLSPALL,cor-1:IF cor<32 THEN 430 
480 call &756f,cor-1:IF cor<32 THEN 430 



500 IF c AND 1 THEN 520 else 620


501 '--- CICLO IMPAR
'------------------------------------------------------------------------------
520 IF INKEY(27) THEN 560 ELSE IF r=2 THEN x=x+1:goto 722 ELSE task=1:if r=1 then 530 else 710
520 IF INKEY(RI) THEN 560 ELSE IF r=2 THEN x=x+1:goto 722 ELSE task=1:if r=1 then 530 else 710

530 task=0:IF r=1 THEN r=2:|SETUPSP,31,15,2:GOTO 770
540 |SETUPSP,31,9,19:|MOVER,31,my(r),1+mx(r):|COLAY,31:IF col THEN |MOVER,31,0,-1:IF r THEN r=0:|SETUPSP,31,15,0:GOTO 410 ELSE 410
540 |SETUPSP,31,9,19:|MOVER,31,my(r),1+mx(r):|COLAY:IF col THEN |MOVER,31,0,-1:IF r THEN r=0:|SETUPSP,31,15,0:GOTO 410 ELSE 410
550 |MOVER,31,0,-1:r=1:|SETUPSP,31,15,1:vx=1:vy=0:GOTO 410 

550 r=1:|SETUPSP,31,15,22:vx=1:vy=0:GOTO 410 

'------------------------------------------------------------------------------
560 IF INKEY(34) THEN 710 ELSE IF r=6 THEN x=x-1:goto 722 ELSE task=5:if r=5 then 570 else 710
560 IF INKEY(LE) THEN 710 ELSE IF r=6 THEN x=x-1:goto 722 ELSE task=5:if r=5 then 570 else 710

570 task=0:IF r=5 THEN r=6:|SETUPSP,31,15,6:GOTO 770
580 |SETUPSP,31,9,19:|MOVER,31,my(r),-1+mx(r):|COLAY,31:IF col THEN |MOVER,31,0,1:IF r THEN r=0:|SETUPSP,31,15,0:GOTO 410 ELSE 410
580 |SETUPSP,31,9,19:|MOVER,31,my(r),-1+mx(r):|COLAY:IF col THEN |MOVER,31,0,1:IF r THEN r=0:|SETUPSP,31,15,0:GOTO 410 ELSE 410
590 r=5:|SETUPSP,31,15,5:vx=-1:vy=0:GOTO 410
'------------------------------------------------------------------------------

619' --- CICLO PAR
620 IF c mod 6 THEN 639 
621 |COLSP,32,6,14:|COLSP,31
621 call &736a,32,6,14:call &736a,31

622 IF cod=32 then |COLSP,32,0,5:goto 630
622 IF cod=32 then CALL &736a,32,0,5:goto 630


623 if cod=14 THEN |COLSP,32,0,5:goto 628:'puerta
623 if cod=14 THEN CALL &736a,32,0,5:goto 628:'puerta

624 oros=oros-1:if oros then 625 else ink 5,0:'abre puerta
625 puntos=puntos+10:|SETUPSP,cod,9,black:|PRINTSP,cod:POKE dirsp(cod),0:oro(cod-6)=1: c$=STR$(puntos):|PRINTAT,0,176,32,@c$:if (1-music) then sound 31,500,10,7,1,1
626 ors=ors+1:if ors and 7 then 627 else if vidas<5 then vidas=vidas +1:|PRINTSP,15,161,vidas*5:|PRINTSP,31: border 17:for i=1000 to 10 step -50:sound 31,i,5,7,1,1:next:border 0
627 |COLSP,31:goto 622
627 call &736a,31:goto 622




628 if oros then |PRINTSP,14:goto 630 else |MUSICOFF:for i=bonus to 0 step -10:border i and 15:sound 31,i,5,7,1,1: puntos=puntos+10:c$=STR$(puntos):|PRINTAT,0,176,32,@c$:c$=STR$(i)+" ":|PRINTAT,0,176,66,@c$:next
629 border 0:level=level+1:return

'------------------------------------------------------------------------------
630 IF INKEY(38) THEN 633
631 IF music THEN |MUSICOFF:music=0:d$="OFF" ELSE music=1:|MUSIC,0,6:d$="ON "
632 c$="MUSIC:"+d$:|PRINTAT,0,24*8,0,@c$

633 if c and 63 then 639
633 if c and 31 then 639
634 bonus=bonus-10:c$=STR$(bonus)+" ":|PRINTAT,0,176,66,@c$: IF bonus THEN 635 else gosub 870:RETURN
635 if c>100 then print c :fps=10*c*300/(TIME-A):f1=fps/10:f2=fps mod 10:C$=STR$(F1)+"."+right$(str$(f2),1):|PRINTAT,0,24*8,67,@c$: gosub 1700:c=0
635 if c>100 then fps=10*c*300/(TIME-A):f1=fps/10:f2=fps mod 10:C$=STR$(F1)+"."+right$(str$(f2),1):|PRINTAT,0,24*8,67,@c$: gosub 1700:c=0
'------------------------------------------------------------------------------
639 IF INKEY(67) THEN 670 ELSE IF r=8 THEN y=y-2:goto 732 ELSE task=7:if r=7 then 640 else 710
639 IF INKEY(UP) THEN 670 ELSE IF r=8 THEN y=y-2:goto 732 ELSE task=7:if r=7 then 640 else 710
640 task=0:IF r=7 THEN r=8:|SETUPSP,31,15,8:GOTO 770 
650 |SETUPSP,31,9,19:|MOVER,31,-2+my(r),mx(r):|COLAY,31:|MOVER,31,2,0:IF col THEN IF r THEN r=0:|SETUPSP,31,15,0:GOTO 410 ELSE 410
650 |SETUPSP,31,9,19:|MOVER,31,-2+my(r),mx(r):|COLAY:|MOVER,31,2,0:IF col THEN IF r THEN r=0:|SETUPSP,31,15,0:GOTO 410 ELSE 410
660 IF y THEN r=7:|SETUPSP,31,15,7:vy=-2:vx=0:GOTO 410 ELSE IF r THEN r=0:|SETUPSP,31,15,0:GOTO 410 ELSE 410
'------------------------------------------------------------------------------


670 IF INKEY(69) THEN 710 ELSE IF r=4 THEN y=y+2: goto 732 ELSE task=3:if r=3 then 680 else 710
670 IF INKEY(DW) THEN 710 ELSE IF r=4 THEN y=y+2: goto 732 ELSE task=3:if r=3 then 680 else 710
680 task=0:IF r=3 THEN r=4:|SETUPSP,31,15,4:GOTO 770
690 |SETUPSP,31,9,19:|MOVER,31,2+my(r),mx(r):|COLAY,31:|MOVER,31,-2,0:IF col THEN IF r THEN r=0:|SETUPSP,31,15,0:GOTO 410 ELSE 410
690 |SETUPSP,31,9,19:|MOVER,31,2+my(r),mx(r):|COLAY:|MOVER,31,-2,0:IF col THEN IF r THEN r=0:|SETUPSP,31,15,0:GOTO 410 ELSE 410
700 r=3:|SETUPSP,31,15,3:vy=2:vx=0:GOTO 410

690 |SETUPSP,31,9,19:|MOVER,31,2+my(r),mx(r):|COLAY,31:IF col THEN |MOVER,31,-2,0:IF r THEN r=0:|SETUPSP,31,15,0:GOTO 410 ELSE 410
690 |SETUPSP,31,9,19:|MOVER,31,2+my(r),mx(r):|COLAY:IF col THEN |MOVER,31,-2,0:IF r THEN r=0:|SETUPSP,31,15,0:GOTO 410 ELSE 410
700 r=3:|SETUPSP,31,15,23:vy=2:vx=0:GOTO 410
'------------------------------------------------------------------------------



710 if r then 711 else if task then 711 else 410

710 if r or task then 711 else 410

711 IF task=tr(r) THEN 790 :'fast response



720 IF vx THEN 721 else 730:'asi puedo ir directo a 721 desde controles
721 x=PEEK(27499)+mx(r)
722 IF x AND 3 THEN 410 ELSE 760
730 if vy then 731 else 760:'asi puedo ir directo a 731 desde controles
731 y=PEEK(27497)+my(r)
732 IF y AND 15 THEN 410 


740 IF y THEN 760:'y>0
750 IF vy<0 THEN |MOVER,31,my(r),mx(r):task=0:vy=0:IF r THEN r=0:|SETUPSP,31,15,0:GOTO 410 ELSE 410
760 IF task THEN 790
770 CALL &750A,31,vy,vx:CALL &71DC,31:CALL &750A,31,-vy,-vx:IF col THEN CALL &750A,31,my(r),mx(r):r=0:|SETUPSP,31,15,0

770 CALL &750A,31,vy,vx:CALL &71DC,31:IF col THEN CALL &750A,31,my(r)-vy,mx(r)-vx:r=0:|SETUPSP,31,15,0 else CALL &750A,31,-vy,-vx

770 CALL &750B,31,vy,vx:CALL &71D8:IF col THEN CALL &750B,31,my(r)-vy,mx(r)-vx:r=0:|SETUPSP,31,15,0 else CALL &750B,31,-vy,-vx
770 CALL &7509,31,vy,vx:CALL &71D8:IF col THEN CALL &7509,31,my(r)-vy,mx(r)-vx:r=0:|SETUPSP,31,15,0 else CALL &750B,31,-vy,-vx

770 CALL &7509,31,vy,vx:CALL &71D8:IF col THEN CALL &7509,31,my(r)-vy,mx(r)-vx:r=0:|SETUPSP,31,15,0 else CALL &7509,31,-vy,-vx

770 |MOVER,31,vy,vx:|COLAY:IF col THEN |MOVER,31,my(r)-vy,mx(r)-vx:r=0:|SETUPSP,31,15,0 else |MOVER,31,-vy,-vx
770 call &74fc,31,vy,vx:call &71cb:IF col THEN call &74fc,31,my(r)-vy,mx(r)-vx:r=0:|SETUPSP,31,15,0 else call &74fc,31,-vy,-vx


780 GOTO 410
790 IF task>3 THEN 810
800 IF task=1 THEN 530 ELSE 680
810 IF task=5 THEN 570 ELSE 640
820 END:'aqui nunca llegamos
870 '--- rutina muerte
880 c$="GRONF!":|PRINTAT,0,y-8,x-4,@c$
881 |MUSICOFF:FOR j=0 TO 7:BORDER 7:FOR i=1 TO 100:NEXT:BORDER 0:FOR k=1 TO 100:NEXT:SOUND 31,j*200,10,7:NEXT:vidas=vidas-1:RETURN

910 ' -- LEVEL BUILDER
920 IF level <39 THEN GOSUB 1360:'juego de bloques 1
930 dir=level*160+20000:
940 c$="AAAAAAAAAAAAAAAAAAAA"
950 |LAYOUT,20,0,@c$
960 |LAYOUT,1,0,@c$
961 for i=0 to 30:sptype(i)=0:next:|LOCATESP,14,0,100:'exit fuera de la pantalla
970 fil=0:e=0:inv=18:oro=6
980 FOR i =dir TO dir+160-16 STEP 16
990 c$="BB":d$="AA"
1000 FOR j= i TO i+15:' 16 bloques
1010 a=PEEK(j):ch$=chr$(a)
1020 IF a<=90 THEN 1150:' A..Z
1030 IF ch$> "o" THEN 1090 else if ch$>"g" then 1074

1031 if ch$>"d" then 1071

1040 IF ch$="a" THEN a=32:sptype(e)=1:spx(e)=4*(j+2-i):spy(e)=8*fil:sps(e)=128+8+4+2+1:spr(e)=9:e=e+1:GOTO 1150:'ene
1050 IF ch$="b" THEN a=32:sptype(e)=1:spx(e)=4*(j+2-i):spy(e)=8*fil:sps(e)=128+8+4+2+1:spr(e)=10:e=e+1:GOTO 1150:'ene
1060 IF ch$="c" THEN a=32:sptype(e)=2:spx(e)=4*(j+2-i):spy(e)=8*fil:sps(e)=128+8+4+2+1:spr(e)=11:e=e+1:GOTO 1150:'ene
1070 IF ch$="d" THEN a=32:sptype(e)=3:spx(e)=4*(j+2-i):spy(e)=8*fil:sps(e)=128+8+4+2+1:spr(e)=16:e=e+1:GOTO 1150:'ene

1071 IF ch$="e" THEN a=32:sptype(e)=1:spx(e)=4*(j+2-i):spy(e)=8*fil:sps(e)=128+8+4+2+1:spr(e)=12:e=e+1:GOTO 1150:'ene
1072 IF ch$="f" THEN a=32:sptype(e)=1:spx(e)=4*(j+2-i):spy(e)=8*fil:sps(e)=128+8+4+2+1:spr(e)=13:e=e+1:GOTO 1150:'ene
1073 IF ch$="g" THEN a=32:sptype(e)=2:spx(e)=4*(j+2-i):spy(e)=8*fil:sps(e)=128+8+4+2+1:spr(e)=14:e=e+1:GOTO 1150:'ene
1074 if ch$>"j" then 1078
1075 IF ch$="h" THEN a=32:sptype(e)=3:spx(e)=4*(j+2-i):spy(e)=8*fil:sps(e)=128+8+4+2+1:spr(e)=19:e=e+1:GOTO 1150:'ene

1076 IF ch$="i" THEN a=32:sptype(inv)=10:spx(inv)=4*(j+2-i):spy(inv)=8*fil+2:sps(inv)=32:spr(inv)=0:inv=inv+1:GOTO 1150:'codo
1077 IF ch$="j" THEN a=32:sptype(inv)=11:spx(inv)=4*(j+2-i)-1:spy(inv)=8*fil:sps(inv)=32:spr(inv)=0:inv=inv+1:GOTO 1150:'codo
1078 IF ch$="k" THEN a=32:sptype(inv)=12:spx(inv)=4*(j+2-i):spy(inv)=8*fil-2:sps(inv)=32:spr(inv)=0:inv=inv+1:GOTO 1150:'codo
1079 IF ch$="l" THEN a=32:sptype(inv)=13:spx(inv)=4*(j+2-i)+1:spy(inv)=8*fil:sps(inv)=32:spr(inv)=0:inv=inv+1:GOTO 1150:'codo

1080 IF ch$="m" THEN a=32:x=4*(j+2-i):y=8*fil:GOTO 1150:'pos monty

1081 IF ch$="o" THEN a=32:sptype(oro)=8:spx(oro)=4*(j+2-i):spy(oro)=8*fil:sps(oro)=2:spr(oro)=0:oro=oro+1:GOTO 1150:'oro
1090 IF ch$="q" THEN a=32:sptype(inv)=6:spx(inv)=4*(j+2-i):spy(inv)=8*fil:sps(inv)=32:spr(inv)=0:inv=inv+1:GOTO 1150:'inv q
1110 IF ch$="x" THEN a=32:sptype(inv)=5:spx(inv)=4*(j+2-i)+2:spy(inv)=8*fil:sps(inv)=32:spr(inv)=0:inv=inv+1:GOTO 1150:'inv x
1120 IF ch$="v" THEN a=32:sptype(14)=9:spx(14)=4*(j+2-i):spy(14)=8*fil:sps(14)=2:spr(14)=0:GOTO 1150:'exit
1130 IF ch$="w" THEN a=32:sptype(inv)=7:spx(inv)=4*(j+2-i):spy(inv)=8*fil+8:sps(inv)=32:spr(inv)=0:inv=inv+1:GOTO 1150:'inv w
1140 IF ch$="z" THEN a=32:sptype(inv)=4:spx(inv)=4*(j+2-i):spy(inv)=8*fil:sps(inv)=32:spr(inv)=0:inv=inv+1:GOTO 1150:'inv Z
1150 c$=c$+chr$(a)



1160 IF CHR$(a)<>" " THEN d$=d$+"A" ELSE d$=d$+" "
1170 NEXT j
1180 c$=c$+"BB":d$=d$+"AA"
1190 |LAYOUT,fil+1,0,@d$
1200 |LAYOUT,fil,0,@c$
1210 fil=fil+2
1220 NEXT i
1240 RETURN
1250 'setup ene, inv, oro, exit 
1260 oros=0:FOR i=0 TO 30
1270 IF sptype(i)<>0 THEN |SETUPSP,i,0,sps(i):|SETUPSP,i,15,spr(i):|LOCATESP,i,spy(i),spx(i) else |SETUPSP,i,0,0
1280 IF sptype(i)=4 OR sptype(i)=5 THEN |SETUPSP,i,9,33:goto 1350:'inv hor
1290 IF sptype(i)=6 OR sptype(i)=7 THEN |SETUPSP,i,9,34:goto 1350:'inv ver
1291 IF sptype(i)>=10 and sptype(i)<=13 THEN |SETUPSP,i,9,22:goto 1350:'inv codo

1300 IF sptype(i)=1 THEN |SETUPSP,i,7,alienH1(alienpal):goto 1350:'1byte borrado
1310 IF sptype(i)=2 THEN |SETUPSP,i,7,alienH2(alienpal):goto 1350:'2 borrado
1320 IF sptype(i)=3 THEN |SETUPSP,i,7,alienV2(alienpal):goto 1350:'2 lineas
1330 IF sptype(i)=8 THEN IF oro(i-6)=0 THEN oros=oros+1:|SETUPSP,i,9,35:|PRINTSP,i:else |SETUPSP,i,0,0:goto 1350:'oro
1340 IF sptype(i)=9 and level <24 THEN |SETUPSP,i,9,36:|PRINTSP,i:'puerta sp 14
1341 IF sptype(i)=9  and level=24 THEN |SETUPSP,i,9,50:|PRINTSP,i:'puerta sp 14
1350 NEXT
1355 return

1360 '-- paleta bloques
'1370 ' A:bloque8x8 B:black C:rocas D:valla E:tierra F,G,H,I,J,K: laberinto

1380 bloque8=21:black=22:piedras=23:valla=24:tierra=25:cCD=26:cAB=27:cAC=28:cBC=29:cBD=30:cAD=31:ladrillos=17: 
1381 rampar=18:rampal=20:panal=37:ventana=38:piedras2=39:hojas=32:bola=48:rombo=49
1390 |SETUPSP,6,9,bloque8:|SETUPSP,7,9,black:|SETUPSP,8,9,piedras:|SETUPSP,9,9,valla
1400 |SETUPSP,10,9,tierra:|SETUPSP,11,9,ccd:|SETUPSP,12,9,cab:|SETUPSP,13,9,cac:|SETUPSP,14,9,cbc:|SETUPSP,15,9,cbd:|SETUPSP,16,9,cad
1401 |SETUPSP,17,9,ladrillos:|SETUPSP,18,9,hojas:|SETUPSP,19,9,rampal:|SETUPSP,20,9,rampar:|SETUPSP,21,9,panal:
1402 |SETUPSP,22,9,ventana:|SETUPSP,23,9,piedras2:|SETUPSP,24,9,bola:|SETUPSP,25,9,rombo:
1403 RETURN

1405 '--- paleta aliens (secuencias de animacion)
1406 alienH1(0)=6:alienH2(0)=7:alienV2(0)=8
1407 alienH1(1)=6:alienH2(1)=7:alienV2(1)=8
1408 alienH1(2)=9:alienH2(2)=7:alienV2(2)=8
1409 alienH1(3)=9:alienH2(3)=7:alienV2(3)=8
1410 alienH1(4)=9:alienH2(4)=7:alienV2(4)=10
1411 alienH1(5)=6:alienH2(5)=7:alienV2(5)=8
1412 alienH1(6)=6:alienH2(6)=7:alienV2(6)=8
1413 alienH1(7)=11:alienH2(7)=7:alienV2(7)=8
1414 alienH1(8)=9:alienH2(8)=7:alienV2(8)=12
1415 alienH1(9)=11:alienH2(9)=7:alienV2(9)=10
'1416 alienH1(10)=11:alienH2(10)=7:alienV2(10)=8
1419 return

1420 '---paleta
1430 INK  0 , 0 
1440 INK  1 , 13 
1450 INK  2 , 24
1460 INK  3 , 14 
1470 INK  4 , 26 
1480 INK  5 , 5 
1490 INK  6 , 6 
1500 INK  7 , 9 
1510 INK  8 , 21 
1520 INK  9 , 2 
1530 INK  10 , 24 
1540 INK  11 , 3 
1550 INK  12 , 17 
1560 INK  13 , 7 
1570 INK  14 , 15 
1580 INK  15 , 20 
1590 BORDER 0
1600 RETURN
1700'timer reset
1710 if (model=6128) then POKE &B8B4,0:POKE &B8B5,0:POKE &B8B6,0:POKE &B8B7,0:A=TIME:rem CPC 6128
1711 if (model=464) then POKE &b187,0: POKE &b188,0: POKE &b189,0: POKE &b18a,0 :' CPC 464
1720 return


3000'-- presentacion
3001 locate 5,5:pen 1:PRINT "HAPPY MONTY"
3001 locate 5,5:pen 14:PRINT "H";:pen 7:print "A";:pen 13:print "P";:pen 15:print "P";:pen 2:print "Y";:pen 1:PRINT " MONTY"
3002 c$="THIS IS A MUTANT MONTY STYLE GAME":|PRINTAT,50,6,@c$
3003 c$="CREATED IN BASIC USING 8BP":|PRINTAT,58,14,@c$
3004 c$="THE INITIAL LEVEL IS A TRIBUTE TO ":|PRINTAT,66,6,@c$
3005 c$="THIS GREAT CLASSIC GAME":|PRINTAT,74,14,@c$
3006 c$="ENJOY 25 NEW LEVELS !":|PRINTAT,82,18,@c$
3007 gosub 3100
'3008 |SETUPSP,0,9,50:|PRINTSP,0,0,70
3010 call &bc02:INK 5,13:INK 0,0:INK 15,24:INK 1,14:ink 14,15
3011 UP=67:DW=69:RI=27:LE=34
3012 tag:plot -10,0,11:mover 32,9*16:print "PRESS FIRE OR SPACE";

3020 c$="HIGH SCORE "+STR$(highp):|PRINTAT,0,176,30,@c$
3030 |SETUPSP,1,9,43:|PRINTSP,1,166,0:|PRINTSP,1,166,8:|SETUPSP,1,9,44:|PRINTSP,1,166,4
3040 |SETUPSP,1,9,45:|PRINTSP,1,166,12:|SETUPSP,1,9,46:|PRINTSP,1,166,16:|SETUPSP,1,9,47:|PRINTSP,1,166,20
'3050 c$="HTTPS://AUAMSTRAD.ES":|PRINTAT,192,0,@c$
3060 c$="JJGA":|PRINTAT,182,70,@c$
3070 c$="2019":|PRINTAT,192,70,@c$
3080 |SETUPSP,0,9,42:|PRINTSP,0,162,68
3081 |MUSIC,0,6
3082 for i=0 to 7:|SETUPSP,i,7,1:|SETUPSP,i,0,129:|SETUPSP,i,15,2:|LOCATESP,i,140,76-i*10:next:i=0:|PRINTSPALL,0,0,1,1
3083 |PRINTSPALL:|AUTOALL,1
'3085 d=27003+i*16:if peek (d)>80 then |poke,d,-4:i=i+1:i=i and 7
3085 if peek (dirsp(i)+3)>80 then |poke,dirsp(i)+3,-4:i=i+1:i=i and 7
3091 if inkey(47)=0 then UP=67:DW=69:RI=27:LE=34: goto 3094
3092 if inkey(76)=0 then UP=72:DW=73:RI=75:LE=74: goto 3094
3093 goto 3083
3094 |MUSICOFF:cls:gosub 1420:return
3100 b$=inkey$: if b$<>"" goto 3100
3110 return

4000' fin del juego
4010 mode 0:|MUSICOFF:FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:|MUSIC,1,6:gosub 1420
4030 |SETUPSP,30,9,50:|LOCATESP,30,84,70:|SETUPSP,30,0,9:|SETUPSP,30,5,0,-1
4040 |SETUPSP,31,7,1:|SETUPSP,31,0,128+8+4+1:|LOCATESP,31,92,0:|SETUPSP,31,15,2
4041 tagoff:locate 3,18:pen 3:print "CONGRATULATIONS!"
4042 c$="NOW YOU HAVE MONEY TO MARRY":|PRINTAT,0,20,120,14,@c$
4043 tag:plot -10,0,13:mover 32,5*16:print "PRESS FIRE OR SPACE";:gosub 3100:tagoff
4044 c=0:sp=0
4045 |SETUPSP,0,9,48
4046 for x=0 to 80 step 8:|PRINTSP,0,170,x:|PRINTSP,0,180,x+4:next

4060 for i=0 to 32:|AUTOALL,1:|PRINTSPALL,0,0,1,1:next:|SETUPSP,30,0,0:|SETUPSP,31,0,5
4062 c=c+1:|AUTOALL,1:|PRINTSPALL,0,0,1,1: |STARS,0,20,8,1,0
4063 if c and 15 then 4070
4064 sp=1+sp and 7:|LOCATESP,sp,70,38:|SETUPSP,sp,0,128+8+1:|SETUPSP,sp,15,24:|SETUPSP,sp,9,52: if sp=7 then sp=0
4070 if c>200 then if inkey(47)=0 or inkey (76)=0 then |MUSICOFF:return else 4062
4080 goto 4062