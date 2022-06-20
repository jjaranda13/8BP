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
;DW LADRILLO_RL ;16
DW COCO_R1;16
DW EX_X_RD;17
DW EX_X_LD;18 *
DW EX_X_RU;19
DW EX_X_LU;20 *
DW EX_H_D;21
DW EX_H_U;22
DW EX_X_HU;23
DW EX_X_HD;24
DW EX_V_L;25 *
DW EX_V_R;26
DW EX_X_LD_UR; 27
DW EX_X_RD_UL; 28 *
DW EX_X_RU_DR
DW EX_X_LU_DL; 30 * 

DW IN_X_RD; I
DW IN_X_LD;32 *
DW IN_X_RU
DW IN_X_LU;34 *
DW IN_FULL;35   M
DW IN_UP
DW IN_DW
DW IN_L   ;P
DW IN_R; 39

DW COCO_R1;40  R

DW COCO_H;41 S
DW COCO_V;42 T
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

EX_X_LD dw EX_X_RD
EX_V_L DW EX_V_R
EX_X_LU DW EX_X_RU
EX_X_RD_UL DW EX_X_LD_UR;
EX_X_LU_DL DW EX_X_RU_DR
IN_X_LD DW IN_X_RD
IN_X_LU DW IN_X_RU
IN_R DW IN_L

COCO_I0 dw COCO_R0
COCO_I1 dw COCO_R1
COCO_I2 dw COCO_R2

;=================================================
_END_FLIP_IMAGES
;=================================================
;=================================================
_BEGIN_IMAGES
;=================================================
;------ BEGIN IMAGE --------
COCO_H
db 4 ; ancho
db 10 ; alto
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 16 , 128 , 0 
db 0 , 16 , 128 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
COCO_V
db 4 ; ancho
db 8 ; alto
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 16 , 128 , 0 
db 0 , 16 , 128 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
;------ END IMAGE --------

;------ BEGIN IMAGE --------
LADRILLO_RL
db 4 ; ancho
db 8 ; alto
db 119 , 238 , 119 , 238 
db 187 , 221 , 187 , 221 
db 76 , 51 , 76 , 51 
db 141 , 59 , 141 , 59 
db 77 , 59 , 77 , 59 
db 140 , 51 , 140 , 51 
db 11 , 29 , 11 , 29 
db 7 , 14 , 7 , 14 
;------ END IMAGE --------
LADRILLO_L
db 4 ; ancho
db 8 ; alto
db 119 , 238 , 0 , 0 
db 187 , 221 , 0 , 0
db 76 , 51 , 0 , 0 
db 141 , 59 , 0 , 0 
db 77 , 59 , 0 , 0 
db 140 , 51 , 0 , 0 
db 11 , 29 , 0 , 0 
db 7 , 14 , 0 , 0 
LADRILLO_R
db 4 ; ancho
db 8 ; alto
db 0 , 0 , 119 , 238 
db 0 , 0 , 187 , 221 
db 0 , 0 , 76 , 51 
db 0 , 0 , 141 , 59 
db 0 , 0 , 77 , 59 
db 0 , 0 , 140 , 51 
db 0 , 0 , 11 , 29 
db 0 , 0 , 7 , 14 
;------ END IMAGE --------
;------ BEGIN IMAGE --------

;------ BEGIN IMAGE --------
IN_X_RD
db 4 ; ancho
db 8 ; alto
db 0 , 255 , 255 , 255 
db 51 , 255 , 255 , 255 
db 119 , 255 , 255 , 255 
db 119 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
;------ END IMAGE --------

;------ BEGIN IMAGE --------
IN_X_RU
db 4 ; ancho
db 8 ; alto
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 119 , 255 , 255 , 255 
db 119 , 255 , 255 , 255 
db 51 , 255 , 255 , 255 
db 0 , 255 , 255 , 255 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
IN_FULL
db 4 ; ancho
db 8 ; alto
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
IN_UP
db 4 ; ancho
db 8 ; alto
db 0 , 255 , 255 , 0 
db 51 , 255 , 255 , 204 
db 119 , 255 , 255 , 238 
db 119 , 255 , 255 , 238 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
IN_DW
db 4 ; ancho
db 8 ; alto
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 119 , 255 , 255 , 238 
db 119 , 255 , 255 , 238 
db 51 , 255 , 255 , 204 
db 0 , 255 , 255 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
IN_L
db 4 ; ancho
db 8 ; alto
db 17 , 255 , 255 , 255 
db 119 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 255 , 255 , 255 , 255 
db 119 , 255 , 255 , 255 
db 17 , 255 , 255 , 255 
;------ END IMAGE --------
EX_X_LD_UR
   
db 4 ; ancho
db 8 ; alto
db 0 , 0 , 0 , 0 
db 255 , 255 , 255 , 136 
db 0 , 0 , 0 , 68 
db 255 , 255 , 255 , 34 
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 170  
;------ END IMAGE --------
;------ BEGIN IMAGE --------
;EX_X_LU_DR
EX_X_RU_DR
db 4 ; ancho
db 8 ; alto
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 170 
db 255 , 255 , 255 , 34 
db 0 , 0 , 0 , 68 
db 255 , 255 , 255 , 136 
db 0 , 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
EX_X_RD
db 4 ; ancho
db 8 ; alto
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 51 
db 0 , 0 , 0 , 68 
db 0 , 0 , 0 , 153 
db 0 , 0 , 0 , 170 
;------ END IMAGE --------
;------ END IMAGE --------
;------ BEGIN IMAGE --------
EX_H_D
db 4 ; ancho
db 8 ; alto
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 255 , 255 , 255 , 255 
db 0 , 0 , 0 , 0 
db 255 , 255 , 255 , 255 
db 0 , 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
EX_X_HD
db 4 ; ancho
db 8 ; alto
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 255 , 255 , 255 , 255 
db 0 , 0 , 0 , 0 
db 255 , 255 , 255 , 255 
db 119 , 255 , 255 , 238  
;------ END IMAGE --------
;------ BEGIN IMAGE --------
EX_V_R
db 4 ; ancho
db 8 ; alto
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 170  
;------ END IMAGE --------
;------ BEGIN IMAGE --------
EX_X_RU
db 4 ; ancho
db 8 ; alto
db 0 , 0 , 0 , 170 
db 0 , 0 , 0 , 153 
db 0 , 0 , 0 , 68 
db 0 , 0 , 0 , 51 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
EX_H_U
db 4 ; ancho
db 8 ; alto
db 0 , 0 , 0 , 0 
db 255 , 255 , 255 , 255 
db 0 , 0 , 0 , 0 
db 255 , 255 , 255 , 255 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
EX_X_HU
db 4 ; ancho
db 8 ; alto
db 119 , 255 , 255 , 238 
db 255 , 255 , 255 , 255 
db 0 , 0 , 0 , 0 
db 255 , 255 , 255 , 255 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
;------ END IMAGE --------
;------ END IMAGE --------
;------ BEGIN IMAGE --------
COCO_UP0
COCO_R0
db 4 ; ancho
db 16 ; alto
db 0 , 0 , 0 , 0 
db 0 , 48 , 224 , 0 
db 0 , 240 , 240 , 128 
db 16 , 240 , 240 , 192 
db 16 , 240 , 240 , 192 
db 48 , 240 , 240 , 224 
db 48 , 240 , 240 , 224 
db 48 , 240 , 240 , 224 
db 48 , 240 , 240 , 224 
db 48 , 240 , 240 , 224 
db 16 , 240 , 240 , 192 
db 16 , 240 , 240 , 192 
db 0 , 240 , 240 , 128 
db 0 , 48 , 224 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
coco_R1
db 4 ; ancho
db 16 ; alto
db 0 , 0 , 0 , 0 
db 0 , 0 , 240 , 128 
db 0 , 48 , 240 , 224 
db 0 , 112 , 240 , 240 
db 0 , 112 , 240 , 240 
db 0 , 240 , 240 , 128 
db 0 , 240 , 224 , 0 
db 0 , 240 , 128 , 0 
db 0 , 240 , 224 , 0 
db 0 , 240 , 240 , 128 
db 0 , 112 , 240 , 240 
db 0 , 112 , 240 , 240 
db 0 , 48 , 240 , 224 
db 0 , 0 , 240 , 128 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
coco_R2
db 4 ; ancho
db 16 ; alto
db 0 , 0 , 0 , 0 
db 0 , 48 , 224 , 0 
db 0 , 240 , 224 , 0 
db 16 , 240 , 192 , 0 
db 16 , 240 , 128 , 0 
db 48 , 240 , 0 , 0 
db 48 , 224 , 0 , 0 
db 48 , 192 , 0 , 0 
db 48 , 224 , 0 , 0 
db 48 , 240 , 0 , 0 
db 16 , 240 , 128 , 0 
db 16 , 240 , 192 , 0 
db 0 , 240 , 224 , 0 
db 0 , 48 , 224 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
;------ END IMAGE --------
COCO_UP1
db 4 ; ancho
db 16 ; alto
db 0 , 12 , 1 , 8 
db 1 , 12 , 1 , 12 
db 1 , 12 , 1 , 12 
db 3 , 12 , 1 , 14 
db 3 , 14 , 3 , 14 
db 3 , 14 , 3 , 14 
db 3 , 15 , 7 , 14 
db 3 , 15 , 7 , 14 
db 1 , 15 , 15 , 12 
db 1 , 15 , 15 , 12 
db 0 , 15 , 15 , 8 
db 0 , 3 , 14 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
;------ BEGIN IMAGE --------
COCO_UP2
db 4 ; ancho
db 16 ; alto
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 3 , 0 , 0 , 6 
db 3 , 8 , 0 , 14 
db 3 , 12 , 1 , 14 
db 3 , 14 , 3 , 14 
db 3 , 15 , 7 , 14 
db 1 , 15 , 15 , 12 
db 1 , 15 , 15 , 12 
db 0 , 15 , 15 , 8 
db 0 , 3 , 14 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
;------ BEGIN IMAGE --------
COCO_DW0
db 4 ; ancho
db 16 ; alto
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 3 , 14 , 0 
db 0 , 15 , 15 , 8 
db 1 , 15 , 15 , 12 
db 1 , 15 , 15 , 12 
db 3 , 15 , 15 , 14 
db 3 , 15 , 15 , 14 
db 3 , 15 , 15 , 14 
db 3 , 15 , 15 , 14 
db 3 , 15 , 15 , 14 
db 1 , 15 , 15 , 12 
db 1 , 15 , 15 , 12 
db 0 , 15 , 15 , 8 
db 0 , 3 , 14 , 0 
db 0 , 0 , 0 , 0 
;------ BEGIN IMAGE --------
COCO_DW1
db 4 ; ancho
db 16 ; alto
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 3 , 14 , 0 
db 0 , 15 , 15 , 8 
db 1 , 15 , 15 , 12 
db 1 , 15 , 15 , 12 
db 3 , 15 , 7 , 14 
db 3 , 15 , 7 , 14 
db 3 , 14 , 3 , 14 
db 3 , 14 , 3 , 14 
db 3 , 12 , 1 , 14 
db 1 , 12 , 1 , 12 
db 1 , 12 , 1 , 12 
db 0 , 12 , 1 , 8 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
COCO_DW2
db 4 ; ancho
db 16 ; alto
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 3 , 14 , 0 
db 0 , 15 , 15 , 8 
db 1 , 15 , 15 , 12 
db 1 , 15 , 15 , 12 
db 3 , 15 , 7 , 14 
db 3 , 14 , 3 , 14 
db 3 , 12 , 1 , 14 
db 3 , 8 , 0 , 14 
db 3 , 0 , 0 , 6 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 
;------ END IMAGE --------

;------ END IMAGE --------
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