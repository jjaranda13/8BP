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
dw JOE_LEFT,0,0,0,0,0,0,0;1
dw JOE_RIGHT,0,0,0,0,0,0,0;2
dw PLANET_0,PLANET_0,PLANET_1,PLANET_2,PLANET_2,PLANET_2,PLANET_2,PLANET_2;3
dw HAWK_0A,HAWK_0B,HAWK_0A,HAWK_0b,HAWK_0A,HAWK_0B,HAWK_0A,HAWK_0b;4
dw HAWK_1A,HAWK_1B,HAWK_1A,HAWK_1b,HAWK_1A,HAWK_1B,HAWK_1A,HAWK_1b;5
dw BORRA,BORRA,EXPLO2,EXPLO3,EXPLO1,EXPLO2,BORRA,1;6 secuencia de muerte
dw fire1_del,fire1_del,1,0,0,0,0,0;7 secuencia de muerte
dw HAWK_2A,HAWK_2B,HAWK_2A,HAWK_2b,HAWK_2A,HAWK_2B,HAWK_2A,HAWK_2b;8
dw JEFE_1,JEFE_2,JEFE_3,JEFE_2,JEFE_1,0,0,0; 9 jefe de fase
dw BODY_DRAGON_2,BODY_DRAGON_2,0,0,0,0,0,0;10 fase 3 ELIMINAR


;-------- MACRO SECUENCIAS ----------------------
; son grupos de secuencias, una para cada direccion
; el significado es:
; still, left, right, up, up-left, up-right, down, down-left, down-right
; se numeran desde 32 en adelante
; un cero significa que se asigna la ultima que tenga. si se usa el cero hay que asignar alguna al iniciar
_MACRO_SEQUENCES
db 0,2,1,0,2,1,0,2,1;32 --> secuencias de JOE id=32
;db 0,2,2,0,2,2,0,2,2;32 --> secuencias de JOE id=32

