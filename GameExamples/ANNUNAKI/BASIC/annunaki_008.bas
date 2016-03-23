10 CALL &6B78:call &BC02
20 dir=&A62C: '42540
30 FOR star=0 TO 40
40 POKE dir+star*2,RND*200
50 POKE dir+star*2+1,RND*80
60 NEXT
61 defint a-z
62 dim rx(30): dim ry(30): 'array mov relativo
63 deg:for i=0 to 14:rx(i)=round(sin(i*360/15)):next:'trayectoria zigzag
64 dim k(12):dim ky(12):dim kx(12)
65 FOR j=0 TO 31:|SETUPSP,j,0,&X0:NEXT:' reset sprites
70 MODE 0: INK 0,0
80 |SETLIMITS,0,80,0,200:|colsp,34,1,0:'sin margen x en deteccion colision
81 LOCATE 7,5:PEN 11:PRINT "ANUNNAKI"
82 LOCATE 2,9:PEN 13:PRINT "nuestro pasado alien"
83 LOCATE 2,22:PEN 7:PRINT "pulsa S para empezar"
84 LOCATE 10,25:PEN 11:PRINT "JJGA 2016"
85 |SETUPSP,31,9,34000:|SETUPSP,31,7,1 : |PRINTSP,31,11*8,36:'nave
87 meteorito=&875a:borradisp=&8746:disparo=&8ac3:navemala1=&8ae6:
88 vidas =3:nd=0: bolaimg=&8e24:craterimg=&8618
89 murol=&8e90:muror=&8e4e
90 |STARS,0,10,3,1,0  
100 |STARS,10,10,2,2,0       
110 |STARS,20,10,1,3,0
120 |STARS,30,10,4,4,0
131 IF INKEY(60)=0 THEN 150
140 GOTO 90
150 ' empieza el juego
151 x=40:y=180:|LOCATESP,31,y,x
152 cls
153 gosub 800:' init
154 goto 194
159'FASE ESPACIAL
160 gosub 1000:'meteoritos
170 gosub 2000:'2 ordas simples
180 gosub 2500:'2 ordas zigzag
190 gosub 2950:'hileras
191 gosub 2955:'hileras
192 gosub 2970:'hileras
193 gosub 2980:'hileras
194 gosub 2990:'hileras
195 gosub 3500:'jefe
196 'FASE LUNAR
197 gosub 4000:'titulo
198 gosub 4200
200 goto 65:'vuelta a empezar


299' rutina de muerte ---------------------------
300 |SETUPSP,31,7,3:y=y+2:x=x+1:|LOCATESP,31,y,x:FOR i=1 TO 50: BORDER 7:CALL &BD19:BORDER 0:|ANIMA,31:|AUTOALL:|PRINTSPALL:NEXT 
310  vidas= vidas-1
311 |MUSICOFF:LOCATE 7,9:PEN 1:PRINT " NIVEL"; nivel
320 LOCATE 7,11:PEN 15:PRINT " VIDAS"; vidas: PEN 1
330 FOR i=1 TO 50: CALL &BD19:NEXT :CLS
331 |SETUPSP,31,7,1:' secuencia normal
332 vivo=1: IF vidas=0 THEN RUN
333 gosub 800
340 RETURN



499' rutina movimiento nave y disparo---------------------------
500 if inkey(27)=0 then x=x+1:if x>70 then x=70 else POKE 27499,x:goto 520
510 if inkey(34)=0 then x=x-1:if x<0 then x=0 else POKE 27499,x
520 if inkey(67)=0 then y=y-3:POKE 27503,1:if y<3 then y=3 else POKE 27497,y:goto 540
530 if inkey(69)=0 then y=y+3:POKE 27503,2:if y>180 then y=180 else POKE 27497,y
540 if timer >0 then timer =timer-1:return :rem tiempo de guarda entre disparos
700 if inkey(47)<>0 then  return else if nd=3 then return
702 nd=nd+1: rem nd->numero de disparos
703 if peek (27112)=0 then libre =7:goto 710
704 if peek (27128)=0 then libre =8:goto 710
705 if peek (27144)=0 then libre =9
710 |LOCATESP,libre,y,x+4:|SETUPSP,libre,0,&x101001: rem disparo sin flag colision
715 timer=3:'separo disparos en el tiempo
720 return

749' logica fin disparo (logica masiva)--------------------------
750 dc=dc mod 3 +1:dir=ddisp(dc):|peek,dir,@yd%: if yd%<-10 then poke dir-1,0: |POKE,dir,200:nd=nd-1
754 return: 

769' rutina colision disparo----------------------------------
770 dir=ddisp(sp%-6): 'primero paro el disparo y luego actuo segun el tipo de enemigo 
775 poke dir-1,0: nd=nd-1:|PRINTSP,6,peek(dir),peek(dir+2): poke dir,255
777 if col%>=duros then return
780 if col%>=semis then ink 8,26:call &bd19:ink 8,10:semi(col-20)=semi(col-20)-1: if semi(col-20)=0 then |SETUPSP,col%,7,4:|SETUPSP,col%,0,&x101:return else return'secuencia de muerte sin colision
781 if col%>=blandos then |SETUPSP,col%,7,4:|SETUPSP,col%,0,&x101:return 'secuencia de muerte sin colision
785 return


799 'inicializacion de cualquier fase-----------------
800 FOR j=0 TO 31:|SETUPSP,j,0,&X0:NEXT:' reset sprites
801 nd=0:'num disparos activos. como mucho 3
802 yd%=0: dc=0:libre=28:ddisp(1)=27113:ddisp(2)=27129:ddisp(3)=27145
803 for i=7 to 9: ' disparos sprites
804 |SETUPSP,i,9,disparo:|SETUPSP,i,0,0
805 |SETUPSP,i,5,-11: ' Vy del disparo
806 |LOCATESP,i,250,0: 'fuera de pantalla
807 next
809 |SETUPSP,31,0,&x100101:'mi nave no dede tener flag colision
810 |SETUPSP,6,9,borradisp:' esta desactivado
811 |SETUPSP,31,7,1: 'secuencia mi nave
813 col%=32:sp%=32:|COLSPALL,@sp%,@col%
814 blandos=10: semis=100:duros=100
900 return

999' fase 1 ---------METEORITOS--------------
1000 'gosub 800: 'init generico
1001 yd%=0:totalm=6: ini=30-totalm+1:|COLSP,32,ini,30 'meteoritos sprites 25...30 (6 sprites)
1002 for i=ini to 30
1003 |SETUPSP,i,9,meteorito:|SETUPSP,i,5,5:|SETUPSP,i,0,&x01011:|SETUPSP,i,6,i mod 3 -1:
1004 |LOCATESP,i,-30-(i-ini)*30,rnd*30+10
1005 next
1006 ' tipos de enemigos: blandos, duros . especifico sprite inicial
1007 blandos=100: duros=25
1008 mc=0:'meteorito counter
1009 for i=1 to totalm: dmet(i)=27385+i*16:next
1020 |STARS,0,10,2,3,0:|PRINTSPALL,1,0
1031 ciclo=0: maxciclos=300: dirm=dmet(1):ym%=0:mc=1
1500 gosub 500:'mov nave + start disparo
1510 gosub 750:'logica disparo
1511 'logica meteorito
1513 if ciclo >maxciclos-50 then 1520: ' a v=5, se recorren 230 en 46 ciclos
1514 if ciclo mod 6=0 then |peek,dirm,@ym% else 1517:rem mc-> meteorito counter
1515 if ym%>=200 then |poke,dirm,-30:|POKE,dirm+2,rnd*40+20:|SETUPSP,mc+ini-1,6,RND*2 -1:mc=mc mod totalm +1:dirm=dmet(mc) 
1516 goto 1520
1517 if ciclo mod 2=0 then mc2=mc2 mod totalm +1: |SETUPSP,mc2+ini-1,6,RND*2 -1: ' cambio de rumbo!!!
1520 |AUTOALL: |PRINTSPALL: |STARS
1533 ciclo=ciclo+1:if ciclo=maxciclos then return:' condicion de salida
1534 |COLSPALL: if sp%<32 then if sp%=31 then gosub 300:goto 1000: else gosub 770
1540 goto 1500



1999'fase 2------12 NAVES SIMPLES, 2 ordas--------
2000 ciclo=0: maxciclos=90: ordas=1 : ' 2 ordas (2,1,0)
2002 totaln=12: blandos=31-totaln:duros=100:semis=100
2003 ini=30-totaln+1:|COLSP,32,ini,30 
2010 for i=ini to 24
2020 |SETUPSP,i,9,navemala1:|SETUPSP,i,7,0:|SETUPSP,i,5,5:|SETUPSP,i,0,&x01011:|SETUPSP,i,6,0
2021 |SETUPSP,i+6,9,navemala1:|SETUPSP,i+6,7,0:|SETUPSP,i+6,5,5:|SETUPSP,i+6,0,&x01011:|SETUPSP,i+6,6,0
2030 |LOCATESP,i,-30,(i-ini)*12+5:|LOCATESP,i+6,-60,(i+6-25)*10+10:
2031 |STARS:gosub 500:gosub 750:|AUTO,7:|AUTO,8:|AUTO,9:|PRINTSPALL,1,0
2040 next
2190 'ciclo
2191 gosub 500:'nave + start disparo
2194 gosub 750:'logica disparo
2200 |AUTOALL
2201 |PRINTSPALL
2210 |STARS
2218 ciclo=ciclo+1:if ciclo=maxciclos then 2240: ' nueva orda
2219 |COLSPALL: if sp<32 then if sp=31 then gosub 300:goto 2000: else gosub 770
2220 goto 2190
2240 if ordas=0 then return 
2241 ordas=ordas -1
2242 ciclo=0
2249 goto 2010



2499' fase 3. ordas en zigzag  ---------------------------
2500 'gosub 800
2501 ordas=1:
2502 totaln=12: blandos=31-totaln:duros=100:semis=100
2503 ini=30-totaln+1:|COLSP,32,ini,30 : 'ini es 19
2509 for i=ini to 24
2510 |SETUPSP,i,9,navemala1:|SETUPSP,i,7,0:|SETUPSP,i,5,5:|SETUPSP,i,0,&x11011:|SETUPSP,i,6,0
2511 |SETUPSP,i+6,9,navemala1:|SETUPSP,i+6,7,0:|SETUPSP,i+6,5,5:|SETUPSP,i+6,0,&x11011:|SETUPSP,i+6,6,0
2520 |LOCATESP,i,-30,(i-ini)*10+10:|LOCATESP,i+6,-60,(i+6-25)*10+10
2521 |STARS:gosub 500:gosub 750:|AUTO,7:|AUTO,8:|AUTO,9:|PRINTSPALL,1,0
2530 next
2690 'ciclo
2710 ciclo=0: maxciclos=70: i=0
2720 gosub 500:'nave + start disparo
2794 gosub 750:'logica disparo, necesita tener hecha la colision.
2795 |MOVERALL,0,rx(i): i=(i+1) mod 15
2800 |AUTOALL
2801 |PRINTSPALL
2810 |STARS
2818 ciclo=ciclo+1:if ciclo=maxciclos then 2900
2819 |COLSPALL: if sp<32 then if sp=31 then gosub 300:goto 2509: else gosub 770
2820 goto 2720:'fin ciclo
2900 if ordas=0 then return 
2901 ordas=ordas -1
2902 ciclo=0
2903 goto 2509

2950'12 naves haciendo una X y subiendo
2951 for i=0 to 12: k(i)=1000:next:kx(0)=-1:ky(0)=3
2952 k(2)=6: kx(2)=0:ky(2)=-5
2953 k(12)=20:finm=3:inim=2: m=inim: goto 3000

2955'12 naves haciendo una S 
2956 for i=0 to 12: k(i)=1000:next:kx(0)=-1:ky(0)=2
2957 k(2)=2: kx(2)=-1:ky(2)=0
2958 k(3)=3: kx(3)=0:ky(3)=5
2959 k(4)=6: kx(4)=1:ky(4)=1
2969 k(12)=20:finm=3:inim=2: m=inim: goto 3000

2970'12 naves 
2971 for i=0 to 12: k(i)=1000:next:kx(0)=-1:ky(0)=2:
2972 k(2)=1: kx(2)=0:ky(2)=5
2973 k(3)=4: kx(3)=-1:ky(3)=1
2974 k(4)=5: kx(4)=-1:ky(4)=-1
2975 k(5)=6: kx(5)=0:ky(5)=-5
2976 k(12)=20:finm=3:inim=2: m=inim: goto 3000

2980'hileras
2981 for i=0 to 12: k(i)=1000:next:kx(0)=-1:ky(0)=5:
2982 k(2)=1: kx(2)=-1:ky(2)=5
2983 k(3)=2: kx(3)=-1:ky(3)=0
2984 k(4)=3: kx(4)=-1:ky(4)=-5
2985 k(5)=4: kx(5)=-1:ky(5)=0
2986 k(12)=20:finm=3:inim=2: m=inim: goto 3000

2990'hileras
2991 for i=0 to 12: k(i)=1000:next:kx(0)=-1:ky(0)=2:
2992 k(2)=2: kx(2)=-1:ky(2)=0
2993 k(3)=8: kx(3)=0:ky(3)=5
2994 k(4)=9: kx(4)=1:ky(4)=3
2995 k(5)=12: kx(5)=0:ky(5)=5
2996 k(12)=20:finm=3:inim=2: m=inim: goto 3000


2999' fase 4 ----trayectorias en dos hileras simetricas configurables por k(i), kx(i),ky(i). se separan de 10 en 10 en x -------------
3000 totaln=12: blandos=31-totaln:duros=100: ini=31-totaln:|COLSP,32,ini,30 
3010 for i=ini to 24
3020 |SETUPSP,i,9,navemala1:|SETUPSP,i,7,0:|SETUPSP,i,5,ky(0):|SETUPSP,i,0,&x01011:|SETUPSP,i,6,kx(0)
3021 |SETUPSP,i+6,9,navemala1:|SETUPSP,i+6,7,0:|SETUPSP,i+6,5,ky(0):|SETUPSP,i+6,0,&x01011:|SETUPSP,i+6,6,-kx(0)
3030 |LOCATESP,i,-30-(i-ini)*20,80+(i-ini)*10:|LOCATESP,i+6,-30-(i-ini)*20,0-(i-ini)*10-6:'6 es el ancho en bytes de la navemala y 26 el alto
3040 |STARS:gosub 500:gosub 750:|AUTO,7:|AUTO,8:|AUTO,9:|PRINTSPALL,1,0
3050 next
3060 ciclo=0: t=0: col%=32:yd%=200
3100 gosub 500: gosub 750
3109 |AUTOALL:|PRINTSPALL:|STARS
3120 |COLSPALL: if sp<32 then if sp=31 then gosub 300:goto 3000 else gosub 770
3130 ciclo=ciclo+1: if ciclo =10 then ciclo=0:t=t+1:m=inim
3131 if m=finm+1 then 3100
3132 IF t>=k(m) AND t<k(m)+6 THEN i= t-k(m)+ini:|SETUPSP,i,5,ky(m):|SETUPSP,i,6,kx(m):|SETUPSP,i+6,5,ky(m):|SETUPSP,i+6,6,-kx(m):IF m=finm THEN finm=m+1:inim=finm-3  ELSE ELSE  IF t>=k(12) THEN RETURN
3132 IF t>=k(m) AND t<k(m)+6 THEN i= t-k(m)+ini:|SETUPSP,i,5,ky(m),kx(m):|SETUPSP,i+6,5,ky(m),-kx(m):IF m=finm THEN finm=m+1:inim=finm-3  ELSE ELSE  IF t>=k(12) THEN RETURN
3133 m=m+1:goto 3100

3499 ' jefe
3500 gosub 800
3501 ' inicio de 10 disparos bola
3502 for i=20 to 29: |SETUPSP,i,0,&x0:|SETUPSP,i,9,bolaimg:next: bola=20: |COLSP,32,20,30
3510 |SETUPSP,30,7,5: |SETUPSP,30,0,&x1111: |SETUPSP,30,5,0,0:'jefe
3520 for jy=-30 to 30
3530 |LOCATESP,30,jy,34:|PRINTSPALL
3540 NEXT
3550 ciclo=30: vj=1:|SETUPSP,30,6,0,vj:semis=30:semi(10)=10:duros=100: blandos=20
3600 gosub 500: gosub 750
3610 |AUTOALL:|PRINTSPALL:|STARS
3620 |COLSPALL: if sp<32 then if sp=31 then gosub 300:goto 3000 else gosub 770
3621 if ciclo mod 60 = 1 then vj=-vj:|SETUPSP,30,6,0,vj'jefe
3622 ciclo=ciclo+1
3623 if ciclo mod 100=<50 then if ciclo mod 8=0 then oy=10+peek (27481): ox=7+peek(27483):gosub 3800
3624 if semi(10)=0 then 3900 :'condicion salida
3630 goto 3600

3799' rutina disparo inteligente ox,oy, 
3800 bola=bola +1: if bola=30 then bola=20
3801|SETUPSP,bola,0,&x1011
3802 if x>ox+4 then vx=1 else if x<ox-4 then vx=-1 else vx=0
3803 vy=1+(y-oy)/100
3810 |LOCATESP,bola,oy,ox:|SETUPSP,bola,5,vy,vx
3820 return

3899' megaexplosion
3900 for i=0 to 25
3910 ex=rnd*14+peek(27483): ey=rnd*10+peek (27481): sp=20+ (i mod 10 )
3920 |SETUPSP,sp,0,&x101:|SETUPSP,sp,7,4: |LOCATESP,sp,ey,ex
3930 |PRINTSPALL:|STARS: |AUTOALL:gosub 500: gosub 750
3940 next
3950 return

3999' FASE LUNAR!
4000 gosub 800:cls: nivel=2
4001 locate 3,2: PEN 1: print "ARKARON DESTROYED!"
4002 |SETUPSP,0,7,5:'|PRINTSP,0,36,34
4010 locate 6,11: PEN 1: print "HOLLOW MOON"
4020 LOCATE 8,13:PEN 11:PRINT "vidas";vidas:LOCATE 8,15:PEN 11:PRINT "pulsa S"
4021 deg
4022 k=k mod 360 +10
4023 sx=2*cos(k):sy=8*sin(k)
4024|PRINTSP,0,36+sy,34+sx
4025 IF INKEY(60)=0 THEN return
4026 goto 4022

4199'COMENZAMOS luna
4200 GOSUB 800:cls:'INIT
4210 INK 0,13
4220 |stars,0,10,5,3,0
4221 for i=0 to 4:|SETUPSP,i,9,craterimg:|SETUPSP,i,0,&X1001:|SETUPSP,i,5,3,0:|LOCATESP,i,-1000,0:next
4222 mu=1:|SETUPSP,3,9,murol::|SETUPSP,4,9,muror
4300 ciclo=30
4310 |PRINTSPALL:|STARS: |AUTOALL:gosub 500: gosub 750
4320 ciclo=ciclo+1:if ciclo mod 30 =0 then 4400
4321 if ciclo mod 37=0 then 4500
4330 GOTO 4310

4400 crsp=crsp+1: if crsp=3 then crsp=0
4410 |LOCATESP,crsp,-30,rnd*50+10
4420 goto 4310

4500 mu=-mu
4510 if mu=1 then |locateSP,3,-16,0 ELSE |locateSP,4,-16,76
4520 goto 4310