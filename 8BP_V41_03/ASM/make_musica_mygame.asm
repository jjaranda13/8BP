; si ensamblas esto independientemente
; deberia ser al menos donde acaba el codigo de 8bp y del player, comprobando
; donde se ensambla la etiqueta _END_CODE. 
; 
; tras ensamblarlo, salvalo con save "musica.bin",b,32200,1400 

org 32200 ; hasta 33600 tenemos 1.4KB desde v32
;--------------------MUSICA------------------------------------
; tiene la limitacion de tan solo poder incluir un solo fichero de 
; instrumentos para todas las canciones
; la limitacion se solventa simplemente metiendo todos los 
; instrumentos en un solo fichero.

;archivo de instrumentos. OJO TIENE QUE SER SOLO UNO
read	"../MUSIC/marcha3.mus.asm" ;

; archivos de musica
SONG_0:
INCBIN	"../MUSIC/marcha3.mus" ;
SONG_0_END:


SONG_1:
;INCBIN	"../MUSIC/otracancion.mus" ;
SONG_1_END:

SONG_2:
SONG_3:
SONG_4:
SONG_5:
SONG_6:
SONG_7:

_END_MUSIC