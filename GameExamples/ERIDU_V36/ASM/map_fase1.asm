org 23300

_MAP_TABLE_FASE1
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
dw 8,80,SUP
dw 8,84,SHOR2
dw 8,88,SHOR2
dw 8,92,SHOR2
dw 8,96,SHOR2
dw 8,100,SHOR2
dw 8,104,SHOR2
dw 12,108,SHOR
dw 9,112,SHOR2
dw 9,116,SHOR2
dw 9,120,SHOR2
dw 12,124,SHOR
dw 9,128,SHOR2
dw 9,132,SHOR2
dw 9,136,SHOR2
dw 15,140,SUP; 16
dw 22,144,SUP
dw 29,148,SUP
dw 36,152,SUP
dw 43,156,SUP
dw 50,160,SUP
dw 57,164,SUP
dw 64,168,SUP
dw 71,172,SUP; 
dw 78,176,SPIC
dw 71,180,SDW
dw 64,184,SHOR2
dw 67,188,SHOR;
dw 71,192,SUP
dw 78,196,SUP
dw 85,200,SUP
dw 85,204,SHOR2; 32
dw 89,208,SHOR;
dw 87,212,SHOR2;
dw 87,216,SHOR2;
dw 93,220,SUP
dw 100,224,SUP
dw 107,228,SUP
dw 107,232,SHOR2
dw 111,236,SHOR;
dw 108,240,SHOR2
dw 108,244,SHOR2
dw 108,248,SDW
dw 101,252,SDW
dw 94,256,SDW
dw 87,260,SDW
dw 80,264,SDW
dw 73,268,SDW;48
dw 66,272,SHOR2
dw 66,276,SHOR2
dw 69,280,SHOR
dw 68,284,SHOR
dw 67,288,SHOR;
dw 64,292,SHOR2;
dw 71,296,SUP
dw 78,300,SUP
dw 85,304,SUP
dw 92,308,SUP
dw 99,312,SUP
dw 106,316,SPIC; 
dw 99,320,SDW
dw 92,324,SDW
dw 85,328,SHOR2
dw 85,332,SHOR2;64
dw 85,336,SDW
dw 78,340,SDW;
dw 71,344,SDW;
dw 64,348,SHOR2
dw 64,352,SHOR2
dw 64,356,SDW
dw 57,360,SDW
dw 50,364,SDW
dw 43,368,SDW
dw 36,372,SDW
dw 29,376,SDW;
dw 22,380,SDW;76
dw 15,384,SDW;
dw 8,388,SHOR2
dw 8,392,SHOR2
dw 8,396,SHOR2
dw 8,400,SDW;8
dw 1,404,SDW;82












_END_MAP_FASE1