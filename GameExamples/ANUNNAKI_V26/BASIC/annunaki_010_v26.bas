1 memory 25999
2 on break gosub 10000
10 CALL &6B78:call &BC02: border 0
20 dir=&A62C: '42540
30 FOR star=0 TO 40
40 POKE dir+star*2,RND*200
50 POKE dir+star*2+1,RND*80
60 NEXT
61 defint a-z
62 dim rx(30): dim ry(30): 'array mov relativo
63 dim k(12):dim ky(12):dim kx(12): dim semi(30)
64 deg:for i=0 to 14:rx(i)=round(sin(i*360/15)):next:'trayectoria zigzag
65 FOR j=0 TO 31:|SETUPSP,j,0,&X0:NEXT:' reset sprites
70 MODE 0: INK 0,0: |MUSICOFF
80 |SETLIMITS,0,80,0,200:|colsp,34,1,0:'sin margen x en deteccion colision
81 LOCATE 7,5:PEN 11:PRINT "ANUNNAKI"
82 LOCATE 2,9:PEN 13:PRINT "nuestro pasado alien"
83 LOCATE 2,22:PEN 7:PRINT "pulsa S para empezar"
84 LOCATE 10,25:PEN 11:PRINT "JJGA 2016"
85 |SETUPSP,31,9,34000:|SETUPSP,31,7,1 : |PRINTSP,31,11*8,36:'nave
86 avionimg=16:navemala7=17
87 meteorito=18:borradisp=19:disparo=20:navemala1=21
88 vidas =5:nd=0: bolaimg=22:craterimg=23:navemala3=24
89 murol=25:muror=26:navemala4=27:navemala5=28:NAVEMALA6=29
90 rocalr=30:rocall=31:rocarl=32:rocarr=33
91 minaimg=34: tierra=35: navend=36
99 |STARS,0,10,3,1,0  
100 |STARS,10,10,2,2,0       
110 |STARS,20,10,1,3,0
120 |STARS,30,10,4,4,0
131 IF INKEY(60)=0 THEN 150
140 GOTO 99
150 ' empieza el juego
151 x=40:y=180:|LOCATESP,31,y,x
152 cls
153 gosub 800:|MUSIC,0,5:' init
154 'goto 196
158'FASE ESPACIAL

160 gosub 1000:'meteoritos
170 gosub 2000:'2 ordas simples
180 gosub 2500:'2 ordas zigzag
181 gosub 9000:' pajaros
190 gosub 2950:'hileras
191 gosub 2955:'hileras
192 gosub 2970:'hileras
193 gosub 2980:'hileras
194 gosub 2990:'hileras
195 gosub 3500:'jefe
196 'FASES LUNA
197 gosub 4000:'titulo+press s
198 gosub 4200:'luna1 zigzag
199 gosub 6000:'luna2 aviones
200 gosub 6500:'desfiladero
201 gosub 7000' 3 jefes
202 gosub 8500' final
203 goto 64:'vuelta a empezar


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
500 if inkey(27)=0 then x=x+1:if x>68 then x=68 else POKE 27499,x:goto 520
510 if inkey(34)=0 then x=x-1:if x<4 then x=4 else POKE 27499,x
520 if inkey(67)=0 then y=y-3:POKE 27503,1:if y<3 then y=3 else POKE 27497,y:goto 540
530 if inkey(69)=0 then y=y+3:POKE 27503,2:if y>180 then y=180 else POKE 27497,y
540 if timer >0 then timer =timer-1:return :rem tiempo de guarda entre disparos
700 if inkey(47)<>0 then  return else if nd=3 then return
702 nd=nd+1: rem nd->numero de disparos
703 if peek (27112)=0 then libre =7:goto 710
704 if peek (27128)=0 then libre =8:goto 710
705 if peek (27144)=0 then libre =9
710 |LOCATESP,libre,y,x+4:|SETUPSP,libre,0,41: rem disparo sin flag colision
715 timer=3:'separo disparos en el tiempo
720 return

749' logica fin disparo (logica masiva)--------------------------
750 dc=dc mod 3 +1:dir=ddisp(dc):|peek,dir,@yd%: if yd%<-11 then poke dir-1,0: |POKE,dir,200:nd=nd-1
754 return: 

769' rutina colision disparo----------------------------------
770 dir=ddisp(sp%-6): 'primero paro el disparo y luego actuo segun el tipo de enemigo 
775 poke dir-1,0: nd=nd-1:|PRINTSP,6,peek(dir),peek(dir+2): poke dir,255
777 if col%>=duros then return
780 if col%>=semis then ink 8,26:call &bd19:ink 8,10:semi(col)=semi(col)-1: if semi(col)=0 then |SETUPSP,col%,7,4:|SETUPSP,col%,0,5:return else return'secuencia de muerte sin colision
781 if col%>=blandos then |MOVER,col,2,1:|SETUPSP,col%,7,4:|SETUPSP,col%,0,5:return 'secuencia de muerte sin colision
785 return


799 'inicializacion de cualquier fase-----------------
800 FOR j=0 TO 31:|SETUPSP,j,0,&X0:NEXT:' reset sprites
801 nd=0:'num disparos activos. como mucho 3
802 yd%=0: dc=0:libre=28:ddisp(1)=27113:ddisp(2)=27129:ddisp(3)=27145
803 for i=7 to 9: ' disparos sprites
804 |SETUPSP,i,9,disparo:|SETUPSP,i,0,0
805 |SETUPSP,i,5,-11,0: ' Vy del disparo
806 |LOCATESP,i,250,0: 'fuera de pantalla
807 next
809 |SETUPSP,31,0,37:'mi nave no dede tener flag colision
810 |SETUPSP,6,9,borradisp:' esta desactivado
811 |SETUPSP,31,7,1: 'secuencia mi nave
813 col%=32:sp%=32:|COLSPALL,@sp%,@col%
814 blandos=10: semis=100:duros=100
900 return

999' fase 1 ---------METEORITOS--------------
1000 'gosub 800: 'init generico
1001 yd%=0:totalm=6: ini=30-totalm+1:|COLSP,32,ini,30 'meteoritos sprites 25...30 (6 sprites)
1002 for i=ini to 30
1003 |SETUPSP,i,9,meteorito:|SETUPSP,i,5,5:|SETUPSP,i,0,11:|SETUPSP,i,6,i mod 3 -1:
1004 |LOCATESP,i,-30-(i-ini)*30,rnd*30+10
1004 |LOCATESP,i,-1000,0
1005 next
1006 ' tipos de enemigos: blandos, duros . especifico sprite inicial
1007 blandos=100: duros=25
1008 mc=0:'meteorito counter
1009 for i=1 to totalm: dmet(i)=27385+i*16:next
1020 |STARS,0,10,2,3,0:|PRINTSPALL,1,0
1031 ciclo=0: maxciclos=300: dirm=dmet(1):ym%=0:mc=1

1040 |MUSIC,0,5:mc=1:dirm=dmet(1)
1100 gosub 500:'mov nave + start disparo
1110 gosub 750:'logica disparo
1111 'logica meteorito
1113 if ciclo >maxciclos-50 then 1120: ' a v=5, se recorren 230 en 46 ciclos
1114 if ciclo mod 8=0 then |LOCATESP,mc+ini-1,-30,rnd*40+20:|SETUPSP,mc+ini-1,6,RND*2 -1:mc=mc mod totalm +1:dirm=dmet(mc) :goto 1120
1117 if ciclo mod 2=0 then mc2=mc2 mod totalm +1: |SETUPSP,mc2+ini-1,6,RND*2 -1: ' cambio de rumbo!!!
1120 |AUTOALL: |PRINTSPALL: |STARS
1133 ciclo=ciclo+1:if ciclo=maxciclos then return:' condicion de salida
1134 |COLSPALL: if sp%<32 then if sp%=31 then gosub 300:|MUSIC,0,5:goto 1000: else gosub 770
1140 goto 1100

1999'fase 2------12 NAVES SIMPLES, 2 ordas--------
2000 ciclo=0: maxciclos=90: ordas=1 : ' 2 ordas (2,1,0)
2002 totaln=12: blandos=31-totaln:duros=100:semis=100
2003 ini=30-totaln+1:|COLSP,32,ini,30 
2010 for i=ini to 24
2020 |SETUPSP,i,9,navemala1:|SETUPSP,i,7,0:|SETUPSP,i,5,5:|SETUPSP,i,0,11:|SETUPSP,i,6,0
2021 |SETUPSP,i+6,9,navemala1:|SETUPSP,i+6,7,0:|SETUPSP,i+6,5,5:|SETUPSP,i+6,0,11:|SETUPSP,i+6,6,0
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
2219 |COLSPALL: if sp<32 then if sp=31 then gosub 300:|MUSIC,0,5:goto 2000: else gosub 770
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
2510 |SETUPSP,i,9,navemala1:|SETUPSP,i,7,0:|SETUPSP,i,5,5:|SETUPSP,i,0,27:|SETUPSP,i,6,0
2511 |SETUPSP,i+6,9,navemala1:|SETUPSP,i+6,7,0:|SETUPSP,i+6,5,5:|SETUPSP,i+6,0,27:|SETUPSP,i+6,6,0
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
2819 |COLSPALL: if sp<32 then if sp=31 then gosub 300:|MUSIC,0,5:goto 2509: else gosub 770
2820 goto 2720:'fin ciclo
2900 if ordas=0 then return 
2901 ordas=ordas -1
2902 ciclo=0
2903 goto 2509

2950'12 naves haciendo una X y subiendo
2951 for i=0 to 12: k(i)=1000:next:kx(0)=-1:ky(0)=3
2952 k(2)=6: kx(2)=0:ky(2)=-5
2953 k(12)=20:finm=2:inim=0: m=inim: goto 3000

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
3020 |SETUPSP,i,9,navemala1:|SETUPSP,i,7,0:|SETUPSP,i,5,ky(0):|SETUPSP,i,0,11:|SETUPSP,i,6,kx(0)
3021 |SETUPSP,i+6,9,navemala1:|SETUPSP,i+6,7,0:|SETUPSP,i+6,5,ky(0):|SETUPSP,i+6,0,11:|SETUPSP,i+6,6,-kx(0)
3030 |LOCATESP,i,-30-(i-ini)*20,80+(i-ini)*10:|LOCATESP,i+6,-30-(i-ini)*20,0-(i-ini)*10-6:'6 es el ancho en bytes de la navemala y 26 el alto
3040 |STARS:gosub 500:gosub 750:|AUTO,7:|AUTO,8:|AUTO,9:|PRINTSPALL,1,0
3050 next
3060 ciclo=0: t=0: col%=32:yd%=200
3100 gosub 500: gosub 750
3109 |AUTOALL:|PRINTSPALL:|STARS
3120 |COLSPALL: if sp<32 then if sp=31 then gosub 300:|MUSIC,0,5:goto 3000 else gosub 770
3130 ciclo=ciclo+1: if ciclo =10 then ciclo=0:t=t+1:m=inim
3131 if m=finm+1 then 3100
3132 IF t>=k(m) AND t<k(m)+6 THEN i= t-k(m)+ini:|SETUPSP,i,5,ky(m),kx(m):|SETUPSP,i+6,5,ky(m),-kx(m):IF m=finm THEN finm=m+1:inim=finm-3  ELSE ELSE  IF t>=k(12) THEN RETURN
3133 m=m+1:goto 3100



3499 ' jefe
3500 gosub 800:|MUSIC,1,5
3501 ' inicio de 10 disparos bola
3502 for i=20 to 29: |SETUPSP,i,0,&x0:next: bola=20: |COLSP,32,20,30: maxbola=30:minbola=20:bola=minbola
3510 |SETUPSP,30,7,5: |SETUPSP,30,0,15: |SETUPSP,30,5,0,0:'jefe
3520 for jy=-30 to 30
3530 |LOCATESP,30,jy,34
3531 gosub 500:gosub 750:|AUTOALL:|PRINTSPALL:|STARS
3540 NEXT
3550 ciclo=30: vj=1:|SETUPSP,30,6,vj:semis=30:semi(30)=10:duros=100: blandos=20
3600 gosub 500: gosub 750
3610 |AUTOALL:|PRINTSPALL:|STARS
3620 |COLSPALL: if sp<32 then if sp=31 then gosub 300:goto 3500 else gosub 770
3621 if ciclo mod 60 = 1 then vj=-vj:|SETUPSP,30,6,vj'jefe
3622 ciclo=ciclo+1
3623 if ciclo mod 100=<50 then if ciclo mod 8=0 then oy=10+peek (27481): ox=7+peek(27483):gosub 3800
3624 if semi(30)=0 then 3900 :'condicion salida
3630 goto 3600

3799' rutina disparo inteligente ox,oy, 
3800 bola=bola +1: if bola=maxbola then bola=minbola
3802 if x>ox+4 then vx=1 else if x<ox-4 then vx=-1 else vx=0
3803 vy=1+(y-oy)/100
3810 |LOCATESP,bola,oy,ox:|SETUPSP,bola,5,vy,vx:|SETUPSP,bola,0,11:|SETUPSP,bola,9,bolaimg:|SETUPSP,bola,7,0
3820 return

3899' megaexplosion
3900 for i=0 to 25
3910 ex=rnd*14+peek(27483): ey=rnd*10+peek (27481): sp=20+ (i mod 10 )
3920 |SETUPSP,sp,0,5:|SETUPSP,sp,7,4: |LOCATESP,sp,ey,ex
3930 |PRINTSPALL:|STARS: |AUTOALL:gosub 500: gosub 750
3940 next
3950 return

3999' FASE superada!
4000 gosub 800:cls: nivel=2:|MUSICOFF
4001 locate 3,2: PEN 1: print "ARKARON DESTROYED!"
4002 |SETUPSP,0,7,5:'|PRINTSP,0,36,34
4010 locate 6,11: PEN 1: print "HOLLOW MOON"
4020 LOCATE 8,13:PEN 11:PRINT "vidas";vidas:LOCATE 8,15:PEN 11:PRINT "pulsa S"
4021 deg
4022 k=k mod 360 +10
4023 sx=4*cos(k):sy=12*sin(k)
4024|PRINTSP,0,35+sy,34+sx
4025 IF INKEY(60)=0 THEN return
4026 goto 4022

4199'FASE LUNAR -------------- ZIGZAG ---------------------------
4200 GOSUB 800:cls:|MUSIC,0,5:'INIT
4210 INK 0,13:'gris
4220 |stars,0,10,5,3,0:'motas
4221 gosub 4600:'init craters y muros
4300 ciclo=30
4301 gosub 5000:gosub 4400
4310 gosub 500: gosub 750:|AUTOALL:|PRINTSPALL:|STARS
4311 |COLSPALL: if sp<32 then if sp=31 then gosub 300:goto 4200 else gosub 770
4320 ciclo=ciclo+1:if ciclo mod 30 =0 then gosub 4400: 'craters
4321 if ciclo mod 37=0 then gosub 4500:'muros
4322 IF CICLO MOD 2=0 THEN k=k mod 10 +1: dirsp=27310+16*k: vx=peek (dirsp):|SETUPSP,k+19,6,-vx:
4323 if ciclo MOD 150=0 then if ciclo<400 then gosub 5000 else return :' condicion de salida
4390 GOTO 4310


4399' rutina de colocacion de craters
4400 crsp=crsp+1: if crsp=3 then crsp=0
4410 |LOCATESP,crsp,-30,rnd*50+10
4420 return 

4499' rutina de colocacion de muros
4500 mu=-mu
4510 if mu=1 then |locateSP,3,-16,0 ELSE |locateSP,4,-16,76
4520 return 

4599' rutina init craters y muros
4600 for i=0 to 4:|SETUPSP,i,9,craterimg:|SETUPSP,i,0,9:|SETUPSP,i,5,3,0
4601 if craterinit=0 then |LOCATESP,i,1000,0
4602 next: craterinit=1
4610 mu=1:|SETUPSP,3,9,murol:|SETUPSP,4,9,muror
4620 return 


4999' preparacion rojas zigzag. solo en el ciclo inicial
5000 '
5002 vx=1:sp=0:|COLSP,32,20,30:for i=20 to 29
5010 |SETUPSP,i,9,navemala6:|SETUPSP,i,0,11:|LOCATESP,i,-30*(i-19),38
5020 |SETUPSP,i,5,5,vx: vx=-vx:|SETUPSP,i,7,0
5030 gosub 500: gosub 750:|AUTOALL:|PRINTSPALL:|STARS
5031 |COLSPALL: if sp<32 then if sp=31 then gosub 300:goto 4200 else gosub 770
5040 next
5050 return


5999' FASE LUNAR 2 -----  AVIONES -----------------------
6000'
6010 gosub 4600:'init craters y muros
6020 gosub 6200:'init orda
6030 gosub 500: gosub 750:|AUTOALL:|PRINTSPALL:|STARS
6040 |COLSPALL: if sp<32 then if sp=31 then gosub 300:|MUSIC,0,5:goto 6010 else gosub 770
6050 ciclo=ciclo+1:if ciclo mod 30 =0 then gosub 4400: 'craters
6060 if ciclo mod 37=0 then gosub 4500:'muros
6061 ' aqui va la logica de la orda. podria una sola linea pero no cabe en basic amstrad
6062 if ciclo mod 10=0 then avsp=avsp mod 5+1:|LOCATESP,avsp+9,-25,8+rnd*60:|SETUPSP,avsp+9,0,11:|SETUPSP,avsp+9,9,avionimg:|SETUPSP,avsp+9,6,0: av2sp=(avsp +3) mod 5:avdir=27163+av2sp*16: flag=1:GOTO 6030
6063 if flag=1 then flag=0:if peek(avdir)>40 then |SETUPSP,av2sp+10,6,-1 else |SETUPSP,av2sp+10,6,1: GOTO 6030
6064 if ciclo>800 then return
6070 GOTO 6030

6199' rutina inicializacion orda de 5 aviones
6200 for i=10 to 14:|SETUPSP,i,9,avionimg:|SETUPSP,i,0,11:|SETUPSP,i,5,5,0:|LOCATESP,i,-1000,0:next
6201 |COLSP,32,10,30: blandos=10:duros=100:semis=100
6280 return

6499' FASE LUNAR 3---------------- DESFILADERO -----------------
6500 ciclo=0: |music,1,5
6510 gosub 500: gosub 750:|AUTOALL:|PRINTSPALL:|STARS
6520 ciclo=ciclo+1:if ciclo< 100 goto 6510
6530 ' ya no hay craters
6540 ciclo=0:|STARS,0,10,0,0,0: 'fin stars
6541 gosub 6600: 'init desfiladero
6550 gosub 500: gosub 750:|AUTOALL:|PRINTSPALL
6551'nueva logica
6552 if ciclo <=48 then if ciclo mod 8=0 then gosub 6800: goto 6559
6553 if ciclo>=400 then if  ciclo mod 8=0 then goto 6900
6555 if ciclo mod 8=0 then gosub 6700
6556 if ciclo mod 24=0 then |SETUPSP,mina,0,11:|SETUPSP,mina,5,3,0:|SETUPSP,mina,9,minaimg:|LOCATESP,mina,-20,(xl+xr)/2:mina=(mina+1)mod 4
6559 |COLSPALL: if sp<32 then if sp=31 then gosub 300:|MUSIC,1,5:goto 6500 else gosub 770
6560 ciclo=ciclo+1
6570 goto 6550

6599' init desfiladero
6600 des=10: |COLSP,32,0,30: duros=10:blandos =0
6601 for i=10 to 30: |SETUPSP,i,5,3,0:|LOCATESP,i,200,0:|SETUPSP,i,0,11:next
6602 for i=0 to 3:|SETUPSP,i,5,3,0:|LOCATESP,i,200,0:|SETUPSP,i,0,11:next
6679 xl=-4:xr=80: mina=0
6680 return

6699'logica de desfiladero
6700 des=des+1: if des=20 then des=10
6701 if xl > 30 THEN img=rocall: |SETUPSP,des,9,img: |LOCATESP,des,-24,xl:xl=xl-4:goto 6730
6702 if xl < 0 THEN img=rocalr:xl=xl+4: |SETUPSP,des,9,img:|LOCATESP,des,-24,xl:goto 6730
6703 azar=int(rnd*2)
6704 if azar=1 THEN img=rocall: |SETUPSP,des,9,img: |LOCATESP,des,-24,xl:xl=xl-4:goto 6730
6705 img=rocalr:|SETUPSP,des,9,img:xl=xl+4:|LOCATESP,des,-24,xl
6710 ' ahora el lado derecho
6730 if xr<xl+30 then img=rocarr:|SETUPSP,des+10,9,img:|LOCATESP,des+10,-24,xr:xr=xr+4: return
6740 xr=xr-4:img=rocarl:|SETUPSP,des+10,9,img:|LOCATESP,des+10,-24,xr: return

6799'estrechamiento inicial
6800 des=des+1:img=rocalr:xl=xl+4: |SETUPSP,des,9,img:|LOCATESP,des,-24,xl:xr=xr-4:img=rocarl:|SETUPSP,des+10,9,img:|LOCATESP,des+10,-24,xr:return

6899' ensanchamiento final
6900 des=des+1: if des>20 then des=10
6901 img=rocall: |SETUPSP,des,9,img:|LOCATESP,des,-24,xl:xl=xl-4
6902 img=rocarr:|SETUPSP,des+10,9,img:|LOCATESP,des+10,-24,xr:xr=xr+4
6910 if ciclo>=600 then return
6920 goto 6559


6999' 3 JEFES
7000 gosub 800:|MUSIC,1,5
7001 ' inicio de 18 disparos bola
7002 for i=10 to 27: |SETUPSP,i,0,&x0:next: bola=20: |COLSP,32,10,30
7010 |SETUPSP,28,7,5: |SETUPSP,28,0,15: |SETUPSP,28,5,0,0:'jefe1
7011 |SETUPSP,29,7,5: |SETUPSP,29,0,15: |SETUPSP,29,5,0,0:'jefe2
7012 |SETUPSP,30,7,5: |SETUPSP,30,0,15: |SETUPSP,30,5,0,0:'jefe3
7020 for jy=-30 to 40
7030 |LOCATESP,28,jy-30,34:|LOCATESP,29,jy,54:|LOCATESP,30,jy+30,14:
7031 gosub 500:gosub 750:|AUTOALL:|PRINTSPALL
7040 NEXT


7050 ciclo=30: vj1=1:vj2=1:vj3=-1:semis=28:semi(28)=100:semi(29)=100:semi(30)=100:duros=100: blandos=10:mins=90
7051 |SETUPSP,28,5,0,vj1:|SETUPSP,29,5,0,vj2:|SETUPSP,30,5,0,vj3
7052 sig1=ciclo+30:sig2=ciclo+10: sig3=ciclo+10:j=0:maxbola=27:minbola=10:bola=minbola
7100 gosub 500: gosub 750
7110 |AUTOALL:|PRINTSPALL
7120 |COLSPALL: if sp<32 then if sp=31 then gosub 300:goto 7000 else gosub 770
7121 if ciclo>sig1 then vj1=-vj1:|SETUPSP,28,6,vj1:sig1=ciclo+60:goto 7124
7122 if ciclo>sig2 then vj2=-vj2:|SETUPSP,29,6,vj2:sig2=ciclo+60:goto 7124
7123 if ciclo>sig3 then vj3=-vj3:|SETUPSP,30,6,vj3:sig3=ciclo+60
7124 ciclo=ciclo+1
7125 if ciclo mod 8=0 then oy=10+peek (27433+16*j): ox=7+peek(27435+16*j):j=j mod 3 +1:gosub 3800
7130 if semi(28)<mins then if  semi(29)<mins then if semi(30)<=mins then 8000 :'condicion salida
7190 goto 7100


8000' megaexplosion
8001 |SETUPSP,28,0,0:|SETUPSP,29,0,0:|SETUPSP,30,0,0
8010 for i=0 to 50
8020 dir=27451+(i mod 3)*16
8030 ex=rnd*14+peek(dir): ey=rnd*10+peek (dir-2): sp=10+ (i mod 18 )
8040 |SETUPSP,sp,0,5:|SETUPSP,sp,7,4: |LOCATESP,sp,ey,ex
8050 |PRINTSPALL: |AUTOALL:gosub 500: gosub 750
8060 next
8070 return

8499' final del juego
8500 mode 0: ink 0,0: |MUSIC,2,6
8510 LOCATE 2,3:PEN 1:print "Enhorabuena, Enki!"
8520 LOCATE 3,5:PEN 10: print "Has derrotado las razas alienigenas que amenazaban la Tierra "
8530 print "Ahora puedes esclavizar a los humanos.  La tierra es tuya"
8531 |SETUPSP,0,9,tierra: |PRINTSP,0,112,40
8532 |SETUPSP,1,9,navend: |PRINTSP,1,148,25
8540 LOCATE 12,22:PEN 7:PRINT "pulsa S "
8550 IF INKEY(60)=0 THEN return
8551 |STARS,0,20,4,4,-2:|STARS,20,20,3,2,-1
8560 goto 8550


8999'space hawks
9000 ciclo=0:maxciclos=200: blandos=10: duros=100:semis=100:gosub 9230:|COLSP,32,10,30:j=1:minbola=25:maxbola=30:bola=minbola
9001 for i=10 to 24
9002 |SETUPSP,i,7,6:|SETUPSP,i,0,31:|SETUPSP,i,5,1,0
9003 |LOCATESP,i,int((i-10)/5)*30-100,10+(i mod 5)*16
9004 gosub 500:gosub 750:|PRINTSPALL:|STARS: 
9005 next
9006 ciclo=ciclo+1: f=ciclo mod 24
9007 |MOVERALL,ry(f),rx(f):|AUTOALL
9008 gosub 500: gosub 750:|PRINTSPALL:|STARS:
9009 |COLSPALL: if sp<32 then if sp=31 then gosub 300:|MUSIC,0,5:goto 9000 else gosub 770
9010 if f=0 then if ciclo<200  then j=j mod 15 +1: dirp=(27400-16*j):if peek (dirp)> 0 then oy=2+peek (dirp+1): ox=2+peek(dirp+3):gosub 3800
9011 if ciclo >300 then return else goto 9006


9230' init mov relativo pajaros
9240 rx(0)=1:ry(0)=2
9250 rx(1)=1:ry(1)=2
9260 rx(2)=1:ry(2)=2
9270 rx(3)=0:ry(3)=2
9280 rx(4)=0:ry(4)=2
9290 rx(5)=0:ry(5)=2
9300 rx(6)=-1:ry(6)=2
9310 rx(7)=-1:ry(7)=2
9320 rx(8)=-1:ry(8)=2
9330 rx(9)=-1:ry(9)=0
9340 rx(10)=-1:ry(10)=0
9350 rx(11)=-1:ry(11)=0
9360 rx(12)=-1:ry(12)=-2
9370 rx(13)=-1:ry(13)=-2
9380 rx(14)=-1:ry(14)=-2
9390 rx(15)=0:ry(15)=-2
9400 rx(16)=0:ry(16)=-2
9401 rx(17)=0:ry(17)=-2
9402 rx(18)=1:ry(18)=-2
9403 rx(19)=1:ry(19)=-2
9404 rx(20)=1:ry(20)=-2
9405 rx(21)=1:ry(21)=0
9406 rx(22)=1:ry(22)=0
9407 rx(23)=1:ry(23)=0
9408 return

10000 |musicoff:mode 2: ink 1,24: end
