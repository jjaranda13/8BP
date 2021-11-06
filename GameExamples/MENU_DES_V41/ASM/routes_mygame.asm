
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
ROUTE_LIST
	dw ROUTE0
	dw ROUTE1
	dw ROUTE2

; DEFINICION DE CADA RUTA
;==========================
ROUTE0; jump
	db 255,128+8+1,0; sin animacion
	db 253
	dw HACKMAN_R0_UP
	db 1,-5,0
	db 2,-4,0
	db 2,-3,0
	db 2,-2,0
	db 2,-1,0
	db 253
	dw HACKMAN_R0_DW
	db 1,-5,0;para que encajen up y down
	db 2,1,0
	db 2,2,0
	db 2,3,0
	db 2,4,0
	db 1,5,0
	db 253
	dw HACKMAN_R0
	db 1,5,0;RO no tiene negro arriba
	db 255,1+4+32,0; ni ruta y con animacion
	db 1,0,0; quieto
	db 0

ROUTE1;
       
	db 0



ROUTE2;
	db 0
