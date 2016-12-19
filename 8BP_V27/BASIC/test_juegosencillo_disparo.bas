10 MEMORY 25999
20 MODE 0: DEFINT A-Z: CALL &6B78:' install RSX
25 ON BREAK GOSUB 280
30 CALL &BC02:'restaura paleta por defecto por si acaso
40 INK 0,0:'fondo negro
50 FOR j=0 TO 31:|SETUPSP,j,0,&X0:NEXT:'reset sprites
80 |SETLIMITS,12,80,0,186: ' establecemos los limites de la pantalla de juego
90 x=40:y=100:' coordenadas del personaje
100 |SETUPSP,0,0,1:' status del personaje
110 |SETUPSP,0,7,1:dir=1:'secuencia de animacion asignada al empezar
120 |LOCATESP,0,y,x:'colocamos al sprite (sin imprimirlo aun)
125 |MUSIC,0,6
126 for i=1 to 4:|SETUPSP,10+i,9,26:next:'disparos
127 locate 1,1: print "pulsa space":print " para disparar"
130 'ciclo de juego
150 |AUTOALL,1:|PRINTSPALL,0,0
170 ' rutina movimiento personaje -------------
180 IF INKEY(27)=0 THEN IF dir=2 THEN dir=1:|SETUPSP,0,7,dir ELSE |ANIMA,0:x=x+1:GOTO 191
190 IF INKEY(34)=0 THEN IF dir=1 THEN dir=2:|SETUPSP,0,7,dir ELSE |ANIMA,0:x=x-1
191 IF espera<ciclo-10 then if INKEY(47)=0 THEN espera=ciclo:disp= 1+ disp mod 4:|LOCATESP,10+disp,y+8,x:|SETUPSP,10+disp,0,137:|SETUPSP,10+disp,15,2+dir
200 |LOCATESP,0,y,x
201 ciclo=ciclo+1
210 goto 150
280 |MUSICOFF:MODE 1: INK 0,0:PEN 1