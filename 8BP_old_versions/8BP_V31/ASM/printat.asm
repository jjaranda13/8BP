org 25000

_INSTALL_RSX2
		ld bc, RSX_TABLE
		ld HL, RSX_space
		call &bcd1

		; ordenamiento de la tabla de sprites
		ld a,0; mode default de ordenamiento
		ld (SOR_mode),a
		call _SORTY; se ordenan los sprites del 0 al 31
		
		ret
	
;=============================================================================================================
; PRINTAT()  RUTINA DE impresion de caracteres
;=============================================================================================================
; inputs
;  flag_sobreescritura,y,x, cadena$
; ejemplo: 
; cad$="hola"
; PRINTAT, 0, 100,40,cad$
;
; x e y en coordenadas graficas
; cadena$ es una variable que contiene la cadena de caracteres a imprimir
; esta funcion invoca a printsp iterativamente, caracter a caracter
; se basa en la definicion de alfabeto que se haya hecho en Alphabet.asm

; variables locales
;-------------------------------------
; voy a usar las variables de la funcion LAYOUT por que se usan las mismas cosas
;LAY_coordy db 0
;LAY_coordx db 0
;LAY_chars dw 0; cadena de caracteres
;LAY_len db 0; longitud de la cadena

;PAT_coordx dw 0
;PAT_coordy dw 0


;function body
;-------------------------------------
_PRINTAT
PAT
 		; recogida de parametros
		cp 3
		jr z, PAT_noover
		ld a, (IX+6); flag sobreescritura
		and a
		jr z, PAT_noover
		ld a,65;flag sobreescritura
		jr PAT_over
PAT_noover      ld a,1
PAT_over	ld (SPR_status),a

		; coord y [0..199]. tambien puede ser negativa o mayor de 200
		;------------------
  		ld a, (IX+4)
		ld (SPR_coordy),a
		ld (PAT_coordy),a
  		ld a, (IX+5)
		ld (SPR_coordy+1),a
		ld (PAT_coordy+1),a
		
		; coord x. la quiero en bytes [0..79]
		;--------------------------------------
 		ld a, (IX+2)
		ld (SPR_coordx),a
		ld (PAT_coordx),a
  		ld a, (IX+3)
		ld (SPR_coordx+1),a
		ld (PAT_coordx+1),a

		; ahora debo extraer el string 
		; en (IX+0) y (IX+1) esta la direccion del bloque de descripcion de cadena
		;-----------------------------------------
		ld l, (IX+0)
		ld h, (IX+1)
		ld a, (HL)
		ld (LAY_len), A; longitud del string
		inc HL
		ld c,(HL)
		inc hl
		ld b, (HL)
		ld (LAY_chars), bc; direccion de memoria donde comienza el string

		; pongo spr_status a 1 pues lo necesita la rutina de impresion
		;ld a,(PAT_over)
		;ld (SPR_status),a

		; ahora entro en bucle hasta que se acabe el string		
		ld HL, (LAY_chars); HL tiene la direccion de la cadena
		

PAT_buc		ld a, (HL); cargamos en A el codigo ASCII
		push hl
		; ahora se debe hacer una busqueda sobre la lista ALPHA_LIST 
		; de momento lo pongo fijo

		ld b,a; buscamos a ascii guardado en b
		ld c,0; posicion del char en ALPHALIST.empezamos en cero
		;ld HL, ALPHA_LETTERS; corresponde a la direccion del cero

		ld hl,ALPHA_LIST
PAT_busca	ld a,(HL)
		cp b
		jr Z, PAT_found
		inc c ; contador de chars en la alphalist
		inc hl
		jr pat_busca
		
PAT_found			

		ld h,c; ahora hl tiene el contador pero en 16bit
		ld a, (ALPHA_tamano)		
		ld e, a
		call _MUL8bit  ; this routine performs the operation HL=H*E
		ld bc , ALPHA_LETTERS
		add hl,bc; ya estamos en la letra
		
		LD (SPR_sprite_data),HL;
		LD (SPR_spritefinal),HL;
	
		;-------rutina impresion letra --------------
		ld a,(ALPHA_ancho)
		ld c,a
		ld (SPR_ancho), a
		ld a,(ALPHA_alto)
		ld (SPR_alto), a
		ld b,a
		ld (SPR_anchoaltofinal),bc;

		;el problema del clipping es que altera SPR_coordx, SPR_coord_y para la siguiente impresion
		
		
		
		call Z, PSP_caso1	
		
		

		;-------end rutina impresion letra-------------
PAT_next	ld a, (LAY_len)
		dec a
		jr z, pat_fin
		ld (LAY_len), A; longitud del string actualizada 

		; ahora hay que sumar el ancho de una letra
		ld hl, (PAT_coordx)
		ld a,(ALPHA_ancho)
		ld c,a
		ld b,0
		add hl,bc
		ld (PAT_coordx),hl
		ld (SPR_coordx),HL ; coordenada x actualizada (necesario pues cliping altera)
		ld hl, (PAT_coordy)
		ld (SPR_coordy),HL ; coordenada y actualizada (necesario pues cliping altera)

		pop hl; hl ahora esta apuntando a la cadena de caracteres
		inc hl; siguiente direccion tiene el siguiente char
		jr PAT_buc

PAT_fin		pop hl
		ret

	
;=============================================================================================================
; FLIP_CHECK()  RUTINA DE chequeo de flipeo
;=============================================================================================================
; inputs
;  SPR_id
; checkea si la rutina de impresion es normal o debe ser flipeada de acuerdo a la tabla _flip_table
; en caso normal retorna sin hacer nada
; en caso de requerir flipear, invoca a la rutina de impresion para flip

; variables locales
;-------------------------------------
; voy a usar las variables de la funci



;function body
;----------------------
FLIP_CHECK

		push hl
		ld a, (SPR_id);										
		ld HL, _FLIP_TABLE
		ld b,0
		ld c,a
                add hl, bc
		ld a,(hl); tengo en a el valor de flip
		and 0
		JR Z, _FLIP_NORMAL
                ; ************
               
_FLIP_NORMAL	pop hl
		ret
