10 MEMORY 16999
11 load "!8bp.bin"
70 MODE 1
71 CALL &6B78
72 ink 2,9:ink 0,0:ink 1,18:ink 3,24: border 0
73 delay=-1 :'infinito
80 LOAD "!tit0004.scr",&c000
90 pen 1:locate 5, 24: print "LAS GUERRAS DEL NOM HAN COMENZADO"

100 |MUSIC,0,0,0,6
101 GOSUB 1000
110' pasamos a historia
120 mode 0:gosub 5000:delay=1500
130 '--RECUERDA
131c$="IMPORTANTE:": |PRINTAT,0,10,30,@c$
132 C$="ESTA HISTORIA ES UNA FICCION":|PRINTAT,0,30,10,@c$
133 C$="   CUALQUIER PARECIDO CON":|PRINTAT,0,38,10,@c$
134 C$="LA REALIDAD ES COINCIDENCIA":|PRINTAT,0,46,10,@c$
135 C$="RECUERDA QUE ESTO ES UN JUEGO":|PRINTAT,0,56,10,@c$
136 C$="PULSA ESPACIO":|PRINTAT,0,100,10,@c$
139 GOSUB 1000
140'--- EVENT201
150 mode 0:|SETUPSP,0,9,16:|PRINTSP,0,10,2
160 C$="EVENTO 201 CELEBRADO EN":|PRINTAT,0,10,30,@c$
161 C$="OCTUBRE 2019":|PRINTAT,0,20,30,@c$
162 C$="ENSAYO DE PANDEMIA GLOBAL":|PRINTAT,0,30,30,@c$
163 C$="FICTICIA":|PRINTAT,0,40,30,@c$
170 gosub 1000
200 '--- PCR
210 |SETUPSP,0,9,17:|PRINTSP,0,100,56
211 C$="COMO YA SE HIZO EN 2009,":|PRINTAT,0,100,2,@c$
213 C$="SE INTRODUCE UN AGENTE":|PRINTAT,0,110,2,@c$
214 C$="MORTAL EN LAS VACUNAS":|PRINTAT,0,120,2,@c$
215 C$="DE GRIPE COMUN Y SE":|PRINTAT,0,130,2,@c$
223 C$="DECLARA PANDEMIA.":|PRINTAT,0,140,2,@c$
224 C$="LA PCR SE USA PARA CREAR":|PRINTAT,0,150,2,@c$
225 C$="MILES DE CASOS FALSOS":|PRINTAT,0,160,2,@c$
226 C$="Y SE INVENTA EL ":|PRINTAT,0,170,2,@c$
227 C$="ENFERMO ASINTOMATICO":|PRINTAT,0,180,2,@c$
230 Gosub 1000
250 '--- CENSORED
260 mode 0:|SETUPSP,0,9,18:|PRINTSP,0,10,2
270 C$="MEDIOS DE COMUNICACION":|PRINTAT,0,10,32,@c$
271 C$="CONTROLADOS.":|PRINTAT,0,20,32,@c$
272 C$="CENSURA TOTAL EN MEDIOS":|PRINTAT,0,30,32,@c$
273 C$="Y MUCHAS REDES SOCIALES.":|PRINTAT,0,40,32,@c$
274 C$="LA GENTE CREE LO QUE":|PRINTAT,0,50,32,@c$
275 C$="DICE SU TELEVISOR...":|PRINTAT,0,60,32,@c$
276 C$="CASI NADIE SOSPECHA NADA":|PRINTAT,0,70,32,@c$
280 GOSUB 1000

300 '--- POLI
310 |SETUPSP,0,9,19:|PRINTSP,0,97,50
320 C$="LA POLICIA SE USA PARA":|PRINTAT,0,130,2,@c$
321 C$="FORZAR NORMAS ESTRICTAS":|PRINTAT,0,140,2,@c$
322 C$="DE CONTROL Y SUMISION":|PRINTAT,0,150,2,@c$
323 C$="TOQUE DE QUEDA, BOZAL,":|PRINTAT,0,160,2,@c$
324 C$="CONFINAMIENTOS,RUINA,":|PRINTAT,0,170,2,@c$
325 C$="PROHIBICIONES, ETC":|PRINTAT,0,180,2,@c$
330 GOSUB 1000
350 '--- vaccine
360 mode 0:|SETUPSP,0,9,20:|PRINTSP,0,10,2
370 C$="UNA VACUNA EXPERIMENTAL":|PRINTAT,0,10,32,@c$
380 C$="DA ESPERANZA AL PUEBLO.":|PRINTAT,0,20,32,@c$
390 C$="Y ASI SE ESTERILIZA ":|PRINTAT,0,30,32,@c$
400 C$="SILENCIONSAMENTE A LA ":|PRINTAT,0,40,32,@c$
410 C$="POBLACION...":|PRINTAT,0,50,32,@c$
411 C$="PLAN DE REDUCCION DE":|PRINTAT,0,60,32,@c$
412 C$="POBLACION EN MARCHA":|PRINTAT,0,70,32,@c$
450 GOSUB 1000
460 ' GREAT RESET
470 |SETUPSP,0,9,21:|PRINTSP,0,120,47
471 C$="BIG RESET:":|PRINTAT,0,120,2,@c$
472 C$="SE LOGRA LA RUINA DEL":|PRINTAT,0,130,2,@c$
473 C$="PAIS Y SE CREA UN":|PRINTAT,0,140,2,@c$
474 C$="REGIMEN TOTALITARIO ":|PRINTAT,0,150,2,@c$
475 C$="CON VIGILANCIA TOTAL":|PRINTAT,0,160,2,@c$
476 C$="BASADO EN LA ":|PRINTAT,0,170,2,@c$
477 C$="TECNOLOGIA 5G":|PRINTAT,0,180,2,@c$
500 GOSUB 1000
510 ' fin intro
520 mode 0:delay=500
521 C$="TU MISION:":|PRINTAT,0,20,30,@c$
522 C$="DESTRUIR EL EJERCITO DEL ":|PRINTAT,0,50,16,@c$
523 C$="NUEVO ORDEN MUNDIAL":|PRINTAT,0,60,20,@c$
524 C$="Y UNIRTE A UNA FIESTA CLANDESTINA":|PRINTAT,0,70,6,@c$
525 C$="PRESS 1 TO PLAY NOMWARS COMPILED CYCLE":|PRINTAT,0,100,2,@c$
526 C$="PRESS 2 TO PLAY NOMWARS PURE BASIC":|PRINTAT,0,110,2,@c$
527 x=0: t=0
530 x=x+1
540 |MAP2SP,0,x:|PRINTSPALL,0,0,0,0
541 if inkey(64)=0 then 600
542 if inkey(65)=0 then 700
543 if inkey(47)=0 then 600:'tambien espacio
550 if x=32 then x=0
551 t=t+1:if t=delay then t=0:goto 120
560 goto 530
600 poke &ffff,2:call &5d4c
700 poke &ffff,3:call &5d4c


'520 mode 0:|SETUPSP,0,9,22:|SETUPSP,1,9,23:
'530 |PRINTSP,0,100,2:|PRINTSP,1,100,2+16:|PRINTSP,0,100,2+32:|PRINTSP,1,100,2+48
'540 end

1000'---rutina pulsa barra lenta---
1001 t=0
1002 FOR I=1 TO 500:NEXT
1010 IF INKEY(47)=0 THEN RETURN
1011 t=t+1: if t=delay then t=0:return
1012 if t>16000 then t=0
1020 goto 1010



5000'paleta imagenes
5001 ink 0,0:ink 1,26:ink 2,13:ink 3,15:ink 4,16:ink 5,14:ink 6,3:ink 7,24:ink 8,25
5010 ink 9,12:ink 10,20:ink 11,6:ink 12,10:ink 13,1:ink 14,11:ink  15,2
5020 border 26:return