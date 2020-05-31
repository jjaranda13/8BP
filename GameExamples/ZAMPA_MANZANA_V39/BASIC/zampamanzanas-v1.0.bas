5 '
' Inicializamos el programa con unas cuantas instrucciones que 8BP necesita: cargar 8BP en memoria, limpiar sprites, etc... --------------------------------------------
10 MEMORY 23999 '19999
20 DEFINT A-Z: CALL &6B78: 'instalamos los comandos RSX

21 f$="                              ":|PRINTAT,5,10,@f$
22 f$=" PULSA ESPACIO PARA CONTINUAR ":|PRINTAT,10,10,@f$
24 f$="                              ":|PRINTAT,15,10,@f$:|MUSIC,1,0,0,6
25 IF INKEY(47)=0 THEN GOTO 27 ELSE 25
27 |MUSIC
30 ON BREAK GOSUB 600 'que hacer si el usuario pulsa 2 veces ESC
40 CALL &BC02: 'restaura paleta por defecto por si acaso
50 MODE 0: INK 0,0:BORDER 0 'fondo negro
60 partida=0
61 defmus=0
62 CLS:FOR s=0 TO 31:|SETUPSP,s,0,0:NEXT:|3D,0

'85		7500 = muestro la pantalla de inicio
85 GOSUB 7500
'90 	3500 = defino el numero de vidas y las caracteristicas de cada fase
90 |MUSIC:fase=1:GOTO 3500
'95		6000 = se definen un buen puñado de variables que se van a usar en el juego
95 GOSUB 6000
96 if preview=1 THEN GOTO 8000
'100	6500 = se definen y se pintan todos los sprites de la zona de juego
100 CLS:GOSUB 6500

'280 creamos el gusanoL y gusanoR, independientemente de en que fase nos encontremos
280 GOSUB 560:GOSUB 570

399 '
'   inicio ciclo de juego --------------------------------------------
405 c=c+1 ':locate 1,1:print fre(0)
410 |AUTOALL:|PRINTSPALL:|COLSPALL
' 420 vamos a mirar los movimientos de los elementos
420 GOSUB 485
' 430 si no hay colisiones, voy a la 450
430 IF cod=32 THEN 450
' 435 colision de soldado (30) contra manzana buena, mala o gusano
435 IF cor=30 THEN 555
' 440 colision suelo (sprite 31) vs manzana buena (linea 551) o envenenada (linea 553)
440 IF cod<10 THEN GOSUB 551:GOTO 4030 ELSE GOSUB 553
445 |colspall:GOTO 430
' 450 lanzo manzana buena
450 IF c AND freqmanzbuena THEN 405 ELSE k=fre(""):|SETUPSP,i,9,19:|SETUPSP,i,5,(rnd*2)+3,0:|SETUPSP,i,0,8+2+1:posx=(RND*46):|LOCATESP,i,ymanzana(posx),posx+25: i=i+1: IF i=9 THEN i=0
' 451 lanzo manzana mala si fase>3
451 IF fase>3 THEN IF c AND freqmanzmala THEN 405 ELSE |SETUPSP,j,9,34:|SETUPSP,j,5,(rnd*2)+3,0:|SETUPSP,j,0,8+2+1:posx=(RND*46):|LOCATESP,j,ymanzana(posx),posx+25: j=j+1:IF j=11 THEN j=10
460 GOTO 405
470 '
'    fin ciclo de juego -------------------------------------


480 '
'   rutina movimientos (soldado y gusano) --------------------------------------------
' 485 movemos el gusano si la fase es >6
485 IF fase>6 THEN IF c AND 15 THEN 490 ELSE |MOVER,29,0,1:|MOVER,28,0,-1
490 IF PEEK(27480)>128 THEN if peek(27483)<26 or peek(27483)>68 then |POKE,27483,x:GOTO 525 ELSE x=peek(27483):GOTO 525
' 495 salto
495 IF INKEY(67)=0 THEN ENV 1,1,15,1,15,-1,1:SOUND 4,638,0,5,1:|SETUPSP,30,0,169:|SETUPSP,30,15,dir:GOTO 531
' 500 soldado anda hacia la derecha
500 IF INKEY(27)=0 THEN IF dir<>0 THEN |SETUPSP,30,7,1:dir=0:RETURN ELSE |SETUPSP,30,6,1:|ANIMA,30:if x<=67 then x=x+1:GOTO 520
' 510 soldado anda hacia la izquierda
510 IF INKEY(34)=0 THEN IF dir<>1 THEN |SETUPSP,30,7,2:dir=1:RETURN ELSE |SETUPSP,30,6,-1:|ANIMA,30:if x>=27 then x=x-1
520 |LOCATESP,30,y,x
' 525 salto por encima del gusanoR
525 IF PEEK(27483)<=PEEK(27467) THEN sound 4,638,30,7,0,1:pts=pts+3:pts$=str$(pts):|PRINTAT,107,0,@pts$:|PRINTSP,15,PEEK(27465)-2,PEEK(27467)+1:|SETUPSP,15,7,3:|SETUPSP,15,0,4+1:GOSUB 560:GOTO 531
' 526 salto por encima del gusanoL
526 IF PEEK(27483)=>PEEK(27451) THEN sound 4,638,30,7,0,1:pts=pts+3:pts$=str$(pts):|PRINTAT,107,0,@pts$:|PRINTSP,15,PEEK(27449)-2,PEEK(27451):|SETUPSP,15,7,3:|SETUPSP,15,0,4+1:GOSUB 570
531 RETURN


533 '
'	rutinas de impactos ---------------------------------------------
' 547 he recogido una manzana buena
547 SOUND 4,638,30,7,0,1:pts=pts+3:cm=cm+1:|SETUPSP,cod,7,3:|SETUPSP,cod,0,4+1:pts$=str$(pts):|PRINTAT,107,0,@pts$:RETURN
' 549 he recogido una manzana mala (1)
549 SOUND 4,142,50,7,0,3:BORDER 7:|SETUPSP,cod,7,5:|SETUPSP,cod,0,4+1:LOCATE 1,8: BORDER 0:cme=cme+1:cme$=str$(cme):|PRINTAT,147,3,@cme$
' 550 he recogido una manzana mala (2)
550 locate 1,6:b$="   ":|PRINTAT,107,2,@b$:if pts>5 then pts=pts-5:pts$=str$(pts):|PRINTAT,107,0,@pts$:RETURN ELSE pts$=str$(pts):|PRINTAT,107,0,@pts$: RETURN
' 551 manzana buena choca suelo (1)
551 SOUND 4,25,20,7,,5:BORDER 7:cmc=cmc+1:|setupsp,cod,7,4:|SETUPSP,cod,0,4+1:cmc$=str$(cmc):|PRINTAT,127,2,@cmc$:border 0
' 552 manzana buena choca suelo (2)
552 locate 1,6:b$="   ":|PRINTAT,107,2,@b$:if pts>0 then pts=pts-1:pts$=str$(pts):|PRINTAT,107,0,@pts$:RETURN ELSE pts$=str$(pts):|PRINTAT,107,0,@pts$:RETURN
' 553 manzana mala choca suelo
553 SOUND 4,25,20,7,,5:|setupsp,cod,7,6:|SETUPSP,cod,0,4+1:RETURN
555 IF cod>27 THEN 557 ELSE IF peek(27001+(16*cod))>peek(27481) THEN 450 ELSE IF cod<10 THEN GOSUB 547:GOTO 4010 ELSE GOSUB 549:GOTO 4050
' 557 he tocado al gusano
557 GOTO 3000


559 '
'	creacion de gusanos ------------------------------------------------
' 560 creo un gusanoR
560 |SETUPSP,29,0,8+4+2+1:|SETUPSP,29,7,7:|LOCATESP,29,171,17:RETURN
' 570 creo un gusanoL
570 |SETUPSP,28,0,8+4+2+1:|SETUPSP,28,7,9:|LOCATESP,28,171,77:RETURN


599 '
'	si el jugador pulsa ESC 2 veces -------------------------------
600 |MUSIC:MODE 1: INK 0,0:PEN 1
610 :end


2000 '
'	creditos ---------------------------------------------------
2010 CLS:plot 5,5:drawr 0,390,3:drawr 630,0,3:drawr 0,-390,3:drawr -630,0,3
2020 f$=" CREDITOS ":|PRINTAT,0,31,@f$
2030 f$="PROGRAMACION":|PRINTAT,14,2,@f$
2040 f$="RIPER":|PRINTAT,21,5,@f$
2050 f$="MUSICA":|PRINTAT,35,2,@f$
2060 f$="XENOMORPHO":|PRINTAT,42,5,@f$
2070 f$="AGRADECIMIENTOS ESPECIALES":|PRINTAT,56,2,@f$
2080 f$="MUCHAS GRACIAS A JOSE JAVIER GARCIA":|PRINTAT,63,5,@f$
2090 f$="POR LA AYUDA Y PACIENCIA AGUANTANDO":|PRINTAT,70,5,@f$
2100 f$="TODAS MIS DUDAS Y PREGUNTAS.":|PRINTAT,77,5,@f$
2110 f$="AGRADECER TAMBIEN EL COMPARTIR LA":|PRINTAT,84,5,@f$
2120 f$="LIBRERIA 8BP Y HACER POSIBLE QUE":|PRINTAT,91,5,@f$
2130 f$="LA GENTE SE ACERQUE AL MUNDO DE LA":|PRINTAT,98,5,@f$
2140 f$="PROGRAMACION Y LOS MICROORDENADORES":|PRINTAT,105,5,@f$
2150 f$="HERRAMIENTAS UTILIZADAS":|PRINTAT,119,2,@f$
2160 f$="EDICION: NOTEPAD PLUS PLUS Y WINAPE":|PRINTAT,126,5,@f$
2170 f$="MUSICA: WYZTRACKER":|PRINTAT,133,5,@f$
2180 f$="GRAFICOS: SPEDIT, PAINT Y CONVIMGCPC":|PRINTAT,140,5,@f$
2190 f$="LIBRERIA: 8BP V39":|PRINTAT,147,5,@f$
2400 f$=" PULSA ESPACIO PARA CONTINUAR ":|PRINTAT,193,10,@f$
2410 IF INKEY(47)=0 THEN |MUSIC:GOTO 62 ELSE 2410


2500 '
'	final del juego --------------------------------------------------
2510 CLS:|MUSIC,0,0,1,6:plot 5,5:drawr 0,390,3:drawr 630,0,3:drawr 0,-390,3:drawr -630,0,3
2520 f$=" GRACIAS POR AYUDAR A ROBERTO ":|PRINTAT,0,10,@f$
2530 a$="GRACIAS A TI LA COSECHA HA SIDO TODO  UN EXITO. LA DOSIS DE VENENO TOMADA A TRAVES DE LAS MANZANAS ENVENENADAS    HA SIDO INSUFICIENTE PARA PARAR A     ROBERTO."
2540 b$="ASI MISMO LOS GUSANOS TAMPOCO HAN     SIDO TAN AGRESIVOS COMO PARECIA A     SIMPLE VISTA."
2545 c$="ESPEREMOS QUE LA PROXIMA RECOLECTA    SEA UN POCO MAS TRANQUILA QUE ESTA... O INCLUSO QUE ROBERTO VENGA CON       AYUDA..."
2550 x=3:y=18:for n=1 to len(a$)
2560 letra$=mid$(a$,n,1):|PRINTAT,y,x,@letra$:x=x+2:IF n MOD 38=0 THEN y=y+7:x=3
2570 for t=1 to 50:next t,n
2580 x=3:y=60:for n=1 to len(b$)
2590 letra$=mid$(b$,n,1):|PRINTAT,y,x,@letra$:x=x+2:IF n MOD 38=0 THEN y=y+7:x=3
2600 for t=1 to 50:next t,n
2610 x=3:y=95:for n=1 to len(c$)
2620 letra$=mid$(c$,n,1):|PRINTAT,y,x,@letra$:x=x+2:IF n MOD 38=0 THEN y=y+7:x=3
2630 for t=1 to 50:next t,n
2635 |SETLIMITS,0,80,0,200:|SETUPSP,0,9,56:|PRINTSP,0,140,27
2690 f$=" PULSA ESPACIO PARA VOLVER AL INICIO ":|PRINTAT,193,3,@f$
2700 IF INKEY(47)=0 THEN GOTO 2710 ELSE 2700
2710 for a=0 to 640 step 1: GOTO 2720
2720 |MUSIC:plot a,0:draw a,400,13:plot a-1,0:draw a,400,0
2730 next
2740 GOTO 62


3000 '
'	algo provoca que quiten una vida ----------------------------------
3005 FOR s=0 TO 31:|SETUPSP,s,0,0:NEXT:|3D,0:
3010 vidas=vidas-1:preview=0
3020 if vidas=0 then 3300
3290 GOTO 95


3300 '
'	has perdido todas las vidas ----------------------------------------
3310 CLS:plot 5,5:drawr 0,390,3:drawr 630,0,3:drawr 0,-390,3:drawr -630,0,3
3320 f$="NO QUEDAN VIDAS DISPONIBLES":|PRINTAT,80,13,@f$
3330 f$=" PULSA ESPACIO PARA VOLVER AL INICIO ":|PRINTAT,193,3,@f$
3340 IF INKEY(47)=0 THEN GOTO 62 ELSE 3340


3500 '
'	variables del inicio del juego y de la fase 1 ----------
3510 vidas=5
3520 IF fase=1 THEN signiv=100:mcaidasniv=15:preview=1:GOTO 95
3530 IF fase=2 THEN signiv=200:mcaidasniv=30:preview=1:GOTO 95
3540 IF fase=3 THEN signiv=300:mcaidasniv=45:preview=1:GOTO 95
3550 IF fase=4 THEN signiv=100:mcaidasniv=15:menvniv=2:preview=1:GOTO 95
3560 IF fase=5 THEN signiv=200:mcaidasniv=30:menvniv=3:preview=1:GOTO 95
3570 IF fase=6 THEN signiv=300:mcaidasniv=45:menvniv=4:preview=1:GOTO 95
3580 IF fase=7 THEN signiv=100:mcaidasniv=20:menvniv=2:preview=1:GOTO 95
3590 IF fase=8 THEN signiv=200:mcaidasniv=40:menvniv=3:preview=1:GOTO 95
3600 IF fase=9 THEN signiv=300:mcaidasniv=55:menvniv=4:preview=1:GOTO 95


4000 '
'	compruebo los puntos, manzanas caidas y manzanas envenenadas----------------------------
4010 if pts>=signiv then IF fase>8 THEN GOTO 2500 ELSE GOSUB 4015:GOTO 4020 ELSE 445
4015 CLS:plot 5,5:drawr 0,390,3:drawr 630,0,3:drawr 0,-390,3:drawr -630,0,3:f$="NIVEL SUPERADO":|PRINTAT,80,26,@f$:f$="TE ESPERA EL SIGUIENTE.":|PRINTAT,94,17,@f$:f$=" PULSA ESPACIO PARA CONTINUAR ":|PRINTAT,193,10,@f$:RETURN
4020 IF INKEY(47)=0 THEN FOR s=0 TO 31:|SETUPSP,s,0,0:NEXT:|3D,0:fase=fase+1:GOTO 3520 ELSE 4020
4030 if cmc>mcaidasniv then GOSUB 4035:GOTO 4040 ELSE 445
'4035 y 4036, han caido demasiadas manzanas buenas al suelo
4035 CLS:plot 5,5:drawr 0,390,3:drawr 630,0,3:drawr 0,-390,3:drawr -630,0,3:|SETLIMITS,0,80,0,200:|SETUPSP,0,9,54:|PRINTSP,0,100,27
4036 f$="DEMASIADAS MANZANAS BUENAS CAIDAS":|PRINTAT,80,6,@f$:f$=" PULSA ESPACIO PARA CONTINUAR ":|PRINTAT,193,10,@f$:RETURN
4040 IF INKEY(47)=0 THEN CLS:GOTO 3000 ELSE 4040
4050 IF cme>menvniv then GOSUB 4055:GOTO 4060 ELSE 445
4055 CLS:plot 5,5:drawr 0,390,3:drawr 630,0,3:drawr 0,-390,3:drawr -630,0,3:|SETLIMITS,0,80,0,200:|SETUPSP,0,9,55:|PRINTSP,0,100,27
4056 f$="HAS TOMADO DEMASIADAS MANZANAS":|PRINTAT,80,10,@f$:f$="ENVENENADAS":|PRINTAT,87,28,@f$:f$=" PULSA ESPACIO PARA CONTINUAR ":|PRINTAT,193,10,@f$:RETURN
4060 IF INKEY(47)=0 THEN CLS:GOTO 3000 ELSE 4060


5000 '
'	reproductor de musica -------------------------------
5005 |MUSIC:bmusica=0:CLS:if defmus=0 then dim musica(39):for i=0 to 39:a=rnd*13:musica(i)=a:next:defmus=1
5006 CLS:plot 5,5:drawr 0,390,3:drawr 630,0,3:drawr 0,-390,3:drawr -630,0,3
5007 f$=" REPRODUCTOR DE MUSICA ":|PRINTAT,0,18,@f$
5010 f$="1 - REPRODUCIR INTRO":|PRINTAT,90,17,@f$
5015 f$="2 - REPRODUCIR ENDING":|PRINTAT,97,17,@f$
5020 f$="3 - PARAR":|PRINTAT,111,17,@f$
5025 f$=" PULSA ESPACIO PARA VOLVER AL INICIO ":|PRINTAT,193,3,@f$
5030 IF INKEY(64)=0 THEN GOTO 5200 ELSE if music=1 then if bmusica<38 then border musica(bmusica):bmusica=bmusica+1: GOTO 5035 ELSE bmusica=0
5035 IF INKEY(65)=0 THEN GOTO 5210 ELSE if music=1 then if bmusica<38 then border musica(bmusica):bmusica=bmusica+1: GOTO 5040 ELSE bmusica=0
5040 IF INKEY(57)=0 THEN GOTO 5300 ELSE 5060
5060 IF INKEY(47)=0 THEN music=0:border 0:|MUSIC:GOTO 62 ELSE 5030
5200 |MUSIC,1,0,0,6:music=1:GOTO 5030
5210 |MUSIC,0,0,1,6:music=1:GOTO 5030
5300 border 0:music=0:|MUSIC:GOTO 5030


6000 '
'	Definimos algunas variables ---------------------------------
' 6010 damos total libertad a la zona de los límites
6010 |SETLIMITS,0,80,0,200
' 6020 posicion inicial del protagonista
6020 x=47:y=155
' 6030 contador manzanas cogidas
6030 cm=0
' 6040 contador manzanas caidas
6040 cmc=0
' 6050 contador de puntos
6050 pts=0
' 6060 contador manzanas envenenadas cogidas
6060 cme=0
' 6120 valor del AND para indicar la frecuencia de caida de las manzanas buenas
6120 freqmanzbuena=15
' 6130 valor del AND para indicar la frecuencia de caida de las manzanas malas
6130 freqmanzmala=127
' 6140 la i se usa para crear y numerar los sprites de las manzanas buenas. Irá del 0 al 9 (10 sprites)
6140 i=0
' 6150 la j se usa para crear y numerar los sprites de las manzanas malas. Irá del 10 al 11 (2 sprites)
6150 j=10
6160 cor=32:cod=32:|COLSPALL,@cor,@cod:
6170 ENT 1,10,-100,3:
6180 ENT 1,10,-100,3:
6190 ENT 1,10,-100,3:
6200 ENT 3,100,5,3:
6210 ENT -5,7,10,1,7,-10,1:
6220 ENT -5,7,10,1,7,-10,1:
6230 if partida>0 then RETURN
' 6240 array que contiene la posición Y de la que debe salir la manzana en base a su posicion X
6240 dim ymanzana(47)
6250 k=25:for m=0 to 2 step 1:ymanzana(m)=k:next:k=17:for m=3 to 15 step 1:ymanzana(m)=k:next:k=7:for m=16 to 31 step 1:ymanzana(m)=k:next:k=17:for m=32 to 42 step 1:ymanzana(m)=k:next:k=25:for m=43 to 46 step 1:ymanzana(m)=k:next
6260 partida=1
6265 preview=1
6270 RETURN


6500 '
'	Preparamos la zona de juego ---------------------------------------
' 6510 #30 protagonista
6510 |SETUPSP,30,0,32+1
6520 |SETUPSP,30,7,1
6530 |LOCATESP,30,y,x
' 6540 suelo
6540 |SETUPSP,0,9,21
6550 for s=26 to 66 step 8:|PRINTSP,0,177,s:next
' 6560 #31 rectangulo invisible del suelo
6560 |SETUPSP,31,9,27
6570 |LOCATESP,31,175,26
6580 |SETUPSP,31,0,32
' 6590 base arbol L
6590 |SETUPSP,0,9,23
6600 |PRINTSP,0,155,21
' 6610 base arbol R
6610 |SETUPSP,0,9,24
6620 |PRINTSP,0,155,74
' 6630 tronco L
6630 |SETUPSP,0,9,25
6640 for t=25 to 145 step 10:|PRINTSP,0,t,23:next
' 6650 tronco R
6650 |SETUPSP,0,9,26
6660 for t=25 to 145 step 10:|PRINTSP,0,t,74:next
' 6670 hojas altas
6670 |SETUPSP,0,9,50:for t=21 to 39 step 1:|PRINTSP,0,0,t:next:|SETUPSP,0,9,51:for t=40 to 59 step 4:|PRINTSP,0,0,t:next:|SETUPSP,0,9,50:for t=60 to 78 step 1:|PRINTSP,0,0,t:next
' 6680 hojas medias
6680 |SETUPSP,0,9,50:for t=21 to 27 step 1:|PRINTSP,0,10,t:next:|SETUPSP,0,9,51:for t=28 to 36 step 4:|PRINTSP,0,10,t:next:|SETUPSP,0,9,51:for t=60 to 68 step 4:|PRINTSP,0,10,t:next:|SETUPSP,0,9,50:for t=72 to 78 step 1:|PRINTSP,0,10,t:next
' 6690 hojas bajas
6690 |SETUPSP,0,9,50:for t=21 to 23 step 1:|PRINTSP,0,20,t:next:|SETUPSP,0,9,51:for t=24 to 27 step 4:|PRINTSP,0,20,t:next:|SETUPSP,0,9,51:for t=72 to 72 step 4:|PRINTSP,0,20,t:next:|SETUPSP,0,9,50:for t=76 to 78 step 1:|PRINTSP,0,20,t:next
' 6700 sprite que tapará al gusano que muere
6700 |SETUPSP,15,9,49
' 6710 añadimos unas manzanas de decoración
6710 |SETUPSP,0,9,52:|PRINTSP,0,2,24:|PRINTSP,0,21,21:|PRINTSP,0,6,34:|PRINTSP,0,2,56:|PRINTSP,0,11,64:|PRINTSP,0,6,74
6715 |SETUPSP,0,9,53:|PRINTSP,0,175,4
6720 |SETLIMITS,26,74,0,200
6730 |SETUPSP,0,0,0
6740 |PRINTSPALL,0,0,1,0:|AUTOALL,1
6743 f$="ZAMPA":|PRINTAT,9,5,@f$:f$="MANZANA":|PRINTAT,16,3,@f$ ':f$="8BP V0.39":|PRINTAT,180,1,@f$
6745 plot 0,330:drawr 150,0,9:plot 0,245:drawr 150,0,9:plot 0,215:drawr 150,0,8:plot 0,78:drawr 150,0,8
6750 g$=" FASE ":|PRINTAT,40,4,@g$:fase$=str$(fase):|PRINTAT,47,7,@fase$
6760 f$=" VIDAS ":|PRINTAT,60,3,@f$:vidas$=str$(vidas):|PRINTAT,67,7,@vidas$
6770 d$=" PUNTOS ":|PRINTAT,100,2,@d$:d$="0":|PRINTAT,107,2,@d$: d$=":":|PRINTAT,107,8,@d$:signiv$=str$(signiv):|PRINTAT,107,9,@signiv$
6780 c$=" CAIDAS ":|PRINTAT,120,2,@c$:c$="0":|PRINTAT,127,4,@c$: c$=":":|PRINTAT,127,9,@c$:mcaidasniv$=str$(mcaidasniv):|PRINTAT,127,10,@mcaidasniv$
6790 e$=" VENENO ":|PRINTAT,140,2,@e$:if fase>3 THEN e$="0":|PRINTAT,147,5,@e$: e$=":":|PRINTAT,147,9,@e$:menvniv$=str$(menvniv):|PRINTAT,147,10,@menvniv$
6800 RETURN


7000 '
'	Como jugar ------------------
7010 CLS:plot 5,5:drawr 0,390,3:drawr 630,0,3:drawr 0,-390,3:drawr -630,0,3
7020 f$=" COMO JUGAR ":|PRINTAT,0,29,@f$
7021 |SETLIMITS,0,80,0,200
7022 f$="O - IZQUIERDA":|PRINTAT,21,11,@f$
7023 f$="P - DERECHA":|PRINTAT,35,11,@f$
7024 f$="Q - SALTAR":|PRINTAT,49,11,@f$
7025 |SETUPSP,0,9,19:|PRINTSP,0,64,10:f$=" - MANZANA BUENA":|PRINTAT,67,13,@f$:f$="SUMA 3 PUNTOS":|PRINTAT,74,19,@f$
7026 |SETUPSP,0,9,34:|PRINTSP,0,87,10:f$=" - MANZANA ENVENENADA":|PRINTAT,92,13,@f$:f$="RESTA 5 PUNTOS":|PRINTAT,99,19,@f$:f$="SI COMES DEMASIADAS, MUERES":|PRINTAT,106,19,@f$
7027 |SETUPSP,0,9,46:|PRINTSP,0,122,7:f$=" - GUSANO":|PRINTAT,124,13,@f$:f$="SALTALO PARA SUMAR 3 PUNTOS":|PRINTAT,131,19,@f$:f$="MATA SI LO TOCAS":|PRINTAT,138,19,@f$
7028 |SETUPSP,0,9,22:|PRINTSP,0,151,8:f$=" - MANZANA CONTRA EL SUELO":|PRINTAT,156,13,@f$:f$="RESTA 1 PUNTO":|PRINTAT,163,19,@f$:f$="SI CAEN DEMASIADAS, MUERES":|PRINTAT,170,19,@f$
7050 f$=" PULSA ESPACIO PARA CONTINUAR ":|PRINTAT,193,10,@f$
7060 IF INKEY(47)=0 THEN |MUSIC:GOTO 62 ELSE 7060


7500 '
'	Pantalla inicial del juego ------------------------------------------------
7505 |MUSIC:plot 110,70:drawr 0,120,1:drawr 440,0,1:drawr 0,-120,1:drawr -440,0,1
7510 f$="1 - EMPEZAR PARTIDA":|PRINTAT,111,17,@f$
7520 f$="2 - HISTORIA":|PRINTAT,121,17,@f$
7530 f$="3 - COMO JUGAR":|PRINTAT,131,17,@f$
7540 f$="4 - CREDITOS":|PRINTAT,141,17,@f$
7550 f$="5 - REPRODUCTOR DE MUSICA":|PRINTAT,151,17,@f$
'7565 f$="7 - FINAL JUEGO":|PRINTAT,154,17,@f$
7570 f$="2020. PROGRAMADO POR RIPER CON 8BP V0.39":|PRINTAT,193,0,@f$
7571 for y=0 to 4 step 1:plot 231,355+y:drawr 32,0,3:drawr -32,-50,3:drawr 32,0,3:next									  	'Z
7572 for y=0 to 4 step 1:plot 271,305+y:drawr 16,50,3:drawr 16,-50,3:next									  				'A
7573 for y=0 to 4 step 1:plot 309,305+y:drawr 8,50,3:drawr 8,-25,3:drawr 8,25,3:drawr 8,-50,3:next							'M
7574 for y=0 to 2 step 1:plot 348+y,305:drawr 0,54,3:next:for y=0 to 2 step 1:plot 372+y,330:drawr 0,29,3:next:for y=0 to 4 step 1:plot 352,330+y:drawr 20,0,3:next:for y=0 to 4 step 1:plot 352,355+y:drawr 20,0,3:next
7575 for y=0 to 4 step 1:plot 376,305+y:drawr 16,50,3:drawr 16,-50,3:next									  				'A
7576 for y=0 to 4 step 1:plot 186,230+y:drawr 8,50,3:drawr 8,-25,3:drawr 8,25,3:drawr 8,-50,3:next							'M
7577 for y=0 to 4 step 1:plot 226,230+y:drawr 16,50,3:drawr 16,-50,3:next									  				'A
7578 for y=0 to 4 step 1:plot 266,230+y:drawr 0,50,3:drawr 32,-50,3::drawr 0,50,3:next									  	'N
7579 for y=0 to 4 step 1:plot 304,280+y:drawr 32,0,3:drawr -32,-50,3:drawr 32,0,3:next									  	'Z
7580 for y=0 to 4 step 1:plot 345,230+y:drawr 16,50,3:drawr 16,-50,3:next									  				'A
7581 for y=0 to 4 step 1:plot 385,230+y:drawr 0,50,3:drawr 32,-50,3::drawr 0,50,3:next									  	'N
7582 for y=0 to 4 step 1:plot 425,230+y:drawr 16,50,3:drawr 16,-50,3:next									  				'A
7590 |MUSIC,1,0,0,6
7600 IF INKEY(64)=0 THEN GOTO 90 ELSE 7610
7610 IF INKEY(65)=0 THEN GOTO 8500 ELSE 7620
7620 IF INKEY(57)=0 THEN GOTO 7000 ELSE 7630
7630 IF INKEY(56)=0 THEN GOTO 2000 ELSE 7640
7640 IF INKEY(49)=0 THEN GOTO 5000 ELSE 7600
'7660 IF INKEY(41)=0 THEN GOTO 2500 ELSE 7660


8000 '
'	Preview ------------
8010 CLS:preview=0:plot 5,5:drawr 0,390,3:drawr 630,0,3:drawr 0,-390,3:drawr -630,0,3
8030 if fase=9 then f$=" ULTIMA FASE ":|PRINTAT,0,28,@f$ ELSE f$=" FASE ":|PRINTAT,0,32,@f$:fase$=str$(fase):|PRINTAT,0,42,@fase$:f$=" ":|PRINTAT,0,46,@f$
8040 |SETUPSP,0,9,19:|PRINTSP,0,62,9:f$=" - CONSIGUE":|PRINTAT,67,13,@f$:signiv$=str$(signiv):|PRINTAT,67,35,@signiv$:f$="PUNTOS":|PRINTAT,67,45,@f$
8050 |SETUPSP,0,9,22:|PRINTSP,0,83,8:f$=" - QUE NO TE CAIGAN MAS DE":|PRINTAT,86,13,@f$:mcaidasniv$=str$(mcaidasniv):|PRINTAT,86,64,@mcaidasniv$:f$="MANZANAS BUENAS AL SUELO":|PRINTAT,93,19,@f$
8060 if fase>3 then GOTO 8070 ELSE 8300
8070 |SETUPSP,0,9,34:|PRINTSP,0,105,9:f$=" - NO COJAS MAS DE ":|PRINTAT,111,13,@f$:menvniv$=str$(menvniv):|PRINTAT,111,49,@menvniv$:f$="MANZANAS":|PRINTAT,111,57,@f$:f$="ENVENENADAS":|PRINTAT,118,19,@f$
8080 if fase>6 then GOTO 8090 ELSE 8300
8090 |SETUPSP,0,9,46:|PRINTSP,0,136,6:f$=" - NO TOQUES LOS GUSANOS":|PRINTAT,137,13,@f$

8300 f$=" PULSA ESPACIO PARA CONTINUAR ":|PRINTAT,193,10,@f$
8310 IF INKEY(47)=0 THEN GOTO 95 ELSE 8310


8500 '
'	Historia ------------------
8510 CLS:plot 5,5:drawr 0,390,3:drawr 630,0,3:drawr 0,-390,3:drawr -630,0,3
8515 f$=" HISTORIA ":|PRINTAT,0,30,@f$
8520 a$="ROBERTO SE HA PASADO TODO EL VERANO   CUIDANDO SUS MANZANOS Y SE ACERCA EL  MOMENTO DE RECOLECTAR LOS FRUTOS PARA QUE ESTEN EN PERFECTO ESTADO."
8530 b$="ESTAN TAN ESPLENDIDOS QUE SON LA      ENVIDIA DE SUS VECINOS, QUE ESTOS     ULTIMOS DIAS SE HAN DEDICADO A IR POR LA NOCHE A ENVENENAR ALGUNOS FRUTOS."
8540 c$="POR SI FUERA POCO ROBERTO HA          ENCONTRADO UNA PLAGA DE GUSANOS QUE   ESTAN  DISPUESTOS A ACABAR CON TODA   LA COSECHA."
8545 d$="AYUDA A ROBERTO A RECOLECTAR TODAS    LAS MANZANAS POSIBLES, ESQUIVANDO LAS ENVENENADAS Y LOS MORDISCOS DE LOS    GUSANOS !!!"
8550 x=3:y=18:for n=1 to len(a$)
8560 letra$=mid$(a$,n,1):|PRINTAT,y,x,@letra$:x=x+2:IF n MOD 38=0 THEN y=y+7:x=3
8570 for t=1 to 50:next t,n
8580 x=3:y=60:for n=1 to len(b$)
8590 letra$=mid$(b$,n,1):|PRINTAT,y,x,@letra$:x=x+2:IF n MOD 38=0 THEN y=y+7:x=3
8600 for t=1 to 50:next t,n
8610 x=3:y=102:for n=1 to len(c$)
8620 letra$=mid$(c$,n,1):|PRINTAT,y,x,@letra$:x=x+2:IF n MOD 38=0 THEN y=y+7:x=3
8630 for t=1 to 50:next t,n
8640 x=3:y=141:for n=1 to len(d$)
8650 letra$=mid$(d$,n,1):|PRINTAT,y,x,@letra$:x=x+2:IF n MOD 38=0 THEN y=y+7:x=3
8660 for t=1 to 50:next t,n
8700 f$=" PULSA ESPACIO PARA CONTINUAR ":|PRINTAT,193,10,@f$
8710 IF INKEY(47)=0 THEN |MUSIC:GOTO 62 ELSE 8710