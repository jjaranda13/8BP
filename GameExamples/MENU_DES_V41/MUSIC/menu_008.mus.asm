
; Tabla de instrumentos
TABLA_PAUTAS: DW PAUTA_0,PAUTA_1,PAUTA_2,PAUTA_3,PAUTA_4,PAUTA_5,PAUTA_6

; Tabla de efectos
TABLA_SONIDOS: DW SONIDO0

;Pautas (instrumentos)
;Instrumento 'Piano'
PAUTA_0:	DB	8,0,7,0,6,0,5,0,129
;Instrumento 'Piano'
PAUTA_1:	DB	15,0,14,10,12,-10,10,0,10,0,10,0,131
;Instrumento 'pru'
PAUTA_2:	DB	15,20,2,-20,10,9,9,-9,8,0,129
;Instrumento 'zoung'
PAUTA_3:	DB	8,0,11,0,13,0,15,0,15,0,14,0,12,0,10,1,129
;Instrumento 'trumpet'
PAUTA_4:	DB	12,1,15,-19,15,19,15,0,15,0,129
;Instrumento 'tromp2'
PAUTA_5:	DB	12,0,13,0,13,0,14,0,14,0,13,0,12,0,11,0,10,0,9,0,9,0,129
;Instrumento 'intro'
PAUTA_6:	DB	9,0,13,0,15,0,12,0,10,0,9,3,9,-3,9,3,9,-3,132

;Efectos
;Efecto 'bom'
SONIDO0:	DB	75,33,151,80,5,0,184,24,1,184,24,2,184,24,3,184,24,4,255

;Frecuencias para las notas
DATOS_NOTAS: DW 0,0
DW 1711,1614,1524,1438,1358,1281,1210,1142,1078,1017
DW 960,906,855,807,762,719,679,641,605,571
DW 539,509,480,453,428,404,381,360,339,320
DW 302,285,269,254,240,227,214,202,190,180
DW 170,160,151,143,135,127,120,113,107,101
DW 95,90,85,80,76,71,67,64,60,57