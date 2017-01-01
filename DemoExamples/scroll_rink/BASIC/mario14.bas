10 MEMORY 25999
11 ON BREAK GOSUB 5000
20 CALL &6B78
30 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:|AUTOALL,1:|PRINTSPALL,0,1,0
40 |SETUPSP,31,7,1:|SETUPSP,31,0,65:|LOCATESP,31,130,36:'personaje
50 |SETUPSP,30,7,7:|SETUPSP,30,0,157:|LOCATESP,30,50,80:|SETUPSP,30,15,2:'bird
60 MODE 0
70 DEFINT a-z
80 CALL &BC02:'default paleta
90 BORDER 10
100 INK 6,15:INK 7,15
110 INK 4,26:INK 5,26
120 INK 2,0:INK 3,0
130 INK 1,14
140 ' establecimiento de patron de tintas
170 tini=8:|RINK,tini,0,6,3,3,3,3,3,3
200 |RINK,0
210 LOCATE 1,1:pen 4:PRINT "DEMO |RINK y |MAP2SP"
220 ' PAINT wall --------
230 |SETUPSP,29,9,23:'ladrillo
231 y=152
232 FOR fila=1 TO 6
240 FOR ladrillo=xini to 42 step 2:|PRINTSP,29,y,ladrillo*2:next
241 xini=(xini-1) mod 2: y=y+8
242 next
390 dir=1:x=0:xp=80: ciclo=40: stepy=2
400 |MUSIC,0,7
409 ' ciclo de juego ---------------------------
410 |AUTOALL:|PRINTSPALL
450 IF INKEY(27)=0 THEN |RINK,STEPy:x=x+1:|MAP2SP,0,x:|MOVER,30,0,-1:if jump=0 then IF dir=2 THEN dir=1:|SETUPSP,31,7,dir ELSE |ANIMA,31
460 IF INKEY(34)=0 THEN |RINK,-STEPy::x=x-1:|MAP2SP,0,x:if jump=0 then IF dir=1 THEN dir=2:|SETUPSP,31,7,dir ELSE |ANIMA,31
471 IF INKEY(67)+jump=0 THEN jump=ciclo:|SETUPSP,31,0,205:|SETUPSP,31,15,dir-1:|SETUPSP,31,7,31+dir
472 IF ciclo-jump=20 THEN jump=0:|SETUPSP,31,7,dir:|MOVER,31,5,0:
490 |PEEK,27483,@xp:IF xp<-20 THEN |LOCATESP,30,50,80:'pajaro vuelta a empezar
501 ciclo=ciclo+1
502 IF xant=x THEN |MAP2SP,0,32000
503 xant=x:' IF quieto THEN no imprimo el castillo asi no parpadea
510 GOTO 410
5000 |musicoff:CALL &BC02:pen 1:MODE 2:END
