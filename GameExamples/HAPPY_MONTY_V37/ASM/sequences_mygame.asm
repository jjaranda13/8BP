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
dw MONTY_R0,MONTY_R0,MONTY_R1,MONTY_R1,MONTY_R2,MONTY_R2,MONTY_R3,MONTY_R3;1
;dw MONTY_R3,MONTY_R3,MONTY_R3,MONTY_R3,MONTY_R3,MONTY_R3,MONTY_R3,MONTY_R3;1
dw MONTY_DW0,MONTY_DW0,MONTY_DW1,MONTY_DW1,0,0,0,0;2
;dw MONTY_DW0,MONTY_DW1,MONTY_DW0,MONTY_DW1,0,0,0,0;2
dw MONTY_0,MONTY_0,MONTY_0,MONTY_0,MONTY_1,MONTY_1,MONTY_1,MONTY_1;3
;dw MONTY_0,MONTY_1,MONTY_0,MONTY_1,MONTY_0,MONTY_1,MONTY_0,MONTY_1;3
dw MONTY_L0,MONTY_L0,MONTY_L1,MONTY_L1,MONTY_L2,MONTY_L2,MONTY_L3,MONTY_L3;4
dw MONTY_UP0,MONTY_UP0,MONTY_UP1,MONTY_UP1,0,0,0,0;5
;dw MONTY_UP0,MONTY_UP1,MONTY_UP0,MONTY_UP1,0,0,0,0;5
dw FANT0_1B_H0,FANT0_1B_H0,FANT0_1B_H1,FANT0_1B_H1,FANT0_1B_H2,FANT0_1B_H2,FANT0_1B_H3,FANT0_1B_H3;6
dw FANT0_2B_H0,FANT0_2B_H0,FANT0_2B_H1,FANT0_2B_H1,FANT0_2B_H2,FANT0_2B_H2,FANT0_2B_H3,FANT0_2B_H3;7
dw FANT0_2L_V0,FANT0_2L_V0,FANT0_2L_V1,FANT0_2L_V1,FANT0_2L_V2,FANT0_2L_V2,FANT0_2L_V3,FANT0_2L_V3;8
dw FROG_1B_H0,FROG_1B_H0,FROG_1B_H1,FROG_1B_H1,FROG_1B_H2,FROG_1B_H2,FROG_1B_H1,FROG_1B_H1;9
dw FROG_2L_V0,FROG_2L_V0,FROG_2L_V1,FROG_2L_V1,FROG_2L_V2,FROG_2L_V2,FROG_2L_V1,FROG_2L_V1;10
;dw ARDILLA_1B_H0,ARDILLA_1B_H1,ARDILLA_1B_H2,0,0,0,0,0;11
dw ARDILLA_1B_H0,ARDILLA_1B_H0,ARDILLA_1B_H1,ARDILLA_1B_H1,ARDILLA_1B_H2,ARDILLA_1B_H2,0,0;11
dw BUG_2L_V0,BUG_2L_V0,BUG_2L_V1,BUG_2L_V1,BUG_2L_V2,BUG_2L_V2,BUG_2L_V1,BUG_2L_V1;12
;-------- MACRO SECUENCIAS ----------------------
; son grupos de secuencias, una para cada direccion
; el significado es:
; still, left, right, up, up-left, up-right, down, down-left, down-right
; se numeran desde 32 en adelante
; un cero significa que se asigna la ultima que tenga. si se usa el cero hay que asignar alguna al iniciar
_MACRO_SEQUENCES
db 0,2,1,3,5,3,4,6,4;32 --> secuencias del soldado , id=32. la siguiente seria la 33
db 0,8,7,0,8,7,0,8,7;33 --> secuencias de JOE

