; fichero de fases

org 25000
;=======================================================
;FASE1
;=======================================================
_START_FASE1
; primero 3 parametros antes de la lista de "map items"
dw 50; maximo alto de un sprite por si se cuela por arriba y ya hay que pintar parte de el
dw -18; ancho maximo de cualquier map item. debe expresarse como numero negativo
db 16; num items
dw 36,82,MONTUP; 1
dw 48,104,MONTUP;2
dw 60,126,MONTUP;3
dw 72,138,MONTUP;4
dw 72,150,MONTDW;5
dw 60,172,MONTH;6
dw 60,194,MONTDW;7
dw 48,206,MONTDW;8
;aqui repito elementos para encajar con la posicion 100
dw 48,228,MONTUP;9
dw 60,250,MONTUP;10
dw 72,262,MONTUP;11
dw 72,274,MONTDW;12
dw 60,296,MONTH;13
dw 60,320,MONTDW;14
dw 48,350,MONTDW;15
dw 36,380,MONTDW;16
_END_FASE1
;=======================================================
;FASE2
;=======================================================
_START_FASE2
dw 50; maximo alto de un sprite por si se cuela por arriba y ya hay que pintar parte de el
dw -6; ancho maximo de cualquier map item. debe expresarse como numero negativo
db 15
dw 128,80,PLACA2_L_OV
dw 128,110,PLACA2_R_OV
dw 192,116,PLACA2_L_OV
dw 192,126,PLACA2_R_OV
dw 92,130,PLACA_L_OV
dw 92,150,PLACA_R_OV
dw 124,151,PLACA_L_OV
dw 124,171,PLACA_R_OV
dw 128,200,PLACA2_L_OV
dw 128,210,PLACA2_R_OV
dw 92,220,PLACA2_L_OV
dw 92,230,PLACA2_R_OV
dw 164,240,PLACA2_L_OV
dw 164,260,PLACA2_R_OV
dw 156,254,CUPULA2_OV



dw 96,100,PLACA_L_OV
dw 96,120,PLACA_R_OV
dw 128,120,PLACA_L_OV
dw 128,140,PLACA_R_OV
dw 64,140,PLACA_L_OV
dw 64,160,PLACA_R_OV
dw 160,100,PLACA_L_OV
dw 160,120,PLACA_R_OV
dw 120,84,CUPULA_OV

_END_FASE2
;=======================================================
;FASE3
;=======================================================
_START_FASE3
dw 50; maximo alto de un sprite por si se cuela por arriba y ya hay que pintar parte de el
dw -80; ancho maximo de cualquier map item. debe expresarse como numero negativo
db 4
dw 40,0,MAR; 1
dw 40,80,MAR; 2
dw 189,0,NUBES; 2
dw 189,80,NUBES; 2

_END_FASE3





