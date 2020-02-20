; ---------- datos de secuencias e imagenes -------------------
; aqui se almacenan tanto las secuencias como las imagenes
; las secuencias se pueden hacer en basic con SETUPSQ o bien
; mediante POKE
; todo se unifica en este fichero para poder
; usar las etiquetas de las imagenes en las secuencias
org 33600
;secuencias de animacion de 8 frames (31 secuencias ocupan 496 bytes)
; en este fichero van tambien las macrosecuencias
read "sequences_mygame.asm"

; tabla de rutas. Espacio de longitud variable
read "routes_mygame.asm"

; ahora vienen las imagenes, tus dibujos. dispones del espacio que quede hasta 
; la direccion 42040, es decir, si no hay secuencias ni rutas tienes 8.5KB
read "images_mygame.asm"
;---------------------TABLA DE SPRITES-------------------------
; esta parte es opcional. puedes manipular la tabla desde basic 
; usando SETUPSP y LOCATESP o bien directamente con POKE
; aunque con POKE no puedes insertar coordenadas negativas
org 27000
read "sprites_table_mygame.asm"

org 42040; 
;----------------- MAPA DEL MUNDO para demo 3d (400bytes) ------------------------
read "map_table_mygame.asm"

