10 MEMORY 25999
20 MODE 0: DEFINT A-Z: CALL &6B78:' install RSX
25 ON BREAK GOSUB 2800
30 CALL &BC02:ink 0,0:'restaura paleta por defecto 
50 FOR j=0 TO 31:|SETUPSP,j,0,0:NEXT:'reset sprites
80 |SETLIMITS,12,80,0,186: ' establecemos los limites de la pantalla de juego
90 x=40:y=100:jump=0:ciclo=40:' coordenadas del personaje
100 |SETUPSP,0,0,13:|SETUPSP,0,5,0,0:' status del personaje
110 |SETUPSP,0,7,1:|SETUPSP,0,7,32:'secuencia de animacion asignada al empezar
120 |LOCATESP,0,y,x:'colocamos al sprite (sin imprimirlo aun)
123 locate 1,1: print "pulsa Q" : print "para saltar": print "ejemplo con ruta"
124 print "pulsa SPACE para disparar"
125 PLOT 1,150:DRAW 640,150: PLOT 92,150:DRAW 92,400:'suelo y pared
126 for i=1 to 4:|SETUPSP,10+i,9,26:next:'disparos
127 |MUSIC,0,5: 'comienza a sonar la musica
130 'ciclo de juego ------
150 |AUTOALL,1:|PRINTSPALL,0,1,0
170 ' rutina movimiento personaje -----
171 IF INKEY(67)+jump=0 THEN  jump=ciclo:|SETUPSP,0,0,141:|SETUPSP,0,15,dir
172 IF espera<ciclo-10 then if INKEY(47)=0 THEN espera=ciclo:disp= 1+ disp mod 4:|LOCATESP,10+disp,peek(27001)+8,peek(27003):|SETUPSP,10+disp,0,137:|SETUPSP,10+disp,15,3+dir
173 IF jump>0 THEN 192 ELSE |SETUPSP,0,6,0
180 IF INKEY(27)=0 THEN dir=0:|SETUPSP,0,6,1: GOTO 192
190 IF INKEY(34)=0 THEN dir=1:|SETUPSP,0,6,-1:GOTO 192
192 IF ciclo-jump=20 THEN jump=0:|MOVER,0,5,0:|SETUPSP,0,6,1-DIR*2
193 ciclo=ciclo+1
310 goto 130
2800 |MUSICOFF:MODE 1: INK 0,0:PEN 1