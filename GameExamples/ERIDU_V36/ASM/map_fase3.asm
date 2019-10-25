org 22600

_MAP_TABLE_FASE3
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
dw 80,80,BLOCK40
dw 120,80,BLOCK40
dw 199,80,BLOCK40
dw 120,80,BLOCK20H
dw 161,80,BLOCK20H

dw 120,100,BLOCK20H
dw 161,100,BLOCK20H

dw 161,120,BLOCK20H
dw 120,120,BLOCK40_END
dw 80,120,BLOCK20H

dw 160,140,BLOCK40
dw 121,140,BLOCK20H
dw 80,140,BLOCK20H

dw 121,160,BLOCK20H
dw 80,160,BLOCK20H

dw 121,180,BLOCK20H
dw 80,180,BLOCK20H

dw 160,200,BLOCK40_END
dw 199,200,BLOCK40_END
dw 80,200,BLOCK20H

dw 120,220,BLOCK40

dw 120,240,BLOCK40_END
dw 80,240,BLOCK20H
dw 160,240,BLOCK20H
dw 199,240,BLOCK40

dw 80,260,BLOCK20H
dw 160,260,BLOCK40

dw 80,280,BLOCK40_END
dw 40,280,BLOCK40_END
dw 199,280,BLOCK40_END
dw 160,280,BLOCK40_END

dw 40,300,BLOCK40
dw 80,300,BLOCK40
dw 120,300,BLOCK40
dw 160,300,BLOCK40

dw 40,320,BLOCK40_end
dw 80,320,BLOCK40_end
dw 120,320,BLOCK40_end
dw 160,320,BLOCK40_end

dw 199,340,BLOCK40
dw 160,340,BLOCK40
dw 120,340,BLOCK40
dw 80,340,BLOCK40

dw 199,360,BLOCK40_end
dw 160,360,BLOCK40_end
dw 120,360,BLOCK40_end
dw 80,360,BLOCK40_end

dw 40,380,BLOCK40
dw 80,380,BLOCK40
dw 120,380,BLOCK40
dw 160,380,BLOCK40

dw 40,400,BLOCK40_end
dw 80,400,BLOCK40_end
dw 120,400,BLOCK40_end
dw 160,400,BLOCK40_end

dw 100,440,BLOCK40
dw 100,450,BLOCK40_END


_END_MAP_FASE3

