
; Tabla de instrumentos
TABLA_PAUTAS: DW PAUTA_0,PAUTA_1,PAUTA_2,PAUTA_3,PAUTA_4,PAUTA_5,PAUTA_6,PAUTA_7,PAUTA_8

; Tabla de efectos
TABLA_SONIDOS: DW 0

;Pautas (instrumentos)
;Instrumento 'Piano_montoya'
PAUTA_0:	DB	14,0,12,0,10,0,9,0,129
;Instrumento 'Piano -1'
PAUTA_1:	DB	46,0,13,0,12,0,11,0,10,0,9,0,8,0,129
;Instrumento 'Inc vol piano -1'
PAUTA_2:	DB	40,0,8,0,8,0,8,0,9,0,9,0,9,0,9,0,9,0,10,0,10,0,10,0,10,0,10,0,11,0,11,0,11,0,11,0,11,0,12,0,12,0,12,0,12,0,12,0,13,0,13,0,13,0,13,0,13,0,14,0,14,0,129
;Instrumento 'Eco 1 piano -1'
PAUTA_3:	DB	45,0,12,0,11,0,10,0,9,0,0,129
;Instrumento 'Eco 2 piano -1'
PAUTA_4:	DB	42,0,9,0,9,0,8,0,8,0,0,129
;Instrumento 'Eco 3 piano -1'
PAUTA_5:	DB	41,0,8,0,8,0,7,0,6,0,0,129
;Instrumento 'Techno +1'
PAUTA_6:	DB	78,-28,15,-22,15,29,14,30,15,0,12,0,0,129
;Instrumento 'Trompeta'
PAUTA_7:	DB	12,0,13,0,13,0,14,0,14,0,13,0,12,0,11,0,10,0,9,0,8,0,129
;Instrumento 'Piano'
PAUTA_8:	DB	15,0,13,0,11,0,10,0,9,0,8,0,7,-2,6,0,5,0,4,0,2,0,1,0,0,129

;Efectos

;Frecuencias para las notas
DATOS_NOTAS: DW 0,0
DW 964,910,859,811,766,722,682,644,608,573
DW 541,511,482,455,430,405,383,361,341,322
DW 304,287,271,255,241,228,215,203,191,180
DW 170,161,152,143,135,128,121,114,107,101
DW 96,90,85,81,76,72,68,64,60,57
DW 54,51,48,45,43,40,38,36,34,32
