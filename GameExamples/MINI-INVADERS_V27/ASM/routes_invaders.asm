
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
ROUTE_LIST
	dw ROUTE0
	dw ROUTE1
	dw ROUTE2
	dw ROUTE3


; DEFINICION DE CADA RUTA
;==========================
ROUTE0; invaders
	db 26,0,1
	db 26,0,-1
	db 26,0,1
	db 8,2,0
	db 26,0,-1
	db 26,0,1
	db 26,0,-1
	db 8,2,0
	db 0

ROUTE1; fire
	db 16,-12,0
	db 255,0
	db 0


ROUTE2; fireinvaders
	db 24,8,0
	db 255,0
	db 0

ROUTE3; firemuerte
	db 1,0,0; quieto
	db 255,0
	db 0
