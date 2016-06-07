10 CALL &6B78
20 dir=&A62C: '42540
30 FOR star=0 TO 40
40 POKE dir+star*2,RND*200
50 POKE dir+star*2+1,RND*80
60 NEXT
61 defint a-z
62 dim rx(30): dim ry(30): 'array mov relativo
63 deg:for i=0 to 14:rx(i)=round(sin(i*360/15)):next:'trayectoria zigzag
65 FOR j=0 TO 31:|SETUPSP,j,0,&X0:NEXT:' reset sprites
70 MODE 0: INK 0,0
80 |SETLIMITS,0,80,0,200:|colsp,34,1,0:'sin margen x en deteccion colision
81 LOCATE 7,5:PEN 11:PRINT "ANUNNAKI"
82 LOCATE 2,9:PEN 13:PRINT "nuestro pasado alien"
83 LOCATE 2,22:PEN 7:PRINT "pulsa S para empezar"
84 LOCATE 10,25:PEN 11:PRINT "JJGA 2016"
85 |SETUPSP,31,9,34000:|SETUPSP,31,7,1 : |PRINTSP,31,11*8,36:'nave
87 disparo=&8744:meteorito=&8752:borradisp=&873e:navemala1=&85a2: disparo=&8ab3:navemala1=&8ad6:
88 vidas =3
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
160 gosub 1000:' fase 1 meteoritos
170 gosub 2000:' fase 2 ordas simples
180 gosub 2500:' fase 3 ordas zigzag
190 gosub 3000:' fase 4
200 goto 63:'vuelta a empezar


299' rutina de muerte ---------------------------
300 |SETUPSP,31,7,3:y=y+2:x=x+1:|LOCATESP,31,y,x:FOR i=1 TO 50: BORDER 7:CALL &BD19:BORDER 0:|ANIMA,31:|AUTOALL:|PRINTSPALL:NEXT 
310  vidas= vidas-1
311 |MUSICOFF:LOCATE 7,9:PEN 1:PRINT " NIVEL"; nivel
320 LOCATE 7,11:PEN 15:PRINT " VIDAS"; vidas: PEN 1
330 FOR i=1 TO 50: CALL &BD19:NEXT :CLS
331 |SETUPSP,31,7,1:' secuencia normal
332 vivo=1: IF vidas=0 THEN RUN
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
715 timer=4:'separo disparos en el tiempo
720 return

749' logica fin disparo (logica masiva)--------------------------
750 dc=dc mod 3 +1:dir=ddisp(dc):|peek,dir,@yd%: if yd%<-10 then poke dir-1,0: |POKE,dir,200:nd=nd-1
754 return: 

769' rutina colision disparo----------------------------------
770 dir=ddisp(sp%-6): 'primero paro el disparo y luego actuo segun el tipo de enemigo 
775 poke dir-1,0: nd=nd-1:|PRINTSP,6,peek(dir),peek(dir+2): poke dir,255
777 if col%>=duros then return
780 if col%>=blandos then |SETUPSP,col%,7,4:|SETUPSP,col%,0,&x101:return 'secuencia de muerte sin colision
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
812' col%=32: |colsp,33,@col%
813 col%=32:sp%=32:|COLSPALL,@sp%,@col%
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
1009 for i=1 to totalm: dmet(i)=27449-i*16:next
1010 'comienza el ciclo de juego
1020 ciclo=0:|STARS,0,10,2,3,0
1030 |PRINTSPALL,1,0
1031 ciclo=0: maxciclos=200
1500 gosub 500:'mov nave + start disparo
1510 gosub 750:'logica disparo
1511 gosub 1800:'logica meteorito
1520 |AUTOALL: |PRINTSPALL: |STARS
1533 ciclo=ciclo+1:if ciclo=maxciclos then return:' condicion de salida
1534 |COLSPALL: if sp%<32 then if sp%=31 then gosub 300:goto 1000: else gosub 770
1540 goto 1500
1799' logica meteorito (logica masiva)
1800 mc=mc mod totalm +1:rem mc-> meteorito counter
1810 dir=dmet(mc): if ciclo >maxciclos-50 then return: ' a v=5, se recorren 230 en 46 ciclos
1820 |peek,dir,@yd%: if yd%>=200 then |poke,dir,-30:|POKE,dir+2,rnd*40+20
1821 mc2=mc2 mod 3 +1:if mc2=1 then |SETUPSP,mc+ini-1,6,RND*2 -1
1830 return



1999'fase 2------12 NAVES SIMPLES, 2 ordas--------
2000 'gosub 800: 'init generico
2000 ciclo=0: maxciclos=90: ordas=1 : ' 2 ordas (2,1,0)
2002 totaln=12: blandos=31-totaln:duros=100
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
2502 totaln=12: blandos=31-totaln:duros=100
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


2999' fase 4 ----trayectorias en dos hileras simetricas configurables por k(i), kx(i),ky(i)-------------
3000 totaln=12: blandos=31-totaln:duros=100: ini=19
3001 for i=0 to 10: k(i)=1000:next:k(0)=7: k(1)=90: kx(0)=0:ky(0)=-4:k(10)=20:finm=1:inim=0
3010 for i=ini to 24
3020 |SETUPSP,i,9,navemala1:|SETUPSP,i,7,0:|SETUPSP,i,5,3:|SETUPSP,i,0,&x01011:|SETUPSP,i,6,-1
3021 |SETUPSP,i+6,9,navemala1:|SETUPSP,i+6,7,0:|SETUPSP,i+6,5,3:|SETUPSP,i+6,0,&x01011:|SETUPSP,i+6,6,1
3030 |LOCATESP,i,-30-(i-ini)*26,80+(i-ini)*10:|LOCATESP,i+6,-30-(i-ini)*26,0-(i-ini)*10:
3040 |STARS:gosub 500:gosub 750:|AUTO,7:|AUTO,8:|AUTO,9:|PRINTSPALL,1,0
3050 next
3060 ciclo=0: t=0
3100 gosub 500:gosub 750
3109 |AUTOALL:|PRINTSPALL:|STARS
3120 |COLSPALL: if sp<32 then if sp=31 then gosub 300:goto 3000 else gosub 770
3130 ciclo=ciclo+1: if ciclo =9 then 3300 
3140 goto 3100
3299 'trayectorias configurables con ki
3300 ciclo=0:t=t+1: if t>=k(10) then return:'condicion de salida
3302 for m=inim to finm
3303 if t>=k(m) and t<k(m)+6 then i= t-k(m)+ini:|SETUPSP,i,5,ky(m):|SETUPSP,i,6,kx(m):|SETUPSP,i+6,5,ky(m):|SETUPSP,i+6,6,kx(m):fm=m
3304 next:finm=fm+1:inim=finm-2: if inim<0 then inim=0:' se comprueban 4 nodos
3305 goto 3100

