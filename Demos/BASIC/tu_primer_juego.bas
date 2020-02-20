10 MEMORY 23999
20 MODE 0: DEFINT A-Z: CALL &6B78:' install RSX
30 ON BREAK GOSUB 320
40 CALL &BC02:'restaura paleta por defecto por si acaso
50 INK 0,0:'fondo negro
60 FOR j=0 TO 31:|SETUPSP,j,0,0:NEXT:|3D,0:'reset sprites
70 |SETLIMITS,0,80,0,124: ' establecemos los limites de la pantalla de juego
80 PLOT 0,74*2:DRAW 640,74*2
90 x=40:y=100:' coordenadas del personaje
100 PRINT "SCORE:"
110 |SETUPSP,31,0,1+32:' status del personaje
120 |SETUPSP,31,7,1'secuencia de animacion asignada al empezar
130 |LOCATESP,31,y,x:'colocamos al sprite (sin imprimirlo aun)
140 |MUSIC,0,0,5
150 cor=32:cod=32:|COLSPALL,@cor,@cod:' configura comando de colision
160 'ciclo de juego
170 |PRINTSPALL,0,0,0,0: 'la primera vez con parametros
180 c=c+1
190 GOSUB 270:' lee el teclado y posiciona al personaje
200 |AUTOALL:|PRINTSPALL
210 |COLSPALL
220 IF cod<32 THEN BORDER 7:|MUSIC:SOUND 1,1000,100,14,0,0,1:end
230 IF c MOD 20=0 THEN LOCATE 7,1:PRINT c
240 IF c MOD 5=0 THEN |SETUPSP,i,9,19:|SETUPSP,i,5,4,rnd*3-1:|SETUPSP,i,0,11:|LOCATESP,i,10,RND*80: i=i+1:IF i=30 THEN i=0
250 GOTO 180
260 ' rutina movimiento personaje -------------
270 IF INKEY(27)=0 THEN IF dir<>0 THEN |SETUPSP,31,7,1:dir=0:RETURN ELSE |ANIMA,31:x=x+1:GOTO 290
280 IF INKEY(34)=0 THEN IF dir<>1 THEN |SETUPSP,31,7,2:dir=1:RETURN ELSE |ANIMA,31:x=x-1
290 |LOCATESP,31,y,x
300 RETURN
310 '---fin del juego---
320 |MUSIC:MODE 1: INK 0,0:PEN 1