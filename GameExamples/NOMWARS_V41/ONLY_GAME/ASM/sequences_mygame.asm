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
;dw JOE_UP1,JOE_UP1,JOE_UP1,JOE_UP1,JOE_UP2,JOE_UP2,JOE_UP2  ,JOE_UP2;1
dw JOE_UP1,JOE_UP1,JOE_UP2,JOE_UP2,JOE_UP1,JOE_UP1,JOE_UP2  ,JOE_UP2;1
dw JOE_UPR1,JOE_UPR1,JOE_UPR2,JOE_UPR2,JOE_UPR1,JOE_UPR1,JOE_UPR2  ,JOE_UPR2;2
dw JOE_R1,JOE_R1,JOE_R2,JOE_R2,JOE_R1,JOE_R1,JOE_R2  ,JOE_R2;3
dw JOE_DWR1,JOE_DWR1,JOE_DWR2,JOE_DWR2,JOE_DWR1,JOE_DWR1,JOE_DWR2  ,JOE_DWR2;4
;dw JOE_DW1,JOE_DW1,JOE_DW1,JOE_DW1,JOE_DW2,JOE_DW2,JOE_DW2  ,JOE_DW2;5
dw JOE_DW1,JOE_DW1,JOE_DW2,JOE_DW2,JOE_DW1,JOE_DW1,JOE_DW2  ,JOE_DW2;5
dw JOE_DWL1,JOE_DWL1,JOE_DWL2,JOE_DWL2,JOE_DWL1,JOE_DWL1,JOE_DWL2  ,JOE_DWL2;6
dw JOE_L1,JOE_L1,JOE_L2,JOE_L2,JOE_L1,JOE_L1,JOE_L2  ,JOE_L2;7
dw JOE_UPL1,JOE_UPL1,JOE_UPL2,JOE_UPL2,JOE_UPL1,JOE_UPL1,JOE_UPL2  ,JOE_UPL2;8
dw DISPARO_FIN1,DISPARO_FIN1,DISPARO_FIN2,DISPARO_FIN3,DISPARO_FIN4,1,0,0 ;9
dw BEXPLO1,BEXPLO1,BEXPLO1,BEXPLO2,BEXPLO2,BEXPLO3,BEXPLO4,1 ;10
dw NAZI_R1,NAZI_R2,NAZI_R1,NAZI_R2,NAZI_R1,NAZI_R2,NAZI_R1,NAZI_R2 ;11
;dw NAZI_R1,NAZI_R2,NAZI_L1,NAZI_L2,NAZI_R1,NAZI_R2,NAZI_L1,NAZI_L2 ;11
dw NAZI_UP1,NAZI_UP2,NAZI_UP1,NAZI_UP2,NAZI_UP1,NAZI_UP2,NAZI_UP1,NAZI_UP2;12
dw NAZI_DW1,NAZI_DW2,NAZI_DW1,NAZI_DW2,NAZI_DW1,NAZI_DW2,NAZI_DW1,NAZI_DW2;13
dw NAZI_L1,NAZI_L2,NAZI_L1,NAZI_L2,NAZI_L1,NAZI_L2,NAZI_L1,NAZI_L2 ;14
dw NAZIMU, NAZIMU,NAZIMU2,NAZIMU, NAZIMU2,NAZIMU, NAZIMU2,1;15
;dw NAZI_L1,NAZI_L2,NAZI_R1,NAZI_R2,NAZI_L1,NAZI_L2,NAZI_R1,NAZI_R2 ;14
;dw DISPARO_FIN1,DISPARO_FIN2,DISPARO_FIN3,DISPARO_FIN4,1,0,0,0 ;1
;dw SOLDADO_L0,SOLDADO_L2,SOLDADO_L1,SOLDADO_L2,0,0,0,0 ;2

;-------- MACRO SECUENCIAS ----------------------
; son grupos de secuencias, una para cada direccion
; el significado es:
; still, left, right, up, up-left, up-right, down, down-left, down-right
; se numeran desde 32 en adelante
; un cero significa que se asigna la ultima que tenga. si se usa el cero hay que asignar alguna al iniciar
_MACRO_SEQUENCES
;db 0,2,1,3,5,3,4,6,4;32 --> secuencias del soldado , id=32. la siguiente secuencia seria la 33
db 0,14,11,12,14,11,13,14,11;32 NAZI
