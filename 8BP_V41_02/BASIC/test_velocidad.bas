1 call &6b78
10 MEMORY 23999
11 DEFINT a-z
12 c%=0: 
30 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:|3d,0:'reset
31 |SETUPSP,31,9,16:|LOCATESP,31,40,40
35 iteraciones=1000
40 a!= TIME: vx=1:vy=-1
50 FOR i=1 TO iteraciones
60 |MOVER,31,1,1
70 NEXT
80 b!=TIME
90 PRINT (b!-a!): rem lo que tarda en unidades de tiempo cpc. (1/300 segundos)
100 c!=((b!-a!)*1/300)/iteraciones: rem c! = lo que tarda cada iteracion en segundos
120 d!=(1/50)/c!
130 PRINT "puedes ejecutar ",d!, "comandos por barrido (1/50 seg)"
140 PRINT "el comando tarda ";(c!*1000 -0.47);"milisegundos"    