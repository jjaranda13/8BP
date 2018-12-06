1 MEMORY 23999
2 ENV 1,11,-1,25:ENT 1,9,49,5,9,-10,15
10 ON BREAK GOSUB 12
11 GOTO 20
12 |MUSICOFF:CALL &BC02:PAPER 0:PEN 1:MODE 1:END
20 CALL &BC02
30 DEFINT A-Z:MODE 0
50 CALL &6B78
60 INK 0,0
61 '--- GLOBAL VARS ---
62 DIM rf(32):FOR i=0 TO 32:rf(i)=4*SIN(i*i):NEXT:'pseudoaleat
63 pie(0)=40:pie(1)=60:pie(2)=20:pie(3)=10:pie(4)=50:pie(5)=70:pie(6)=30: pie(7)=65
65 collider=32:collided=32:|COLSPALL,@collider,@collided
70 DIM pts(11): DIM name$(11):'scores
71 star=22:marcoL=26:marcoR=27:corazon=28:borra=33:coin=31
72 score=0:vidas=4:scp=10:scx=60:scm=0
73 dim r(24):for i=0 to 23: r(j)=(j+5) mod 24:j=r(j):next:'rutas estrellas
75 diry(0)=-1 :diry(1)=-1:diry(2)=-3:diry(3)=-4:diry(4)=-3:diry(5)=-1:diry(6)=-1:diry(7)=-1:'explo joe
76 dirx(0)=-3:dirx(1)=-2:dirx(2)=-1 :dirx(3)=0:dirx(4)=1:dirx(5)=2:dirx(6)=3:dirx(7)=2:'explo joe
77 rt(0)=8:rt(1)=22:rt(2)=19:rt(3)=7:rt(4)=9:rt(5)=21:rt(6)=10:rt(7)=20:rt(8)=22:rt(9)=9:'rutas piedras
80 'rutas, posiciones y pasos de naves fase 2 
81 rn1(0)=37:rnx1(0)=0:rny1(0)=0:rn2(0)=37:rnx2(0)=0:rny2(0)=0:rn3(0)=37:rnx3(0)=0:rny3(0)=0:p1(0)=40:p2(0)=20:p3(0)=0
82 rn1(1)=38:rnx1(1)=0:rny1(1)=0:rn2(1)=38:rnx2(1)=0:rny2(1)=0:rn3(1)=38:rnx3(1)=0:rny3(1)=0:p1(1)=40:p2(1)=20:p3(1)=0
83 rn1(2)=39:rnx1(2)=10:rny1(2)=80:rn2(2)=39:rnx2(2)=36:rny2(2)=80:rn3(2)=39:rnx3(2)=65:rny3(2)=80:p1(2)=0:p2(2)=0:p3(2)=0
84 rn1(3)=37:rnx1(3)=0:rny1(3)=-20:rn2(3)=38:rnx2(3)=0:rny2(3)=0:rn3(3)=37:rnx3(3)=0:rny3(3)=20:p1(3)=40:p2(3)=20:p3(3)=0
85 rn1(4)=40:rnx1(4)=120:rny1(4)=60:rn2(4)=40:rnx2(4)=120:rny2(4)=60:rn3(4)=40:rnx3(4)=120:rny3(4)=60:p1(4)=40:p2(4)=20:p3(4)=0
86 rn1(5)=41:rnx1(5)=-40:rny1(5)=60:rn2(5)=41:rnx2(5)=-40:rny2(5)=60:rn3(5)=41:rnx3(5)=-40:rny3(5)=60:p1(5)=40:p2(5)=20:p3(5)=0
87 rn1(6)=41:rnx1(6)=-40:rny1(6)=45:rn2(6)=40:rnx2(6)=120:rny2(6)=65:rn3(6)=39:rnx3(6)=36:rny3(6)=80:p1(6)=40:p2(6)=40:p3(6)=0
88 rn1(7)=42:rnx1(7)=100:rny1(7)=-20:rn2(7)=42:rnx2(7)=100:rny2(7)=-20:rn3(7)=42:rnx3(7)=100:rny3(7)=-20:p1(7)=20:p2(7)=10:p3(7)=0
90' rutas fase 3
97 ro(0)=47:ro(1)=48:ro(2)=49:ro(3)=48:ro(4)=47:ro(5)=49:ro(6)=50:ro(7)=48:ro(8)=50:ro(9)=48
98 ' --- INTRO ---
99 mode 0:|SETLIMITS,0,80,0,200:|STARS,0,20,4,1,0: c=0
100 CALL &BBE4,1,1,1,1,1
101 b$=inkey$:if b$<>"" then 101
110 TAG:PLOT 0,-10,4:MOVE 4*32,400-16:PRINT "SPACE PHANTOM";:TAGOFF
120 TAG:PLOT 0,-10,4:MOVE 0*32,400-16*3:PRINT "8BP game - JJGA 2018";:TAGOFF
130 LOCATE 5,2:PEN 10:PRINT CHR$(22)+CHR$(1);"SPACE PHANTOM";CHR$(22)+CHR$(0);
131 ink 3,11
140 LOCATE 1,4:PEN 3:PRINT CHR$(22)+CHR$(1);"8BP game - JJGA 2018";CHR$(22)+CHR$(0);
150 |3D,1,31,0:|MAP2SP,1:|SETLIMITS,0,80,0,200   
160 x=218:INK 1,15: INK 2,7
170 Y=2000:|PRINTSPALL,0,0,0
171 |MUSIC,0,6
180 |MAP2SP,Y,X:|PRINTSPALL
190 |MAP2SP,Y+5000,X:|PRINTSPALL
195 IF y<=1500 THEN INK 1,24: INK 2,13
200 y=(y-4):IF y<=1250 THEN y=2000:INK 1,15: INK 2,7
210 |STARS
211 c=c+1:if c=460 then 300
212 if inkey(47) then 220
212 b$=inkey$:if b$="" then 220
213 goto 300
220 GOTO 180

300'--- PRINT SCORE SCREEN ---
301 mode 1:|MUSICOFF:|SETLIMITS,0,80,0,200: c=0
302 gosub 500:'read scores
303 b$=inkey$:if b$<>"" then 303
311 ink 2,15:ink 3,24: ink 0,0:ink 1,24:x=14:'tintas para sprites por detras
340 PAPER 0:PEN 1:LOCATE x+1,2: PRINT "SPACE PHANTOM"
350 LOCATE 1,5:PRINT "A fully 100% BASIC game created with 8BP"    
351 LOCATE 4,4:PRINT "by Jose Javier Garcia Aranda 2018"
360 LOCATE 2,7:PRINT "8BP: The ulimate RSX library for games"
371 LOCATE 12,10:PRINT "----------------": 
371 k=70:for y=248 to 280 step 4:plot k,y,1:draw 640-k,y:k=k-8:next
372 LOCATE 15,9:PRINT " Hall of fame "
399 pen 1
380 FOR i=0 TO 9
381 LOCATE 1,i+11   
390 PRINT ,name$(i),pts(i)    
400 NEXT
401 |3D,0
402 for i=0 to 5:|SETUPSP,i,0,64+8+1:|SETUPSP,i,9,coin:|SETUPSP,i,5,2,0:|LOCATESP,i,i*30,10+i*45 mod 60
403 next: dato=0
411 c=c+1:if c =800 then for i=0 to 5:|SETUPSP,i,0,0:next:goto 98
412 b$=inkey$:if b$="" then 415 else 1000
420 |STARS,0,20,2,1,0
415 |AUTOALL:|PRINTSPALL,0,0,0
416 i=(i+1)mod 6 : diri=27000+i*16+1:|peek,diri,@dato: if dato>200 then |locatesp,i,-24,5+rnd*65
430 GOTO 411

500 '--- READ SCORE TABLE ---
501 dir=23900
501 dir=&a3d4
510 FOR i=0 TO 9: name$(i)=""
520 FOR j=dir TO dir +7
530 letra=PEEK (j): name$(i)=name$(i)+CHR$(letra)
540 NEXT j: dir=dir+8
550 pts(i)=0:|PEEK,dir,@pts(i):dir=dir+2
560 NEXT i
570 RETURN


1000 '--- LOGICA FASES ---
1001 UK=67:DK=69:LK=34:RK=27:FK=47
1002 if b$="X" THEN UK=72:DK=73:LK=74:RK=75:FK=77
1009 |3D,0:for i=0 to 31:|SETUPSP,i,0,0:next
1010 vidas=4:vivo=1:ciclo=0:|COLSP,32,27,31
1020 GOSUB 2000:'fase 1
1030 GOSUB 4000:'fase 2
1040 GOSUB 5000:'fase 3
1050 GOSUB 6000:'fin
1060 run

1500'--- LIVES CONTROL
1510 vidas=vidas -1
1520 for i=0 to 31:|SETUPSP,i,0,0:next
1521 if vidas=0 then 1700:'check new high scores
1530 return

1700'--- CHECK HIGH SCORE ----
1701 ink 0,0:border 5: ink 2,15:ink 1,20:|MUSICOFF
1710 j=10:for i=9 to 0 step -1:if score>pts(i) then j=i:next
1720 if j=10 then run:'end game & start
1730 for i=8 to j step -1:pts(i+1)=pts(i):name$(i+1)=name$(i):next:'update table
1731 b$=inkey$:if b$<>"" then 1731
1732 mode 1:border 5: ink 3,8:locate 6,8:pen 3: print "CONGRATULATIONS! NEW HIGH SCORE"
1733 |SETUPSP,0,0,1:|SETUPSP,0,9,coin:|PRINTSP,0,170,0:|PRINTSP,0,170,72
1740 locate 14,10:pen 2:PRINT "ENTER YOUR NAME"
1741 locate 17,13:PEN 2:PRINT"--------"
1742 locate 15,12:PEN 1:input name$(j): name$(j)=mid$(name$(j),1,8)
1749 pts(j)=score

1750 '--- WRITE SCORE TABLE ---
1760 dir=&a3d4:'41940
1770 FOR i=0 TO 9: k=1
1780 FOR j=dir TO dir +7:
1781 dato$=mid$(name$(i),k,1): if dato$=""  then dato$=" "
1782 dato=asc(dato$)
1785 poke j,dato:k=k+1:next j
1790 dir=dir+8
1800 |Poke,dir,pts(i)
1801 dir=dir+2
1810 NEXT i
1820 run



1999'--- fase 1 ---
2000 for i=0 to 31:|SETUPSP,i,0,0:next
2001 mode 0:ink 3,0: ink 1,20: ink 5,3:ink 6,8:ink 9,14
2002 gosub 9000:'print marcadores
2003 gosub 9100:'personaje
2004 |PRINTSP,32,1:'1bit fondo
2005 |SETUPSP,31,0,0+8+4+2+1:'fase 1 no overwrite
2006 border 0
2010 i=0:x=40:incx=-1:|AUTOALL,1:|PRINTSPALL,0,1,0:espera=ciclo
2018 |MUSIC,1,6:TR=0

2019'--- ciclo de juego ---
2020 ciclo=ciclo+1: if (ciclo> 1000) then 3000
2025 if vivo then gosub 8000 else border ciclo mod 10:timer=timer-1:if timer=0 then vivo=1: gosub 1500:goto 2000' mueve personaje
2030 |AUTOALL:|PRINTSPALL:|COLSPALL
2031 if collider =32 then 2035
2032 if collided =31 then gosub 2800 else gosub 2900
2035 IF (ciclo and 7)  THEN  2020
2036 gosub 2600:'new planet
2060 goto 2020


2499 '--- new star ---
2500 i= (i+1) and 15
2510 |SETUPSP,i,9,star:|SETUPSP,i,0,137
2520 |SETUPSP,i,15,ruta: ruta=r(ruta)
2530 |LOCATESP,i,98,40:'x
2540 return

2599'--new planet---
2600 sp=(sp+1)and 7: planet=sp+16: xp=rnd*60+10:yp=rnd*140+40:|SETUPSP,planet,7,3
2610 |SETUPSP,planet,0,139
2611 rp=(1+rp) and 3:|SETUPSP,planet,15,26+rp:|LOCATESP,planet,yp,xp
2620 IF (ciclo and 15)  THEN  2622
2621 gosub 2500
2622 if (ciclo and 63)  THEN  return
2623 if ciclo >500 then gosub 2700:'new bird
2625 return


2700 '--- new bird fase1
2701 birdsp=(birdsp+1)mod 3: bird=birdsp+24: xp=rnd*60+10:yp=rnd*140+40:|SETUPSP,bird,7,3
2702 |SETUPSP,bird,0,137:|SETUPSP,bird,15,31+RB:|LOCATESP,bird,yp,xp
2703 RB=(RB+1)AND 1
2704 return


2799 '--- muerte joe ---
2800 dircollider=27000+16*collider
'Con el truco de mirar si tiene flag de collided consigo evitar la colision incluso si el enemigo es colisionador
'De este modo puedo matar pajaros en la lejania pero no pueden matar a joe al solaparse 
'al acercase se que ese flag de collided desaparece (gracias a la ruta) y me mata al solaparse
2810 'if vidas<4 then return
2811 if peek(dircollider) and 2 then return 
2812 |SETUPSP,31,0,128+64+8+1:|SETUPSP,31,15,30:vivo=0:timer=50
2813 |MUSICOFF:SOUND 3,145,300,12,1,1,12
2814 for i=27 to 30:|SETUPSP,i,0,TR+8+1:|LOCATESP,i,y+8,x:|SETUPSP,i,9,32:NEXT
2815 |SETUPSP,27,5,3,3:|SETUPSP,28,5,3,-3:|SETUPSP,29,5,-3,3:|SETUPSP,30,5,-3,-3
2816 for i=0 to 3:|SETUPSP,i,0,TR+8+1:|LOCATESP,i,y+8,x:|SETUPSP,i,9,32:NEXT
2818 |SETUPSP,0,5,4,1:|SETUPSP,1,5,4,-1:|SETUPSP,2,5,-4,1:|SETUPSP,3,5,-4,-1
2820 return

2899 '--- muerte enemigo
2900 |SETUPSP,collider,7,6:|SETUPSP,collider,0,5+TR
2911 if collider< 24 then score=score+5 else score=score+10
2912 |SETUPSP,collided,7,7:|SETUPSP,collided,0,5+TR
2913 goto 9201




3000'--- fase 1b ---
3020 ciclo=ciclo+1: if (ciclo> 2000) goto 3800
3025 if vivo then gosub 8000 else border ciclo mod 10:timer=timer-1:if timer=0 then vivo=1: gosub 1500:goto 2000' mueve personaje
3030 |AUTOALL:|PRINTSPALL:|COLSPALL
3031 if collider =32 then 3033
3032 if collided =31 then gosub 2800 else gosub 2900
3033 if (ciclo and 15)  THEN  3040
3034 gosub 3700:'new bird
3040 IF (ciclo and 15) THEN  3020
3041 gosub 2500:'new star
3060 if (ciclo and 7) then 3020
3060 goto 3020


3700 'new bird fase 1b
3701 sp=(sp+1)and 7: birdsp=sp+16:xp=rnd*60+10:yp=rnd*140+40:|SETUPSP,birdsp,7,3
3702 |SETUPSP,birdsp,0,137:|SETUPSP,birdsp,15,31+RB:|LOCATESP,birdsp,yp,xp
3703 RB=(RB+1)AND 3
3704 return

3710'--- muerte jefe fase 1---
3711 score=score+5:jefe=jefe-1:|SETUPSP,collided,7,7:|SETUPSP,collided,0,5+TR:if jefe >0 then 3833 
3712 |SETUPSP,collider,0,0:|SETUPSP,31,5,0,0
3713 |MUSICOFF:i=0
3715 FOR d=27000 TO 27256 STEP 16 
3716 POKE d,9:|SETUPSP,i,9,35:'fragment
3719 |SETUPSP,i,5,rf(i),rf(i+1)/2
3720 |POKE,d+1,ye+12+rf(i+3):|POKE,d+3,xe+7+rf(i+4)
3721 i=i+1:NEXT
3722 SOUND 3,145,300,12,1,1,12
3723 FOR i=1 TO 80:|AUTOALL:|PRINTSPALL:NEXT    
3724 return




3799 '--- jefe fase 1
3800 ink 6,6:xe=34:ye=-20:|SETUPSP,26,0,128+32+8+1:|LOCATESP,26,ye,xe:|SETUPSP,26,15,35:jefe=20
3802 |AUTOALL,1:|PRINTSPALL,0,1,0:dis=0:'sprite disparos jefe
3820 ciclo=ciclo+1 
3825 if vivo then gosub 8000 else border ciclo mod 10:timer=timer-1:if timer=0 then vivo=1: gosub 1500:goto 2000
3830 |AUTOALL:|PRINTSPALL:|COLSPALL
3831 if collider=32 then 3833
3832 if collided=31 then gosub 2800 else if collider=26 then 3711 else gosub 2900

3833 if ciclo and 7 then 3840
3834 |PEEK,27417,@ye:if ye>100 then gosub 3900
3840 IF (ciclo and 15) THEN  3870
3841 gosub 2500
3870 goto 3820

3900 '--- new disparo jefe
3920 |SETUPSP,dis+16,9,32:|SETUPSP,dis+16,0,32+8+1
3930 |SETUPSP,dis+16,5,diry(dis) ,dirx(dis)
3940 |LOCATESP,dis+16,ye+4,peek(27419)+4
3941 dis=(dis+1) and 7
3950 return






4000'--- fase 2 ---
4001 ciclo=3000: if vidas<5 then vidas=vidas+1
4002 mode 0:border 0:for i=0 to 31:|SETUPSP,i,0,0:next: |PRINTSPALL,0,1,0
4012 FOR i=0 TO 3:INK i,0:NEXT:'fondos negros
4020 'paint escenario
4021 CLG 3:INK 8,0:ppmin=32:p=ppmin:pp=ppmin
4022 pen 4:paper 8:locate 2,3:print "PHASE 2:ultraworld"
4023 locate 3,4:pen 12:print "."
4024 |MUSICOFF
4030 m=0:tini =0:tfin=tini+2: y=198:t=tini 
4040 FOR j=0 TO 25:locate 3+j/2,4:pen 12:print "."
4041 FOR k=1 TO m
4042 ri=t:FOR q=320 TO 640 STEP pp
4043 ri=(ri+2)MOD 3
4044 PLOT q,y,ri:DRAW q+p,y: 'lado derecho
4045 PLOT 640-q,y,(ri+2)MOD 3:DRAW 640-(q+pp),y:'lado izq
4046 NEXT q
4047 y=y-2:p=p+1:IF p>ppmin THEN pp=p ELSE pp=ppmin
4048 NEXT k
4049 t=t+1:IF t>tfin THEN t=tini:m=m+1
4050 p=p+1
4051 NEXT j
4052 |RINK,tini,3,3,15:|RINK,0
4053 xe=0:ye=0:pause=0:cambio=0
4060' paleta
4061 INK 3,11:paper 3:pen 3:locate 1,3:print STRING$(20," "):locate 1,4:print STRING$(20, " ")
4062 FOR i=4 TO 7:INK i,26:NEXT
4063 FOR i=8 TO 11:INK i,0:NEXT  
4064 FOR i=12 TO 15:INK i,21:NEXT 
4065 gosub 9100:TR=64:|PRINTSP,32,2:'2bit fondo
4066 for i=0 to 31:|SETUPSP,i,0,0:next
4067 espera=ciclo: cicloini=ciclo:gosub 9100:gosub 9000:|COLSP,32,27,31
4068 if ciclo>4000 then if cambio=0 then pause=0:cambio=1:ink 3,1:|RINK,0,4,4,11
4069 |MUSIC,2,7:|AUTOALL,1:|PRINTSPALL,0,1,0
4070 '---ciclo de juego fase2---
4071 |RINK,2
4080 if vivo then gosub 8000 else border ciclo mod 10:timer=timer-1:if timer=0 then vivo=1: gosub 1500:goto 4002' mueve personaje
4081 |AUTOALL:|PRINTSPALL:|COLSPALL
4082 ciclo=ciclo+1: if ciclo=5000 then return
4090 if collider=32 then 4290
4100 if collided=31 then gosub 2800 else gosub 2900
4290 if (ciclo and 15)=0 then gosub 4501
4291 goto 4071

4299'--- new nave
4300 if pause then if ciclo>4050 then ink 3,1:|RINK,0,4,4,11:pause=0 else return
4301 nave=(nave+3) mod 6: r=r+1:r=r and 7
4310 |SETUPSP,nave,0,235:|SETUPSP,nave,15,rn1(r):|LOCATESP,nave,rny1(r),rnx1(r):|ROUTESP,nave, p1(r)
4320 |SETUPSP,nave+1,0,235:|SETUPSP,nave+1,15,rn2(r):|LOCATESP,nave+1,rny2(r),rnx2(r):|ROUTESP,nave+1,p2(r)
4330 |SETUPSP,nave+2,0,235:|SETUPSP,nave+2,15,rn3(r):|LOCATESP,nave+2,rny3(r),rnx3(r):|ROUTESP,nave+2,p3(r)
4331 if ciclo>4000 then if cambio=0 then pause=1:cambio=1
4340 return

4500'-- disp enemigo
4501 if (ciclo and 127) THEN 4510
4502 gosub 4300:'new nave
4510 de=1+de and 7:des=de+9
4520 na=rnd*6: dirn=27000+na*16: if peek(dirn)=0 then return
4522 |peek,dirn+3,@xe%:if xe>80 then return else if xe<1 then return
4523 |peek,dirn+1,@ye%:if ye>200 then return else if ye<10 then return
4524 if x>xe+4 then vxd=2 else if x<xe-4 then vxd=-2 else vxd=0
4525 if y>ye+8 then vyd=3 else if y<ye-8 then vyd=-3 else vyd=0
4530 |SETUPSP,des,0,64+32+8+1:|SETUPSP,des,9,32:|SETUPSP,des,5,vyd,vxd:|LOCATESP,des,ye,xe
4540 return



5000'--- fase 3 ---
5001 |MUSICOFF: mode 0
5002 pen 4:paper 8:locate 3,3:print "PHASE 3: dragon head"
5003 for i=1 to 5000:next
5004 INK 4,26:ink 5,26:INK 8,0:ink 9,0:ink 12,21:ink 13,21
5005 INK 6,18:ink 7,18: ink 10,6:ink 11,6
5005 INK 6,8:ink 7,8: ink 10,6:ink 11,6
5005 INK 6,15:ink 7,15: ink 10,18:ink 11,18
5010 ink 0,15:ink 1,11:ink 3,11:border 0:for i=0 to 31:|SETUPSP,i,0,0:next 
5010 ink 0,4:ink 1,5:ink 3,5:border 0:for i=0 to 31:|SETUPSP,i,0,0:next 
5010 ink 0,3:ink 1,11:ink 3,11:border 0:for i=0 to 31:|SETUPSP,i,0,0:next 
5011 clg 0:paper 1:for i=1 to 12:locate 1,i:print STRING$(20," "):next
5012 gosub 9100:gosub 9000
5013 |PRINTSP,32,1:'1bit fondo
5014 |SETUPSP,0,9,36:|SETUPSP,0,0,1:|PRINTSP,0,87,30:'ciudad
'5015 |SETUPSP,31,0,64+8+4+2+1:'esto sobra, ya se ha hecho
5016 jefe=30: TR=64:pen 1: fin3=0
5020 espera=ciclo: cicloini=ciclo:ovnisp=22:xe=0:ye=0
5021 gosub 7500:'dragon
5022 |MUSIC,2,7
5100|PRINTSPALL,0,1,0:|AUTOALL,1
5499 '--- ciclo de juego ---
5500 if vivo then gosub 8000 else border ciclo mod 10:timer=timer-1:if timer=0 then vivo=1: gosub 1500:goto 5004' mueve personaje
5510 |MOVERALL,0,vx:|AUTOALL:|PRINTSPALL:|COLSPALL
5511 if collider=32 then 5520
5512 if collided=31 then gosub 2800 else gosub 5805
5520 ciclo=ciclo+1
5530 if ciclo and 7 then 5500
5535 goto 7001


5800'--- muerte enemigo
5805 |SETUPSP,collided,7,7:|SETUPSP,collided,0,5+TR
5806 if collider <21 then return
5810 if collider = 21 then jefe=jefe-1:if jefe then 5855 else 5900
5850 |SETUPSP,collider,7,6:|SETUPSP,collider,0,5+TR
5855 score=score+10
5857 goto 9201


5900' --- final jefe2
5901 |SETUPSP,collider,0,0:|SETUPSP,31,5,0,0
5902 |MUSICOFF:i=0: |peek,27337,@ye: |peek,27339,@xe
5905 FOR d=27000 TO 27256 STEP 16 
5905 FOR d=27000 TO 27416 STEP 16 
5910 POKE d,64+9:|SETUPSP,i,9,35:'fragment
5915 |SETUPSP,i,5,rf(i),rf(i+1)/2
5920 |POKE,d+1,ye+12+rf(i+3):|POKE,d+3,xe+7+rf(i+4)
5925 i=i+1:NEXT
5930 SOUND 3,145,300,12,1,1,12: ink 6,26:ink 7,26
5935 FOR i=1 TO 80:|AUTOALL:|PRINTSPALL:NEXT    
5940 return


6000'--- final
6001 mode 0:ink 0,0:ink 11,0: ink 12,17:ink 8,5: ink 2,20
6010 locate 1,1:paper 4:pen 11:print STRING$(40," "):locate 6,2:print "RETIRADA!!"
6011 for i=0 to 31:|SETUPSP,i,0,0:next:|3d,0
6012 b$=inkey$:if b$<>"" then 6012:'clean buffer
6013 |SETUPSP,0,9,29:|PRINTSP,0,1,1:|SETUPSP,0,9,30:|PRINTSP,0,1,7
6014 |SETUPSP,0,9,29:|PRINTSP,0,1,67:|SETUPSP,0,9,30:|PRINTSP,0,1,73
6020 |MUSIC,0,6: |SETLIMITS,0,80,16,200
6030 ciclo=ciclo+1: if ciclo and 15 then 6040
6031 gosub 6500:ciclo=0
6040 |AUTOALL,1:|PRINTSPALL
6041 |STARS,0,10,2,2,0:|STARS,10,10,12,4,0:|STARS,20,10,4,8,0
6050 b$=inkey$:if b$<>"" then 1700
6060 goto 6030



6499 '--- new star 
6500 i= (i+1) and 15 :b$=inkey$:if b$<>"" then 1700
6501 if i and 3 then 6510
6502 |SETUPSP,i,0,137
6503 |SETUPSP,i,15,45
6504 |LOCATESP,i,-10,rnd*50+10:return
6510 sp=i+15:|SETUPSP,sp,0,137
6520 |SETUPSP,sp,15,43
6530 |LOCATESP,sp,200,rnd*50+10
6530 |LOCATESP,sp,200,rnd*50
6540 return





7000 'new piedra
7001 if ciclo and 127 then 7010
7001 if ciclo and 127 then 7003
7002 gosub 7601
7003 if jefe then 7010 else return:'dragon muerto
7010 i= 1+i and 7
7020 |SETUPSP,i,9,34:|SETUPSP,i,0,137+16
7040 |SETUPSP,i,0,153:|SETUPSP,i,15,36
7050 |LOCATESP,i,100,pie(i)
7050 |LOCATESP,i,95,pie(i)
7060 return
7060 goto 5500


7500 'setup dragon
7510 for s=16 to 21:|SETUPSP,s,9,38:|SETUPSP,s,0,233:|SETUPSP,s,15,46:|LOCATESP,s,20,100:next
7511 |SETUPSP,21,9,37:|ROUTESP,21,20:'head
7520 |ROUTESP,20,16
7530 |ROUTESP,19,12
7540 |ROUTESP,18,8
7550 |ROUTESP,17,4
7570 return

7600 'ovni
7601 ovni=ovni+1: if ovni>3 then ovni=0
7602 ovnisp=22+ovni
7610 |SETUPSP,ovnisp,0,128+64+32+8+1
7611 |LOCATESP,ovnisp,0,0:|SETUPSP,ovnisp,15,ro(ovni)
7612 return

7700 'disparo. sp 26
7710 dirn=27000+ovnisp*16:if peek(dirn)=0 then return
7720 |peek,dirn+3,@xe%:if xe>80 then return else if xe<0 then return
7730 |peek,dirn+1,@ye%:if ye>200 then return else if ye<24 then return
7740 if x>xe+4 then vxd=2 else if x<xe-4 then vxd=-2 else vxd=0
7750 if y>ye+8 then vyd=3 else if y<ye-8 then vyd=-3 else vyd=0
7760 |SETUPSP,26,0,64+32+8+1:|SETUPSP,26,9,32:|SETUPSP,26,5,vyd,vxd:|LOCATESP,26,ye,xe
4540 return


7999'-- mov personaje ---
8000 IF INKEY(DK) THEN 8020
8010 IF y <170 THEN y=y+4:poke 27501,4:GOTO 8040
8020 IF INKEY(UK) THEN 8039
8030 IF y>16 THEN y=y-4:poke 27501,252:goto 8040
8039 poke 27501,0
8040 IF INKEY(RK)THEN 8060
8050 IF x<70 THEN vx=-1:x=x+1:dir=1:poke 27502,1:GOTO 8080
8060 IF INKEY(LK)THEN 8079
8070 IF x>5 THEN vx=1:x=x-1:dir=0:poke 27502,255:goto 8080
8079 poke 27502,0:vx=0
8080 IF espera>ciclo-6 THEN return 
8090 IF dir THEN IF INKEY(FK)=0 THEN espera=ciclo:disp=1+disp AND 3:d=27+disp:|SETUPSP,d,0,203:|LOCATESP,d,PEEK(27497)+4,PEEK(27499)-3:|SETUPSP,d,15,24:return
8100 IF INKEY(FK)=0 THEN espera=ciclo:disp=1+disp AND 3:d=27+disp:|SETUPSP,d,0,203:|LOCATESP,d,PEEK(27497)+4,PEEK(27499)+2:|SETUPSP,d,15,25:return
8110 return



9000 '--- print marcadores ---
9001 window 1,20,1,2:paper 4: cls:window 1,20,1,25
9002 |SETLIMITS,0,80,0,200
9010 |SETUPSP,0,9,marcoL:|PRINTSP,0,0,0
9011 |SETUPSP,0,9,marcoR:|PRINTSP,0,0,76
9012 c$="    ":|PRINTAT,0,2,51,@c$
9013 |SETUPSP,0,9,28:for i=1 to vidas:|PRINTSP,0,0,5+(vidas-i)*6:next
9013 |SETUPSP,0,9,28:for i=1 to vidas:|PRINTSP,0,0,3+(vidas-i)*6:next
9014 |SETUPSP,0,9,29:|PRINTSP,0,2,34:|SETUPSP,0,9,30:|PRINTSP,0,2,40
9015 |SETLIMITS,0,80,16,200:gosub 9200
9020 return

9100 '---setup personaje ---
9110 |SETUPSP,31,9,16:|SETUPSP,31,0,64+8+4+2+1
9115 |SETUPSP,31,7,1:|SETUPSP,31,7,32:'macrosec
9120 y=100:x=40:|LOCATESP,31,y,x: dir=1
9130 return 

9200 '--- print score ---
9201 if score >=scp then scp=scp*10:scm=scm+3:scx=60-scm
9210 c$=str$(score):|PRINTAT,0,2,scx,@c$
9230 return



