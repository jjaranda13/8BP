10 REM loader
30 CALL &BC02:' default paleta
40 MODE 1:GOSUB 900
110 PEN 2
120 PEN 2:PRINT "elige una demo"
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
230 PRINT "0) next page
240 PEN 1: INPUT demo
250 IF demo >0 THEN RUN "demo"+MID$(STR$(demo),2,10)+".bas"
260 ' siguiente pagina
270 MODE 1:GOSUB 900: 
271 PEN 2:PRINT "elige una demo"
272 PRINT "--------------------------": PEN 3:INK 3,15
280 PRINT "10) test scroll multidireccional"
290 PRINT "11) test pseudo-3D"
300 PRINT "12) test stars"
310 PRINT "13) test music y fx a la vez"
320 PRINT "14) test 8BP en C"
330 PRINT "15) test background images"
340 PRINT "16) test double clipping
350 PRINT "17) test flag sprites delete"
360 PRINT "0) previous page
370 PEN 1: INPUT demo
380 IF demo >0 THEN RUN "demo"+MID$(STR$(demo),2,10)+".bas"
390 GOTO 40
900 REM 8bp
910 PEN 1
920 LOCATE 10,1:PRINT "   **  ****  ****"
930 LOCATE 10,2:PRINT "  *  *  *  *  *  *"
940 LOCATE 10,3:PRINT "  *  *  *  *  *  *" 
950 LOCATE 10,4:PRINT "   **   ***   ***"
960 LOCATE 10,5:PRINT "  *  *  *  *  *"
970 LOCATE 10,6:PRINT "  *  *  *  *  *"
980 LOCATE 10,7:PRINT"   **  ****  ***   v43"
990 RETURN