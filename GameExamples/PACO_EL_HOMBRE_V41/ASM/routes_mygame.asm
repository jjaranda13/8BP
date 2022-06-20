
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
ROUTE_LIST
	dw ROUTE0;derecha
	dw ROUTE1;izq
	dw ROUTE2; up
	dw ROUTE3; down
	dw ROUTE4; quieto coco
	dw ROUTE5; derecha fant
	dw ROUTE6; izq fant
	dw ROUTE7; up fant
	dw ROUTE8; dw fant
        ; rutas para dibujar paco
	dw ROUTE9; p
	dw ROUTE10; a
	dw ROUTE11; c
	dw ROUTE12; o
	dw ROUTE13; bola transp bajando

; DEFINICION DE CADA RUTA
;==========================
ROUTE0; derecha 
	db 253
	dw COCO_R1
        db 1,0,0
	db 253
	dw COCO_R2
        db 1,0,1
	db 253
	dw COCO_R1
	db 1,0,0
	db 253
	dw COCO_R0
        db 1,0,1
	db 0

ROUTE1; izquierda
	db 253
	dw COCO_L1
        db 1,0,0
	db 253
	dw COCO_L2
        db 1,0,-1
	db 253
	dw COCO_L1
	db 1,0,0
	db 253
	dw COCO_L0
        db 1,0,-1
	db 0


ROUTE2;UP
	db 253
	dw COCO_UP1
        db 1,0,0
	db 253
	dw COCO_UP2
        db 1,-4,0
	db 253
	dw COCO_UP1
	db 1,0,0
	db 253
	dw COCO_UP0
        db 1,-4,0
	db 0


ROUTE3;DW
	db 253
	dw COCO_DW1
        db 1,0,0
	db 253
	dw COCO_DW2
        db 1,4,0
	db 253
	dw COCO_DW1
	db 1,0,0
	db 253
	dw COCO_DW0
        db 1,4,0
	db 0


ROUTE4; quieto
	db 1,0,0
	db 0


;-----------RUTAS DE FANTASMAS
ROUTE5
	db 253
	dw FANT_R1
        db 1,0,0
	db 253
	dw FANT_R0
        db 1,0,1

	db 0


ROUTE6
	db 253
	dw FANT_L1
        db 1,0,0
	db 253
	dw FANT_L0
        db 1,0,-1

	db 0


ROUTE7;UP
	db 253
	dw FANT_UP1
        db 1,0,0
	db 253
	dw FANT_UP0
        db 1,-4,0

	db 0


ROUTE8;DW
	db 253
	dw FANT_DW1
        db 1,0,0
	db 253
	dw FANT_DW0
        db 1,4,0
	db 0

; ---- RUTAS PARA DIBUJAR PACO -----

ROUTE9
	db 253
	dw FULL_1
	db 4,0,1
	db 2,-2,1	
	db 2,-2,0
	db 2,-2,-1
	db 4,0,-1
 	db 32,1,0
	db 255,0,0
	db 0,0,0
	db 0

ROUTE10
	db 253
	dw FULL_1
	db 28,-1,0
	db 3,-2,1
	db 3,2,1
	db 27,1,0
	db 1,-16,0
	db 4,0,-1
	db 255,0,0
	db 0,0,0
	db 0

ROUTE11
	db 253
	dw FULL_1
	db 4,0,-1
	db 2,1,-1
	db 28,1,0
	db 2,1,1
	db 3,0,1
	db 255,0,0
	db 0,0,0
	db 0

ROUTE12
	db 253
	dw FULL_1
	db 2,0,-1
	db 2,1,-1
	db 28,1,0
	db 2,1,1
	db 2,0,1
	db 2,-1,1
	db 28,-1,0
	db 2,-1,-1
	db 255,0,0
	db 0,0,0
	db 0

ROUTE13 ; bola down 
	db 253
	dw BOLA_TRANSP
	db 100,2,0
;	db 1,-100,0

	db 0