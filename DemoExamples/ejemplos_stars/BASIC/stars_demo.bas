10 MEMORY 26999
20 CALL &6B78:' install RSX   
30 ON BREAK GOSUB 5000
40 mode 0:CALL &BC02:'restaura paleta por defecto por si acaso
50 banco=42540
60 FOR dir=banco TO banco+40*2 STEP 8:
70 y=INT(RND*190):x=INT(RND*60)+4
80 POKE dir,y:POKE dir+1,x:
90 POKE dir+2,(y+4):POKE dir+3,x-1
100 POKE dir+4,(y+8):POKE dir+5,x-2
110 POKE dir+6,(y+12):POKE dir+7,x-3
120 NEXT

140 'ESCENARIO DE LLUVIA
141 '--------------------
150 |SETLIMITS,0,80,50,200: ' limites de la pantalla de juego
151 cesped=&84d0:|SETUPSP,30,9,cesped:'letra Y es el sprite 31
152 rocas=&84f2:|SETUPSP,21,9,rocas: 'letra P es el sprite 21
160 cadena$="YYYYYYYYYYYYYYYYYYYY"
170 |LAYOUT,22,0,@cadena$:'esto pinta el cesped
180 cadena$="PPPPPPPPPPPPPPPPPPPP"
190 |LAYOUT,23,0,@cadena$:'pinta una fila de rocas
200 |LAYOUT,24,0,@cadena$:'pinta otra fila de rocas
210 '----- ciclo de juego--------
211 defint a-z
220 LOCATE 1,10:PRINT "DEMO DE LLUVIA"
221 LOCATE 1,11:PRINT "pulsa ENTER"
230 |STARS,0,40,4,2,-1
240 IF INKEY(18)=0 THEN 300
250 GOTO 230

300 'ESCENARIO DE ESTRELLAS
310 '----------------------
311 defreal a-z:banco=42540
312 mode 0
320 FOR star=0 TO 40
330 POKE banco+star*2,RND*200
340 POKE banco+star*2+1,RND*80
350 NEXT
360 |SETLIMITS,0,80,0,200
361 LOCATE 1,10:PRINT "DEMO DE ESTRELLAS"
362 LOCATE 1,11:PRINT "pulsa ENTER"
363 defint a-z
370 '----- ciclo de juego--------
380 |STARS,0,10,3,1,0  
390 |STARS,10,10,2,2,0       
400 |STARS,20,10,1,3,0
410 |STARS,30,10,4,4,0
420 IF INKEY(18)=0 THEN 500
430 GOTO 380


500 ' ESCENARIO DE NIEVE
510 '-------------------
511 mode 0: |SETLIMITS,0,80,9,200: ' limites de la pantalla de juego
512 LOCATE 1,1:PRINT "DEMO DE NIEVE"
513 defreal a-z
520 FOR dir=42540 TO 42619 STEP 2
530 POKE dir,RND*200:POKE dir+1,RND*80
540 NEXT: defint a-z
550 |STARS,0,20,4,2,dx1
560 |STARS,20,20,4,1,dx2
570 dx1=1*COS(i):dx2=SIN(i)
580 i=i+1: IF i=359 THEN i=0
581 IF INKEY(18)=0 THEN 700
590 GOTO 550


700 ' ESCENARIO DE TIERRA
710 '----------------------
711 mode 0: |SETLIMITS,0,80,9,200: ' limites de la pantalla de juego
712 defreal a-z
713  LOCATE 1,1:PRINT "DEMO DE TIERRA"
720 casa=&8514: |SETUPSP,1,9,casa:|SETUPSP,2,9,casa:|SETUPSP,3,9,casa:
721 |locatesp,1,0,10:|locatesp,2,150,30:|locatesp,3,50,50
722 for i=1 to 3:|SETUPSP,i,0,&x10001:next:'flag movimiento relativo
730 FOR dir=42540 TO 42618 STEP 2: POKE dir,RND*200:POKE dir+1,RND*80:NEXT
731 defint a-z: ink 0,13: ink 10,0: t=0
740 |stars,0,20,10,2,0
741 |moverall,2,0:|printspall,0,0,0
742 t=t+2
743 if t=50 then |locatesp,2,-40,30
744 if t=150 then |locatesp,3,-40,50
745 if t=200 then |locatesp,1,-40,10
746 if t=240 then t=0
747 IF INKEY(18)=0 THEN 40
750 goto 740
5000 |MUSICOFF
5010 END