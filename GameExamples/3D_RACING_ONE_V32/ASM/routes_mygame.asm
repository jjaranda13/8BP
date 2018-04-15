
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
ROUTE_LIST
	dw ROUTE0
	dw ROUTE1
	dw ROUTE2
	dw ROUTE3
	dw ROUTE4
	dw ROUTE5; nube
	dw ROUTE6; nube
	dw ROUTE7; nube
	dw ROUTE8; coches
;	dw ROUTE9; test

; DEFINICION DE CADA RUTA
;==========================
ROUTE0; explosion fragmento a derecha
;----------------
	db 253
	dw FRAGMENT_RED;YELLOW
	db 1,-5,1
	db 2,-4,1
	db 2,-3,1
	db 2,-2,1
	db 2,-1,1
	db 253
	dw FRAGMENT_BORRA
	db 1,0,0
	db 1,25,-9
	db 0


ROUTE1; explosion fragmento diagonal derecha
;---------------------
	db 253
	dw FRAGMENT_RED;YELLOW
	db 1,-5,0
	db 2,-4,0
	db 2,-3,0
	db 2,-3,1
	db 2,-2,1
	db 253
	dw FRAGMENT_BORRA
	db 1,0,0
	db 1,29,-4
	db 0

ROUTE2; explosion arriba
;---------------------
	db 253
	dw FRAGMENT_RED;YELLOW

	db 1,-5,0
	db 2,-4,0
	db 2,-4,0
	db 2,-3,0
	db 2,-3,0
	db 253
	dw FRAGMENT_BORRA
	db 1,0,0

	db 1,33,0
	db 0

ROUTE3; explo diagonal izq
;---------------------
	db 253
	dw FRAGMENT_RED;YELLOW
	db 1,-5,0
	db 2,-4,0
	db 2,-3,0
	db 2,-3,-1
	db 2,-2,-1
	db 253
	dw FRAGMENT_BORRA
	db 1,0,0

	db 1,29,4
	db 0


ROUTE4; explosion fragmento izquierda
;---------------------
	db 253
	dw FRAGMENT_RED;YELLOW

	db 1,-5,-1
	db 2,-4,-1
	db 2,-3,-1
	db 2,-2,-1
	db 2,-1,-1
	db 253
	dw FRAGMENT_BORRA
	db 1,0,0

	db 1,25,9
	db 0


ROUTE5; nube izq
;--------------------------
	db 45,-1,-1
	db 1,45,45
	db 0

ROUTE6; nube centro
;--------------------------
	db 10,-1,0
	db 1,-1,1
	db 10,-1,0
	db 1,-1,1
	db 10,-1,0
	db 1,-1,1
	db 10,-1,0
	db 10,-1,0
	db 1,53,-3
	db 0

ROUTE7; nube dere
;--------------------------
	db 35,-1,1
	db 1,35,-35
	db 0




ROUTE8; ruta de coches enemigos. esta ruta es DINAMICA, se construye desde basic
;--------------------------
	ds 300; dejamos 100 bytes de espacio en prevision


;ROUTE9; ruta de test
;---------------------
;	db 10,0,1
;	db 40,0,1
;	db 30,0,1
;	db 0


