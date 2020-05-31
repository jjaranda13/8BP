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
dw MANZANA_BORRAR,MAS3_1,MAS3_2,MAS3_3,MAS3_3,MAS3_3,MANZANA_BORRAR,1 ;3		el soldado coge una manzana buena
dw CHOF,MANZANA_BORRAR,MENOS1_1,MENOS1_2,MENOS1_3,MENOS1_3,MANZANA_BORRAR,1;4	cae al suelo una manzana buena
dw MANZANA_BORRAR,MENOS5_1,MENOS5_2,MENOS5_3,MANZANA_BORRAR,1,0,0;5    	el soldado coge una manzana mala
dw CHOF,MANZANA_BORRAR,MANZANA_BORRAR,1,0,0,0,0;6 			cae al suelo una manzana mala
dw GUSANO_R1,GUSANO_R1,GUSANO_R1,GUSANO_R1,GUSANO_R2,GUSANO_R2,GUSANO_R2,GUSANO_R2;7	gusanoR se desplaza
dw GUSANO_BORRAR,MAS3_1,MAS3_2,MAS3_3,MAS3_3,MAS3_3,MANZANA_BORRAR,1;8 					secuencia muerte gusano
dw GUSANO_L1,GUSANO_L1,GUSANO_L1,GUSANO_L1,GUSANO_L2,GUSANO_L2,GUSANO_L2,GUSANO_L2;9	gusanoL se desplaza

;-------- MACRO SECUENCIAS ----------------------
; son grupos de secuencias, una para cada direccion
; el significado es:
; still, left, right, up, up-left, up-right, down, down-left, down-right
; se numeran desde 32 en adelante
; un cero significa que se asigna la ultima que tenga. si se usa el cero hay que asignar alguna al iniciar
_MACRO_SEQUENCES
db 0,2,1,0,0,0,0,0,0;32 --> secuencias del soldado , id=32. la siguiente secuencia seria la 33