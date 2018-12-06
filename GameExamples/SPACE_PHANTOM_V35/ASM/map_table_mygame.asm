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
MAX_SP_HEIGHT	dw 25; maximo alto de un sprite por si se cuela por arriba y ya hay que pintar parte de el
MAX_SP_WIDTH 	dw -20*4; ancho maximo de cualquier map item. debe expresarse como numero negativo
;MAPITEMS db 60+18;54;60; numero de elementos del mapa a considerar. como mucho debe ser 82
;MAPITEMS db 60+18;eagle
MAPITEMS db 71;67;82;82;60+18;eagle
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

; ----------- meto este mundo para demostrar el pseudo 3d ----------------------
ancho equ 18
alto equ 8
let center=375

;let y =2000-alto
;let x=340

;------------------------------SPACE = 26 segmentos

let x=center-ancho-ancho
let y=2000-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_X00;
let y=y-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_00X;
let y=y-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_000;



let x=center-ancho
let y=2000-alto
dw y,x,SEGMENT_XX0;
let y=y-alto
dw y,x,SEGMENT_X0X;
let y=y-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_X00_2x;
let y=y-alto
;dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_000;


let x=center
let y=2000-alto
dw y,x,SEGMENT_0X0;
let y=y-alto
dw y,x,SEGMENT_X0X;
let y=y-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_X0X_2x;
let y=y-alto
;dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_000;


let x=center+ancho
let y=2000-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_X00_3x;
let y=y-alto
;dw y,x,SEGMENT_XXX;
let y=y-alto
;dw y,x,SEGMENT_X0X_2x;
let y=y-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_000;



let x=center+ancho+ancho
let y=2000-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_X00;
let y=y-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_X00;
let y=y-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_000;


;------------------------------PHANTOM =28 segmentos


let w=12

let x=center-w-w-w
let y=2000-190-60;+5000

dw y,x,SEGMENT_XX0;
let y=y-alto
dw y,x,SEGMENT_X0X;
let y=y-alto
dw y,x,SEGMENT_XX0
let y=y-alto
dw y,x,SEGMENT_X00_2x
let y=y-alto
;dw y,x,SEGMENT_X00
let y=y-alto
dw y,x,SEGMENT_000


let x=center-w-w
let y=2000-190-60

dw y,x,SEGMENT_X0X_2x;
let y=y-alto
;dw y,x,SEGMENT_X0X;
let y=y-alto
dw y,x,SEGMENT_XXX
let y=y-alto
dw y,x,SEGMENT_X0X_2x
let y=y-alto
;dw y,x,SEGMENT_X0X
let y=y-alto
dw y,x,SEGMENT_000

let x=x+w
let y=2000-190-60
dw y,x,SEGMENT_0X0;
let y=y-alto
dw y,x,SEGMENT_X0X;
let y=y-alto
dw y,x,SEGMENT_XXX
let y=y-alto
dw y,x,SEGMENT_X0X_2x
let y=y-alto
;dw y,x,SEGMENT_X0X
let y=y-alto
dw y,x,SEGMENT_000

let x=x+w
let y=2000-190-60
dw y,x,SEGMENT_XX0;
let y=y-alto
dw y,x,SEGMENT_X0X_4x;
let y=y-alto
;dw y,x,SEGMENT_X0X
let y=y-alto
;dw y,x,SEGMENT_X0X
let y=y-alto
;dw y,x,SEGMENT_X0X
let y=y-alto
dw y,x,SEGMENT_000


let x=x+w
let y=2000-190-60
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_0X0_4x;
let y=y-alto
;dw y,x,SEGMENT_0X0
let y=y-alto
;dw y,x,SEGMENT_0X0
let y=y-alto
;dw y,x,SEGMENT_0X0
let y=y-alto
dw y,x,SEGMENT_000


let x=x+w
let y=2000-190-60
dw y,x,SEGMENT_0XX;
let y=y-alto
dw y,x,SEGMENT_X0X_3x;
let y=y-alto
;dw y,x,SEGMENT_X0X
let y=y-alto
;dw y,x,SEGMENT_X0X
let y=y-alto
dw y,x,SEGMENT_0X0
let y=y-alto
dw y,x,SEGMENT_000


let y=2000-190-60;+5000
let x=346-w+84
let x=center+w+w+w

dw y,x,SEGMENT_X0X;
let y=y-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_X0X_3x
let y=y-alto
;dw y,x,SEGMENT_X0X
let y=y-alto
;dw y,x,SEGMENT_X0X
let y=y-alto
dw y,x,SEGMENT_000


;------------------------------8BP=17 segments


let w=18;12

let x=center-w
let y=2000-500
dw y,x,SEGMENT_0X0;
let y=y-alto
dw y,x,SEGMENT_X0X;
let y=y-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_X0X;
let y=y-alto
dw y,x,SEGMENT_0XX;
let y=y-alto
dw y,x,SEGMENT_000;
let y=y-alto


let x=center
let y=2000-500
dw y,x,SEGMENT_XX0;
let y=y-alto
dw y,x,SEGMENT_X0X;
let y=y-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_X0X;
let y=y-alto
dw y,x,SEGMENT_XXX;
let y=y-alto
dw y,x,SEGMENT_000;
let y=y-alto

let x=center+w
let y=2000-500

dw y,x,SEGMENT_XX0;
let y=y-alto
dw y,x,SEGMENT_X0X;
let y=y-alto
dw y,x,SEGMENT_XX0
let y=y-alto
dw y,x,SEGMENT_X00_2x
let y=y-alto
;dw y,x,SEGMENT_X00
let y=y-alto
dw y,x,SEGMENT_000
;------------end del mundo para  la demostracion pseudo 3d ------------------


_END_MAP