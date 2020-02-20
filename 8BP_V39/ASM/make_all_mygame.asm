
; Makefile para los videojuegos que usan 8bits de poder
; si alteras solo una parte solo tienes que ensamblar el make correspondiente
; por ejemplo puedes ensamblar el make_graficos si cambias dibujos
;--------------------CODIGO ------------------------------
;incluye la libreria 8bp y el playerWYZ de musica
read "make_codigo_mygame.asm"

;--------------------MUSICA------------------------------------
; incluye las canciones. 
read "make_musica_mygame.asm"

; ---------- GRAFICOS -------------------
; esta parte incluye imagenes y secuencias de animacion
; y la tabla de sprites inicializada con dichas imagenes y secuencias
read "make_graficos_mygame.asm"

