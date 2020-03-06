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
dw NAVE_L,0,0,0,0,0,0,0;1
dw NAVE_R,0,0,0,0,0,0,0;2
dw NAVE_UP,0,0,0,0,0,0,0;3
dw NAVE_UPL,0,0,0,0,0,0,0;4
dw NAVE_UPR,0,0,0,0,0,0,0;5
dw NAVE_DW,0,0,0,0,0,0,0;6
dw NAVE_DL,0,0,0,0,0,0,0;7
dw NAVE_DR,0,0,0,0,0,0,0;8

;dw EXP0,EXP1,EXP2,EXP3,EXP0,EXP2,EXP4,1;9
dw EXP4,EXP0,EXP1,EXP2,EXP3,EXP3,EXP4,1;9   explosion
dw FIRE_DEL,FIRE_DEL,1,0,0,0,0,0;10 disparo
dw NAUTA1,NAUTA1, NAUTA1, NAUTA1,NAUTA2,NAUTA2,NAUTA2,NAUTA2;11 nauta
dw METEORITO,METEORITO,METEORITO2,METEORITO2,METEORITO3,METEORITO3,METEORITO4,METEORITO4;12 enemigo meteorito 
dw ARO1,ARO1,ARO2,ARO2,ARO3,ARO4,ARO3,ARO2;13 enemigo aro
dw COSA3,COSA3,cosa2,cosa2,cosa1,cosa1,0,0;14 enemigo maquina
dw hex1,hex2,hex3,hex1,hex2,hex3,hex1,hex2;15 enemigo hexagon
dw HAWk1,HAWk1,HAWK2,HAWK2,HAWK3,HAWK3,HAWK2,HAWK2;16 enemigo pajaro

dw NAUTA_DEL,1,0,0,0,0,0,0;17
dw MEDUSA1,MEDUSA1,MEDUSA2,MEDUSA3,MEDUSA3,0,0,0;18
dw NAUTA1_L,NAUTA1_L, NAUTA1_L, NAUTA1_L,NAUTA2_L,NAUTA2_L,NAUTA2_L,NAUTA2_L;19 nauta L

;-------- MACRO SECUENCIAS ----------------------
; son grupos de secuencias, una para cada direccion
; el significado es:
; still, left, right, up, up-left, up-right, down, down-left, down-right
; se numeran desde 32 en adelante
; un cero significa que se asigna la ultima que tenga. si se usa el cero hay que asignar alguna al iniciar
_MACRO_SEQUENCES
;dw 0,NAVE_L,NAVE_R,NAVE_UP,NAVE_UPL,NAVE_UPR,NAVE_DW,NAVE_DWL,NAVE_DWR;32
;db 0,2,1,3,5,3,4,6,4;32 --> secuencias del soldado , id=32. la siguiente secuencia seria la 33

