
; Tabla de instrumentos
TABLA_PAUTAS: DW PAUTA_0,PAUTA_1,PAUTA_2

; Tabla de efectos
TABLA_SONIDOS: DW 0

;Pautas (instrumentos)
;Instrumento 'warn'
PAUTA_0:	DB	12,0,12,0,12,0,10,0,9,0,10,0,12,0,12,0,136
;Instrumento 'synt'
PAUTA_1:	DB	14,0,13,0,11,0,8,0,6,0,130
;Instrumento 'piano'
PAUTA_2:	DB	11,0,15,0,12,0,10,0,9,0,9,0,9,0,130

;Efectos

;Frecuencias para las notas
DATOS_NOTAS: DW 0,0
DW 964,910,859,811,766,722,682,644,608,573
DW 541,511,482,455,430,405,383,361,341,322
DW 304,287,271,255,241,228,215,203,191,180
DW 170,161,152,143,135,128,121,114,107,101
DW 96,90,85,81,76,72,68,64,60,57
DW 54,51,48,45,43,40,38,36,34,32
