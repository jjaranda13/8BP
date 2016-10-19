; si ensamblas esto independientemente
; deberia ser al menos donde acaba el codigo de 8bp y del player, comprobando
; donde se ensambla la etiqueta _FIN_CODIGO. 
; suponiendo que es menor de 32000 (en realidad es algo menos, puedes ensamblar en 32000)
; tras ensamblarlo, salvalo con save "musica.bin",b,32000,1500
;org 32000
org 32350 ; para usar la v23
;--------------------MUSICA------------------------------------
; tiene la limitacion de tan solo poder incluir un solo fichero de 
; instrumentos para todas las canciones
; la limitacion se solventa simplemente metiendo todos los 
; instrumentos en un solo fichero.

;archivo de instrumentos. OJO TIENE QUE SER SOLO UNO
read	"../music/montoya7_v26.mus.asm"	
;read	"medieval5.mus.asm" ;	
;read	"pingu4.mus.asm"		

; archivos de musica
; ojo la primera nota debe sonar en los 3 canales y ademas ya nunca se repetira
; si no hacemos sonar una primera nota, el canal se queda mudo. Parece un bug del player aunque 
; no tiene ningun efecto negativo si cumplimos esta regla.
; IMPORTANTE esta nota especial debe ser del instrumento con id=0 (edito usando WYZ tracker)
; si es de otro instrumento me da problemas.
SONG_0:
INCBIN	"../music/montoya7_v26.mus" ;
;INCBIN	"medieval5.mus" ;
;INCBIN	"pingu3.mus" ;
SONG_0_END:


SONG_1:
;INCBIN	"pingu2.mus" ;
INCBIN	"../music/pingu4_v26.mus" ;
SONG_1_END:

SONG_2:
INCBIN	"../music/medieval5_v26.mus" ;
SONG_2_END:
SONG_3:
SONG_4:
SONG_5:
SONG_6:
SONG_7:

