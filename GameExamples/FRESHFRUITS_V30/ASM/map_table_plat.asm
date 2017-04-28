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
dw 16; maximo alto de un sprite por si se cuela por arriba y ya hay que pintar parte de el
dw -42; ancho maximo de cualquier map item. debe expresarse como numero negativo
;db 16;26;13; numero de elementos del mapa a considerar. como mucho debe ser 64
db 25;//16

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
;dw 36,0,IMAGE0; 1
;dw 36,20,IMAGE0; 2
;dw 36,24,IMAGE0; 3
;...etc

dw 7*8-1,-20,PLT_ROCA
dw 9*8-1,-20,PLT_ROCA
dw 11*8-1,-20,PLT_ROCA
dw 20*8-1,40,PLTFILL
dw 15*8-1,20,PLTFILL
dw 10*8-1,60,PLTFILL
dw 10*8-1,120,PLT_ROCA
dw 12*8-1,140,PLT_ROCA
dw 14*8-1,160,PLT_ROCA
dw 17*8-1,180,PLTFILL
dw 10*8-1,260,PLT_ROCA
dw 15*8-1,264,PLT_ROCA
dw 20*8-1,256,PLT_ROCA
dw 17*8-1,290,PLTFILL
dw 10*8-1,390,PLTFILL
dw 25*8-1,384,delete
dw 25*8-1,390,BANDA
dw 25*8-1,390+16,BANDA
dw 25*8-1,390+32,BANDA
dw 25*8-1,390+48,BANDA
dw 25*8-1,390+64,BANDA
dw 25*8-1,390+72,delete
dw 7*8-1,580,PLT_ROCA
dw 9*8-1,580,PLT_ROCA
dw 11*8-1,580,PLT_ROCA



;--------NIVELES--------------------
org 25000

BEGIN_FASE1
dw 16; maximo alto de un sprite por si se cuela por arriba y ya hay que pintar parte de el
dw -42; ancho maximo de cualquier map item. debe expresarse como numero negativo
db 25;num elementos
dw 7*8-1,-20,PLT_ROCA
dw 9*8-1,-20,PLT_ROCA
dw 11*8-1,-20,PLT_ROCA
dw 20*8-1,40,PLTFILL
dw 15*8-1,20,PLTFILL
dw 10*8-1,60,PLTFILL
dw 10*8-1,120,PLT_ROCA
dw 12*8-1,140,PLT_ROCA
dw 14*8-1,160,PLT_ROCA
dw 17*8-1,180,PLTFILL
dw 10*8-1,260,PLT_ROCA
dw 15*8-1,264,PLT_ROCA
dw 20*8-1,256,PLT_ROCA
dw 17*8-1,290,PLTFILL
dw 10*8-1,390,PLTFILL
dw 25*8-1,384,delete
dw 25*8-1,390,BANDA
dw 25*8-1,390+16,BANDA
dw 25*8-1,390+32,BANDA
dw 25*8-1,390+48,BANDA
dw 25*8-1,390+64,BANDA
dw 25*8-1,390+72,delete
dw 7*8-1,580,PLT_ROCA
dw 9*8-1,580,PLT_ROCA
dw 11*8-1,580,PLT_ROCA
END_FASE1


BEGIN_FASE2
dw 16; maximo alto de un sprite por si se cuela por arriba y ya hay que pintar parte de el
;dw -42; ancho maximo de cualquier map item. debe expresarse como numero negativo
dw -32
db 30;num elementos
dw 7*8-1,-20,PLT_ROCA
dw 9*8-1,-20,PLT_ROCA
dw 11*8-1,-20,PLT_ROCA
dw 15*8-1,20,ARBUSTO
dw 20*8-1,40,SELVA
dw 10*8-1,60,SELVA
dw 12*8-1,60,ARBUSTO
dw 15*8-1,80,PLT_ROCA
;dw 5*8-4,20,GRIETA
dw 5*8-6,100,GRIETA
dw 5*8-4,180,GRIETA
dw 5*8-6,260,GRIETA
dw 5*8-4,340,GRIETA
dw 5*8-6,420,GRIETA
dw 10*8-1,120,PLT_ROCA
dw 12*8-1,150,PLT_ROCA
dw 14*8-1,180,PLT_ROCA
dw 16*8-1,210,PLT_ROCA
dw 16*8-1,240,SELVA
dw 16*8-1,280,ARBUSTO
dw 16*8-1,310,SELVA
dw 7*8-1,350,PLT_ROCA
dw 9*8-1,350,PLT_ROCA
dw 11*8-1,350,ARBUSTO

dw 10*8-1,380,PLT_ROCA
dw 13*8-1,400,PLT_ROCA
dw 14*8-1,420,PLT_ROCA
dw 14*8-1,440,SELVA
dw 7*8-1,500,PLT_ROCA
dw 9*8-1,500,PLT_ROCA
dw 11*8-1,500,PLT_ROCA
END_FASE2

BEGIN_FASE3

