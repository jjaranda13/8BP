1 rem este listado requiere haber generado un .dsk con el programa C compilado
2 rem =========================================================================
10 memory 19999
11 LOAD "ciclo.bin",20000: rem cargamos el ciclo de juego compilado
20 MODE 0: DEFINT A-Z: CALL &6B78:' install RSX
21 ENT 1,10,100,3
30 ON BREAK GOSUB 320
40 CALL &BC02:'restaura paleta por defecto por si acaso
50 INK 0,0:'fondo negro
60 FOR j=0 TO 31:|SETUPSP,j,0,0:NEXT:|3D,0:'reset sprites
70 |SETLIMITS,0,80,0,124: ' establecemos los limites de la pantalla de juego
80 PLOT 0,74*2:DRAW 640,74*2
90 x=40:y=100:' coordenadas del personaje
100 PRINT "SCORE:      FPS:"
110 |SETUPSP,31,0,1+32:' status del personaje
120 |SETUPSP,31,7,1'secuencia de animacion asignada al empezar
130 |LOCATESP,31,y,x:'colocamos al sprite (sin imprimirlo aun)
140 |MUSIC,1,0,0,5: puntos=0
150 cor=32:cod=32:|COLSPALL,@cor,@cod:' configura comando de colision
151 locate 1,20:input "basic(1) o C(2)", a: if a=1 then 160 else call &56b0
152 goto 320
160 |PRINTSPALL,0,0,0,0: 'configura comando de impresion
161 POKE &b8b4,0: POKE &b8b5,0: POKE &b8b6,0: POKE &b8b7,0:'reset timer cpc6128. hace falta pues TIME puede retornar un numero muy grande y puede dar overflow con DEDFINT
162 t1=TIME
170 '--- ciclo de juego. Esta es la parte que se ha traducido a C ---
180 c=c+1
190 ' lee el teclado y posiciona al personaje
191 IF INKEY(27)=0 THEN IF dir<>0 THEN |SETUPSP,31,7,1:dir=0 ELSE |ANIMA,31:x=x+1:GOTO 195
192 IF INKEY(34)=0 THEN IF dir<>1 THEN |SETUPSP,31,7,2:dir=1 ELSE |ANIMA,31:x=x-1
195 |LOCATESP,31,y,x
200 |AUTOALL:|PRINTSPALL
210 |COLSPALL
220 IF cod<32 THEN BORDER 7:puntos=puntos-1:SOUND 4,638,30,15,0,1:|SETUPSP,cod,0,9:LOCATE 7,1:PRINT puntos:goto 250 else border 0
221 rem para calcular los FPS tenemos en cuenta que TIME me da en unidades 1/300 segundos y voy a medir cada 20 ciclos. por tanto fps= 20 ciclos x 300 / dt
230 IF c MOD 20=0 THEN puntos=puntos+10 :LOCATE 7,1:PRINT puntos: t2=t1:t1=TIME:fps=6000/(t1-t2):locate 17,1:print fps
240 IF c MOD 5=0 THEN |SETUPSP,i,9,19:|SETUPSP,i,5,4,rnd*3-1:|SETUPSP,i,0,11:|LOCATESP,i,10,RND*80: i=i+1:IF i=30 THEN i=0
250 if c<500 then GOTO 180
251 '--- end ciclo de juego ---
252 |poke,42038,puntos
310 '---fin del juego---
320 |MUSIC:INK 0,0:PEN 1:border 0:|peek,42038,@puntos
330 locate 3,10:print "FINAL SCORE:";puntos