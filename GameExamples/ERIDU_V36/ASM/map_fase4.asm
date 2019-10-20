org 21900

_MAP_TABLE_FASE4
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
dw 20,80,BLOCKB20V
dw 40,90,BLOCKB20V
dw 60,100,BLOCKB20V
dw 80,110,BLOCKB20V
dw 100,120,BLOCKB20V
dw 120,130,BLOCKB20V
dw 120,140,BLOCKB20V_END
dw 100,150,BLOCKB20V_END
dw 80,160,BLOCKB20V_END
dw 60,170,BLOCKB20V_END
dw 40,180,BLOCKB20V_END
dw 20,190,BLOCKB20V_END

dw 199,160,BLOCKB20V_UP
dw 180,170,BLOCKB20V_UP
dw 160,180,BLOCKB20V_UP
dw 140,190,BLOCKB20V_UP
dw 120,200,BLOCKB20V_UP
dw 100,210,BLOCKB20V_UP
dw 100,220,BLOCKB20V_END_UP
dw 120,230,BLOCKB20V_END_UP
dw 140,240,BLOCKB20V_END_UP
dw 160,250,BLOCKB20V_END_UP
dw 180,260,BLOCKB20V_END_UP
dw 199,270,BLOCKB20V_END_UP

dw 20,230,BLOCKB20V
dw 40,240,BLOCKB20V
dw 60,250,BLOCKB20V
dw 80,260,BLOCKB20V
dw 100,270,BLOCKB20V
dw 120,280,BLOCKB20V
dw 120,290,BLOCKB20V_END
dw 100,300,BLOCKB20V_END
dw 80,310,BLOCKB20V_END
dw 60,320,BLOCKB20V_END
dw 40,330,BLOCKB20V_END
dw 20,340,BLOCKB20V_END

dw 20,360,BLOCKC20V
dw 40,360,BLOCKB20V
dw 40,370,BLOCKB20V_END
dw 20,372,BLOCKC20V_END

dw 20,390,BLOCKC20V
dw 40,390,BLOCKB20V
dw 40,400,BLOCKB20V_END
dw 20,402,BLOCKC20V_END

dw 20,420,BLOCKC20V
dw 40,420,BLOCKB20V
dw 40,430,BLOCKB20V_END
dw 20,432,BLOCKC20V_END

;
dw 199,370,BLOCKC20V
dw 180,370,BLOCKB20V_UP
dw 180,380,BLOCKB20V_END_UP
dw 199,382,BLOCKC20V_END

dw 199,400,BLOCKC20V
dw 180,400,BLOCKB20V_UP
dw 180,410,BLOCKB20V_END_UP
dw 199,412,BLOCKC20V_END



_END_MAP_FASE4

