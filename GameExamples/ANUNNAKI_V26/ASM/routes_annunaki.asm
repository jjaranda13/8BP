
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
; en el juego anunnaki NO SE USA NINGUNA RUTA, pues lo hice antes de crear esta funcionalidad.
; estas son solo rutas de ejemplo


ROUTE_LIST
	dw ROUTE0
	dw ROUTE1
	dw ROUTE2
	dw ROUTE3
	dw ROUTE4


; DEFINICION DE CADA RUTA
;==========================
ROUTE0; un circulo
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


ROUTE1; izquierda-derecha
;-------------------------
	db 10,0,-1
	db 10,0,1
	db 0


ROUTE2; arriba-abajo
;--------------------
	db 10,-2,0
	db 10,2,0
	db 0


ROUTE3; un ocho
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

ROUTE4; un loop y se va hacia la izquierda
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

ROUTE5
segment_4_1	db 10,-2,-1
segment_4_2	db 10,2,-1
segment_4_3	db 0
