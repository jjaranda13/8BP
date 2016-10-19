


org 27000
;------- sprite 0 MONTOYA------------------
sprite0		db 1; status, es un byte de flags
		; bit 0 flag de impresion. Si esta a 1 (activo) se imprime en PRINT_SPRITES()
		; bit 1 flag de colision. una fruta o moneda por ejemplo pueden no tener flag de 
		;	impresion pero tener el de colision
   		; bit 2 flag de animacion automatica. se tiene en cuenta en ANIMA_ALL(). 
		;       En el caso del personaje , recomiendo desactivarlo, ya que si me quedo quieto no
		;	hay que cambiar el fotograma.
		; un sprite activo con deteccion de colision y animacion debe tener 
		;  status = 1(bit 0)+ 2 (bit1) + 4 (bit 2) =7
		; bit 3 flag de movimiento automatico. Se mueve solo al invocar MOVE_ALL()
		;	teniendo en cuenta su velocidad. util en meteoritos y guardias.
		; 	
		dw 50; coordy puede tomar valores negativos. area visible es[0..79]
		dw 50; coordx . puede tomar valores negativos. area visible es[0..199]. 
		db 0; velocidadY para movimiento automatico
		db 0; velocidadX para movimiento automatico
		db 2; identificador de secuencia de animacion asignada [0..NUM_SEQUENCES]
	 	   ; un 0 significa que no hay secuencia de animacion
		db 0; identificador de frame en la secuencia de animacion[0..n]
	    	; si sa secuencia de animacion es cero , este campo se ignora
		dw MONTOYA_D0; como ejemplo he puesto la direccion de la imagen 0
		; si hay una secuencia  de animacion asignada, entonces este dato es 
		; redundante con el id_frame. Aun asi es necesario.
		; Ademas si no hay secuencia es la unica forma de indicar cual es la imagen,
		; ejemplo hierba, ladrillos, etc objetos sin secuencias de animacion

		;cada sprite ocupa 16 bytes para que sea muy rapido calcular su direccion
		; 16 en binario es 1000, mientras que 11 en binario es 1011
		; la velocidad en multiplicar depende del numero de unos.
		db 0 ; posible uso futuro
		db 0 ; posible uso futuro
		db 0 ; posible uso futuro
		db 0 ; posible uso futuro
		db 0 ; posible uso futuro
;--------------------------------------------------------------------------
sprite1		ds 16;
sprite2		ds 16;
sprite3 	ds 16;
sprite4		ds 16;
sprite5		ds 16;
sprite6		ds 16;
sprite7		ds 16;
sprite8		ds 16;
sprite9		ds 16;
sprite10	ds 16;
sprite11 	ds 16;
sprite12 	ds 16;
sprite13 	ds 16;
sprite14 	ds 16;
sprite15 	ds 16; hasta aqui van 16 sprites
sprite16 	ds 16;
sprite17 	ds 16;


;	let COUNTER = NUM_SP-12
;	while COUNTER
;	db 0; status 0=desactivado, 1=activo
;	dw 0; coordy puede tomar valores negativos. area visible es[0..79]
;	dw 0; coordx . puede tomar valores negativos. area visible es[0..199]. 
;	db 0; velocidadY para movimiento automatico.
;	db 0; velocidadX para movimiento automatico.
;	db 1; identificador de secuencia de animacion asignada [0..NUM_SEQUENCES-1]
;	db 0; identificador de frame en la secuencia de animacion[0..9]
;	dw IMAGE_1:; esto es  direccion de la imagen 0
;	db 0 ; posible uso futuro
;	db 0 ; posible uso futuro
;	db 0 ; posible uso futuro
;	db 0 ; posible uso futuro
;	db 0 ; posible uso futuro
;	let COUNTER = COUNTER-1
;	wend

;----------------------------------------------------------
; AQUI METO LOS LADRILLOS. 14 en total (14 sprites)
; sprite 18 --> M void (cuadro todo a ceros)
; sprite 19 --> N rejas
; sprite 20 --> O hojas
; sprite 21 --> P roca
; sprite 22 --> Q nube
; sprite 23 --> R agua
; sprite 24 --> S ventana
; sprite 25 --> T arco R
; sprite 26 --> U arco L
; sprite 27 --> V bandera
; sprite 28 --> W planta
; sprite 29 --> X picotorre
; sprite 30 --> Y cesped
; sprite 31 --> Z ladrillo
;---------------------------------------------------------- M
sprite18
	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw VOID
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro

;---------------------------------------------------------- N
sprite19
	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw REJA
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
;---------------------------------------------------------- O
sprite20
	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw HOJAS
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro

;---------------------------------------------------------- P
sprite21
	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw ROCA
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro

;---------------------------------------------------------- Q
sprite22
	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw NUBE
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
;---------------------------------------------------------- R
sprite23
	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw AGUA
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
;---------------------------------------------------------- S
sprite24
	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw VENTANA
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro

;---------------------------------------------------------- T
sprite25
	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw ARCOR
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro

;---------------------------------------------------------- U
sprite26
	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw ARCOL
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro

;---------------------------------------------------------- V
sprite27
	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw BANDERA
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro

;---------------------------------------------------------- W
sprite28
	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw PLANTA
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
;---------------------------------------------------------- X
sprite29
 	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw PICOTORRE
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro

;---------------------------------------------------------- Y
sprite30
	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw CESPED
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro

;---------------------------------------------------------- Z SPRITE NUMERO 31
sprite31
	db 0 
	dw 0; y
	dw 0; x
	db 0; vy
	db 0;vx
	db 0;
	db 0;
	dw LADRILLO
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro