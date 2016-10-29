
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

; DEFINICION DE CADA RUTA
;==========================
ROUTE0; bird downup
	db 10,2,-1
	db 10,-2,-1
	db 0

ROUTE1; bird updown
	db 10,-2,-1
	db 10,2,-1
	db 0

ROUTE2; bird attacker
	db 30,0,-1
	db 10,0,0
	db 20,2,-1
	db 20,-2,-1
	db 0

ROUTE3; un loopA y se va hacia la izquierda
;---------------------
	db 30,1,-1
	db 10,-2,-1
	db 20,-2,0
	db 10,-2,1
	db 5,-1,1
	db 10,2,1
	db 20,2,0
	db 10,2,-1
	db 30,-1,-1
	db 30,0,-1
	db 0

ROUTE4; un loopB y se va hacia la izquierda
;---------------------
	db 30,-1,-1
	db 10,2,-1
	db 20,2,0
	db 10,2,1
	db 5,1,1
	db 10,-2,1
	db 20,-2,0
	db 10,-2,-1
	db 30,1,-1
	db 30,0,-1
	db 0

ROUTE5; ZIGZAG acelerado 1
;------------------------------
	db 4,-8,-1
	db 4,-6,-1
	db 4,-4,-1
	db 4,-2,-1
	db 4,2,-1
	db 4,4,-1
	db 4,6,-1
	db 4,8,-1
	db 4,6,-1
	db 4,4,-1
	db 4,2,-1
	db 4,-2,-1
	db 4,-4,-1
	db 4,-6,-1
	db 0

ROUTE6; ATAQUE1 horizontal
;------------------------------
	db 30,2,-1
	db 20,-2,1
	db 80,1,-2
	db 0
ROUTE7; ATAQUE2 horizontal
;------------------------------
	db 30,-2,-1
	db 20,2,1
	db 80,-1,-2
	db 0

ROUTE8; onda cuadrada
;------------------------------
	db 20,0,-1
	db 20,-2,0
	db 20,0,-1
	db 20,2,0
	db 0
ROUTE9; onda cuadrada
;------------------------------
	db 10,-1,-1
	db 10,-1,0
	db 10,-1,1
	db 10,-1,-1
	db 10,-1,0
	db 10,-1,1
	db 1,60,0
	db 0

