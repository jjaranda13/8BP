10 MEMORY 23999
20 ON BREAK GOSUB 40
30 GOTO 50
40 |MUSICOFF:CALL &BC02:PAPER 0:PEN 1:MODE 1:END
50 CALL &BC02: CALL &6B78:|3d,0
51 mode 1: locate 1,10:print "tras ejecutar esta demo se escribira el laberinto en la misma zona de memoria que se dibuja el mapa 3D por lo que la demo5 dejara de funcionar"
52 locate 1,20:input "pulsa enter",a$
60 DEFINT A-Z:MODE 0
70 brick=41:fondo=42
80 INK 1,13: INK 0,0:INK 2,0:INK 3,0:INK 6,6: INK 10,24:INK 11,24
90 GOSUB 230:'pinta layout
100 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:'reset sprites
110 y=16:x=4
120 col=0:|COLAY,65,@col,31:cor=0:cod=0:|COLSPALL,@cor,@cod
130 |SETUPSP,31,9,43:|LOCATESP,31,y,x:|SETUPSP,31,0,65+8:' bolita
140 'ciclo de juego
150 |AUTOALL:|PRINTSPALL:|COLSPALL
170 IF INKEY(27) THEN 180
171 vyn=0:vxn=1:goto 205
180 IF INKEY(34) THEN 190
181 vyn=0:vxn=-1:goto 205
190 IF INKEY(67) THEN 200
191 vyn=-4:vxn=0:goto 205
200 IF INKEY(69) THEN 205
201 vyn=4:vxn=0
'205 if c mod 4=0 then vx=vxn:vy=vyn:|SETUPSP,31,5,vy,vx: |MOVER,31,vy,vx:|COLAY,31,@col:|MOVER,31,-vy,-vx:if col then |SETUPSP,31,5,0,0:vyn=0:vxn=0:
205 if c mod 4=0 then |SETUPSP,31,5,vyn,vxn:|MOVER,31,vyn,vxn:|COLAY:|MOVER,31,-vyn,-vxn:if col then |SETUPSP,31,5,0,0
205 if c and 3 then 207
206 |SETUPSP,31,5,vyn,vxn:|MOVER,31,vyn,vxn:|COLAY,31:|MOVER,31,-vyn,-vxn:if col then |SETUPSP,31,5,0,0
207 c=c+1
210 GOTO 150
230 'RUTINA CREACION LAYOUT
240 c$(0)="BBBBBBBBBBBBBBBBBBBB"
250 c$(1)="BAAAAAAAAAAAAAAAAAAB"
260 c$(2)="BABBBABBBABBBABBBBAB"
270 c$(3)="BABBBAAAAAAAAABBBBAB"
280 c$(4)="BAAAAABBBBBBBABBBBAB"
290 c$(5)="BAAAAAAAAAAAAAAAAAAB"
300 c$(6)="BAAAAAAAAAAAAAAAAAAB"
310 c$(7)="BAAAAAAAAAAAAAAAAAAB"
320 c$(8)="BAAAAAAAAAAAAAAAAAAB"
330 c$(9)="BBBBBBBBBBBBBBBBBBBB"
340 |SETUPSP,6,9,fondo
350 |SETUPSP,7,9,brick
360 FOR i=0 TO 9
370 |LAYOUT,i*2,0,@c$(i):
380 |LAYOUT,i*2+1,0,@c$(i):
390 NEXT
395 locate 2,23:print "DEMO LAYOUT"
400 RETURN