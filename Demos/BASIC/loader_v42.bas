10 'MEMORY 23999: ' dada demo hace el suyo
20 'LOAD "!8bp.bin":' cada demo carga el suyo
30 MODE 1:CALL &BC02: PEN 1
40 LOCATE 10,1:PRINT "   **  ****  ****"
50 LOCATE 10,2:PRINT "  *  *  *  *  *  *"
60 LOCATE 10,3:PRINT "  *  *  *  *  *  *" 
70 LOCATE 10,4:PRINT "   **   ***   ***"
80 LOCATE 10,5:PRINT "  *  *  *  *  *"
90 LOCATE 10,6:PRINT "  *  *  *  *  *"
100 LOCATE 10,7:PRINT"   **  ****  ***   v42"
110 PEN 2
120 PRINT "elige una demo"
130 PRINT "--------------------------": PEN 3:INK 3,15
140 PRINT "1) juego sencillo con musica"
150 PRINT "2) juego sencillo con salto y disparo"
160 PRINT "3) test colision sprites"
170 PRINT "4) test layout con sobreescritura"
180 PRINT "5) test animacion tintas"
190 PRINT "6) test sobreescritura mode 1"
200 PRINT "7) test ordenamiento sprites"
210 PRINT "8) test mini alfabeto"
220 PRINT "9) test rutas de sprites"
230 PRINT "10) test scroll multidireccional"
240 PRINT "11) test pseudo-3D"
250 PRINT "12) test stars"
260 PRINT "13) test music y fx a la vez"
270 PRINT "14) test 8BP en C"
280 PRINT "15) test background images"
290 PEN 1: INPUT demo
300 RUN "demo"+MID$(STR$(demo),2,10)+".bas"

