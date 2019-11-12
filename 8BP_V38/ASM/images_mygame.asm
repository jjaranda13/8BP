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
dw SOLDADO_R0; 16
dw SOLDADO_R1;17 piernas abiertas
dw SOLDADO_R2;18
dw DISPARO;19


; ahora las imagenes
;=================================================
; si no vas a usar el comando PRINTAT,  sino simplemente los caracteres del amstrad, entonces
; puedes comentar la siguientes 3 lineas
_BEGIN_ALPHABET
read "alphabet_default.asm"
_END_ALPHABET
;=================================================
_SPRITE_HEIGHTS_TABLE	ds 32 ; 32 bytes para almacenar las alturas de los sprites y poderlos ordenar. uso interno.
;=================================================
_BEGIN_FLIP_IMAGES
;=================================================
; aqui pon las imagenes que se definen como otras existentes pero flipeadas horizontalmente. 

; los frames del soldado a la izquierda los defino como flipeados. es mas lento pero gasta menos ram
SOLDADO_L0 dw SOLDADO_R0;
SOLDADO_L1 dw SOLDADO_R1;
SOLDADO_L2 dw SOLDADO_R2;

;=================================================
_END_FLIP_IMAGES
;=================================================
;=================================================
_BEGIN_IMAGES
;=================================================

;------ BEGIN SPRITE --------
DISPARO
db 6 ; ancho
db 10 ; alto
db 0,0 , 0 , 0 , 0 ,0
db 0,0 , 0 , 0 , 0 ,0
db 0,0 , 0 , 0 , 0 ,0
db 0,0 , 0 , 0 , 0 ,0
db 0,0 , 0 , 0 , 0 ,0
db 0,0 , 16 , 32 , 0 ,0
db 0,0 , 100 , 152 , 0 ,0
db 0,0 , 100 , 152 , 0 ,0
db 0,0 , 100 , 152 , 0 ,0
db 0,0 , 16 , 32 , 0 ,0

;------ END SPRITE --------
;------ BEGIN SPRITE --------
SOLDADO_R0
db 6 ; ancho
db 24 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 48 , 48 , 0 , 0 
db 0 , 16 , 56 , 48 , 32 , 0 
db 0 , 52 , 48 , 48 , 48 , 0 
db 0 , 52 , 48 , 48 , 48 , 0 
db 0 , 52 , 48 , 48 , 48 , 0 
db 0 , 12 , 36 , 112 , 240 , 0 
db 0 , 164 , 240 , 229 , 207 , 0 
db 0 , 69 , 207 , 207 , 207 , 0 
db 0 , 80 , 207 , 207 , 218 , 0 
db 0 , 0 , 229 , 207 , 248 , 0 
db 0 , 0 , 80 , 240 , 240 , 0 
db 0 , 16 , 48 , 48 , 80 , 0 
db 0 , 16 , 37 , 48 , 90 , 0 
db 0 , 16 , 15 , 26 , 79 , 0 
db 0 , 16 , 37 , 48 , 79 , 0 
db 0 , 0 , 37 , 37 , 0 , 0 
db 0 , 0 , 48 , 37 , 0 , 0 
db 0 , 0 , 16 , 15 , 0 , 0 
db 0 , 0 , 32 , 16 , 32 , 0 
db 0 , 0 , 48 , 16 , 48 , 0 
db 0 , 0 , 60 , 60 , 60 , 0 
db 0 , 0 , 0 , 0 , 0 , 0
;------ END SPRITE --------
;------ BEGIN SPRITE --------
SOLDADO_R1
db 6 ; ancho
db 24 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 48 , 48 , 0 , 0 
db 0 , 16 , 56 , 48 , 32 , 0 
db 0 , 52 , 48 , 48 , 48 , 0 
db 0 , 52 , 48 , 48 , 48 , 0 
db 0 , 52 , 48 , 240 , 240 , 0 
db 0 , 88 , 240 , 229 , 218 , 0 
db 0 , 164 , 207 , 207 , 207 , 0 
db 0 , 69 , 207 , 207 , 207 , 0 
db 0 , 80 , 207 , 207 , 218 , 0 
db 0 , 0 , 229 , 207 , 248 , 0 
db 0 , 16 , 48 , 48 , 240 , 0 
db 0 , 16 , 37 , 48 , 80 , 0 
db 0 , 16 , 15 , 26 , 79 , 0 
db 0 , 16 , 37 , 48 , 79 , 0 
db 0 , 80 , 37 , 37 , 90 , 0 
db 0 , 0 , 48 , 37 , 0 , 0 
db 0 , 0 , 176 , 15 , 0 , 0 
db 0 , 48 , 80 , 15 , 176 , 0 
db 0 , 48 , 160 , 80 , 48 , 0 
db 0 , 16 , 112 , 16 , 112 , 0 
db 0 , 0 , 60 , 60 , 60 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
SOLDADO_R2
db 6 ; ancho
db 24 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 48 , 48 , 0 , 0 
db 0 , 16 , 56 , 48 , 32 , 0 
db 0 , 52 , 48 , 48 , 48 , 0 
db 0 , 52 , 48 , 48 , 48 , 0 
db 0 , 52 , 48 , 48 , 48 , 0 
db 0 , 12 , 36 , 112 , 240 , 0 
db 0 , 164 , 240 , 229 , 207 , 0 
db 0 , 69 , 207 , 207 , 207 , 0 
db 0 , 80 , 207 , 207 , 218 , 0 
db 0 , 0 , 229 , 207 , 248 , 0 
db 0 , 0 , 80 , 240 , 240 , 0 
db 0 , 16 , 48 , 48 , 80 , 0 
db 0 , 16 , 37 , 48 , 90 , 0 
db 0 , 16 , 15 , 26 , 90 , 0 
db 0 , 16 , 37 , 48 , 90 , 0 
db 0 , 0 , 37 , 37 , 0 , 0 
db 0 , 0 , 48 , 37 , 138 , 0 
db 0 , 0 , 16 , 79 , 138 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 16 , 32 , 0 , 0 
db 0 , 0 , 16 , 32 , 0 , 0 
db 0 , 0 , 16 , 48 , 0 , 0 
;------ END SPRITE --------

;=================================================
_END_IMAGES
;=================================================

;=================================================
_BEGIN_3D_ZOOM_IMAGES
;=================================================
; limites aplicables a todas las imagenes con zoom
; para estos limites se considera el horizonte como el 0 y hacia abajo va creciendo hasta 200

_ZOOM_LIMIT_A
db 120; entre 0 y limitA se pone imagen 3

_ZOOM_LIMIT_B
db 50
;db 80; entre este limite y el limite A, se pone imagen 2
;mas cerca que limit B se pone imagen 1
;=================================================
; las imagenes de tipo zoom se definen aqui. 

;CARTEL_ZOOM
;db 1; ancho simbolico
;db 1; alto simbolico
;dw CARTEL1, CARTEL2, CARTEL3



;=================================================
_END_3D_ZOOM_IMAGES
;=================================================

;=================================================================
_BEGIN_3D_SEGMENTS
;=================================================================
; el ancho es el de la scanline
; el alto es el alto real
; luego va el dx, que puede ser positivo ( inclinado a izquierda) o negativo (inclinado a derecha)
; finalmente podria ir un dy que indique alto de patron de repeticion
db 0; esto es para que la primera imagen de tipo segmento sea > _3D_SEGMENTS
;--------------------------------------------------------------------

; 
;----------------- SEGMENTOS RECTOS --------------------------------
;SEGMENT_L0
;db 20; ancho
;db 50; alto
;db 0; dx
;db 192,192,192,192, 192,192,192,192 ,192,240,240, 0, 0, 0, 0, 0, 0, 0, 0, 0
;-------------------------------------------------------------------


;=================================================
_END_3D_SEGMENTS
;=================================================

_END_GRAPH