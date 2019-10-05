
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
	dw ROUTE7; nave enemiga
	dw ROUTE8; loop 

; DEFINICION DE CADA RUTA
;==========================
ROUTE0; jump_right
	db 253
	dw SOLDADO_R1_UP
	db 1,-5,1
	db 2,-4,1
	db 2,-3,1
	db 2,-2,1
	db 2,-1,1
	db 253
	dw SOLDADO_R1_DOWN
	db 1,-5,1; subo para que UP y down encajen ya que down tiene negro por encima
	db 2,1,1
	db 2,2,1
	db 2,3,1
	db 2,4,1
	db 1,5,1
	db 253
	dw SOLDADO_R1
	db 1,5,1; baja una mas
	db 255,13,0; nuevo estado, ya sin flag de ruta y con flag de animacion
	db 254,32,0; macrosecuencia 32
	db 1,0,0; quietooo.!!!!
	db 0

ROUTE1; jump_left
	db 253
	dw SOLDADO_L1_UP
	db 1,-5,-1
	db 2,-4,-1
	db 2,-3,-1
	db 2,-2,-1
	db 2,-1,-1
	db 253
	dw SOLDADO_L1_DOWN
	db 1,-5,-1; subo para que UP y down encajen ya que down tiene negro por encima
	db 2,1,-1
	db 2,2,-1
	db 2,3,-1
	db 2,4,-1
	db 1,5,-1
	db 253
	dw SOLDADO_L1
	db 1,5,-1; baja una mas
	db 255,13,0; nuevo estado, ya sin flag de ruta y con flag de animacion
	db 254,32,0; macrosecuencia 32
	db 1,0,0; quietooo.!!!!
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


; rutas space harrier
ROUTE5; disparo_izq
;-----------------
	db 253
	dw FIRE1
	db 4,0,-2
	db 253
	dw FIRE2
	db 1,2,1;centra
	db 3,0,-1
	db 253
	dw FIRE3
	db 1,2,1;centra
	db 2,0,-1
	db 253
	dw FIRE4
	db 1,0,0
	db 255,0,0
	db 0


; rutas space harrier
ROUTE6; disparo_dere
;-----------------
	db 253
	dw FIRE1
	db 4,0,2
	db 253
	dw FIRE2
	db 1,2,1; centra
	db 3,0,1
	db 253
	dw FIRE3
	db 1,2,1;centra
	db 2,0,1
	db 253
	dw FIRE4
	db 1,0,0
	db 255,0,0
	db 0

;rutas naves enemigas
ROUTE7; 
	db 255, 128+64+8+1,0; cambio de estado
	db 253
	dw NAVE_0
	db 20,1,-1
	db 253
	dw NAVE_1
	db 20,-1,-1
	db 253
	dw NAVE_2
	db 10,0,-1
	db 10,2,-1	
	db 10,2,0
	db 253
	dw NAVE_3; cambio de imagen
	db 255,128+32+64+8+1,0 ; cambio de estado
	db 40,3,2
	dw 0

ROUTE8; ruta de dragon
	db 255, 128+64+32+8+1,0; cambio de estado
	db 70,1,-1
	db 10,3,-1
	db 5,3,0
	db 5,3,1
	db 5,0,1
	db 20,-3,1
	db 5,0,1
	db 5,3,1
	db 5,3,0
	db 10,3,-1
	db 5,0,-1
	db 20,-3,-1
	db 40,-1,-1
	; recolocacion
	db 1,0,115
	db 1,-30,0
	db 120,0,0
	db 120,0,0
	db 0