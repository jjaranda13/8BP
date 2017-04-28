
org 33500;
;=====================================================================
; hasta 31 secuencias de animacion 
;=====================================================================
; debe ser una tabla fija y no variable
; cada secuencia contiene las direcciones de frames de animacion ciclica
; cada secuencia son 8 direcciones de memoria de imagen
; numero par porque las animaciones suelen ser un numero par
; un cero significa fin de secuencia, aunque siempre se gastan 8 words /secuencia
; al encontrar un cero se comienza de nuevo. 
; si no hay cero, tras el frame 8 se comienza de nuevo
 
; la secuencia cero es que no hay secuencia. 
; empezamos desde la secuencia 1

;--------------secuencias de animacion  --------
_SEQUENCES_LIST

; todo esto debe ser sustituido por un solo ladrillo y pintar suelo sin secuencias
;dw BRICK_D,BRICK_C,BRICK_B,BRICK_A,0,0,0,0 ;1 pintado de ladrillo moviendose de  izq a dere
;dw BRICK_C2,BRICK_B2,BRICK_A2,BRICK_D2,0,0,0,0 ;2
;dw BRICK_D,BRICK_A,BRICK_B,BRICK_C,0,0,0,0 ;3
;dw BRICK_C2,BRICK_D2,BRICK_A2,BRICK_B2,0,0,0,0 ;4

;dw BALL,0,0,0,0,0,0,0;5
;dw BALL_UP,0,0,0,0,0,0,0;6
;dw BALL_DOWN,0,0,0,0,0,0,0;7

;dw FINN3,FINN2,FINN1,FINN2,0,0,0,0;8
;dw FINN3,FINN2,FINN1,FINN2,FINN3,FINN2,FINN1,FINN2;8
dw BUG_A,BUG_B,BUG_C,0,0,0,0,0;1
dw BOLAMAN_R3,BOLAMAN_R2,BOLAMAN_R1,BOLAMAN_R2,0,0,0,0;2
dw BOLAMAN_L3,BOLAMAN_L2,BOLAMAN_L1,BOLAMAN_L2,0,0,0,0;3
dw BOLAMAN_R1_UP,0,0,0,0,0,0,0;4
dw BOLAMAN_R1_DOWN,0,0,0,0,0,0,0;5
dw BOLAMAN_L1_UP,0,0,0,0,0,0,0;6
dw BOLAMAN_L1_DOWN,0,0,0,0,0,0,0;7
dw DEMON_R1,DEMON_R2,DEMON_R3,DEMON_R2,0,0,0,0;8
dw DEMON_L1,DEMON_L2,DEMON_L3,DEMON_L2,0,0,0,0;9
;dw EXPLO1,EXPLO2,EXPLO3,EXPLO1,EXPLO2,EXPLO3,EXPLO1,EXPLO2;10
dw EX1,EX1,EX1,EX2,EX2,EX3,EX3,EX3;10 
dw ABEJA_L0,ABEJA_L0,ABEJA_L0,ABEJA_L1,ABEJA_L1,ABEJA_L1,0,0;11
dw ABEJA_R0,ABEJA_R0,ABEJA_R0,ABEJA_R1,ABEJA_R1,ABEJA_R1,0,0;12
dw SNAKE_L0,SNAKE_L1,SNAKE_L0,SNAKE_L2,SNAKE_L0,SNAKE_L1,SNAKE_L0,SNAKE_L2;13
dw SNAKE_R0,SNAKE_R1,SNAKE_R0,SNAKE_R2,SNAKE_R0,SNAKE_R1,SNAKE_R0,SNAKE_R2;14

;dw BUG_A,BUG_B,BUG_C,0,0,0,0,0;12
; reserva de memoria para creacion de secuencias desde BASIC
;------------------------------------------------------------
;ds 256; 256 bytes es una reserva para poder crear hasta 16 secuencias de animacion desde BASIC
	; si no vas a crear secuencias desde basic puedes borrar (o comentar) esta reserva
	; si deseas reservar hasta 31 , deberas poner "ds 496", ya que 16*31=496

_MACRO_SEQUENCES
;--------MACRO SECUENCIAS ----------------------
; son grupos de secuencias, una para cada direccion
; el significado es:
; still, left, right, up, up-left, up-right, down, down-left, down-right
; se numeran desde 32 en adelante
;db 3,3,3,4,4,4,5,5,5;32 --> secuencias de la bola, id=32. la siguiente seria la 33
;db 7,7,7,6,6,6,7,7,7;32 --> secuencias de la bola, id=32. la siguiente seria la 33
;db 0,1,3,0,0,0,0,0,0;33 --> secuencias plt izq
;db 0,2,4,0,0,0,0,0,0;34 --> secuencias plt dere
db 0,3,2,4,6,4,5,6,5;32 --> secuencias de bolaman
db 0,9,8,0,0,0,0,0,0;33 --> secuencias de DEMON
db 0,11,12,0,0,0,0,0,0;34 --> secuencias de ABEJA
db 0,13,14,0,0,0,0,0,0;34 --> secuencias de SNAKE