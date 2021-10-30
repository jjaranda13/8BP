org 23850; usa CALL 24300

;org 10000
RUTINA
ld hl, 7466; direccion origen
ld de, &c000; direccion destino = pantalla
ld bc, 2000; esto es el numero de bytes a copiar
ldir
; el segmento oculto 0 no lo copio (no habra por tanto rutina tintas)

ld hl, 7466+2000+48; direccion origen
ld de, &c000+2000+48; direccion destino = pantalla
ld bc, 2048; esto es el numero de bytes a copiar
ldir

; el segmento oculto 1 no lo copio (no habra por tanto rutina tintas)

ld hl, 7466+4000+96; direccion origen
ld de, &c000+4000+96; direccion destino = pantalla
ld bc, 16384-4096; esto es el numero de bytes a copiar
ldir

;ld hl, 7516+4000+48+48; direccion origen
;ld de, &c000+4000+48+48; direccion destino = pantalla
;ld bc, 2000; esto es el numero de bytes a copiar
;ldir

;ld hl, 7516+6000+48*3; direccion origen
;ld de, &c000+6000+48*3; direccion destino = pantalla
;ld bc, 2000; esto es el numero de bytes a copiar
;ldir


ret
END_RUTINA

; DATOS EDITABLES POR EL USUARIO
;--------------------------------
direccionVarNumJuego	EQU	&FFFF		; Direccion RAM de la variable donde se indica el numero del juego a cargar
										; Si el juego es el 0, volvera al menu
direccionRutina 	EQU END_RUTINA ;&4650		; Direccion donde se compila la rutina. Indiferente -> El codigo es reubicable, incluso compilado
	
;output	"cargaSNA.bin"				; Nombre del binario generado				
;--------------------------------


; PARAMETROS QUE DEPENDEN DE LA VERSION DEL MENU DANDANATOR. ACTUAL 1.8 ASM
;---------------------------------------------------------------------------
direccionPila			EQU &BFF8		; Direccion de la pila usada por el menu del dandanator
direccionArranque		EQU &0072		; Direccion actual de arranque secundario (autoboot en A)
;---------------------------------------------------------------------------


; Rutina
; -------------------------------
	org direccionRutina					; Calcular etiquetas a partir de este valor de base
										; No afecta puesto que no hay etiquetas. El codigo binario es reubicable

		DI 								; Deshabilitar interrupciones
		LD SP, direccionPila			; Utilizando la pila en el mismo sitio que el menu del dandanator
		LD IY, direccionPila-4			; Utilizamos una zona de la pila no usada para el byte que "machaca" el dandanator
		
		LD B, 0							; Establecer el slot 0 del dandanator, donde esa el menu, en 0x0000
		DEFB &FD,&FD
		LD (IY+0),B
		
		LD BC, direccionArranque		; Establecer la direccion de arranque del menu como retorno con RET
		PUSH BC
		
		LD A, &CA 						; Desactivar, en diferido (tras RET) el modo de compatibilidad forzada o "FollowROM"
		DEFB &FD, &FD
		LD (IY+0),A								
		
		LD A, (direccionVarNumJuego)	; Juego deseado para cargar. 0 = Menu
		RET 							; Desactivar FollowROM y saltar al menu
_END_RUTINAS