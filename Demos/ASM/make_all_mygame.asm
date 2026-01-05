
; Makefile para los videojuegos que usan 8bits de poder
; si alteras solo una parte solo tienes que ensamblar el make correspondiente
; por ejemplo puedes ensamblar el make_graficos si cambias dibujos

; DESDE LA V42 EXISTEN "OPCIONES" DE ENSAMBLAJE
; ------------------------------------------------
; ASSEMBLING_OPTION = 0 --> todos los comandos disponibles. MEMORY 23500
;			    para salvar libreria +graficos+ musica
;                           SAVE "8BP0.bin",b,23500,19120
;
; ASSEMBLING_OPTION = 1 --> para juegos de laberintos. MEMORY 25000
; 			    disponibles los comandos |LAYOUT, |COLAY  
;			    para salvar libreria +graficos+ musica
;                           SAVE "8BP1.bin",b,25000,17620
;
; ASSEMBLING_OPTION = 2 --> para juegos con scroll, MEMORY 24800                          
;		            disponibles los comandos |MAP2SP, |UMA
;			    para salvar libreria +graficos+ musica
;                           SAVE "8BP2.bin", b,24800,17820
;
; ASSEMBLING_OPTION = 3 --> para juegos pseudo 3D , MEMORY 24000 
; 			    disponible comando |3D
;			    para salvar libreria +graficos+ musica
;                           SAVE "8BP3.bin", b,24000,18620
;
; ASSEMBLING_OPTION = 4 --> para juegos sin scroll ni necesidad de
;			    el mecanismo de LAYOUT para laberintos
;			    dispones de 500 bytes mas para tus sprites
;

let ASSEMBLING_OPTION = 0

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


