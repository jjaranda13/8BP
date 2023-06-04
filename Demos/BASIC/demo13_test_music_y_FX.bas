10 MEMORY 24999
11 load "8bp1.bin": banco=42540
12 for dir=banco to banco+40*2 step 2: y=int(rnd*200):x=int(rnd*80):poke dir,y:poke dir+1,x:next
20 MODE 0: DEFINT A-Z: CALL &6B78:' install RSX
21 ENT 1,10,10,2 
25 ON BREAK GOSUB 2800
30 CALL &BC02:INK 0,0:'restaura paleta por defecto 
50 FOR j=0 TO 31:|SETUPSP,j,0,0:NEXT:'reset sprites
80 |SETLIMITS,12,80,0,125:|3d,0
90 x=40:y=100:jump=0:ciclo=40:' coordenadas del personaje
100 |SETUPSP,0,0,13:|SETUPSP,0,5,0,0:' status del personaje
110 |SETUPSP,0,7,1:|SETUPSP,0,7,32:'secuencia de animacion asignada al empezar
120 |LOCATESP,0,y,x:'colocamos al sprite (sin imprimirlo aun)
121 LOCATE 2,20: PRINT "8BP MUSIC and FX"
122 c$= "EJEMPLO DE SALTO CON RUTA Y FLIP":|PRINTAT,0,10,14,@c$
123 c$= "USA Q,O,P PARA MOVERTE":|PRINTAT,0,30,14,@c$
124 c$= "PULSA SPACE PARA DISPARAR":|PRINTAT,0,50,14,@c$
125 PLOT 1,150,1:DRAW 640,150: PLOT 92,150:DRAW 92,400:'suelo y pared
126 FOR i=1 TO 4:|SETUPSP,10+i,9,26:NEXT:'disparos
127 |MUSIC,1,0,1,6: 'comienza a sonar la musica. chanel C OFF
128 |STARS,0,10,12,1,1 
129 c$= "2 CHANNELS FOR MUSIC, 1 CHANNEL FOR FX":|PRINTAT,0,130,2,@c$
130 'ciclo de juego ------
150 |AUTOALL,1:|PRINTSPALL,0,1,0
170 ' rutina movimiento personaje -----
172 IF INKEY(47)=0 THEN IF espera<ciclo-10 THEN SOUND 4,100,15,14,,1:espera=ciclo:disp= 1+ disp MOD 4:|LOCATESP,10+disp,PEEK(27001)+8,PEEK(27003):|SETUPSP,10+disp,0,137:|SETUPSP,10+disp,15,3+dir
173 IF PEEK(27000)>128 THEN 193 ELSE |SETUPSP,0,6,0: ' si estado es >128 es que estoy saltando (tiene ruta)
174 IF INKEY(67)=0 THEN |SETUPSP,0,0,137:|SETUPSP,0,15,dir:'saltar
180 IF INKEY(27)=0 THEN dir=0:|SETUPSP,0,6,1:'ir derecha
190 IF INKEY(34)=0 THEN dir=1:|SETUPSP,0,6,-1:'ir izquierda
193 ciclo=ciclo+1
194 |STARS
310 GOTO 150
2800 |MUSIC:MODE 1: INK 0,0:PEN 1