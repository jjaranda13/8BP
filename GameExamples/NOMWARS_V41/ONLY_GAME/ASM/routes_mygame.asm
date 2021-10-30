
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
ROUTE_LIST
	dw ROUTE0; arriba
	dw ROUTE1; diagonal 60 grados
	dw ROUTE2; diagonal 45 grados
	dw ROUTE3; diagonal 30 grados
	dw ROUTE4; diagonal 0 grados
	dw ROUTE5; diagonal -30 grados
	dw ROUTE6; diagonal -45 grados
	dw ROUTE7; diagonal -60 grados
	dw ROUTE8; abajo
	dw ROUTE9; izq -60
	dw ROUTE10; izq -45
	dw ROUTE11; izq -30
	dw ROUTE12; izq 
	dw ROUTE13; izq 30
	dw ROUTE14; izq 45
	dw ROUTE15; izq 60

	dw ROUTE16; bomba


	dw ROUTE17; enemigo
	dw ROUTE18; enemigo
	dw ROUTE19
	dw ROUTE20
	dw ROUTE21
	dw ROUTE22
	dw ROUTE23
	dw ROUTE24
	dw ROUTE25
	dw ROUTE26
	dw ROUTE27
	dw ROUTE28
	dw ROUTE29
	dw ROUTE30
	dw ROUTE31
	dw ROUTE32; rutas disparo enemigo
	dw ROUTE33
	dw ROUTE34
	dw ROUTE35
	dw ROUTE36
	dw ROUTE37
	dw ROUTE38
	dw ROUTE39
	dw ROUTE40
	dw ROUTE41
	dw ROUTE42
	dw ROUTE43
	dw ROUTE44
	dw ROUTE45
	dw ROUTE46
	dw ROUTE47
	dw ROUTE48; logo bota

; DEFINICION DE CADA RUTA
;==========================
ROUTE0; ruta de disparo hacia arriba  |
	db 253
	dw DISPARO_0
	db 10,-8,0
	db 254,9,1; cambia secuencia, pero no imagen
	db 251,0,0; anima=cambia imagen
	db 1,0,-1; recoloca 
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0; esto es como un return. 
	db 0


ROUTE1; ruta de disparo 1 , 60 grados
	db 253
	dw DISPARO_1
	db 9,-8,1
	db 254,9,1
	db 251,0,0
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0;return
	db 0

ROUTE2; dere 45 
	db 253
	dw DISPARO_2
	db 8,-8,2
	; todo lo que no sean pasos se hace de golpe y ademas el ultimo paso
	db 254,9,1; cambia secuencia y pasa a frame 0
	db 251,0,0; anima para que use la nueva imagen de explosion (frame 1)
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0; return 

	db 0


ROUTE3 ;diagonal 30 grados  
	db 253
	dw DISPARO_3
	db 8,-4,3

	db 254,9,1
	db 251,0,0
	db 1,0,2; recoloca es necesario
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,0; return
	db 0

ROUTE4 ;horizontal dere  ->
	db 253
	dw DISPARO_4
	db 8,0,3
	db 254,9,1
	db 251,0,0
	db 1,0,2; recoloca. es necesario
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,2; return
	db 0

ROUTE5 ; diagonal -30 grados
	db 253
	dw DISPARO_5
	db 8,4,3
	db 254,9,1
	db 251,0,0
	db 1,0,2; recoloca
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,0; return
	db 0

ROUTE6 ; diagonal dere -45 grados
	db 253
	dw DISPARO_6
	db 8,8,2
	db 254,9,1
	db 251,0,0
;	db 1,0,2; recoloca
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,0; return
	db 0

ROUTE7; ruta de disparo dere , -60 grados
	db 253
	dw DISPARO_7
	db 9,8,1
	db 254,9,1
	db 251,0,0
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0;return
	db 0


ROUTE8; ruta de disparo hacia abajo  |
	db 253
	dw DISPARO_8
	db 10,8,0
	db 254,9,1; cambia secuencia, pero no imagen
	db 251,0,0; anima=cambia imagen
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0; esto es como un return. 
	db 0

ROUTE9; ruta de disparo izq , -60 grados
	db 253
	dw DISPARO_9
	db 9,8,-1
	db 254,9,1
	db 251,0,0
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0;return
	db 0

ROUTE10 ; diagonal dere -45 grados
	db 253
	dw DISPARO_10
	db 8,8,-2
	db 254,9,1
	db 251,0,0
;	db 1,0,2; recoloca
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,0; return
	db 0

ROUTE11 ; izq -30
	db 253
	dw DISPARO_11
	db 8,4,-3
	db 254,9,1
	db 251,0,0
	db 1,0,-2; recoloca
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,0; return
	db 0

ROUTE12 ; horiz izq
	db 253
	dw DISPARO_12
	db 8,0,-3
	db 254,9,1
	db 251,0,0
	db 1,0,-2; recoloca. es necesario
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,2; return
	db 0


ROUTE13 ; izq 30
	db 253
	dw DISPARO_13
	db 8,-4,-3

	db 254,9,1
	db 251,0,0
	db 1,0,-2; recoloca es necesario
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,0; return
	db 0


ROUTE14 ; izq 45

	db 253
	dw DISPARO_14
	db 8,-8,-2
	; todo lo que no sean pasos se hace de golpe y ademas el ultimo paso
	db 254,9,1; cambia secuencia y pasa a frame 0
	db 251,0,0; anima para que use la nueva imagen de explosion (frame 1)
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0; return 

	db 0


ROUTE15 ; izq 60
	db 253
	dw DISPARO_15
	db 9,-8,-1
	db 254,9,1
	db 251,0,0
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0;return
	db 0

ROUTE16; ruta de bomba
	db 253
	dw BOMB1
	;db 11,-3,0
	db 8,-4,0
	db 253
	dw BOMB2
	db 10,-4,0
	db 253
	dw BOMB3
	db 10,-4,0
	db 4,0,0
	db 2,2,0
	db 253
	dw BOMB2
	db 8,2,0
	db 254,10,1; frame 0 pero no pone la imagen, hay que animar
	db 251,0,0; pone la imagen pues anima
	db 255,128+64+32+8+4+1,0; pone anima pero dejo auto 
	db 1,0,-2; mueve bomba antes de imprimir, ahora explosion
	db 255,64+32+4+1,0; quito auto y asi no se mueve
	db 1,0,0; para que no comienze y asigne BOMB1
	db 0

;-----------------------------rutas de enemigos --------------------------------
ROUTE17; izq sin retorno
	db 70,0,-1
	db 1,0,70
	db 0

ROUTE18; derecha sin retorno
	db 70,0,1
	db 1,0,-70
	db 0

ROUTE19; izq derecha 
	db 60,0,1
	db 60,0,-1
	db 0

ROUTE20; izq baja
	db 30,0,-1
	db 16,2,-1
	db 30,0,-1
	db 1,-32,0
	db 1,0,76
	db 0

ROUTE21; dere baja
	db 30,0,1
	db 16,2,1
	db 30,0,1
	db 1,-32,0
	db 1,0,-76
	db 0

ROUTE22; circulo izq
	db 20,0,-1
	db 12,2,-1
	db 20,2,0
	db 12,2,1
	db 20,0,1
	db 12,-2,1
	db 20,-2,0
	db 12,-2,-1
	db 0


ROUTE23; zigzag down
	db 10,2,-1
	db 10,2,1
	db 0

ROUTE24
	db 20,0,1
	db 20,2,0
	db 20,0,1
	db 20,-2,0
	db 20,0,1
	db 20,2,0
	db 20,0,1
	db 1,-40,-80
	db 0

ROUTE25
	db 20,0,-1
	db 20,2,0
	db 20,0,-1
	db 20,-2,0
	db 20,0,-1
	db 20,2,0
	db 20,0,-1
	db 1,-40,80
	db 0

ROUTE26 ; a partir de aqui son rutas de final
	db 20,2,0
	db 252,22,0
	db 0
ROUTE27
	db 1,40,40
	db 252,25,0
	db 0
ROUTE28
	db 30,2,-1
	db 30,2,1
	db 30,-2,1
	db 30,-2,-1
	db 0
ROUTE29
	db 1,40,-40
	db 252,24,0
	db 0
ROUTE30
	db 40,2,0
	db 252,31,0
	db 0

ROUTE31
; circulo izq
	db 20,0,1
	db 12,2,1
	db 20,2,0
	db 12,2,-1
	db 20,0,-1
	db 12,-2,-1
	db 20,-2,0
	db 12,-2,1
	db 0



;-------------------------------- 32

; DEFINICION DE CADA RUTA
;==========================
ROUTE32; ruta de disparo hacia arriba  |
	db 253
	dw DISPARONAZI_UP
	db 20,-2,0
	db 254,9,1; cambia secuencia, pero no imagen
	db 251,0,0; anima=cambia imagen
	;db 1,0,-1; recoloca 
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0; esto es como un return. 
	db 0


ROUTE33; ruta de disparo 1 , 60 grados
	db 253
	dw DISPARONAZI_UPR
	db 20,-2,1
	db 254,9,1
	db 251,0,0
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0;return
	db 0

ROUTE34; dere 45 
	db 253
	dw DISPARONAZI_UPR
	db 20,-2,1
	; todo lo que no sean pasos se hace de golpe y ademas el ultimo paso
	db 254,9,1; cambia secuencia y pasa a frame 0
	db 251,0,0; anima para que use la nueva imagen de explosion (frame 1)
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0; return 

	db 0


ROUTE35 ;diagonal 30 grados  
	db 253
	dw DISPARONAZI_UPR
	db 20,-1,1

	db 254,9,1
	db 251,0,0
	;db 1,0,2; recoloca es necesario
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,0; return
	db 0

ROUTE36 ;horizontal dere  ->
	db 253
	dw DISPARONAZI_R
	db 20,0,1
	db 254,9,1
	db 251,0,0
	;db 1,0,2; recoloca. es necesario
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,2; return
	db 0

ROUTE37 ; diagonal -30 grados
	db 253
	dw DISPARONAZI_DWR
	db 20,1,1
	db 254,9,1
	db 251,0,0
	;db 1,0,2; recoloca
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,0; return
	db 0

ROUTE38 ; diagonal dere -45 grados
	db 253
	dw DISPARONAZI_DWR
	db 20,2,1
	db 254,9,1
	db 251,0,0
;	db 1,0,2; recoloca
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,0; return
	db 0

ROUTE39; ruta de disparo dere , -60 grados
	db 253
	dw DISPARONAZI_DWR
	db 20,2,1
	db 254,9,1
	db 251,0,0
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0;return
	db 0


ROUTE40; ruta de disparo hacia abajo  |
	db 253
	dw DISPARONAZI_DW
	db 20,2,0
	db 254,9,1; cambia secuencia, pero no imagen
	db 251,0,0; anima=cambia imagen
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0; esto es como un return. 
	db 0

ROUTE41; ruta de disparo izq , -60 grados
	db 253
	dw DISPARONAZI_DWL
	db 20,2,-1
	db 254,9,1
	db 251,0,0
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0;return
	db 0

ROUTE42 ; diagonal dere -45 grados
	db 253
	dw DISPARONAZI_DWL
	db 20,2,-1
	db 254,9,1
	db 251,0,0
;	db 1,0,2; recoloca
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,0; return
	db 0

ROUTE43 ; izq -30
	db 253
	dw DISPARONAZI_DWL
	db 20,1,-1
	db 254,9,1
	db 251,0,0
	;db 1,0,-2; recoloca
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,0; return
	db 0

ROUTE44 ; horiz izq
	db 253
	dw DISPARONAZI_L
	db 20,0,-1

	db 254,9,1
	db 251,0,0
	;db 1,0,-2; recoloca. es necesario
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,2; return
	db 0


ROUTE45 ; izq 30
	db 253
	dw DISPARONAZI_UPL
	db 20,-1,-1

	db 254,9,1
	db 251,0,0
	;db 1,0,-2; recoloca es necesario
	db 255,64+4+1,0; quito auto y ruta asi no se mueve mas
	db 1,0,0; return
	db 0


ROUTE46 ; izq 45

	db 253
	dw DISPARONAZI_UPL
	db 20,-2,-1
	; todo lo que no sean pasos se hace de golpe y ademas el ultimo paso
	db 254,9,1; cambia secuencia y pasa a frame 0
	db 251,0,0; anima para que use la nueva imagen de explosion (frame 1)
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0; return 

	db 0


ROUTE47 ; izq 60
	db 253
	dw DISPARONAZI_UPL
	db 20,-2,-1
	db 254,9,1
	db 251,0,0
	db 255,64+4+1,0; quito auto y asi no se mueve
	db 1,0,0;return
	db 0



ROUTE48 ; logo bota
	db 6,1,0
	db 4,2,0	
	db 2,3,0
	db 2,-3,0
	db 4,-2,0	
	db 6,-1,0
	db 0