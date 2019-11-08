
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
ROUTE_LIST
	; rutas de monty
	dw ROUTE0;quieto
	dw ROUTE1;dere
	dw ROUTE2
	dw ROUTE3;abajo
	dw ROUTE4; 
	dw ROUTE5; izq
	dw ROUTE6
	dw ROUTE7;up
	dw ROUTE8
	; rutas de enemigos
	dw ROUTE9;->
	dw ROUTE10;-->
	dw ROUTE11;--->
	dw ROUTE12;<-
	dw ROUTE13;<--
	dw ROUTE14;<---
	dw ROUTE15;down
	dw ROUTE16
	dw ROUTE17
	dw ROUTE18;up
	dw ROUTE19
	dw ROUTE20
	; ruta de inversor
	dw ROUTE21

	; rutas para optimizar movimiento monty
	dw ROUTE22; cambio a ruta 1 (derecha)
	dw ROUTE23; cambio a ruta 3 (abajo)
	
	dw ROUTE24;corazon

; DEFINICION DE CADA RUTA
;==========================
ROUTE0; stop
	db 254,3,0; secuencia quieto
	db 1,0,0
	db 255,128+32+8+4,0; no imprime
	db 1,0,0
	db 255,128+32+8+4+1,0; imprime 
	db 1,0,0
	db 255,128+32+8+4,0; no 
	db 1,0,0
	db 255,128+32+8+4+1,0; si
	db 0

ROUTE1; derecha lento
	db 255,128+32+8+4+1,0; colisiona
	db 254,1,0; secuencia animacion 1
	db 1,0,0
	db 1,0,1
	db 255,128+8+4,0; no colisiona ,no imprime
	db 1,0,0
	db 255,128+8+4+1,0;no colision, si imprime
	db 1,0,1
	db 0

ROUTE2; derecha rapido
	db 255,128+32+8+4+1,0
	db 1,0,1
	db 1,0,1
;	db 255,128+32+8+4+1,0
	db 1,0,1
	db 1,0,1
;	db 255,128+8+4+1,0
	db 0

ROUTE3; abajo lento
	db 255,128+32+8+4+1,0
	db 254,2,0
	db 1,0,0
	db 1,2,0
;	db 255,128+32+8+4+1,0
	db 1,0,0
	db 1,2,0
;	db 255,128+8+4+1,0
	db 0

ROUTE4; abajo rapido
	db 255,128+32+8+4+1,0
	db 1,2,0
;	db 255,128+32+8+4+1,0
	db 1,2,0
;	db 255,128+8+4+1,0
	db 0

ROUTE5; izquierda lento
	db 255,128+32+8+4+1,0
	db 254,4,0
	db 1,0,0
	db 1,0,-1
;	db 255,128+32+8+4+1,0
	db 255,128+8+4+1,0
	db 1,0,0
	db 1,0,-1
;	db 255,128+8+4+1,0
	db 0

ROUTE6; izquierda rapido
	db 255,128+32+8+4+1,0
	db 1,0,-1
	db 1,0,-1
;	db 255,128+32+8+4+1,0
	db 1,0,-1
	db 1,0,-1
;	db 255,128+8+4+1,0
	db 0

ROUTE7; arriba lento
	db 255,128+32+8+4+1,0
	db 254,5,0
	db 1,-2,0
	db 1,0,0
;	db 255,128+32+8+4+1,0
	db 1,-2,0
	db 1,0,0
;	db 255,128+8+4+1,0
	db 0

ROUTE8; arriba rapido
	db 255,128+32+8+4+1,0
	db 1,-2,0
;	db 255,128+32+8+4+1,0
	db 1,-2,0
;	db 255,128+8+4+1,0
	db 0

; rutas de enemigos
;=====================================
ROUTE9; ->
	db 255,141,0
	db 1,0,0
	db 1,0,1
	db 255,140,0;'no print no col
	db 1,0,0
	db 255,141,0;print no col
	db 1,0,1
	db 255,128+8+4+2,0; col, no print
	db 1,0,0
	db 255,128+8+4+2+1,0; col, print
	db 1,0,1
	db 255,128+8+4+2,0;no
	db 1,0,0
	db 255,128+8+4+2+1,0;si
	db 1,0,1
	db 0

ROUTE10; ->->
	;db 255,141,0
	db 255,128+8+4+2+1,0
	db 1,0,1
;	db 255,128+8+4+2+1,0
	db 1,0,1
	;db 255,141,0
	db 1,0,1
;	db 255,128+8+4+2+1,0
	db 1,0,1
	db 0

ROUTE11; ->->->
	db 255,141,0
	db 1,0,2
	db 255,128+8+4+2+1,0
	db 1,0,2
	;db 255,141,0
	db 0



ROUTE12; <-
	db 255,141,0
	db 1,0,0
	db 1,0,-1
	db 255,140,0
	db 1,0,0
	db 255,141,0
	db 1,0,-1
;	db 255,141,0
	db 255,128+8+4+2+1,0
	db 1,0,0
	db 1,0,-1
	db 255,128+8+4+2,0
	db 1,0,0
	db 255,128+8+4+2+1,0
	db 1,0,-1
	db 0

ROUTE13; <-<-
	;db 255,141,0
	db 255,128+8+4+2+1,0
	db 1,0,-1
	;db 255,128+8+4+2+1,0
	db 1,0,-1
	;db 255,141,0
	db 1,0,-1
	;db 255,128+8+4+2+1,0
	db 1,0,-1
	db 0

ROUTE14; <-<-<-
	db 255,141,0
	db 1,0,-2
	db 255,128+8+4+2+1,0
	db 1,0,-2
;	db 255,141,0
	db 0



ROUTE15; down v=1
	db 255,141,0
	db 1,1,0
	db 1,1,0
	db 1,1,0
	db 1,1,0
	db 255,128+8+4+2+1,0
	db 1,1,0
	db 1,1,0
	db 1,1,0
	db 1,1,0
	;db 255,141,0
	db 0

ROUTE16; down v=2
	;db 255,141,0
	db 255,128+8+4+2+1,0
	db 1,2,0
	db 1,2,0
	;db 255,128+8+4+2+1,0
	db 1,2,0
	db 1,2,0
	;db 255,141,0
	db 0

ROUTE17; down v=4
	db 255,141,0
	db 1,4,0
	db 255,128+8+4+2+1,0
	db 1,4,0
	db 0

ROUTE18; up v=-1
	db 255,141,0
;	db 255,128+8+4+2+1,0
	db 1,-1,0
	db 1,-1,0
	db 1,-1,0
	db 1,-1,0
	db 255,128+8+4+2+1,0
	db 1,-1,0
	db 1,-1,0
	db 1,-1,0
	db 1,-1,0
	db 0

ROUTE19; up v=-2
	;db 255,141,0
	db 255,128+8+4+2+1,0
	db 1,-2,0
	db 1,-2,0
	;db 255,128+8+4+2+1,0
	db 1,-2,0
	db 1,-2,0
	db 0

ROUTE20; up v=-4
	db 255,141,0
	db 1,-4,0
	db 255,128+8+4+2+1,0
	db 1,-4,0
	db 0


;----------ruta inversor codo
ROUTE21
	db 255,128+8,0; no colisionador
	db 8,0,0; retardo
	db 255,32,0; colisionador, sin ruta
	db 1,0,0
	db 0

ROUTE22; optimizacion para monty cambio a derecha
	db 254,1,0; secuencia
	db 1,0,-1
	db 252,1,0
	db 1,0,0
	db 0

ROUTE23; optimizacion para monty cambio a abajo
	db 254,2,0; secuencia
	db 1,-2,0
	db 252,3,0
	db 0


ROUTE24; corazon
	db 253
	dw CORAZON
	db 5,-2,-1
	db 5,-2,1
	db 0

; esto no lo uso
ROUTE25; codo izq->up
	db 253; imagen black
	dw BLACK
	db 1,0,-1
	db 252,19,0
	db 0


	