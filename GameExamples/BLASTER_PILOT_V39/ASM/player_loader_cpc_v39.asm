
;                .filename "VADERETRO"
                ;ORG	&4100

		

mc_wait_flyback equ 	&bd19

PLAYER:         DI


		CALL	PLAYER_OFF

; MUSICA DATOS INICIALES

		LD	DE,&0020		;  Nº BYTES RESERVADOS POR CANAL
;		LD	DE,&0200		;  Nº BYTES RESERVADOS POR CANAL
                LD      HL,BUFFER_DEC       	;* RESERVAR MEMORIA PARA BUFFER DE SONIDO!!!!!
                LD      (CANAL_A),HL
                
                ADD     HL,DE       	
                LD      (CANAL_B),HL       	

                ADD     HL,DE       	
                LD      (CANAL_C),HL 

                ADD     HL,DE       	
                LD      (CANAL_P),HL 

                ;LD      A,0             	;* CANCION Nº 0
		LD A,(INS_cancion); variable de la rutina MUSIC-ON de la libreria 8bp
                CALL    CARGA_CANCION

;PANTALLA



		EI

; este ret es una modificacion para hacerlo funcionar por interrupciones
; comentalo si quieres que funcione normalmente
		RET


	
LOOP:		CALL 	mc_wait_flyback
		CALL	INICIO

		JR	LOOP


BUFFER_DEC:     DS      &20*4		;************************* mucha atencion!!!!
					; aqui se decodifica la cancion hay que dejar suficiente espacio libre.
					; son 128 bytes
					;*************************
                



TABLA_SONG:     DW      SONG_0		
		DW	SONG_1
		DW	SONG_2
		DW	SONG_3
		DW	SONG_4
		

;codigo del player
read "WYZPROPLAY47c_CPC_winape_v39.asm" ; permite mutar el canal c en la musica para usarlo con sound
_END_PLAYERWYZ

_END_CODE
;org _SCREEN_4_BEGIN
;BUFFER_DEC     DS      48		;************************* mucha atencion!!!!


