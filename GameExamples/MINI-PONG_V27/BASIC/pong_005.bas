10 MEMORY 25999
20 DEFINT A-Z: CALL &6B78:' install RSX
21 |PRINTSPALL,0,0:|AUTOALL,0:mode 0
22 on break gosub 2800
26 CALL &BC02:'restaura paleta por defecto     
27 INK 0,9
28 INK 1,26
29 INK 4,1
30 ink 6,20: ink 7,20
31 puntosplayer=0
32 puntoscomputer=0
33 LOCATE 5,1:PEN 7:PRINT puntosplayer
34 LOCATE 15,1:PEN 1:PRINT puntoscomputer
35 PLOT 320,0,1:DRAW 320,400: plot 0,300:draw 16,300:draw 16,100:draw 0,100:
36 plot 640,300:draw 640-16,300:draw 640-16,100:draw 640,100
37 border 0

40 'barra del jugador
41 |SETUPSP,31,9,16:|SETUPSP,31,0,11:|LOCATESP,31,80,4
50 ' pelota
51 |SETUPSP,29,9,17:|SETUPSP,29,0,41+64:|LOCATESP,29,90,38:vyp=1:vxp=1
52 collided=0:collider=0:|COLSP,32,30,31:|COLSP,34,4,0
53 |COLSPALL,@collider,@collided
60 'barra computer
61 |SETUPSP,30,9,16:|SETUPSP,30,0,11:|LOCATESP,30,80,74:|SETUPSP,30,5,0,0
62 yc=90
80 |PRINTSPALL
81 env 1,1,15,1,15,-1,1:SOUND 1,100,25,15,1:SOUND 1,100,25,15,1:SOUND 1,100,50,15,1
82 IF INKEY(47)<>0 THEN  82
83 SOUND 1,100,7,15

90 'ciclo de juego------------
100 GOSUB 220:'lectura teclado y movimiento barra
110 GOSUB 310:'pelota
120 GOSUB 410:'computer
130 |AUTOALL:|PRINTSPALL
140 GOTO 100

200 ' rutina de movimiento barra
220 IF INKEY(67)=0 THEN vy=-5:GOTO 250
230 IF INKEY(69)=0 THEN vy=5:GOTO 250
240 if vy>0 then vy=vy-1 else if vy<0 then vy=vy+1
250 |SETUPSP,31,5,vy
260 RETURN

300 ' rutina movimiento pelota
310 xp=PEEK(27467)
311 IF xp>6 THEN IF xp<70 THEN 345
320 IF xp>=80 THEN GOSUB 500: CLS:GOTO 33:'vxp=-vxp: REM AQUI HAY QUE HACER GOSUB GOL
321 |COLSPALL: IF collider=32 THEN 345
341 IF collided=31 THEN SOUND 1,200,7,15:IF vxp<0 THEN vxp=-vxp:IF vy>0 THEN IF vyp<4 THEN vyp=vyp+1 ELSE ELSE IF vy<0 THEN IF vyp>-4 THEN vyp=vyp-1
342 IF collided=30 THEN SOUND 1,200,7,15:|SETUPSP,30,5,0:IF vxp>0 THEN vxp=-vxp: IF vyp=0 THEN vyp=1
343 pongs=pongs+1: if pongs=10 then vxp=vxp*2
345 yp=PEEK(27465) 
346 IF yp<=16 THEN vyp=-vyp:SOUND 1,600,7,15 ELSE IF yp>=192 THEN vyp=-vyp: SOUND 1,600,7,15
347 |SETUPSP,29,5,vyp,vxp

350 RETURN
400 ' rutina movimiento computer
410 IF vxp<0 THEN RETURN:'|SETUPSP,30,5,0:return
411 IF xp<40 THEN RETURN 
420 |PEEK,27481,@yc: yc=yc+21
430 IF yc<yp-5 THEN vyc=5: GOTO 450
440 IF yc>yp+5 THEN vyc=-5: goto 450
441 if vyc>0 then vyc=vyc-1 else if vyc<0 then vyc=vyc+1
450 |SETUPSP,30,5,vyc
460 RETURN

500 ' rutina puntos
510 |PEEK,27467,@xp
511 IF xp>40 THEN puntosplayer=puntosplayer+1 ELSE puntoscomputer=puntoscomputer+1
512 pongs=0
520 RETURN

2800 MODE 2: INK 0,0:PEN 1: END