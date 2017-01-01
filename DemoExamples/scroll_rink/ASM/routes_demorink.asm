
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
ROUTE_LIST
	dw ROUTE0
	dw ROUTE1
	dw ROUTE2
	dw ROUTE3
	dw ROUTE4


; DEFINICION DE CADA RUTA
;==========================

; DEFINICION DE CADA RUTA
;==========================
ROUTE0; jumpderecha
	db 1,-10,0
	db 2,-4,0
	db 2,-3,0
	db 2,-2,0
	db 2,-1,0
	db 2,1,0
	db 2,2,0
	db 2,3,0
	db 2,4,0
	db 1,5,0
	db 1,0,0; quietoooo al mismo tiempo que el cambio de estado
	db 255,65; nuevo estado, ya sin flag de ruta
	db 1,0,0; quietoooo al mismo tiempo que el cambio de estado
	db 0

ROUTE1; jumpizq
	db 1,-10,0
	db 2,-4,0
	db 2,-3,0
	db 2,-2,0
	db 2,-1,0
	db 2,1,0
	db 2,2,0
	db 2,3,0
	db 2,4,0
	db 1,5,0
	db 255,65; nuevo estado, ya sin flag de ruta
	db 1,0,0; quietoooo
	db 0



ROUTE2; bird downup
	db 10,2,-1
	db 10,-2,-1
	db 0

ROUTE3; bird downup
	db 200,0,-1
	db 1,0,200
	db 0


ROUTE4; un circulo
;-----------------
	db 5,2,0
	db 5,2,-1
	db 5,0,-1
	db 5,-2,-1
	db 5,-2,0
	db 5,-2,1
	db 5,0,1
	db 5,2,1
	db 0



ROUTE5; arriba-abajo
;--------------------
	db 10,-2,0
	db 10,2,0
	db 0


ROUTE6; un ocho
;-----------------

	db 15,2,0
	db 5,2,-1
	db 5,0,-1
	db 25,-2,-1
	db 5,0,-1
	db 5,2,-1
	db 15,2,0
	db 5,2,1
	db 5,0,1
	db 25,-2,1
	db 5,0,1
	db 5,2,1
	db 0

ROUTE7; un loop y se va hacia la izquierda
;---------------------
	db 120,0,-1
	db 10,-2,-1
	db 20,-2,0
	db 10,-2,1
	db 5,0,1
	db 10,2,1
	db 20,2,0
	db 10,2,-1
	db 80,0,-1
	db 0

