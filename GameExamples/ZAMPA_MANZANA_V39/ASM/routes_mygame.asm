
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
ROUTE_LIST
	dw ROUTE0
	dw ROUTE1

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
	db 255,32+1,0; nuevo estado, ya sin flag de ruta y con flag de animacion
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
	db 255,32+1,0; nuevo estado, ya sin flag de ruta y con flag de animacion
	db 254,32,0; macrosecuencia 32
	db 1,0,0; quietooo.!!!!
	db 0
