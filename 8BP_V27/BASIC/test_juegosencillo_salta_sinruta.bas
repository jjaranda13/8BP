10 MEMORY 25999
20 MODE 0: DEFINT A-Z: CALL &6B78:' install RSX
25 ON BREAK GOSUB 2800
30 CALL &BC02:'restaura paleta por defecto por si acaso
40 INK 0,0:'fondo negro
50 FOR j=0 TO 31:|SETUPSP,j,0,&X0:NEXT:'reset sprites
60 |SETUPSQ,9,16,17,18,17,0,0,0,0: REM soldado derecha    
70 |SETUPSQ,10,19,20,21,20,0,0,0,0: REM soldado izq
80 |SETLIMITS,12,80,0,186: ' establecemos los limites de la pantalla de juego
90 x=40:y=100:' coordenadas del personaje
100 |SETUPSP,0,0,1:' status del personaje
110 |SETUPSP,0,7,9:'secuencia de animacion asignada al empezar
120 |LOCATESP,0,y,x:'colocamos al sprite (sin imprimirlo aun)
121 DIM salto(24):' datos del salto
122 for i=-5 to 5: k=k+1:salto(k)=i: k=k+1: salto(k)=i:next :salto(1)=-10: salto(23)=5
123 locate 1,1: print "pulsa Q" : print "para saltar": print "ejemplo sin ruta"
125 PLOT 1,150:DRAW 640,150: plot 92,150:draw 92,400:'suelo y pared
126 |MUSIC,0,5: 'comienza a sonar la musica
130 'ciclo de juego ------
150 |LOCATESP,0,y,x:|PRINTSPALL,0,0
151 GOSUB 170
160 GOTO 130:' fin ciclo juego
170 ' rutina movimiento personaje -------------
171 IF jump =0 THEN IF INKEY(67)=0 THEN jump=1:|SETUPSP,0,9,DIR*2+22
180 IF INKEY(27)=0 THEN x=x+1:if jump=0 then IF dir<>0 THEN |SETUPSP,0,7,9:dir=0:x=x-1:RETURN ELSE |ANIMA,0:GOTO 210
190 IF INKEY(34)=0 THEN x=x-1:if jump=0 then IF dir<>1 THEN |SETUPSP,0,7,10:dir=1:x=x+1:RETURN ELSE |ANIMA,0
210 if jump=0 then RETURN
260 'rutina de salto ------------
270 IF jump=11 THEN |SETUPSP,0,9,DIR*2+23 ELSE IF jump=23 THEN y=y+salto(jump):jump=0:|SETUPSP,0,7,DIR+9:return
280 y=y+salto(jump)
300 jump=jump+1
310 return

2800 |MUSICOFF:MODE 1: INK 0,0:PEN 1