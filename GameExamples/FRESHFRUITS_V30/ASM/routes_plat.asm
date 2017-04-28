
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
ROUTE_LIST
	dw ROUTE0
	dw ROUTE1
	dw ROUTE2
	dw ROUTE3
	dw ROUTE4
	dw ROUTE5
	dw ROUTE6
	dw ROUTE7
	dw ROUTE8
	dw ROUTE9
	dw ROUTE10
	dw ROUTE11
	dw ROUTE12
	dw ROUTE13
	dw ROUTE14
	dw ROUTE15
	dw ROUTE16
	dw ROUTE17
	dw ROUTE18
	dw ROUTE19
	dw ROUTE20
; DEFINICION DE CADA RUTA
;==========================


ROUTE0	; ANDANDO_R 
	;siempre se llega aqui cayendo
	db 253
	dw BOLAMAN_R3; cambio justo antes de empezar a andar. importante pues no se anima solo
	db 240,0,0; andar es no moverse
	db 0



ROUTE1	; ANDANDO_L
	db 253
	dw BOLAMAN_L3; cambio justo antes de empezar a andar. importante pues no se anima solo
	db 240,0,0; andar es no moverse
	db 0



ROUTE2 ; SALTANDO_R
        db 253
	dw BOLAMAN_R1_UP; secuencia up
	
	db 5,-5,0
	db 3,-4,0
	db 2,-3,0
	db 1,-2,0
	db 253
	dw BOLAMAN_R1_DOWN; secuencia down
	db 1,-5,0; subimos una mas

	db 1,2,0
	db 2,3,0
	db 3,4,0
	db 5,5,0

	db 253; este cambio no lo hago porque ya se encarga la logica
	dw BOLAMAN_R3; cambio justo en el ultimo frame
	db 1,5,0; 

	db 1,0,0 ; en realidad esto no es moverse

	db 0


ROUTE3 ; SALTANDO_L
        db 253
	dw BOLAMAN_L1_UP; secuencia up
	db 5,-5,0
	db 3,-4,0
	db 2,-3,0
	db 1,-2,0
	db 253
	dw BOLAMAN_L1_DOWN; secuencia down
	db 1,-5,0; subimos una mas

	db 1,2,0
	db 2,3,0
	db 3,4,0
	db 5,5,0

	db 253; este cambio no lo hago porque ya se encarga la logica
	dw BOLAMAN_L3; cambio justo en el ultimo frame
	db 1,5,0; 

	db 1,0,0 ; en realidad esto no es moverse

	db 0



ROUTE4; CAYENDO_R
	db 253
	dw BOLAMAN_R1_DOWN; secuencia down
	db 1,0,0; esto ya es caer 5
	db 80,5,0
	db 0

ROUTE5; CAYENDO_L
	db 253
	dw BOLAMAN_L1_DOWN; secuencia down
	db 1,0,0; esto ya es caer 5
	db 80,5,0
	db 0



ROUTE6; guardian LR
	db 254,8,0
	db 1,0,-1
	db 30,0,1
	db 254,9,0
	db 1,0,1
	db 30,0,-1
	db 0

ROUTE7; guardian LR2
	db 254,9,0
	db 1,0,1
	db 15,0,-1
	db 252,6,0; a ruta 6
	db 0


ROUTE8; fin caida derecha
	db 253
	dw BOLAMAN_R1_DOWN; secuencia down para borrar posible resto
	db 1,0,0; esto imprime
	db 253
	dw BOLAMAN_R3; 
	db 1,5,0; imprime
	db 252,0,0; ruta cero, se aplica el primer segmento de dicha ruta
	db 0

ROUTE9; fin caida izq
	db 253
	dw BOLAMAN_L1_DOWN; secuencia down para borrar posible resto
	db 1,0,0; esto imprime
	db 253
	dw BOLAMAN_L3; 
	db 1,5,0; imprime
	db 252,1,0; ruta 1, se aplica el primer segmento de dicha ruta
	db 0

ROUTE10; bug
	db 40,2,0
	db 40,-2,0
        db 0


ROUTE11; bug2
	db 20,2,0
	db 40,-2,0
	db 252,10,0 ; ruta 10
        db 0


ROUTE12; bug3
	db 20,2,0
	db 10,0,0
	db 20,2,0
	db 20,-2,0
	db 20,2,0
	db 40,-2,0
        db 0


ROUTE13; bug4
	db 30,2,0
	db 10,0,0
	db 10,-2,0
	db 10,2,0
	db 20,-2,0
	db 20,2,0
	db 30,-2,0
        db 0


ROUTE14; presentacion tomate
	db 4,0,1
	db 4,0,2	
	db 4,0,1
	db 4,0,-1
	db 4,0,-2	
	db 4,0,-1
	db 0

ROUTE15; presentacion guardian
	db 86,0,1
	db 1,0,-86	
	db 0

ROUTE16; abeja ini
	db 254,12,0;seq =dere
	db 1,0,-1
	db 120,0,1
	db 252,17,0; ruta 17
	db 0


ROUTE17; abeja 
	db 254,11,0;seq =izq
	db 1,0,1
	db 240,0,-1
	db 254,12,0;seq =dere
	db 1,0,-1
	db 240,0,1	
	db 0


ROUTE18; guardian LRmini
	db 254,8,0
	db 1,0,-1
	db 20,0,1
	db 254,9,0
	db 1,0,1
	db 20,0,-1
	db 0

ROUTE19; snake
	db 254,13,0
	db 1,0,1
	db 200,0,-1
	db 254,14,0
	db 1,0,-1
	db 200,0,1
	db 0


ROUTE20; abejamini
	db 254,12,0;seq =dere
	db 1,0,-1
	db 140,0,1
	db 254,11,0;seq =izq
	db 1,0,1
	db 140,0,-1	
	db 0