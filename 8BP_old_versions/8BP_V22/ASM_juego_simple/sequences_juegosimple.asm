
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
dw 0,0,0,0,0,0,0,0	  ;1
dw 0,0,0,0,0,0,0,0	  ;2
dw 0,0,0,0,0,0,0,0	  ;3
dw 0,0,0,0,0,0,0,0	  ;4
dw 0,0,0,0,0,0,0,0	  ;5
