
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
ROUTE_LIST
	dw ROUTE0
	dw ROUTE1
	dw ROUTE2
	dw ROUTE3
	; rutas de coches
	dw ROUTE4
	dw ROUTE5
	dw ROUTE6
	dw ROUTE7
	dw ROUTE8
	dw ROUTE9
	; rutas de troncos
	DW route10
	dw route11
	DW ROUTE12
	; arrastre de troncos
	DW ROUTE13
	DW ROUTE14
	; ruta tortuga
	DW ROUTE15
	; arrastre tortugas
	DW ROUTE16

	DW ROUTE17; hojas rapido R
	DW ROUTE18; arrastre hojas


; DEFINICION DE CADA RUTA
;==========================
ROUTE0; jump up
	db 253
	dw FROG_UP2
	db 1,0,0
	db 8,-2,0
	db 253
	dw FROG_UP1
	db 8,0,0; stop
	db 255,64+32+1,0
	db 1,0,0
	db 0

ROUTE1; jump down
	db 253
	dw FROG_DW2
	db 1,0,0
	db 8,2,0
	db 253
	dw FROG_DW1
	db 8,0,0; stop
	db 255,1+32+64,0
	db 1,0,0
	db 0

ROUTE2;jump right
	db 253
	dw FROG_R2
	db 1,0,0
	db 4,0,1
	db 1,0,0
	db 253
	dw FROG_R1_DEL
	db 1,0,0
	db 253
	dw FROG_R1
	db 4,0,0; stop
	db 255,1+32+64,0
	db 1,0,0
	db 0

ROUTE3; jump left
	db 253
	dw FROG_L2
	db 1,0,0
	db 4,0,-1
	db 1,0,0
	db 253
	dw FROG_L1_DEL
	db 1,0,-1
	db 253
	dw FROG_L1
	db 1,0,1
	db 4,0,0; stop
	db 255,1+32+64,0; quita ruta
	db 1,0,0
	db 0


	;RUTAS PARA LOS VEHICULOS
	;------------------------
ROUTE4; CAR NORMAL L
	db 253
	dw CAR1_L
	db 54,0,-1
	db 255,0,0
	db 1,0,0
	db 0

ROUTE5; CAR NORMAL R
	db 253
	dw CAR1_R
	db 54,0,1
	db 255,0,0
	db 1,0,0
	db 0

ROUTE6; CAR FAST L
	db 253
	dw MOTO_L
	db 28,0,-2
	db 255,0,0
	db 1,0,0
	db 0

ROUTE7; CAR FAST R
	db 253
	dw MOTO_R
	db 28,0,2
	db 255,0,0
	db 1,0,0
	db 0


ROUTE8; CAR SLOW L
	db 253
	dw BUS_L
	db 1,0,-1
	db 1,0,0
	db 0

ROUTE9; CAR SLOW R
	db 253
	dw BUS_R
	db 1,0,1
	db 1,0,0
	db 0


	; rutas de troncos
	;-----------------
ROUTE10; tronco  R lento
	db 1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0
	db 1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0
	db 1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0
	db 1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0
	db 252,11,0; pasamos a la ruta 11
	db 1,0,0
	db 0

ROUTE11; continuacion de ruta 10 (una ruta no puede medir mas de 255)
	db 1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0
	db 1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0
	db 1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0
	db 1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0,1,0,1,2,0,0
	db 1,0,-64
	db 252,10,0
	db 1,0,0
	db 0

ROUTE12; tronco L rapido
	db 64,0,-1
	db 1,0,64
	db 0

ROUTE13; arrastre rana L tronco rapido
	db 253
	dw FROG_UP1_ARRASTRE_L
	db 4,0,-1
	db 0

ROUTE14; arrastre rana R tronco lento
	db 253
	dw FROG_UP1_ARRASTRE_R
	db 1,0,1
	db 2,0,0
	db 1,0,1
	db 2,0,0
	db 1,0,1
	db 2,0,0
	db 0

ROUTE15; turtles slow L
	db 253
	DW turtlesa
	db 1,0,-1
	db 1,0,0
	db 253
	DW turtlesb
	db 3,0,0
	db 0

ROUTE16; arrastre tortugas
	db 253
	dw FROG_UP1_ARRASTRE_L
	db 1,0,-1
	db 4,0,0
	db 1,0,-1
	db 4,0,0
	db 1,0,-1
	db 4,0,0
	db 1,0,-1
	db 4,0,0
	db 0


ROUTE17; hojas R rapido
	db 64,0,1
	db 1,0,-64
	db 0

ROUTE18; arrastre hojas R rapido
	db 253
	dw FROG_UP1_ARRASTRE_R
	db 4,0,1
	db 0

