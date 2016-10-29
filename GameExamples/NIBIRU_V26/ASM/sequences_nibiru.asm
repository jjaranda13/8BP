
org 33500;
;=====================================================================
; secuencias de animacion 
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
dw NAVE,NAVE,0,0,0,0,0,0;1
dw FIRE4,0,0,0,0,0,0,0;2 disparo
dw NAVEBALL_L,0,0,0,0,0,0,0;3
dw NAVEBALL_R,0,0,0,0,0,0,0;4
dw NAVEBALL_UP,0,0,0,0,0,0,0;5
dw NAVEBALL_UL,0,0,0,0,0,0,0;6
dw NAVEBALL_UR,0,0,0,0,0,0,0;7
dw NAVEBALL_DW,0,0,0,0,0,0,0;8
dw NAVEBALL_DL,0,0,0,0,0,0,0;9
dw NAVEBALL_DR,0,0,0,0,0,0,0;10
dw BIRD_UP,BIRD_UP,BIRD_DW,BIRD_DW,0,0,0,0;11
dw EXPLO1,EXPLO2,EXPLO1,EXPLO2,EXPLO1,EXPLO2,EXPLO3,0;12
dw EXPLO1,EXPLO2,EXPLO1,EXPLO2,EXPLO1,EXPLO2,EXPLO3,1;13
dw FIRE4_DEL,FIRE4_DEL,1,0,0,0,0,0;14 disparo muerte
dw FIRE_OV,0,0,0,0,0,0,0;15 disparo sobreescritura
;dw VULCAN1,VULCAN1,VULCAN1,VULCAN1,VULCAN2,VULCAN2,VULCAN2,0;16
dw MOSCA1,MOSCA2,0,0,0,0,0,0;16
dw NAVEBALL_R,NAVEBALL_UR,NAVEBALL_UP,NAVEBALL_UL,NAVEBALL_L,NAVEBALL_DL,NAVEBALL_DW,NAVEBALL_DR;15 nave en trompo


_MACRO_SEQUENCES
;--------MACRO SECUENCIAS ----------------------
; son grupos de secuencias, una para cada direccion
; el significado es:
; still, left, right, up, up-left, up-right, down, down-left, down-right
; se numeran desde 32 en adelante
db 0,3,4,5,6,7,8,9,10;32 NAVEBALL secuencias de la nave redonda


