
; Tabla de instrumentos
TABLA_PAUTAS: DW PAUTA_0,PAUTA_1,PAUTA_2,PAUTA_3,PAUTA_4,PAUTA_5,PAUTA_6,PAUTA_7

; Tabla de efectos
TABLA_SONIDOS: DW SONIDO0,SONIDO1,SONIDO2,SONIDO3

;Pautas (instrumentos)
;Instrumento 'Harmonica'
PAUTA_0:	DB	42,0,11,0,12,0,11,0,10,0,9,0,129
;Instrumento 'triririn'
PAUTA_1:	DB	73,0,10,0,42,0,9,0,8,0,7,0,7,0,7,0,7,0,6,0,6,0,6,0,6,0,136
;Instrumento 'chip1'
PAUTA_2:	DB	70,0,7,0,40,0,7,0,6,0,5,0,129
;Instrumento 'onda1'
PAUTA_3:	DB	73,0,10,0,11,0,12,0,11,0,10,0,9,0,8,0,129
;Instrumento 'Onda2'
PAUTA_4:	DB	71,0,8,0,8,0,8,0,7,0,6,0,6,0,6,0,6,0,6,0,6,0,5,0,5,0,5,0,5,0,5,0,5,0,140
;Instrumento 'Chip2'
PAUTA_5:	DB	68,0,5,0,37,0,5,0,4,0,3,0,129
;Instrumento 'Harmonica vol 2'
PAUTA_6:	DB	38,0,7,0,8,0,8,0,7,0,7,0,6,0,129
;Instrumento 'Bajo v2'
PAUTA_7:	DB	77,0,44,0,11,0,9,0,8,0,8,0,8,0,7,0,7,0,6,0,7,0,6,0,6,0,5,0,5,0,129

;Efectos
;Efecto 'bass drum'
SONIDO0:	DB	209,61,0,46,91,0,209,121,0,255
;Efecto 'drum'
SONIDO1:	DB	232,44,0,23,59,5,232,58,3,0,9,2,0,8,1,0,7,1,255
;Efecto 'cascabeles'
SONIDO2:	DB	16,9,1,255
;Efecto 'bass drum vol 2'
SONIDO3:	DB	186,57,0,0,102,0,162,131,0,255

;Frecuencias para las notas
DATOS_NOTAS: DW 0,0
DW 964,910,859,811,766,722,682,644,608,573
DW 541,511,482,455,430,405,383,361,341,322
DW 304,287,271,255,241,228,215,203,191,180
DW 170,161,152,143,135,128,121,114,107,101
DW 96,90,85,81,76,72,68,64,60,57
DW 54,51,48,45,43,40,38,36,34,32
