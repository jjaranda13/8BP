IMAGE_LIST
;---------------------------------------------------------------------------------------------
;pondremos aqui una lista de las imagenes que queremos usar sin especificar la direccion de memoria desde basic
; de este modo el comando |SETUPSP,<id>,9,<address> se transforma en |SETUPSP,<id>,9,<numero>
; la ventaja de no usar direcciones de memoria en basic es que si ampliamos los graficos o se reensamblan en 
; direcciones diferentes, el numero que asignemos no cambiara
; NO tienen que tener todas un numero, solo aquellas que vamos a usar con |setupsp, id, 9,<num>
; se empiezan a numerar en 16
; podemos usar hasta 255 imagenes especificadas de este modo 
; no hace falta que la lista tenga 255 elementos. es de longitud variable, incluso puede estar vacia
;----------------------------------------------------------------------------------------------
dw NAVE; 16
dw FIRE_DELETED;17
dw FIRE;18
dw FIREINV;19
dw INVADER_DELETED;20

; ahora las imagenes
IMAGE0

;------ BEGIN SPRITE --------
NAVE
db 6 ; ancho
db 8 ; alto
db 0 , 160 , 16 , 138 , 0 , 0 
db 0 , 160 , 32 , 229 , 0 , 0 
db 0 , 56 , 0 , 80 , 216 , 0 
db 0 , 48 , 80 , 160 , 206 , 0 
db 0 , 101 , 224 , 218 , 206 , 0 
db 0 , 101 , 192 , 206 , 206 , 0 
db 0 , 96 , 229 , 138 , 205 , 0 
db 0 , 112 , 228 , 136 , 229 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
FIRE; disparo de nuestra nave
db 1 ; ancho
db 12+4 ; alto
db 48 
db 48 
db 12 
db 12 
db 0 
db 0 
db 0 
db 0 
db 0 
db 0 
db 0 
db 0 
db 0 
db 0 
db 0 
db 0 

;------ END SPRITE --------
;------ BEGIN SPRITE --------
FIREINV; disparo de invasores
db 1 ; ancho
db 12 ; alto
db 0 
db 0 
db 0 
db 0 
db 0 
db 0 
db 0 
db 0 
db 12 
db 12 
db 48 
db 48 
;------ BEGIN SPRITE --------
INVADER_DELETED; fotograma de borrado para cuando mueren
db 6 ; ancho
db 16 ; alto
ds 16*6
;------ BEGIN SPRITE --------
FIRE_DELETED; disparo borrado
db 1 ; ancho
db 4 ; alto
ds 4
;------ BEGIN SPRITE --------
EXPLO1
db 6 ; ancho
db 16 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 32 , 16 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 16 , 16 , 32 , 16 , 0 
db 0 , 0 , 100 , 152 , 0 , 0 
db 0 , 0 , 100 , 152 , 0 , 0 
db 0 , 0 , 16 , 32 , 0 , 0 
db 0 , 16 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 32 , 0 
db 0 , 0 , 32 , 32 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
EXPLO2
db 6 ; ancho
db 16 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 228 , 228 , 0 , 0 
db 0 , 68 , 228 , 228 , 160 , 0 
db 0 , 68 , 240 , 240 , 228 , 0 
db 0 , 216 , 240 , 240 , 204 , 0 
db 0 , 240 , 240 , 240 , 240 , 0 
db 0 , 240 , 240 , 240 , 240 , 0 
db 0 , 216 , 240 , 240 , 228 , 0 
db 0 , 216 , 240 , 240 , 228 , 0 
db 0 , 240 , 240 , 240 , 240 , 0 
db 0 , 80 , 240 , 240 , 240 , 0 
db 0 , 68 , 240 , 216 , 216 , 0 
db 0 , 0 , 216 , 216 , 136 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
INVADER1
db 6 ; ancho
db 16 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 15 , 15 , 0 , 0 
db 0 , 5 , 15 , 15 , 10 , 0 
db 0 , 4 , 48 , 26 , 37 , 0 
db 0 , 13 , 112 , 26 , 165 , 0 
db 0 , 14 , 3 , 11 , 7 , 0 
db 0 , 13 , 15 , 15 , 15 , 0 
db 0 , 14 , 240 , 240 , 164 , 0 
db 0 , 80 , 88 , 252 , 88 , 0 
db 0 , 4 , 12 , 12 , 160 , 0 
db 0 , 14 , 14 , 14 , 8 , 0 
db 0 , 13 , 240 , 80 , 14 , 0 
db 0 , 8 , 160 , 80 , 4 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
INVADER2
db 6 ; ancho
db 16 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 15 , 15 , 0 , 0 
db 0 , 5 , 15 , 15 , 10 , 0 
db 0 , 4 , 48 , 26 , 37 , 0 
db 0 , 13 , 112 , 26 , 165 , 0 
db 0 , 14 , 3 , 11 , 7 , 0 
db 0 , 13 , 15 , 15 , 15 , 0 
db 0 , 14 , 240 , 240 , 164 , 0 
db 0 , 14 , 88 , 252 , 13 , 0 
db 0 , 5 , 12 , 12 , 10 , 0 
db 0 , 0 , 14 , 14 , 160 , 0 
db 0 , 0 , 14 , 4 , 240 , 0 
db 0 , 0 , 12 , 4 , 88 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
;------ END SPRITE --------
;------ END SPRITE --------
_FINGRAPH