10 CALL &6B78
20 dir=&A62C: '42540
30 FOR star=0 TO 40
40 POKE dir+star*2,RND*200
50 POKE dir+star*2+1,RND*80
60 NEXT
61 defint a-z
62 FOR j=0 TO 31:|SETUPSP,j,0,&X0:NEXT:' reset sprites
70 MODE 0: INK 0,0
80 |SETLIMITS,0,80,0,200:|colsp,35,0:'sin margen x en deteccion colision
81 LOCATE 7,5:PEN 11:PRINT "ANUNNAKI"
82 LOCATE 2,9:PEN 13:PRINT "nuestro pasado alien"
83 LOCATE 2,22:PEN 7:PRINT "pulsa S para empezar"
84 LOCATE 10,25:PEN 11:PRINT "JJGA 2016"
85 |SETUPSP,31,9,34000:|SETUPSP,31,7,1 : |PRINTSP,31,11*8,36:'nave
87 disparo=&8738:meteorito=&8746:borradisp=&8732:navemala1=&85a2: disparo=&8aa7:navemala1=&8aca:
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
160 gosub 1000:' fase 1
161 gosub 800
170 gosub 2000:' fase 2
180 gosub 1000:' fase 3
190 gosub 1000:' fase 4
200 goto 20:'vuelta a empezar


299' rutina de muerte ---------------------------
300 |SETUPSP,31,7,3:y=y+2:x=x+1:|LOCATESP,31,y,x:FOR i=1 TO 50: BORDER 7:CALL &BD19:BORDER 0:|ANIMA,31:|AUTOALL:|PRINTSPALL:NEXT 
310  vidas= vidas-1:print peek(27507)
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
711 'locate 1,1:print peek(27112)					     
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
802 yd%=0: dc=0:libre=7:ddisp(1)=27113:ddisp(2)=27129:ddisp(3)=27145
803 for i=7 to 9: ' disparos sprites 7,8,9
804 |SETUPSP,i,9,disparo:|SETUPSP,i,0,0
805 |SETUPSP,i,5,-11: ' Vy del disparo
806 |LOCATESP,i,250,0: 'fuera de pantalla
807 next
809 |SETUPSP,31,0,&x100101:'mi nave no dede tener flag colision
810 |SETUPSP,6,9,borradisp:' esta desactivado
811 |SETUPSP,31,7,1: 'secuencia mi nave
812 col%=32: |colsp,33,@col%
813 sp%=32:|COLSPALL,@sp%
900 return



999' fase 1 ---------METEORITOS--------------
1000 'gosub 800: 'init generico
1001 yd%=0:totalm=6: ini=30-totalm+1:|COLSP,32,ini 'meteoritos sprites 25...30 (6 sprites)
1002 for i=ini to 30
1003 |SETUPSP,i,9,meteorito:|SETUPSP,i,5,5:|SETUPSP,i,0,&x01011:|SETUPSP,i,6,i mod 3 -1:
1004 |LOCATESP,i,-30-(i-ini)*30,rnd*30+10
1005 next
1006 ' tipos de enemigos: blandos, duros . especifico sprite inicial
1007 blandos=25: duros=25
1008 mc=0:'meteorito counter
1009 for i=1 to totalm: dmet(i)=27497-i*16:next
1010 'comienza el ciclo de juego
1020 ciclo=0:|STARS,0,10,2,3,0
1030 |PRINTSPALL,1,0
1031 ciclo=0: maxciclos=200
1500 gosub 500:'mov nave + start disparo
1510 gosub 750:'logica disparo
1511 gosub 1800:'logica meteorito
1512 |COLSPALL: if sp%<32 then if sp%=31 then gosub 300:goto 2000: else gosub 770
1520 |AUTOALL
1530 |PRINTSPALL
1532 |STARS:rem sin parametros repite los ultimos
1533 ciclo=ciclo+1:if ciclo=maxciclos then return:' condicion de salida
1540 goto 1500


1799' logica meteorito (logica masiva)
1800 mc=mc mod totalm +1:rem mc-> meteorito counter
1810 dir=dmet(mc): if ciclo >maxciclos-50 then return: ' a v=5, se recorren 230 en 46 ciclos
1820 |peek,dir,@yd%: if yd%>=200 then |poke,dir,-30:|POKE,dir+2,rnd*40+20
1821 mc2=mc2 mod 3 +1:if mc2=1 then |SETUPSP,mc+ini-1,6,RND*2 -1
1830 return

1999'fase 2------5 NAVES SIMPLES--------
2000 'gosub 800: 'init generico
2001 ciclo=0: maxciclos=115: ordas=3
2002 totaln=12: blandos=31-totaln:duros=100
2003 ini=30-totaln+1:|COLSP,32,ini 
2010 for i=ini to 24
2020 |SETUPSP,i,9,navemala1:|SETUPSP,i,7,0:|SETUPSP,i,5,4:|SETUPSP,i,0,&x01011:|SETUPSP,i,6,0
2030 |LOCATESP,i,-30,(i-ini)*10+10
2040 next
2041 for i=25 to 30
2042 |SETUPSP,i,9,navemala1:|SETUPSP,i,7,0:|SETUPSP,i,5,4:|SETUPSP,i,0,&x01011:|SETUPSP,i,6,0
2043 |LOCATESP,i,-60,(i-25)*10+10:next
2050 |PRINTSPALL,1,0
2051 |STARS,0,10,2,2,0

2190 'ciclo
2191 gosub 500:'nave + start disparo
2192 |COLSPALL: if sp%<32 then if sp%=31 then gosub 300:goto 2000: else gosub 770

2194 gosub 750:'logica disparo, necesita tener hecha la colision.
2200 |AUTOALL
2201 |PRINTSPALL
2210 |STARS
2219 ciclo=ciclo+1:if ciclo=maxciclos then 2240
2220 goto 2190

2240 if ordas=0 then return
2241 ordas=ordas -1
2242 ciclo=0
2243 goto 2010