10 MEMORY 24999:' assembling option 0
11 load "!8bp1.bin"
20 MODE 0: DEFINT A-Z: CALL &6B78:' install RSX
25 ON BREAK GOSUB 280
30 CALL &BC02:'restaura paleta por defecto por si acaso
40 INK 0,0:'fondo negro
50 FOR j=0 TO 31:|SETUPSP,j,0,0:NEXT:'reset sprites
80 |SETLIMITS,12,80,0,186: ' establecemos los limites de la pantalla de juego
90 x=40:y=100:' coordenadas del personaje
91 print "controls: O,P"
92 plot 11*8+4,0,1:draw 11*8+4,300
100 |SETUPSP,0,0,1:' status del personaje
110 |SETUPSP,0,7,1'secuencia de animacion asignada al empezar
120 |LOCATESP,0,y,x:'colocamos al sprite (sin imprimirlo aun)
125 |MUSIC,0,0,5
130 'ciclo de juego
140 GOSUB 180
150 |PRINTSPALL,0,0
160 GOTO 130
170 ' rutina movimiento personaje -------------
180 IF INKEY(27)=0 THEN IF dir<>0 THEN |SETUPSP,0,7,1:dir=0:RETURN ELSE |ANIMA,0:x=x+1:GOTO 200
190 IF INKEY(34)=0 THEN IF dir<>1 THEN |SETUPSP,0,7,2:dir=1:RETURN ELSE |ANIMA,0:x=x-1
200 |LOCATESP,0,y,x
210 RETURN
280 |MUSIC:MODE 1: INK 0,0:PEN 1