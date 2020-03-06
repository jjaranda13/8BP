;mapa demo scroll

;_MAP_TABLE
; primero 3 parametros antes de la lista de "map items"
;dw 50; maximo alto de un sprite por si se cuela por arriba y ya hay que pintar parte de el
;dw -40; ancho maximo de cualquier map item. debe expresarse como numero negativo
;db 64; numero de elementos del mapa a considerar. como mucho debe ser 64

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
org 41800
BEGIN_MAPA_DEMO
dw 1100,110,CASA; 1
dw 1050,-110,CACTUS;2
dw 1210,100,CASA;3
dw 1200,120,CACTUS;4
dw 1100,140,CASA;5
dw 1160,160,CASA;6
dw 1070,170,CASA;7
dw 1175,140,CACTUS;8
dw 1010,150,CASA;9
dw 1250,150,CASA;10
dw 1260,170,CASA;11
dw 1290,160,CACTUS;12
dw 1180,190,CASA;13
dw 1060,200,CASA;14
END_MAPA_DEMO