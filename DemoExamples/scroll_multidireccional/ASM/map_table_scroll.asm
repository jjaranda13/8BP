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
dw -40; ancho maximo de cualquier map item. debe expresarse como numero negativo
db 64; numero de elementos del mapa a considerar. como mucho debe ser 64

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
dw 100,10,CASA; 1
dw 50,-10,CACTUS;2
dw 210,0,CASA;3
dw 200,20,CACTUS;4
dw 100,40,CASA;5
dw 160,60,CASA;6
dw 70,70,CASA;7
dw 175,40,CACTUS;8
dw 10,50,CASA;9
dw 250,50,CASA;10
dw 260,70,CASA;11
dw 290,60,CACTUS;12
dw 180,90,CASA;13
dw 60,100,CASA;14
dw 1000,1000,CASA;15
dw 1000,1000,CASA;16
dw 1000,1000,CASA;17
dw 1000,1000,CASA;18
dw 1000,1000,CASA;19
dw 1000,1000,CASA;20
dw 1000,1000,CASA;21
dw 1000,1000,CASA;22
dw 1000,1000,CASA;23
dw 1000,1000,CASA;24
dw 1000,1000,CASA;25
dw 1000,1000,CASA;26
dw 1000,1000,CASA;27
dw 1000,1000,CASA;28
dw 1000,1000,CASA;29
dw 1000,1000,CASA;30
dw 1000,1000,CASA;31
dw 1000,1000,CASA;32
dw 1000,1000,CASA;33
dw 1000,1000,CASA;34
dw 1000,1000,CASA;35
dw 1000,1000,CASA;36
dw 1000,1000,CASA;37
dw 1000,1000,CASA;38
dw 1000,1000,CASA;39
dw 1000,1000,CASA;40
dw 1000,1000,CASA;41
dw 1000,1000,CASA;42
dw 1000,1000,CASA;43
dw 1000,1000,CASA;44
dw 1000,1000,CASA;45
dw 1000,1000,CASA;46
dw 1000,1000,CASA;47
dw 1000,1000,CASA;48
dw 1000,1000,CASA;49
dw 1000,1000,CASA;50
dw 1000,1000,CASA;51
dw 1000,1000,CASA;52
dw 1000,1000,CASA;53
dw 1000,1000,CASA;54
dw 1000,1000,CASA;55
dw 1000,1000,CASA;56
dw 1000,1000,CASA;57
dw 1000,1000,CASA;58
dw 1000,1000,CASA;59
dw 1000,1000,CASA;60
dw 1000,1000,CASA;61
dw 1000,1000,CASA;62
dw 1000,1000,CASA;63
dw 1000,1000,CASA;64