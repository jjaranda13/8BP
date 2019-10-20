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
dw EXPLO1,EXPLO2,EXPLO3,EXPLO4,EXPLO5,0,0,0;1
;dw SOLDADO_R0,SOLDADO_R2,SOLDADO_R1,SOLDADO_R2,0,0,0,0 ;1
;dw CAR1_L,CAR1_L,CAR1_L,CAR1_L,CAR1_L,CAR1_L,CAR1_L,CAR1_L;1
;dw CAR1_R,CAR1_R,CAR1_R,CAR1_R,CAR1_R,CAR1_R,CAR1_R,CAR1_R;1
;-------- MACRO SECUENCIAS ----------------------
; son grupos de secuencias, una para cada direccion
; el significado es:
; still, left, right, up, up-left, up-right, down, down-left, down-right
; se numeran desde 32 en adelante
; un cero significa que se asigna la ultima que tenga. si se usa el cero hay que asignar alguna al iniciar
_MACRO_SEQUENCES
;db 0,1,2,1,1,2,1,1,2;32 CAR macro sequence

