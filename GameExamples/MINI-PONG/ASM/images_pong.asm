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
dw BARRA; 16
dw PELOTA;17 

; ahora las imagenes
IMAGE0
;------ BEGIN SPRITE --------
PELOTA
;------ BEGIN SPRITE --------
db 6 ; ancho
db 13 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 16 , 32 , 0 , 0 
db 0 , 0 , 52 , 56 , 0 , 0 
db 0 , 0 , 52 , 56 , 0 , 0 
db 0 , 0 , 52 , 56 , 0 , 0 
db 0 , 0 , 16 , 32 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
;------ END SPRITE --------
BARRA
db 2 ; ancho
db 42 ; alto
db 0 , 0
db 0 , 0
db 0 , 0
db 0 , 0
db 0 , 0
db 16 , 32 ;1
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48;8
db 48 , 48 ;1
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48;8
db 48 , 48 ;1
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48;8
db 48 , 48 ;1
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48
db 48 , 48
db 16 , 32;8
db 0 , 0
db 0 , 0
db 0 , 0
db 0 , 0
db 0 , 0


;------ END SPRITE --------
_FINGRAPH