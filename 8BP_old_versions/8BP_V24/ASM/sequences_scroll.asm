
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
dw JOE1,JOE1,JOE2,JOE2,0,0,0,0;1
dw JOE7,JOE7,JOE8,JOE8,0,0,0,0;2
dw JOE3,JOE3,JOE4,JOE4,0,0,0,0;3
dw JOE5,JOE5,JOE6,JOE6,0,0,0,0;4

dw SOLDADO_R0,SOLDADO_R2,SOLDADO_R1,SOLDADO_R2,0,0,0,0 ;4
dw SOLDADO_I0,SOLDADO_I2,SOLDADO_I1,SOLDADO_I2,0,0,0,0 ;5


