; si ensamblas esto independientemente
; deberia ser al menos donde acaba el codigo de 8bp y del player, comprobando
; donde se ensambla la etiqueta _FIN_CODIGO. 
; 
; tras ensamblarlo, salvalo con save "musica.bin",b,32250,1250 
org 32250
;--------------------MUSICA------------------------------------
; tiene la limitacion de tan solo poder incluir un solo fichero de 
; instrumentos para todas las canciones
; la limitacion se solventa simplemente metiendo todos los 
; instrumentos en un solo fichero.

;archivo de instrumentos. OJO TIENE QUE SER SOLO UNO
read	"../MUSIC/montoya7_v2.mus.asm" ;
; archivos de musica
SONG_0:
INCBIN	"../MUSIC/montoya7_v2.mus" ;
SONG_0_END:


SONG_1:
INCBIN	"../MUSIC/stars3_v2.mus" ;
SONG_1_END:

SONG_2:
SONG_3:
SONG_4:
SONG_5:
SONG_6:
SONG_7:
_FIN_MUSICAS
