10 MEMORY 23999
20 CALL &6B78
30 INK 1,7:INK 0,0
40 INK 2,26:INK 3,26
50 MODE 1
60 DEFINT A-Z
70 FOR i=1 TO 24:LOCATE 1,i:PRINT STRING$(40,"O"):NEXT
80 |3D,0:|SETLIMITS,0,80,0,200
90 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT
100 |SETUPSP,31,9,27:|SETUPSP,31,0,1+64
101 |SETUPSP,30,9,35:|SETUPSP,30,0,1+64
110 x=40:y=100: incx=1:incy=1
120 |LOCATESP,31,y,x:
121 |LOCATESP,30,y-10,x-10:
130 |PRINTSPALL,0,0,0:'imprime 2 imagenes flipeadas en mode 1
140 x=x+incx:IF x>76 OR x<0 THEN incx=-incx  
150 y=y+incy:IF y>180 OR y<10 THEN incy=-incy 
160 GOTO 120