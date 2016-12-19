
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
ROUTE0; jump
	db 2,-5,1
	db 2,-4,1
	db 2,-3,1
	db 2,-2,1
	db 2,-1,1
	db 2,1,1
	db 2,2,1
	db 2,3,1
	db 2,4,1
	db 1,5,1
	db 255,13; nuevo estado, ya sin flag de ruta
	db 1,0,0; quietoooo
	db 0

ROUTE1; jumpizq
	db 2,-5,-1
	db 2,-4,-1
	db 2,-3,-1
	db 2,-2,-1
	db 2,-1,-1
	db 2,1,-1
	db 2,2,-1
	db 2,3,-1
	db 2,4,-1
	db 1,5,-1
	db 255,13; nuevo estado, ya sin flag de ruta
	db 1,0,0; quietoooo
	db 0


ROUTE2; bird 
	db 30,0,-1
	db 10,0,0
	db 20,2,-1
	db 20,-2,-1
	db 0

ROUTE3; disparo_dere
;-----------------
	db 40,0,2
	db 255,0
	db 1,0,0
	db 0

ROUTE4; disparo_izq
;-----------------
	db 40,0,-2
	db 255,0
	db 1,0,0
	db 0


ROUTE5; un circulo
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

