10 MEMORY 24999
20 CALL &6B78
30 MODE 0
40 LOCATE 1,1: PEN 1: PRINT "* PRINTAT vs PRINT *"
50 PLOT 1,400-32,1 : DRAW 640,400-32
60 |SETLIMITS,0,80,0,200
70 DEFINT a-z
80 iteraciones=1000
90 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:'reset
100 puntos=1000
110 a!= TIME
120 FOR i=1 TO iteraciones
130 puntos=puntos+1
140 c$=STR$(puntos):|PRINTAT,0,24,10,@c$
150 NEXT
160 b!=TIME
170 c!=((b!-a!)*1/300)/iteraciones: REM c es lo que tarda cada iteracion en segundos
180 cad$="EL COMANDO PRINTAT TARDA "+STR$(INT(10*c!*1000 -0.47)/10)+" MILISEG."    
190 |PRINTAT,0,100,0,@cad$
200 REM ahora vamos a calcular lo que tarda print
210 REM -----------------------------------------
220 puntos=1000
230 a!= TIME
240 FOR i=1 TO iteraciones
250 puntos=puntos+1
260 LOCATE 3,5: PRINT PUNTOS
270 NEXT
280 b!=TIME
290 c!=((b!-a!)*1/300)/iteraciones: REM c = lo que tarda cada iteracion en segundos
300 LOCATE 1,18:PEN 1:PRINT "el comando PRINT tarda ";INT(10*(c!*1000 -0.47))/10;"milisegundos"    