; si ensamblas esto independientemente
; deberia ser al menos donde acaba el codigo de 8bp y del player, comprobando
; donde se ensambla la etiqueta _FIN_CODIGO. 
; 
; tras ensamblarlo, salvalo con save "musica.bin",b,32100,1400 
; tras ensamblarlo, salvalo con save "musica.bin",b,32250,1250 
;org 32250
;org 32100; 
org 32200 ; hasta 33500 tenemos 1.3KB desde v32
;--------------------MUSICA------------------------------------
; tiene la limitacion de tan solo poder incluir un solo fichero de 
; instrumentos para todas las canciones
; la limitacion se solventa simplemente metiendo todos los 
; instrumentos en un solo fichero.

;archivo de instrumentos. OJO TIENE QUE SER SOLO UNO
;read	"../MUSIC/montoya7_v2.mus.asm" ;
read	"../MUSIC/cars_04.mus.asm" ;
;read	"../MUSIC/mistery_002.mus.asm" ;
; archivos de musica
SONG_0:
;INCBIN	"../MUSIC/montoya7_v2.mus" ;
INCBIN	"../MUSIC/cars_04.mus" ;
;INCBIN	"../MUSIC/mistery_002.mus" ;
SONG_0_END:


SONG_1:
;INCBIN	"../MUSIC/congrat_004.mus" ;
;INCBIN	"../MUSIC/mistery_002.mus" ;
INCBIN	"../MUSIC/congrat_005.mus" ;
SONG_1_END:

SONG_2:
INCBIN	"../MUSIC/final_racing_004.mus" ;
SONG_3:
SONG_4:
SONG_5:
SONG_6:
SONG_7:
_FIN_MUSICAS
