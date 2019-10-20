org 21400

_MAP_TABLE_ERIDU
;----------------------------------------------------------------------------------------------
; primero 3 parametros antes de la lista de "map items"
;MAX_SP_HEIGHT_FASE1	dw 50; maximo alto de un sprite por si se cuela por arriba y ya hay que pintar parte de el
;MAX_SP_WIDTH_FASE1 	dw -1; ancho maximo de cualquier map item. debe expresarse como numero negativo
;MAPITEMS_FASE1 db 82;49 ;36; numero de elementos del mapa a considerar. como mucho debe ser 82

; la tabla de map items se recorre buscando items que puedan aparecer en pantalla.
; se tienen en cuenta los anchos y altos anteriores para items que puedan estar solo parcialmente
; A esos items se les aplica el clipping pero parte de ellos se pinta, logicamente
; si ambos "maximos" se ponen a cero, entonces es necesario que la esquina superior izq se encuentre dentro
; de la pantalla para ser representados
;
; en este ejemplo hay dos items que se deben pintar parcialmente en la pantalla
;
;                 +--+
;        +--------|  |---------+
;        |        |  |         |
;        |        +--+         |
;   +------+                   |
;   |      |      screen       |
;   +------+                   |
;        |                     |
;        |                     |
;        +---------------------+

; a partir de aqui comienzan los items
;------------------------
;    FASE 1 
;---------------------
;dw 36,0,IMAGE0; 1
;dw 36,20,IMAGE0; 2
;dw 36,24,IMAGE0; 3
;...etc


; LETRA "E"
dw 170,80,BLOCK40
dw 170,100,BLOCK8_END
dw 162,90,BLOCK8_END
dw 154,100,BLOCK8_END
dw 146,90,BLOCK8_END
dw 138,100,BLOCK8_END


;LETRA "R"
dw 170,104,BLOCK40
dw 170,120,BLOCK16_END
dw 162,108,BLOCK8_END
dw 162,116,BLOCK8
dw 154,124,BLOCK24_END
dw 146,120,BLOCK16
dw 146,108,BLOCK16_END

;LETRA "I"

dw 170,127,BLOCK40
dw 170,131,BLOCK40_END

;LETRA "D"

dw 170,134,BLOCK40
dw 170,146,BLOCK8_END
dw 162,146,BLOCK24
dw 162,150,BLOCK24_END
dw 162,138,BLOCK24_END
dw 138,146,BLOCK8_END

;LETRA "U"
dw 170,154,BLOCK40
dw 170,158,BLOCK32_END
dw 170,166,BLOCK32
dw 170,170,BLOCK40_END

_END_MAP_ERIDU
