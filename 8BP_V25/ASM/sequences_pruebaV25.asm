
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

;--------------secuencias de animacion  --------
_SEQUENCES_LIST
dw NAVE,0,0,0,0,0,0,0;1
dw JOE1,JOE2,0,0,0,0,0,0;2 UP JOE
dw JOE7,JOE8,0,0,0,0,0,0;3 DW JOE
dw JOE3,JOE4,0,0,0,0,0,0;4 R JOE
dw JOE5,JOE6,0,0,0,0,0,0;5 L JOE
dw NAVEBALL_L,0,0,0,0,0,0,0;6
dw NAVEBALL_R,0,0,0,0,0,0,0;7
dw NAVEBALL_UP,0,0,0,0,0,0,0;8
dw NAVEBALL_UL,0,0,0,0,0,0,0;9
dw NAVEBALL_UR,0,0,0,0,0,0,0;10
dw NAVEBALL_DW,0,0,0,0,0,0,0;11
dw NAVEBALL_DL,0,0,0,0,0,0,0;12
dw NAVEBALL_DR,0,0,0,0,0,0,0;13
dw NAVEBALL_R,NAVEBALL_UR,NAVEBALL_UP,NAVEBALL_UL,NAVEBALL_L,NAVEBALL_DL,NAVEBALL_DW,NAVEBALL_DR;14 nave en trompo



dw SOLDADO_R0,SOLDADO_R2,SOLDADO_R1,SOLDADO_R2,0,0,0,0 ;14
dw SOLDADO_I0,SOLDADO_I2,SOLDADO_I1,SOLDADO_I2,0,0,0,0 ;15


_MACRO_SEQUENCES
;--------MACRO SECUENCIAS ----------------------
; son grupos de secuencias, una para cada direccion
; el significado es:
; still, left, right, up, up-left, up-right, down, down-left, down-right
; se numeran desde 32 en adelante
db 0,5,4,2,5,4,3,5,4;32 JOE secuencias del soldado joe
db 0,6,7,8,9,10,11,12,13;33 NAVEBALL secuencias de la nave redonda


