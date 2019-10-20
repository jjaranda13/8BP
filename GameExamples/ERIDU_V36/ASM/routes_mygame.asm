
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
ROUTE_LIST
	dw ROUTE0;disparo
	dw ROUTE1;fuel
	dw ROUTE2;gema
	dw ROUTE3;cohete
	DW ROUTE4;disparo delete
	dw ROUTE5;ovni
	dw ROUTE6;explosion transparente
	dw ROUTE7;parte comun de ambas explosiones
	dw ROUTE8;explosion normal
	dw ROUTE9;bomba
	DW ROUTE10;bomba delete
	DW ROUTE11;cohete down
	DW ROUTE12;eye
	DW ROUTE13;alienball

; DEFINICION DE CADA RUTA
;==========================
ROUTE0; disparo
	;db 255,128+64+32+8+1,0
	db 253
	dw DISPARO
	db 20,0,5
	db 255,0,0
	db 1,0,0
	db 0

ROUTE1;fuel
	db 253
	dW FUEL
	db 120,0,-1
	db 255,0,0	
	db 1,0,0
	db 0

ROUTE2;gema
	db 253
	dW GEMA
	db 1,1,-1
	db 1,-1,-1
	db 0



ROUTE3; cohete
	db 253
	dw COHETE
	db 100,0,-1;pausa
	db 128,-3,-1
	db 255,0,0
	db 1,0,0
	db 0

ROUTE4; disparo del
	db 255,128+64+8+1,0;ya no es collider
	db 253
	dw DISPARO_DEL
	db 1,0,0
	db 255,0,0
	db 1,0,0
	db 0

ROUTE5;OVNI
	db 253
	dW OVNI
	db 10,-1,-1
	db 10,1,-1
	db 0

ROUTE6; explosion transp
	db 255,128+64+8+1,0

ROUTE7;
	db 253
	dW EXPLO5
	db 253
	dW EXPLO1
	db 1,0,-1
	db 253
	dW EXPLO2
	db 1,0,-1
	db 253
	dW EXPLO3
	db 1,0,-1
	db 253
	dW EXPLO4
	db 1,0,-1
	db 253
	dW EXPLO5
	db 1,0,0
	db 255,0,0
	db 1,0,0
	db 0

ROUTE8  ;explosion normal
	db 253
	dW EXPLO5
	db 255,128+8+1,0
	db 252,7,0
	db 1,0,0
	db 0


ROUTE9; Bomba
;	db 255,128+64+32+8+1,0
	db 253
	dw BOMB
	db 1,6,4
	db 4,0,1
	db 4,5,1
	db 1,5,0
	db 1,5,1
	db 1,5,0
	db 1,5,1
;	db 33,4,0
	db 29,5,0
;	db 20,6,0
	db 255,0,0
	db 1,0,0
	db 0

ROUTE10; bomba_del
	db 255,128+64+8+1,0;ya no es collider
	db 253
	dw BOMB_DEL
	db 1,0,0
	db 255,0,0
	db 1,0,0
	db 0

ROUTE11; cohete_down
	db 253
	dw COHETE_down
	db 100,0,-1;pausa
	db 128,3,-1
	db 255,0,0
	db 1,0,0
	db 0

ROUTE12 ; EYE
	db 253
	dw EYE
	db 20,0,-2;
	db 4,1,-1;
	db 4,1,0;
	db 2,-1,1;
	db 2,-1,0;
	db 100,0,-2;
	db 255,0,0
	db 1,0,0
	db 0


ROUTE13; ALIENBALL
	db 253
	dw ALIENBALL
	db 40,-2,-1
	db 80,1,-1
	db 0


