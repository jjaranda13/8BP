;MAP TABLE
;-----------------------
; esta tabla contiene las 64 entradas que definen las imagenes del mapa del mundo para 
; tus juegos con scroll. 
; la tabla se ensambla en la 26000 y contiene 3 parametros globales (que ocupan 5 bytes en total) y 
; y una lista de "map items", los cuales estan descritos por 3 parametros cada uno (x,y,direccion de imagen)
; la lista puede contener hasta 64 items pero se puede limitar con uno de los parametros globales.
; la lista ocupa los 5 bytes iniciales + 64 items x 6 bytes = 5+384=399 bytes
; Por tanto el mapa del mundo puede tener hasta 64 elementos o "map items"
; la tabla comienza con 3 parametros que definen el alto maximo, ancho maximo y el numero de items
; los elementos de mapa se transforman en sprites mediante MAP2SP() que es una funcion que debes invocar en cada ciclo de juego
; ya que los map items van cambiando cada vez que te mueves en un juego con scroll.
; al invocar MAP2SP(), los items que se encuentren dentro de la pantalla (total o parcialmente) se transforman en sprites
; empezando por el sprite 0 en adelante. Ojo por que si consumes los 32 sprites no te quedaran para tu personaje y enemigos, etc
; si usas este mecanismo, tu personaje y los enemigos deben usar los sprites desde 31 hacia abajo, de ese modo evitaras posibles
; choques entre los sprites que usa el mecanismo de scroll y tus personajes.

; las coordenadas de los elementos del mapa deben ser todas positivas, entre 0 y 320000 y el eje vertical a diferencia
; de la pantalla del amstrad, crece hacia arriba. 
;
;  32000
;    ^
;    |
;    |
;    |
;   0+---------> 32000
;    0
;
; coordy, coordx, image
; ---------------------

_MAP_TABLE
; primero 3 parametros antes de la lista de "map items"
dw 50; maximo alto de un sprite por si se cuela por arriba y ya hay que pintar parte de el
dw -18; ancho maximo de cualquier map item. debe expresarse como numero negativo
;db 16;26;13; numero de elementos del mapa a considerar. como mucho debe ser 64
db 16

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
;    FASE 1 , desde xo=0 hasta xo=380+80=460
;---------------------
dw 36,82,MONTUP; 1
dw 48,104,MONTUP;2
dw 60,126,MONTUP;3
dw 72,138,MONTUP;4
dw 72,150,MONTDW;5
dw 60,172,MONTH;6
dw 60,194,MONTDW;7
dw 48,206,MONTDW;8
;aqui repito elementos para encajar con la posicion 100
dw 48,228,MONTUP;9
dw 60,250,MONTUP;10
dw 72,262,MONTUP;11
dw 72,274,MONTDW;12
dw 60,296,MONTH;13
dw 60,320,MONTDW;14
dw 48,350,MONTDW;15
dw 36,380,MONTDW;16
;-------------------------
; FASE 2 desde xo=600
;-------------------------
dw 36,682,MONTUP; 1
dw 48,704,MONTUP;2
dw 60,726,MONTUP;3
dw 72,738,MONTUP;4
dw 72,750,MONTDW;5
dw 60,772,MONTH;6
dw 60,794,MONTDW;7
dw 48,806,MONTDW;8
;aqui repito elementos para encajar con la posicion 100
dw 48,828,MONTUP;9
dw 60,850,MONTUP;10
dw 72,862,MONTUP;11
dw 72,874,MONTDW;12
dw 60,896,MONTH;13
dw 60,920,MONTDW;14
dw 48,950,MONTDW;15
dw 36,980,MONTDW;16
