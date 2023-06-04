10 memory 24999
11 load "8bp1.bin"
12 ON BREAK GOSUB 14
13 GOTO 20
14 |MUSIC:CALL &BC02:PAPER 0:PEN 1:MODE 1:END
20 CALL &BC02
30 DEFINT A-Z:MODE 0
50 CALL &6B78
60 |3d,0:|SETLIMITS,0,80,0,200:for i=0 to 31:|SETUPSP,i,0,0:next:'reset sprites
70 ' todas las naves colocada en la misma coordenada inicial
75 ' y con la misma ruta pero con un numero inicial de pasos distinto
76 locate 2,3: print "comando |ROUTESP "
80 for s=16 to 21:|SETUPSP,s,9,33:|SETUPSP,s,0,137:|SETUPSP,s,15,8:|LOCATESP,s,20,100:next
90 s=21:|ROUTESP,s,40:'nave cabeza
100 s=20:|ROUTESP,s,30
110 s=19:|ROUTESP,s,20
120 s=18:|ROUTESP,s,10
130 s=17:|ROUTESP,s,0
131 |PRINTSPALL,0,0,0
140'--- ciclo de juego ---
150 |AUTOALL,1:|PRINTSPALL
160 goto 150