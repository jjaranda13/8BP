; si ensamblas esto independientemente
; deberia ser al menos donde acaba el codigo de 8bp y del player, comprobando
; donde se ensambla la etiqueta _END_CODE. 
; 
; tras ensamblarlo, salvalo con save "musica.bin",b,32200,1400 

;org 32200 ;  NO HACE FALTA EL ORG PORQUE ENTRA DESPUES DEL CODIGO
org 32250
;--------------------MUSICA------------------------------------
; tiene la limitacion de tan solo poder incluir un solo fichero de 
; instrumentos para todas las canciones
; la limitacion se solventa simplemente metiendo todos los 
; instrumentos en un solo fichero.

;archivo de instrumentos. OJO TIENE QUE SER SOLO UNO
;read	"../MUSIC/montoya7_v2.mus.asm" ;
;read	"../MUSIC/frogger.mus.asm" ;
;read "../MUSIC/sin_canal_c_conFX.mus.asm"
;read "../MUSIC/sin_c_fx.mus.asm"
;read "../MUSIC/pt10.mus.asm"
;read "../MUSIC/nueva_006.mus.asm"
read "../MUSIC/nueva_008.mus.asm"
;read "../MUSIC/comm002.mus.asm"
;read "../MUSIC/intro3.mus.asm"
; archivos de musica

SONG_0:
;INCBIN	"../MUSIC/introx.mus" ;
;INCBIN	"../MUSIC/montoya7_v2.mus" ;
;INCBIN	"../MUSIC/frogger.mus" ;
;INCBIN	"../MUSIC/sin_canal_c_conFX.mus" ;
;INCBIN	"../MUSIC/sin_c_fx.mus" ;
;INCBIN	"../MUSIC/pt10.mus" ;
;INCBIN	"../MUSIC/comm002.mus" ;
;INCBIN	"../MUSIC/msx_001.mus" ;

INCBIN	"../MUSIC/inqui03.mus" ;
SONG_0_END:


SONG_1:
;INCBIN	"../MUSIC/intro3.mus"
;INCBIN	"../MUSIC/svi003.mus" ;
;INCBIN	"../MUSIC/msx_001.mus" ;
SONG_1_END:


SONG_2:

;INCBIN	"../MUSIC/introx.mus" ;

;INCBIN	"../MUSIC/nueva_008.mus" ;

SONG_2_END:

SONG_3:
SONG_4:
SONG_5:
SONG_6:
SONG_7:

_END_MUSIC