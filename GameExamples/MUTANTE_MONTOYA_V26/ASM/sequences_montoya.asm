
org 33500;
;=====================================================================
; 31 secuencias de animacion (500bytes) de 8 frames
;=====================================================================
; debe ser una tabla fija y no variable
; cada secuencia contiene las direcciones de frames de animacion ciclica
; cada secuencia son 8 direcciones de memoria de imagen
; numero par porque las animaciones suelen ser un numero par
; un cero significa fin de secuencia, aunque siempre se gastan 8 words /secuencia
; al encontrar un cero se comienza de nuevo. 
; si no hay cero, tras el frame 8 se comienza de nuevo
; en total caben 31 secuencias diferentes (disponemos de 500 bytes)
; SEQUENCES:
; la secuencia cero es que no hay secuencia. 
; empezamos desde la secuencia 1
_SEQUENCES_LIST
;--------------secuencias de animacion del personaje --------
dw MONTOYA_R0,MONTOYA_R1,MONTOYA_R2,MONTOYA_R1,0,0,0,0	  ;1
dw MONTOYA_UR0,MONTOYA_UR1,MONTOYA_UR2,MONTOYA_UR1,0,0,0,0  ;2
dw MONTOYA_U0,MONTOYA_U1,MONTOYA_U0,MONTOYA_U2,0,0,0,0      ;3
dw MONTOYA_UL0,MONTOYA_UL1,MONTOYA_UL2,MONTOYA_UL1,0,0,0,0  ;4
dw MONTOYA_L0,MONTOYA_L1,MONTOYA_L2,MONTOYA_L1,0,0,0,0      ;5
dw MONTOYA_DL0,MONTOYA_DL1,MONTOYA_DL2,MONTOYA_DL1,0,0,0,0  ;6
dw MONTOYA_D0,MONTOYA_D1,MONTOYA_D0,MONTOYA_D2,0,0,0,0      ;7
dw MONTOYA_DR0,MONTOYA_DR1,MONTOYA_DR2,MONTOYA_DR1,0,0,0,0  ;8
;--------------secuencias de animacion del soldado --------
dw SOLDADO_R0,SOLDADO_R2,SOLDADO_R1,SOLDADO_R2,0,0,0,0 ;9
dw SOLDADO_L0,SOLDADO_L2,SOLDADO_L1,SOLDADO_L2,0,0,0,0 ;10

;--------------secuencias de animacion del fantasma --------
dw FANTASMA_0,FANTASMA_1,FANTASMA_2,0,0,0,0,0;11

;a continuacion se almacenan todas las secuencias que defina el programador
dw PATO_D,0,0,0,0,0,0,0;12
dw PATO_I,0,0,0,0,0,0,0;13
dw NAVE_MALA,0,0,0,0,0,0,0;14
dw PRINCESS,PRINCESS,PRINCESS,PRINCESS,PRINCESS2,PRINCESS2,PRINCESS2,PRINCESS2;15
dw MOSCA1,MOSCA2,0,0,0,0,0,0 ;16



_MACRO_SEQUENCES
;--------MACRO SECUENCIAS ----------------------
; son grupos de secuencias, una para cada direccion
; el significado es:
; still, left, right, up, up-left, up-right, down, down-left, down-right
; se numeran desde 32 en adelante