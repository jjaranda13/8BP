10 '-- MENU HOBBY RRETRO --
20 MEMORY 24000
25 'he metido la rutina de carga de rom en la zona de sprites de 8BP, en la direccion 42000
26 load "8bp.bin"
27 FOR dir=42540 TO 42618 STEP 2: POKE dir,RND*200: POKE dir+1,RND*80:NEXT
40 MODE 0: DEFINT A-Z: CALL &6B78:' install RSX
50 NUMGAMES=15:' 2 paginas, 10 juegos por cada pagina
60 DIM GAME$(NUMGAMES): page=0: numpags=NUMGAMES/10 :'paginas 0 a N-1
70 GAME$(0)="MUTANTE MONTOYA"
80 GAME$(1)="ANUNNAKI"
90 GAME$(2)="NIBIRU"
100 GAME$(3)="MINI INVADERS"
110 GAME$(4)="MINI PONG"
120 GAME$(5)="3D RACING ONE"
130 GAME$(6)="FRESH FRUITS"
140 GAME$(7)="SPACE PHANTOM"
150 GAME$(8)="FROGGER"
160 GAME$(9)="NEXT PAGE"
161 '---- pagina 2 dejuegos
162 GAME$(10)="ERIDU"
163 GAME$(11)="HAPPY MONTY"
164 GAME$(12)="BLASTER PILOT"
165 GAME$(13)="NOMWARS C"
166 GAME$(14)="NOMWARS BASIC"
171 GAME$(15)="PREVIOUS PAGE"

175 '--- PALETA ---
180 INK 0,0:INK 1,26:INK 2,1:INK 3,6:INK 4,3:INK 5,2:INK 6,23 
190 INK 7,24:INK 8,15:INK 9,9 :INK 10,14:INK 11,25:INK 12,11 
200 INK 13,10:INK 14,18:INK 15,17 
210 BORDER 0

219'--- LOAD SCREEN ---
220 LOAD "!titan.scr",&C000
221 ' borrado del segmento 0 de la pantalla porque ConvImg mete ahi cosas 
222 ' y debe estar limpia para 8BP, pues ahi 8BP guarda variables
230 FOR i = &C000+2000 TO &C000+2000+48: POKE i,0:NEXT
240 |MUSIC,0,0,0,6
250 c$=INKEY$: IF C$<>"" THEN 250:'clean buffer kayboard
260 C$="PULSA UNA" :|PRINTAT,0,16,0,@C$
270 C$="TECLA" :|PRINTAT,0,26,0,@C$
280 |STARS,0,20,10,1,0: 
290 b$=INKEY$: IF b$<>"" THEN 310
300 GOTO 280

310 MODE 0: hs=10
320 '--- PRINT MENU ---
330 |SETUPSP,0,9,18:|PRINTSP,0,0,69
340 |SETUPSP,0,9,17:|PRINTSP,0,0,28
341 c$="PAGE"+str$(page)
342 |PRINTAT,0,3,2,@C$
343 plot 8,396,3:draw 160,396:draw 160, 370
344 draw 8,370,4:draw 8,396
350 FOR i = 0 TO MIN(NUMGAMES-page*10,9)
360 c$=STR$(i)+"."
370 |PRINTAT,0,26+i*10,0,@c$
380 |PRINTAT,0,26+i*10,10,@game$(10*page+i)
390 NEXT
400 PLOT 1,24,5:DRAW 640,24
410 LOCATE 1,10
415 ' game setup
420 |SETUPSP,31,9,16:|LOCATESP,31,155,16:|SETUPSP,31,0,32+5:|SETUPSP,31,7,1
430 |COLSP,0,7:col=32:|COLSP,33,@col
440 c=0:d=0:puntos=0
450 FOR i=0 TO 7:|SETUPSP,i,9,19:|LOCATESP,i,175,-10:|SETUPSP,i,0,1+8+4+2:NEXT:'enemigos
460 |PRINTSPALL, 0,0,1,0
461 c$="HI SCORE:"+STR$(hs):|PRINTAT,0,190,0,@c$:c$="SCORE:0":|PRINTAT,0,190,44,@c$
462 b$=inkey$:if b$<>"" then 462
470 '--- ciclo de juego ---
480 c=c +1: IF c and 15 THEN 481 else puntos=puntos+1:c$=STR$(puntos):|PRINTAT,0,190,62,@c$
481 IF PEEK(27496)>128 then 500
482 if inkey(47) then 484 else |SETUPSP,31,15,0:|SETUPSP,31,0,128+8+1:goto 500
484 b$=inkey$: if b$="" then 500 
485 if b$<>" " then 600 else 500 
500 IF c-d <20 THEN 530
500 IF c-d <20 THEN 530
510 p=RND*100:IF p<90 THEN 530 else if p<93 then tipo=2 else if p<99 then tipo=1 else tipo=3
520 e=1+e AND 7:|SETUPSP,e,0,1+8+4+2
520 e=1+e AND 7
521 on tipo goto 522,523,524
522 |LOCATESP,e,180,80:|SETUPSP,e,7,2:d=c:|SETUPSP,e,6,-1:goto 530
523 |LOCATESP,e,180,144:|SETUPSP,e,7,4:d=c:|SETUPSP,e,6,-2:goto 530
524 |LOCATESP,e,136,80:|SETUPSP,e,7,3:|SETUPSP,e,6,-1:d=c
530 |AUTOALL,1:|PRINTSPALL:|COLSP,31
531 if col<32 then 541:'fin
540 GOTO 480
541 if puntos>hs then hs=puntos: locate 3,23:pen 5:paper 2:print "CONGRATULATIONS!": border 7
542 for i=1 to 5000:next:window 1,20,17,25:paper 0:cls:border 0:window 1,20,1,25:goto 400
600'--- end ciclo juego---
610 if b$="9" then if page =0 then page=1:goto 310 
611 if b$="5" then if page =1 then page=0:goto 310 
620'--- lanzamiento de la rom ---
621 juego= asc(b$)-48: if juego >9 or juego <0 then 310
622' uso juego+2 porque el 1 es el menu, y el 2 es el primer juego.
623' en DES no hay rom cero pero en mi lista si.
630 poke &ffff,(page*9+juego+2):call 42000:'9 porque la pag 0 tiene 9 juegos