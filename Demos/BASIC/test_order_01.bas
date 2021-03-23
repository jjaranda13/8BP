10 MEMORY 23999
20 CALL &6B78: CALL &BC02:mode 0
30 |3D,0:|SETLIMITS,0,80,0,200
40 |SETUPSP,4,7,9: |SETUPSP,4,0,3
41 x=20:y=100:|LOCATESP,4,y,x
50 |SETUPSP,5,9,16: |SETUPSP,5,0,1: |LOCATESP,5,130,40
51 |SETUPSP,6,9,16: |SETUPSP,6,0,1: |LOCATESP,6,155,45
52 |SETUPSP,7,9,16: |SETUPSP,7,0,1: |LOCATESP,7,160,33
53' cesped
54 |SETUPSP,0,9,37: |SETUPSP,0,0,1: |LOCATESP,0,130,52
56 |SETUPSP,1,9,37: |SETUPSP,1,0,1: |LOCATESP,1,120,35
'58 |poke,24000,27064: 'ordenamos desde sprite 4
75 ink 0,4
80 dir=0:'derecha
81 pen 2:locate 3,1:print "DEMO 8BP V41"
82 c$="0 : ORDEN PARCIAL EN Y MINIMA ": |PRINTAT,0,10,0,@c$
83 c$="1 : ORDEN COMPLETO EN Y MINIMA": |PRINTAT,0,18,0,@c$
84 c$="2 : ORDEN PARCIAL EN Y MAXIMA": |PRINTAT,0,26,0,@c$
85 c$="3 : ORDEN COMPLETO EN Y MAXIMA ": |PRINTAT,0,34,0,@c$

86 pen 1:locate 1,7:input "order type (0-3)";t:|PRINTSPALL,t
87 pen 2: locate 1,8: print "cesped no ordenado"
88 pen 2: locate 1,9: print "resto ordenados"
90 ' ciclo de juego
91|PRINTSPALL,4,8,0,1
100 gosub 200:'control personaje
110|PRINTSPALL
120 goto 100


200' control
210 if inkey(27) then 240
220 if dir=1 then dir=0:|SETUPSP,4,7,9 else x=x+1:|ANIMA,4
230 goto 270
240 if inkey(34) then 270
250 if dir=0 then dir=1:|SETUPSP,4,7,10 else x=x-1:|ANIMA,4
270 if inkey(67)=0 then y=y-1: goto 290
280 if inkey(69)=0 then y=y+1
290 |LOCATESP,4,y,x:return


