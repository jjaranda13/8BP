org 20000

jp _RINK

;=============================================================================================================
;RUTINA  _RINK t_ini,t1,t2,...,t8 
;RUTINA  _RINK step			INK
;=============================================================================================================
; esta funcion hace una rotacion de tintas 
; puede tener 9 parametros o solo 1
; si se invoca con 9 parametros estamos pasando la tinta inicial donde comienzan las 8 que van a rotar y 
; el patron de 8 tintas a mover. por ejemplo si invocamos con RINK, 8,3,3,3,3,24,24,24,24
; significa que las tintas [8..15] van a rotar con un patron de franjas (4 rojas y 4 amarillas)
; si se invoca con 1 parametro estamos pasando el step
; para dar sensacion de mas velocidad simplemente hay que aumentar el step
; t1...t8 es el patron de color que se va a hacer rotar. pueden ser franjas o cualquier cosa


;global variables
;--------------
ink_counter	db 0
;ink_poner	db 0
ink_cambiar	db 0

;local variables
;---------------------
;ink_tinta	db 2; current tinta a cambiar
ink_index	db 0; valor puntero

ink_tini	db 1; tinta inicial de rango 
;ink_tfin	db 10; tinta final de rango
ink_t1		db 3; tinta 
ink_t2		db 3; tinta 
ink_t3		db 3; tinta 
ink_t4		db 3; tinta 
ink_t5		db 24; tinta 
ink_t6		db 24; tinta 
ink_t7		db 24; tinta 
ink_t8		db 24; tinta 
ink_step	db 0; salto a dar



;function body
;-------------------------------------

;carga de parametros de entrada
_RINK
		; recogida de los 8 colores de franja
		cp a,1
		jr z, ink_noparam
		push IX
		pop hl
		ld BC,ink_t8

		ld d,8
_inkbuc8		
		
		
		
		ld a,(hl)
		ld (BC),a
		inc hl
		inc hl
		dec bc
		dec d

		JR nz,_inkbuc8
; voy a recoger ink_tini
		ld a,(hl)
		ld (ink_tini),a

		ret

ink_noparam	; recogida de step
		ld a,(ix+0)
		ld (ink_step),a
		ld b,a
;ink_noparam
		ld a, (ink_index)
		;ld b, (ink_step)
		add b ;b tiene el step
;		dec a; aqui hay que sumar el step, ya sea positivo o negativo
		and a, %111
		ld (ink_index),a; actualizado el index [0..7]

		ld a, 8
		ld (ink_counter),a

		ld a,(ink_tini)
		dec a
		ld (ink_cambiar),a; inicialmente es cero
		
ink_bucle       
		;seleccion de tinta a alterar
		ld a, (ink_cambiar)
		inc a
		ld (ink_cambiar),a; la primera vez es 1
		

		;seleccion de tinta a poner
		ld a, (ink_index)
		inc a
		and %111
		ld (ink_index),a
		ld c,a
		ld b,0
		ld hl, ink_t1
		add hl, bc
		ld a,(hl)
		;ld (ink_poner),a
		ld b,a
		ld c,b
		; comando ink
		ld a,(ink_cambiar)
		call &bc32

ink_finbucle		
		ld a, (ink_counter)
		dec a
		JR z, ink_fin
		ld (ink_counter),a; decremento contador
		jr ink_bucle
		
ink_fin		
		;pop hl
		ret

