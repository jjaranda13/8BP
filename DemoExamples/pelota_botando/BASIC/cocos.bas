10 MEMORY 26999
20 MODE 0: DEFINT A-Z: CALL &6B78:' install RSX
21 on break gosub 5000
25 call &bc02:'restaura paleta por defecto por si acaso
26 gosub 2300:' paleta con sobreescritura
30 FOR j=0 TO 31:|SETUPSP,j,0,&X0:NEXT:'reset sprites
40 |SETLIMITS,0,80,0,200: ' establecemos los limites de la pantalla de
juego
45 |SETUPSP,30,9,&84d0:' rejilla de fondo ("Y")
46 |SETUPSP,31,9,&84f2:' ladrillo ("Z")
50 dim c$(25):for i=0 to 24:c$(i)=" ":next
100 c$(1)= "ZZZZZZZZZZZZZZZZZZZZ"
110 c$(2)= "ZYYYYYYYYYYYYYYYYYYZ"
120 c$(3)= "ZYYYYYYYYYYYYYYYYYYZ"
125 c$(4)= "ZYZZZYZZZZZZZZYZZZYZ"
130 c$(5)= "ZYZZZYZZZZZZZZYZZZYZ"
140 c$(6)= "ZYYYYYYYYYYYYYYYYYYZ"
150 c$(7)= "ZYYYYYYYYYYYYYYYYYYZ"
160 c$(8)= "ZYZZZZZZZYZZZZZZZZYZ"
170 c$(9)= "ZYZ     ZYZ      ZYZ"
190 c$(10)="ZYZ     ZYZ      ZYZ"
195 c$(11)="ZYZZZZZZZYZZZZZZZZYZ"
200 c$(12)="ZYYYYYYYYYYYYYYYYYYZ"
210 c$(13)="ZYYYYYYYYYYYYYYYYYYZ"
220 c$(14)="ZYZZZYZZZZZZZYZZZZYZ"
230 c$(15)="ZYYYYYYYZ ZYYYYYYYYZ"
240 c$(16)="ZYYYYYYYZ ZYYYYYYYYZ"
250 c$(17)="ZYZZZZZYZZZYZZZZZZYZ"
260 c$(18)="ZYYYYYYYYYYYYYYYYYYZ" 
270 c$(19)="ZYYYYYYYYYYYYYYYYYYZ"
271 c$(20)="ZZZZZZZZZZZZZZZZZZZZ"
272 c$(21)=""
273 c$(22)=""
274 c$(23)=""
300 'imprimimos el layout
310 FOR i=0 TO 20:|LAYOUT,i,0,@c$(i):NEXT
311 locate 1,1:pen 9:print "DEMO SOBREESCRITURA"
312 locate 3,23:pen 11:print "BASIC usando 8BP"
320 |SETUPSP,0,0,&x01000111:' deteccion de colision con sprites y layout
330 |SETUPSP,0,7,1:dir=1: ' secuencia = 1 (coco derecha)
340 xa=20*2:xn=xa:ya=12*8:yn=ya:' coordenadas del personaje 
350 |LOCATESP,0,ya,xa: 'colocamos al personaje (sin imprimirlo)
360 |PRINTSPALL,0,1,0:' imprime sprites
361 cl%=0:' variable colision
362 |COLAY,89,0,cl%:'umbral chr$("Y") es 89
400 ' COMIENZA EL JUEGO
401 |MUSIC,0,5
402' lectura teclado y colisiones.
403' si vamos en direccion H (o p), primero chequeamos si hay pulsada tecla direccion V (q a) y viceversa
404 if dirn <3 then gosub 450: gosub 410 else gosub 410:gosub 450
405 |LOCATESP,0,yn,xn:|PRINTSPALL
406 ya=yn:xa=xn
407 goto 404

409' teclado direccion horizontal
410 if INKEY(27)<0 then 430 
420 xn=xa+1:poke 27003,xn:|COLAY,0,@cl%: IF cl%=0 then if dir<>1 then |SETUPSP,0,7,1:DIR=1:xn=xa:return else dirn=1:return
421 xn=xa:poke 27003,xn:return:'hay colision
430 if INKEY(34)<0 then return
440 xn=xa-1:poke 27003,xn:|COLAY,0,@cl%: IF cl%=0 then if dir<>2 then |SETUPSP,0,7,2:DIR=2:xn=xa:return else dirn=2:return
441 xn=xa:poke 27003,xn:'hay colision
442 return
449 'teclado direccion vertical
450 if INKEY(67)<0 then 480
460 yn=ya-2:poke 27001,yn:|COLAY,0,@cl%: IF cl%=0 then if dir<>3 then |SETUPSP,0,7,3:DIR=3:yn=ya:return else dirn=3:return
461 yn=ya:poke 27001,yn:'hay colision
480 if INKEY(69)<0 then return
490 yn=ya+2:poke 27001,yn:|COLAY,0,@cl%: IF cl%=0 then if dir<>4 then |SETUPSP,0,7,4:DIR=4:yn=ya:return else dirn=4:return
491 yn=ya:poke 27001,yn:'hay colision
492 return

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

5000 |musicoff
5010 end