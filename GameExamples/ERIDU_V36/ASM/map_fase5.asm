org 20700

_MAP_TABLE_FASE5
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
dw 40,80,BLOCK40
dw 40,100,BLOCK40_END

dw 40,80,BLOCK20H


dw 199,80,BLOCK40
dw 199,100,BLOCK40_END

dw 160,80,BLOCK20H



dw 180,120,BLOCKB20V
dw 180,125,BLOCKB20V_END
dw 40,120,BLOCKB20V_UP
dw 40,125,BLOCKB20V_END_UP

dw 121,120,BLOCK20H
dw 80,120,BLOCK20H



dw 160,120,BLOCK40
dw 160,140,BLOCK40_END


dw 80,120,BLOCK40
dw 80,140,BLOCK40_END


dw 80,160,BLOCK20
dw 140,160,BLOCK20

dw 70,170,BLOCK20H
dw 130,170,BLOCK20H

dw 80,200,BLOCK20_END
dw 140,200,BLOCK20_END




dw 120,230,BLOCK40
dw 120,250,BLOCK40_END

dw 120,230,BLOCK20H
dw 81,230,BLOCK20H



dw 199,250,BLOCK40
dw 40,250,BLOCK40

dw 160,270,BLOCK40
dw 80,270,BLOCK40

dw 121,270,BLOCK20H
dw 80,270,BLOCK20H



dw 199,290,BLOCK40_END
dw 160,290,BLOCK40_END
dw 80,290,BLOCK40_END
dw 40,290,BLOCK40_END

dw 120,320,BLOCK40
dw 120,330,BLOCK40_END
dw 110,332,LOGO_8BP
dw 120,345,BLOCK40
dw 120,355,BLOCK40_END
dw 160,330,BLOCK40
dw 160,345,BLOCK40_END
dw 80,330,BLOCK40
dw 80,345,BLOCK40_END



dw 160,400,BLOCK40
dw 160,410,BLOCK20_END
dw 140,440,BLOCK20_END

dw 130,410,BLOCK20H

dw 80,400,BLOCK20
dw 60,430,BLOCK20
dw 80,440,BLOCK40_END

dw 70,410,BLOCK20H

_END_MAP_FASE5

