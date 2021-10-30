;MAP TABLE
;-----------------------
; esta tabla contiene las entradas que definen las imagenes del mapa del mundo para 
; tus juegos con scroll. 
; la tabla se ensambla en la 42040 y contiene 3 parametros globales (que ocupan 5 bytes en total) y 
; y una lista de "map items", los cuales estan descritos por 3 parametros cada uno (x,y,direccion de imagen)
; la lista puede contener hasta 82 items pero se puede limitar con uno de los parametros globales.
; la lista ocupa los 5 bytes iniciales + 82 items x 6 bytes = 5+492=497 bytes
; Por tanto el mapa del mundo puede tener hasta 82 elementos o "map items"
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
;----------------------------------------------------------------------------------------------
; primero 3 parametros antes de la lista de "map items"
MAX_SP_HEIGHT	dw 40; maximo alto de un sprite por si se cuela por arriba y ya hay que pintar parte de el
MAX_SP_WIDTH 	dw -16; ancho maximo de cualquier map item. debe expresarse como numero negativo
MAPITEMS db 48; numero de elementos del mapa a considerar. como mucho debe ser 82

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


;-------------------------------------
;screen1
dw 170,20, ARBOL
dw 80,60, ARBOL

;screen2
dw 1*200+207,8,MUROSIMPLE
dw 1*200+207,24,MUROSIMPLE
dw 1*200+207,40,MUROSIMPLE
dw 1*200+207,56,MUROSIMPLE

dw 1*200+168,8,MURO
;dw 1*200+168,21,MURO
dw 1*200+168,46,MURO2
dw 1*200+168,34,PUENTE2
dw 1*200+168,59,MURO2
dw 1*200+168,21,MURO
;dw 1*200+168,46,MURO2


;screen3
;dw 2*200+100,62,CESPED
dw 2*200+100,60,TRINCHERA
;dw 2*200+68,62,TERRA
dw 2*200+60,16,ARBOL
dw 2*200+180,40,ARBOL

;screen4
dw 3*200+100,8,CESPED
dw 3*200+68,8,TERRA
dw 3*200+92,18,CESPED
dw 3*200+60,18,TERRA

dw 3*200+151,62,CESPED
dw 3*200+119,62,TERRA

dw 3*200+181,30,ARBOL

;screen5
dw 4*200+132,18,CESPED
dw 4*200+100,18,TERRA

dw 4*200+132,56,CESPED
dw 4*200+100,56,TERRA

;screen6
dw 5*200+51,32,ARBOL
dw 5*200+151,16,ARBOL
dw 5*200+100,60,ARBOL
dw 5*200+190,50,ARBOL

;screen7
dw 6*200+52,8,TANK2
dw 6*200+152,8,TANK2
dw 6*200+100,72-13,TANK

;screen8
dw 7*200+51,72-13,TANK
dw 7*200+152,72-13,TANK
dw 7*200+101,8,TANK2

;screen9
dw 8*200+208,8,MUROFAKE
dw 8*200+208,12,MUROFAKE
dw 8*200+208,16,MUROFAKE
dw 8*200+208,20,MUROFAKE
dw 8*200+208,24,MUROFAKE
dw 8*200+208,28,MUROFAKE
dw 8*200+208,32,MUROFAKE

;dw 8*200+200,40,MUROFAKE
dw 8*200+208,48,MUROFAKE2
dw 8*200+208,52,MUROFAKE2
dw 8*200+208,56,MUROFAKE2
dw 8*200+208,60,MUROFAKE2
dw 8*200+208,64,MUROFAKE2
dw 8*200+208,68,MUROFAKE2



_END_MAP