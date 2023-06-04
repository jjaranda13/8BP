
; Makefile para los videojuegos que usan 8bits de poder
; si alteras solo una parte solo tienes que ensamblar el make correspondiente
; por ejemplo puedes ensamblar el make_graficos si cambias dibujos

; DESDE LA V42 EXISTEN "OPCIONES" DE ENSAMBLAJE
; ------------------------------------------------
; ASSEMBLING_OPTION = 0 --> todos los comandos disponibles. 

; ASSEMBLING_OPTION = 1 --> para juegos de laberintos. MEMORY 25000
; 			    disponibles los comandos |LAYOUT, |COLAY  
;
; ASSEMBLING_OPTION = 2 --> para juegos con scroll, MEMORY 24800                          
;		            disponibles los comandos |MAP2SP, |UMA
;
; ASSEMBLING_OPTION = 3 --> para juegos pseudo 3D , MEMORY 24000 
; 			    disponible comando |3D
;
; ASSEMBLING_OPTION = 4 --> uso futuro

let ASSEMBLING_OPTION = 1
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


