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
; si a un sprite se le asigna la secuencia cero es que no tiene secuencia
; empezamos desde la secuencia 1

;--------------secuencias de animacion  --------
_SEQUENCES_LIST
dw HACKMAN_R0,HACKMAN_R0,HACKMAN_R1,HACKMAN_R1,HACKMAN_R2,HACKMAN_R2,HACKMAN_R1,HACKMAN_R1 ;1
dw ANT1, ANT1,ANT1,ANT1,ANT2,ANT2,ANt2,ANT2;2
dw BIRD_UP,BIRD_UP,BIRD_DW,BIRD_DW,0,0,0,0;3
dw BUG,BUG,BUG,BUG,BUG,BUG,BUG,BUG;4


;-------- MACRO SECUENCIAS ----------------------
; son grupos de secuencias, una para cada direccion
; el significado es:
; still, left, right, up, up-left, up-right, down, down-left, down-right
; se numeran desde 32 en adelante
; un cero significa que se asigna la ultima que tenga. si se usa el cero hay que asignar alguna al iniciar
_MACRO_SEQUENCES
;db 0,2,1,3,5,3,4,6,4;32 --> secuencias del soldado , id=32. la siguiente secuencia seria la 33

