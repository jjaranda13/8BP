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
dw SOLDADO_R0,SOLDADO_R2,SOLDADO_R1,SOLDADO_R2,0,0,0,0 ;1
dw SOLDADO_L0,SOLDADO_L2,SOLDADO_L1,SOLDADO_L2,0,0,0,0 ;2
dw SOLDADO_R1_UP,0,0,0,0,0,0,0;3
dw SOLDADO_R1_DOWN,0,0,0,0,0,0,0;4
dw SOLDADO_L1_UP,0,0,0,0,0,0,0;5
dw SOLDADO_L1_DOWN,0,0,0,0,0,0,0;6


dw JOE_LEFT,0,0,0,0,0,0,0;7
dw JOE_RIGHT,0,0,0,0,0,0,0;8

dw RASTAN_D1,RASTAN_D2,RASTAN_D1,RASTAN_D2,RASTAN_D1,RASTAN_D2,RASTAN_D1,RASTAN_D2;9
dw RASTAN_L1,RASTAN_L2,RASTAN_L1,RASTAN_L2,RASTAN_L1,RASTAN_L2,RASTAN_L1,RASTAN_L2;10


dw JOE1,JOE1,JOE2,JOE2,0,0,0,0;11
dw JOE7,JOE7,JOE8,JOE8,0,0,0,0;12
dw JOE3,JOE3,JOE4,JOE4,0,0,0,0;13
dw JOE5,JOE5,JOE6,JOE6,0,0,0,0;14

dw BORRA_C,1,0,0,0,0,0,0;15 demo c
;-------- MACRO SECUENCIAS ----------------------
; son grupos de secuencias, una para cada direccion
; el significado es:
; still, left, right, up, up-left, up-right, down, down-left, down-right
; se numeran desde 32 en adelante
; un cero significa que se asigna la ultima que tenga. si se usa el cero hay que asignar alguna al iniciar
_MACRO_SEQUENCES
db 0,2,1,3,5,3,4,6,4;32 --> secuencias del soldado , id=32. la siguiente seria la 33
db 0,8,7,0,8,7,0,8,7;33 --> secuencias de JOE

