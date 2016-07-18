10 MEMORY 26999
20 MODE 0: DEFINT A-Z: CALL &6B78:' install RSX
21 ON BREAK GOSUB 5000
25 CALL &BC02:'restaura paleta por defecto por si acaso
26 GOSUB 2300:' paleta con sobreescritura
30 FOR j=0 TO 31:|SETUPSP,j,0,&X0:NEXT:'reset sprites
40 PEN 1: PAPER 0:FOR i=0 TO 20*24:PRINT CHR$(INT(204.5+RND(1)));:NEXT  :' imprime un fondo con tintas 1 y 0     
45 LOCATE 1,2:PEN 5:PRINT " demo pelota botando con sobreescritura"
50 ballimg=&8724: 'sprite pelota
60 |SETUPSP,0,9,ballimg :|SETUPSP,0,0,&X1000001
70 REM ahora empieza el show
80 g=1:'gravedad
90 v=-10:'velocidad inicial
100 y=0:'coordenada inicial
110 incx=1
120 t=t+1
130 y=180+v*t+g*t*t      
140 IF y>=180 THEN t=0
150 x=x+incx: IF x>70 THEN incx=-incx       
160 IF x<=0 THEN incx=-incx
170 |LOCATESP,0,y,x
180 |PRINTSPALL,0,0
181 LOCATE 1,1 :PRINT t
190 GOTO 120
2300 REM ---------- PALETA sprites transparentes MODE 0------------------
2301 INK 0,11: REM azul claro
2302 INK 1,15: REM naranja
2303 INK 2,0 : REM negro
2304 INK 3,0: 
2305 INK 4,26: REM blanco
2306 INK 5,26: 
2307 INK 6,6: REM rojo
2308 INK 7,6: 
2309 INK 8,18: REM verde
2310 INK 9,18: 
2311 INK 10,24: REM amarillo
2312 INK 11,24 :
2313 INK 12,4: REM magenta
2314 INK 13,4 : 
2315 INK 14,16 : REM naranja
2316 INK 15, 16: 
2317 AMARILLO=10
2420 RETURN
5000 |MUSICOFF
5010 END