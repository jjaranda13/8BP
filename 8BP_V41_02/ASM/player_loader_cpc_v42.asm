
;                .filename "VADERETRO"
                ;ORG	&4100

		

mc_wait_flyback equ 	&bd19

; la rutina player la llamo una sola vez, al establecer la interrupcion con MUSIC. Despues llamo periodicamente a INICIO
PLAYER:         DI 


		CALL	PLAYER_OFF

; MUSICA DATOS INICIALES

		;LD	DE,&0020		;  Nº BYTES RESERVADOS POR CANAL &20 es 32
		LD	DE,24	; he reducido de 32 a 24 v41
                LD      HL,BUFFER_DEC       	;* RESERVAR MEMORIA PARA BUFFER DE SONIDO!!!!!		
                LD      (CANAL_A),HL
              
		ADD     HL,DE       	
                LD      (CANAL_B),HL       	

                ADD     HL,DE       	
		;Ld hl, BUFFER_DEC_CANAL_C   no sirve
                LD      (CANAL_C),HL 

                ADD     HL,DE       	
		;Ld hl, BUFFER_DEC_CANAL_P   no sirve
                LD      (CANAL_P),HL 

                ;LD      A,0             	;* CANCION Nº 0
		LD A,(INS_cancion); variable de la rutina MUSIC-ON de la libreria 8bp
                CALL    CARGA_CANCION

;PANTALLA



		EI

; este ret es una modificacion para hacerlo funcionar por interrupciones
; comentalo si quieres que funcione normalmente y descomenta las 3 siguentes lineas
		RET


	
;LOOP
;		CALL 	mc_wait_flyback
;		CALL	INICIO
;		JR	LOOP


BUFFER_DEC:     
		;DS      &20*4 ; 32x4
		ds 	24*4; he reducido a 24 (v41)


					;************************* mucha atencion!!!!
					; aqui se decodifica la cancion hay que dejar suficiente espacio libre.
					; son 128 bytes
					;*************************
                



TABLA_SONG:     DW      SONG_0		
		DW	SONG_1
		DW	SONG_2
		DW	SONG_3
		DW	SONG_4
		

;codigo del player
;read "WYZPROPLAY47c_CPC_winape_v39.asm" ; permite mutar el canal c en la musica para usarlo con sound
;read "WYZPROPLAY47c_CPC_winape_v40.asm" ; permite mutar el canal c en la musica para usarlo con sound
;read "WYZPROPLAY47c_CPC_winape_v41.asm" ; permite canal de efectos
read "WYZPROPLAY47c_CPC_winape_v42.asm" ; he movido algunas variables de segmentos ocultos aqui por detectar efectos en screen
_END_PLAYERWYZ

_END_CODE
;org _SCREEN_4_BEGIN
;BUFFER_DEC     DS      48		;************************* mucha atencion!!!!


