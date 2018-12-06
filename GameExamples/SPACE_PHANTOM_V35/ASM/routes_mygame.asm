
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
ROUTE_LIST
	; rutas de estrellas
	dw ROUTE0
	dw ROUTE1
	dw ROUTE2
	dw ROUTE3
	dw ROUTE4
	dw ROUTE5
	dw ROUTE6
	dw ROUTE7;
	dw ROUTE8;
	dw ROUTE9;
	dw ROUTE10;
	dw ROUTE11;
	dw ROUTE12;
	dw ROUTE13;
	dw ROUTE14;
	dw ROUTE15
	dw ROUTE16
	dw ROUTE17;
	dw ROUTE18;
	dw ROUTE19;
	dw ROUTE20;
	dw ROUTE21;
	dw ROUTE22;
	dw ROUTE23;

	;rutas de disparo joe
	dw ROUTE24;
	dw ROUTE25;


	;rutas de planetas
	dw ROUTE26;
	dw ROUTE27;
	dw ROUTE28;
	dw ROUTE29;

	;JOE DEAD
	dw ROUTE30

	;rutas de pajaros
	dw ROUTE31
	dw ROUTE32
	dw ROUTE33
	dw ROUTE34
	dw ROUTE35

	;ruta piedra
	dw ROUTE36

	;rutas de enemigos naves
	dw ROUTE37
	dw ROUTE38
	dw ROUTE39
	dw ROUTE40
	dw ROUTE41

	dw ROUTE42
	dw ROUTE43
	dw ROUTE44
	dw ROUTE45

	;rutas de dragon
	DW ROUTE46

	;RUTAS DE OVNIS
	DW ROUTE47
	DW ROUTE48
	DW ROUTE49
	DW ROUTE50

;---- primer cuadrante ----
ROUTE0; 
	db 6,-2,0
	db 1,-1,1
	db 0

ROUTE1; 
	db 3,-2,0
	db 1,-1,1
	db 0

ROUTE2; 
	db 2,-2,0
	db 1,-1,1
	db 0

ROUTE3; 
	db 1,-2,0
	db 1,-1,1
	db 0

ROUTE4; 
	db 1,-1,0
	db 1,-1,1
	db 0


ROUTE5; 
	db 2,0,1
	db 1,-1,0
	db 0


;---- segundo cuadrante ----
ROUTE6; 
	db 2,0,1
	db 1,1,0
	db 0

ROUTE7; 
	db 1,1,0
	db 1,1,1
	db 0

ROUTE8; 
	db 1,2,0
	db 1,1,1
	db 0

ROUTE9; 
	db 2,2,0
	db 1,1,1
	db 0

ROUTE10; 
	db 3,2,0
	db 1,1,1
	db 0


ROUTE11; 

	db 6,2,0
	db 1,1,1
	db 0

;---- tercer cuadrante ----
ROUTE12; 
	db 6,-2,0
	db 1,-1,-1
	db 0

ROUTE13; 
	db 3,-2,0
	db 1,-1,-1
	db 0

ROUTE14; 
	db 2,-2,0
	db 1,-1,-1
	db 0

ROUTE15; 
	db 1,-2,0
	db 1,-1,-1
	db 0

ROUTE16; 
	db 1,-1,0
	db 1,-1,-1
	db 0


ROUTE17; 
	db 2,0,-1
	db 1,-1,0
	db 0


;---- cuarto cuadrante ----
ROUTE18; 
	db 2,0,-1
	db 1,1,0
	db 0

ROUTE19; 
	db 1,1,0
	db 1,1,-1
	db 0

ROUTE20; 
	db 1,2,0
	db 1,1,-1
	db 0

ROUTE21; 
	db 2,2,0
	db 1,1,-1
	db 0

ROUTE22; 
	db 3,2,0
	db 1,1,-1
	db 0


ROUTE23; 

	db 6,2,0
	db 1,1,-1
	db 0

;---- cuarto cuadrante ----

; rutas space harrier
ROUTE24; disparo_izq
;-----------------
	;db 255,203,0
	db 253
	dw FIRE1
;	db 4,0,-2
	db 5,0,-2
	db 253
	dw FIRE2
	db 1,2,1;centra
;	db 3,0,-1
	db 4,0,-1
	db 253
	dw FIRE3
	db 1,2,1;centra
;	db 2,0,-1
	db 3,0,-1
	db 253
	dw FIRE4
	db 1,0,0
;	db 255, 1+2+8+64+128,0
	db 1,0,0
	db 255,0,0
	db 0


; rutas space harrier
ROUTE25; disparo_dere
;-----------------
	;db 255,203,0
	db 253
	dw FIRE1
;	db 4,0,2
	db 5,0,2
	db 253
	dw FIRE2
	db 1,2,1; centra
;	db 3,0,1
	db 4,0,1
	db 253
	dw FIRE3
	db 1,2,1;centra
;	db 2,0,1
	db 3,0,1
	db 253
	dw FIRE4
	db 1,0,0
;	db 255, 1+2+8+64+128,0
	db 1,0,0
	db 255,0,0
	db 0



; RUTAS DE PLANETAS
;-----------------------

ROUTE26

;	db 255,128+2+8+1,0;flag collided lo uso para no colisionar con joe
	db 255,128+32+2+8+1,0;flag collided lo uso para no colisionar con joe
	db 251,0,0
	db 6,-1,1
	db 251,0,0
	db 20,-2,1
	db 251,0,0
	db 255, 32+8+1,0; quito ruta y flag
	db 100,-2,2
	db 0

ROUTE27

	;db 253
	;dw PLANET_0
;	db 255,128+2+8+1,0;flag 
	db 255,128+32+2+8+1,0;flag 
	db 251,0,0
	db 6,-1,-1
	;db 253
	;dw PLANET_1
	db 251,0,0
	db 20,-2,-1
	;db 253
	;dw PLANET_2
	db 251,0,0
	db 255, 32+8+1,0; quito ruta
	db 100,-2,-2
	db 0

ROUTE28

	;db 253
	;dw PLANET_0
;	db 255,128+8+2+1,0;flag
	db 255,128+32+8+2+1,0;flag
	db 251,0,0
	db 6,1,1
	;db 253
	;dw PLANET_1
	db 251,0,0
	db 20,2,1
	;db 253
	;dw PLANET_2
	db 251,0,0
	db 255, 32+8+1,0; quito ruta
	db 100,2,2
	db 0

ROUTE29

	;db 253
	;dw PLANET_0
;	db 255,128+2+8+1,0;flag 
	db 255,128+32+2+8+1,0;flag 
	db 251,0,0
	db 6,1,-1
	;db 253
	;dw PLANET_1
	db 251,0,0
	db 20,2,-1
	;db 253
	;dw PLANET_2
	db 251,0,0
	db 255, 32+8+1,0; quito ruta
	db 100,2,-2
	db 0



; ruta joe dead
ROUTE30
	db 253
	dw JOE_DEAD
	db 2,1,0
	db 2,-1,0
	db 0


	db 10,-5,0
	db 1,1,0
	db 1,2,0
	db 1,4,0
	db 1,8,0
	db 100,10,0

	db 255,0,0
	db 1,0,0
	db 0


;rutas pajaros
ROUTE31
	db 254,4,0; secuencia animacion pajaro mini
;	db 255,128+32+8+4+1,0
	db 255,128+32+8+4+1+2,0
	db 10,1,1
	db 10,-1,1
	db 254,5,0; secuencia animacion pajaro mediano
	db 10,1,-1
	db 254,8,0; secuencia animacion pajaro grande
	db 255,32+8+4+1,0; quito ruta
	db 100,-1,-1
	db 0


ROUTE32
	db 254,4,0; secuencia animacion pajaro mini
	;db 255,128+32+8+4+1,0
	db 255,128+32+8+4+1+2,0
	db 10,-1,-1
	db 10,1,1
	db 254,5,0; secuencia animacion pajaro mediano
	db 10,-1,-1
	db 254,8,0; secuencia animacion pajaro grande
	db 255,32+8+4+1,0; quito ruta
	db 100,2,1
	db 0

ROUTE33
	db 254,4,0; secuencia animacion pajaro mini
	;db 255,128+32+8+4+1,0
	db 255,128+32+8+4+1+2,0
	db 10,-2,0
	db 10,1,0
	db 254,5,0; secuencia animacion pajaro mediano
	db 10,-1,-1
	db 254,5,0; secuencia animacion pajaro grande
	db 255,32+8+4+1,0; quito ruta
	db 100,2,1
	db 0

ROUTE34
	db 254,4,0; secuencia animacion pajaro mini
	;db 255,128+32+8+4+1,0
	db 255,128+32+8+4+1+2,0
	db 10,1,0
	db 10,-2,0
	db 254,5,0; secuencia animacion pajaro mediano
	db 10,-1,-1
	db 254,5,0; secuencia animacion pajaro grande
	db 255,32+8+4+1,0; quito ruta
	db 100,2,-1
	db 0


ROUTE35; jefe
	db 253
	dw JEFE_1
	;db 255,128+32+8+1,0; es collider asi que podemos dispararle, pero tambien puede matarnos
	db 255,128+2+32+8+1,0; es collider asi que podemos dispararle, pero no  puede matarnos por tener flag collided
	db 40,2,0
	db 253
	dw JEFE_2
	db 40,2,0
	db 253
	dw JEFE_3
	db 255,128+32+8+1,0; collider. quito flag y ya podemos colisionar con el
	db 10,2,1
	db 10,2,-1
	db 10,-2,-1
	db 10,-2,1
	db 40,2,0
	db 1,-120,100; no puedo subir mas de 127 de golpe
	db 1,-120,-100
	db 0

ROUTE36; piedra
	db 10,1,0
	db 10,2,0
	db 10,3,0
	db 100,4,0
	db 0

;rutas naves enemigas
;------------------------------------------------------
ROUTE37;
	db 255, 128+64+32+8+2+1,0; cambio de estado
	db 253
	dw NAVE_0
	db 1,65,120
	db 60,1,-1
	db 253
	dw NAVE_1
	db 20,-1,-1
	db 253
	dw NAVE_2
	db 10,0,-1
	db 10,2,-1	
	db 10,2,0
	db 253
	dw NAVE_3; cambio de imagen
	db 255,128+32+64+8+1,0 ; cambio de estado
	db 40,3,2
	db 255,0,0
	db 0


ROUTE38;
	db 255, 128+64+32+8+2+1,0; cambio de estado
	db 253
	dw NAVE_0
	db 1,65,-40
	db 60,1,1
	db 253
	dw NAVE_1
	db 20,-1,1
	db 253
	dw NAVE_2
	db 10,0,1
	db 10,2,1	
	db 10,2,0
	db 253
	dw NAVE_3; cambio de imagen
	db 255,128+32+64+8+1,0 ; cambio de estado
	db 40,3,-2
	db 255,0,0
	db 0


ROUTE39;
	db 255, 128+64+32+8+2+1,0; cambio de estado
	db 253
	dw NAVE_0
;	db 1,65,120
	db 10,2,0
	db 253
	dw NAVE_1
	db 20,2,0
	db 253
	dw NAVE_2
	db 20,-3,0
	db 253
	dw NAVE_3; cambio de imagen
	db 255,128+32+64+8+1,0 ; cambio de estado
	db 1,0,0
	db 80,4,0
	db 255,0,0
	db 0


ROUTE40;
	db 255, 128+64+32+8+2+1,0; cambio de estado
	db 253
	dw NAVE_0
	db 60,0,-1
	db 253
	dw NAVE_1
	db 40,0,-1
	db 253
	dw NAVE_2
	db 1,0,0
	db 20,2,2
	db 253
	dw NAVE_3; cambio de imagen
	db 255,128+32+64+8+1,0 ; cambio de estado
	db 1,0,0
	db 80,2,-2
	db 255,0,0
	db 0


ROUTE41;
	db 255, 128+64+32+8+2+1,0; cambio de estado
	db 253
	dw NAVE_0
	db 60,0,1
	db 253
	dw NAVE_1
	db 40,0,1
	db 253
	dw NAVE_2
	db 1,0,0
	db 20,2,-2
	db 253
	dw NAVE_3; cambio de imagen
	db 255,128+32+64+8+1,0 ; cambio de estado
	db 1,0,0
	db 80,2,2
	db 255,0,0
	db 0


ROUTE42;
	db 255, 128+64+32+8+2+1,0; cambio de estado
	db 253
	dw NAVE_0
	db 100,1,-1
	db 253
	dw NAVE_1
	db 50,1,1
	db 253
	dw NAVE_2
	db 1,0,0
	db 50,1,-2
	db 253
	dw NAVE_3; cambio de imagen
	db 255,128+32+64+8+1,0 ; cambio de estado
	db 1,0,0
	db 30,2,2
	db 30,2,-2
	db 30,2,2
	db 255,0,0
	db 0


ROUTE43; ruta de retirada
	db 253
	dw NAVE_3
	db 24,-3,0
	db 253
	dw NAVE_2
	db 1,5,2
;	db 40,-2,0
	db 30,-2,0;
	db 10,-2,1;
	db 253
	dw NAVE_1
	db 1,3,2
;	db 20,-1,0
	db 120,-1,1
	db 255,0,0 ; cambio de estado
	db 0

;	db 40,-1,0
;	db 20,-1,0
;	db 100,-1,0
;	db 255,0,0 ; cambio de estado
;	db 0
ROUTE44; ruta de planeta retirada
	db 253
	dw planet_0
	db 40,1,0
	db 253
	dw planet_1
	db 40,2,0
	db 253
	dw planet_2
	db 100,2,0
	db 0
ROUTE45;
	db 253
	dw LUZ
	db 100,1,0
	db 100,1,0
	db 100,1,0
	db 0

ROUTE46; ruta de dragon
	db 255, 128+64+32+8+1,0; cambio de estado
	;db 251,0,0; anima
	db 70,1,-1
	;db 251,0,0; anima
	db 10,3,-1
	db 5,3,0
	db 5,3,1
	
	db 5,0,1
	db 20,-3,1
	db 5,0,1
	db 5,3,1
	db 5,3,0
	db 10,3,-1

	
	db 5,0,-1
	db 20,-3,-1
	;db 251,0,0; anima
	db 40,-1,-1
	; recolocacion
	db 1,0,115
	db 1,-30,0
	db 120,0,0
	db 120,0,0
	db 0

; rutas de ovnis de fase 3
; ------------------------
ROUTE47
	db 255, 128+64+32+8+2+1,0; cambio de estado
	db 253
	dw JEFE_1
	db 60,1,1
	db 253
	dw JEFE_2
	db 255, 128+64+32+8+1,0; cambio de estado
	db 60,1,-1
	db 253
	dw JEFE_3
	db 120,2,1
	DB 0


ROUTE48
	db 255, 128+64+32+8+2+1,0; cambio de estado
	db 253
	dw JEFE_1
	db 80,0,1
	db 60,1,-1
	db 253
	dw JEFE_2
	db 255, 128+64+32+8+1,0; cambio de estado
	db 20,0,-1
	db 253
	dw JEFE_3
	db 1,0,0
	db 20,0,2
	db 20,1,2
	db 120,1,-2
	DB 0

ROUTE49
	db 255, 128+64+32+8+2+1,0; cambio de estado
	db 253
	dw JEFE_1
	db 40,0,1
	db 40,1,1
	db 253
	dw JEFE_2
	db 255, 128+64+32+8+1,0; cambio de estado
	db 40,1,-1
	db 253
	dw JEFE_3
	db 30,2,-1
	db 90,2,1
	DB 0


ROUTE50
	db 255, 128+64+32+8+2+1,0; cambio de estado
	db 253
	dw JEFE_1
	db 40,1,1
	db 20,1,-1
	db 253
	dw JEFE_2
	db 255, 128+64+32+8+1,0; cambio de estado
	db 40,2,1
	db 253
	dw JEFE_3
	db 1,0,0
	db 40,2,2
	db 120,2,0
	DB 0


