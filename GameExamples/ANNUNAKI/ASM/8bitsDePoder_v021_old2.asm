
 
;=============================================================================================================
;   88888
;  8     8
;  8     8
;   88888   bits de poder . Un tributo al amstrad CPC                  
;  8     8                                            
;  8     8   
;   88888
;
; Jose Javier Garcia Aranda 2016
;
; CONJUNTO DE RUTINAS ASM PARA PROGRAMAS (JUEGOS) BASIC
; ------------------------------------------------------------------------------------------------------------
; las funciones usables desde basic las denoto con etiquetas asm con formato  "_<function name>"
;
; tras invocar "call _INSTALL_RSX" desde BASIC, usando "CALL &6b78" dispondras de los siguientes comandos
;
;|PRINTSP, #,y,x                    -> imprime un sprite sin tener en cuenta byte de status               
;|PRINTSPALL, sync                  -> imprime todos los sprites con flag de impresion activo
;|LOCATESP, #,y,x                   -> cambia las coordenadas de un sprite (sin imprimirlo)
;|COLAY, #,@colision                -> detecta la colision con el layout y retorna 1 si hay colision
;|COLSP, #,@id                      -> retorna primer sprite con el que colisiona #
;|ANIMA, #                          -> cambia el fotograma de un sprite segun su secuencia
;|ANIMALL                           -> cambia el fotograma de los sprites con flag animacion activado
;|MOVER, #,dy,dx                    -> movimiento relativo de un sprite
;|MOVERALL, dy,dx                   -> movimiento relativo de todos los sprites con flag de mov relativo activo
;|AUTO, #,dy,dx                     -> movimiento automatico de un sprite de acuerdo a su velocidad
;|AUTOALL, dy,dx                    -> movimiento de todos los sprites con flag de mov automatico activo 
;|STARS, starini,numstars,color,dy,dx  -> scroll de un banco de estrellas en cualquier direccion y velocidad
;|SETLIMITS, xmin,xmax,ymin,ymax    -> define la ventana de juego, donde se hace clippling
;|LAYOUT, y,x,string                -> imprime un layout de imagenes de 8x8 y rellena map layout
;|SETUPSP, #, param_number, valor   -> modifica un parametro de un sprite
;|SETUPSQ, #, adr0,adr1,...,adr7    -> crea una secuencia de animacion
;|MUSIC, cancion,speed              -> comienza a sonar una cancion a la velocidad deseada
;|MUSICOFF                          -> para la musica
;|POKE, direccion, valor	    -> acepta valores negativos. es un poke de 16bit
;|PEEK,dir,@variable

; tablas de datos accesibles desde basic
; -------------------------------------------
; 42540	    STARS1 tabla de 20 estrellas (y,x) 1 byte por coordenada. Usar POKE para rellenarla
; 42580	    STARS2 tabla de 20 estrellas (y,x) 1 byte por coordenada. Usar POKE para rellenarla
; 27000     SPRITES_TABLE tabla de 32 sprites de 16bytes cada uno. Usar |SETUPSP
;                         tambien puedes usar POKE, salvo para coordenadas negativas que
;                         deberas usar LOCATE_SPRITE() o bien |POKE			
; 33500     SEQUENCES_TABLE tabla de 31 secuencias de animacion, 8 words cada una. Usar |SETUPSQ
;--------------------------------------------------------------------------------------------------
; Ensambladas a partir de direccion =27000. La primera instruccion basic debe ser memory 26999 para
; colocar HIMEM en 26999 y asi no machacar las rutinas que comienzan en 27000
; los sprites deben dibujarse a partir de direccion 34000 por lo que disponemos de  8KB para graficos
; El programa basic podra ocupar hasta 27KB, pero cuidado, las variables de basic
; tambien ocupan memoria de modo que tu programa debe de ser menor de 27KB
; 
; por ultimo, es acosejable que tu programa se cargue mediante un "cargador" que carga la
; libreria 8bp y los sprites y la musica, y a continuacion tu programa
;
;10 MEMORY 26999
;20 LOAD "8bp.lib"   <--- esta libreria, incluye tabla de sprites y layout de pantallas
;30 LOAD "music.bin"  <--- musica (dos ficheros generados por el editor de musica)
;40 LOAD "sprites.bin" <--- graficos y tabla de secuencias
;50 RUN "tujuego.bas"  <--- tu juego se carga al final con RUN, reemplazando este listado BASIC
;
; ----------------------------------------------------------------------
; AMSTRAC CPC464 MAPA DE MEMORIA de 8BP
;
; &FFFF +---------- 
;       |  pantalla
; &C000 +---------- 
;       |  system (simbolos redefinibles, etc)
; 42619 +---------- 
;       | banco de 40 estrellas (desde 42540 hasta 42619)
; 42540 +---------- 
;       | map layout de caracteres (25x20 =500 bytes) 
;       |          
; 42040 +---------- 
;       | sprites (8KB para dibujos. 8040 bytes)
; 34000 +---------- 
;       |  hasta 31 secuencias de animacion de 8 frames (496 bytes)
; 33500 +---------- 
;       | canciones (1.5kB para musica)       
;       |		       
; 32000 +----------
;       |  rutinas 8BP   ( y sobran 500 bytes para ampliaciones)
;       |	 aqui estan todas las rutinas y la tabla de sprites
;       |        incluye el player de musica "wyz"
; 27000 +---------- 
;       |  |variables el basic
;       |  V
;       |  
;       |  ^ basic (texto del programa)
;       |  |
;       +---------- 0kB

; En todas estas rutinas:
;   - CADA RUTINA SE IDENTIFICA CON 3 LETRAS <ID_RUTINA>
;     ejemplo "PSP" identifica a la rutina _PRINT_SPRITE
;   - Por claridad escribo todas las etiquetas precedidas del <ID_RUTINA>
;     ejemplo "PSP_sigue" (una etiqueta de la rutina PSP)
;

;=============================================================================================================
; VARIABLES Y DATOS COMUNES DE SPRITES (SPR)
;=============================================================================================================
_SPRITES_DATA:

org 27000
; Esta primera seccion es de variables, no es una rutina
; Manejamos una tabla de _NUM_SPRITES sprites
; Puedes usar mas pero dando "cambiazos" en la tabla
;   por ejemplo poke 30000+i*2, 37000 cambia la dir del dibujo del sprite i
;   estos pokes permiten hacer secuencias de animacion
NUM_SPRITES equ 32; soportamos 32 sprites simultaneos. si cambias este numero y reensamblas
		   ; puedes ahorrar memoria (si pones menos)
SEQUENCES equ 33500; direccion de memoria de las secuencias

;=====================================
; TABLA DE SPRITES (_SPR_SPRITES_TABLE)
;=====================================
_SPR_SPRITES_TABLE
; tabla de variables de estado de los sprites 
;------- sprite 0 (ejemplo)------------------
sp0		db 1; status, es un byte de flags
		; bit 0 flag de impresion. Si esta a 1 (activo) se imprime en PRINT_SPRITES()
		; bit 1 flag de colision. una fruta o moneda por ejemplo pueden no tener flag de 
		;	impresion pero tener el de colision
   		; bit 2 flag de animacion automatica. se tiene en cuenta en ANIMA_ALL(). 
		;       En el caso del personaje , recomiendo desactivarlo, ya que si me quedo quieto no
		;	hay que cambiar el fotograma.
		; bit 3 flag de movimiento automatico. Se mueve solo al invocar AUTO_ALL()
		;	teniendo en cuenta su velocidad. util en meteoritos y guardias.
		; bit 4 flag de movimiento relativo. todos los sprites que tengan este flag 
		; 	se mueven a la vez al invocar MOVER_ALL(incy,incx) muy util en 
		;	naves en formacion y llegadas a planetas
		; 
		; ejemplos
		; un sprite que se imprimr con deteccion de colision con otros spries y animacion debe tener 
		;  status = 1(bit 0)+ 2 (bit1) + 4 (bit 2) =7 =&x0111
		; un sprite que se imprime activo sin deteccion de colision con otros y movimiento relativo 
		;  status = 1(bit 0)+ 0 (bit1) + 0 (bit 2) + 0 (bit 3)+ 16 (bit 4)=17 =&x10001

		dw 50; coordy puede tomar valores negativos. area visible es[0..79]
		dw 50; coordx . puede tomar valores negativos. area visible es[0..199]. 
		db 0; velocidadY para movimiento automatico
		db 0; velocidadX para movimiento automatico
sp0_seq		db 2; identificador de secuencia de animacion asignada [0..NUM_SEQUENCES]
	 	   ; un 0 significa que no hay secuencia de animacion
sp0_frame	db 0; identificador de frame en la secuencia de animacion[0..n]
	    	; si sa secuencia de animacion es cero , este campo se ignora
sp0img		dw 34000; direccion de la imagen 
		; si hay una secuencia  de animacion asignada, entonces este dato es 
		; redundante con el id_frame. Aun asi es necesario.
		; Ademas si no hay secuencia es la unica forma de indicar cual es la imagen,
		; ejemplo hierba, ladrillos, etc objetos sin secuencias de animacion

		;cada sprite ocupa 16 bytes para que sea muy rapido calcular su direccion
		; 16 en binario es 1000, mientras que 11 en binario es 1011
		; la velocidad en multiplicar depende del numero de unos.
		db 0 ; posible uso futuro
		db 0 ; posible uso futuro
		db 0 ; posible uso futuro
		db 0 ; posible uso futuro
		db 0 ; posible uso futuro

;------- resto de sprites  ------------------
sprite_size 	equ sp1-sp0
sp_seq_offset	equ sp0_seq-sp0
sp_frame_offset equ sp0_frame-sp0


;--------------------------------------------------------------------------
sp1	let COUNTER = NUM_SPRITES-1
	while COUNTER
	db 0; status 0=desactivado, 1=activo
	dw 0; coordy puede tomar valores negativos. area visible es[0..79]
	dw 0; coordx . puede tomar valores negativos. area visible es[0..199]. 
	db 0; velocidadY para movimiento automatico.
	db 0; velocidadX para movimiento automatico.
	db 1; identificador de secuencia de animacion asignada [0..NUM_SEQUENCES-1]
	db 0; identificador de frame en la secuencia de animacion[0..9]
	dw 34000:; esto es  direccion de la imagen 0
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	db 0 ; posible uso futuro
	let COUNTER = COUNTER-1
	wend


org 27000+512 ; la tabla de sprites ocupa 32 x 16bytes = 512 bytes


;=============================================================================================================
;RUTINA  INSTALL_RSX() 	RSX
;=============================================================================================================
; instala los comandos RSX para usar desde basic
_INSTALL_RSX
		ld bc, RSX_TABLE
		ld HL, RSX_space
		call &bcd1
		ret

RSX_TABLE	defw RSX_NAMETB
		JP _PRINT_SPRITE	;|PRINTSP, #,y,x
		JP _PRINT_SPRITES	;|PRINTSPALL, sync
		JP _POKE		;|POKE
		JP _LOCATE_SPRITE	;|LOCATESP, #,y,x
		JP _COLISION_LAYOUT	;|COLAY, #,@colision
		JP _COLISION_SPRITES	;|COLSP, #,@id
		JP _ANIMA_SP		;|ANIMA, #
		JP _ANIMA_ALL		;|ANIMALL
		JP _MOVER		;|MOVER, #,dy,dx
		JP _MOVER_ALL		;|MOVERALL, dy,dx
		JP _AUTO_SPRITE		;|AUTO, #,dy,dx
		JP _AUTO_ALL		;|AUTOALL
		JP _SCROLL_STARS	;|SCROLLSTARS, bank,num,color,dy,dx
		JP _SET_LIMITS		;|SETLIMITS, xmin,xmax,ymin,ymax
		JP _PRINT_LAYOUT	;|LAYOUT, y,x,string
		JP _SETUP_SPRITE	;|SETUPSP, #, param_number, valor
		JP _SETUP_SEQUENCE	;|SETUPSQ, #, adr0,adr1,...,adr6
		JP _MUSIC_ON		;|MUSIC, cancion,speed
		JP _MUSIC_OFF		;|MUSICOFF
		JP _PEEK		;|PEEK,dir,@variable
		JP _COLSPALL		;|COLSPALL
RSX_space	db 0,0,0,0

RSX_NAMETB	defM "PRINTS"
		db "P"+&80
		defM "PRINTSPAL"
		db "L"+&80
		defM "POK"
		db "E"+&80
		defM "LOCATES"
		db "P"+&80
		defM "COLA"
		db "Y"+&80
		defM "COLS"
		db "P"+&80
		defM "ANIM"
		db "A"+&80
		defM "ANIMAL"
		db "L"+&80
		defM "MOVE"
		db "R"+&80
		defM "MOVERAL"
		db "L"+&80
		defM "AUT"
		db "O"+&80
		defM "AUTOAL"
		db "L"+&80
		defM "STAR"
		db "S"+&80
		defM "SETLIMIT"
		db "S"+&80
		defM "LAYOU"
		db "T"+&80
		defM "SETUPS"
		db "P"+&80
		defM "SETUPS"
		db "Q"+&80
		defM "MUSI"
		db "C"+&80
		defM "MUSICOF"
		db "F"+&80
		defM "PEE"
		db "K"+&80
		defM "COLSPAL"
		db "L"+&80
		db 0
ENDRSX
;=============================================================================================================
;RUTINA  _MUL8bit(H,E) (MUL)
;=============================================================================================================
; es una rutina interna auxiliar para multiplicar de forma eficiente numeros de 8 bit
; se basa en desplazamientos en lugar de en repetir N veces una suma
; el resultado queda en HL (16bit) y como mucho es 65536 (255x255=65535)
; es mejorable protegiendo d mediante un push/pop o con una simple asignacion a una variable byte. 
; por velocidad he preferido evitar proteger d, aunque apenas tendria impacto.
_MUL8bit:                           ; this routine performs the operation HL=H*E
  
  		ld d,0                         ; clearing D and L
  		ld l,d
  		ld b,8                         ; we have 8 bits
MUL_Loop:
  		add hl,hl ; advancing a bit. consume 3 ciclos, mientras que un desplazamiento son 6 ciclos
		jp nc,MUL_Skip; if zero, we skip the addition (jp is used for speed)
  		add hl,de    ; adding to the product if necessary
MUL_Skip:
  		djnz MUL_Loop
  		ret

;=============================================================================================================
;RUTINA  _SET_LIMITS(xmin,xmax,ymin,ymax)
;=============================================================================================================
; variables locales
;-------------------------------------
; estas variables son globales pero se rellenan aqui.
; por defecto los limites del clipping es la pantalla
SPR_MIN_X: 	; limite horizontal para el clipping
		dw 0;15
SPR_MAX_X:	; limite horizontal para el clipping
		dw 80; ojo, es el primer byte que no se pinta!!!
SPR_MIN_Y:	; limite vertical para el clipping
		dw 0;20
SPR_MAX_Y:	; limite vertical para el clipping
		dw 200; ojo, es el primer scanline que no se pinta!!!

;function body
;-------------------------------------
_SET_LIMITS:

		ld h, (IX+7);es el mas signific. no lo necesito
		ld l,(IX+6);menos signific
		ld (SPR_MIN_X), hl

		ld h, (IX+5);es el mas signific. no lo necesito
		ld l,(IX+4);menos signific
		ld (SPR_MAX_X), hl

		ld h, (IX+3);es el mas signific. no lo necesito
		ld l,(IX+2);menos signific
		ld (SPR_MIN_Y), hl

		ld h, (IX+1);es el mas signific. no lo necesito
		ld l,(IX+0);menos signific
		ld (SPR_MAX_Y), hl
		ret

;=============================================================================================================
;RUTINA  _LOCATE_SPRITE #,y,x
;=============================================================================================================
; esta funcion coloca el sprite en las coordenadas que indiques. Basicamente modifica las coordenadas
; del sprite en la tabla SPRITES_TABLE. A diferencia de un simple POKE, acepta numeros negativos de modo
; que puedes conseguir que el sprite desaparezca parcial o totalmente de la pantalla
; variables locales 
;-------------------------------------

;function body
;-------------------------------------
_LOCATE_SPRITE

	 	;ld b, (IX+5);es el mas signific.  es cero pues solo hay 32 sprites
		ld c,(IX+4);menos signific. aqui tenemos el sprite id
		; ahora hay que localizar la direccion donde se encuentran las
		; variables de estado del sprite
		;------------------calculo de la direccion del sprite -----------
		 call _get_dir_sp; sprite id en c, retorna hl
		; ahora en HL esta la direccion de la entrada del sprite en tabla SPRITES__TABLE
		;-------------------------------------------------------------------------------
		inc hl; la primera variable es status
		;----- coord y -----
		ld b, (IX+3);es el mas signific. 
		ld c,(IX+2);menos signific

		ld (HL),C
		inc hl
		ld (HL),B
		;----- coord x -----
		inc HL
		ld b, (IX+1);es el mas signific. 
		ld c,(IX+0);menos signific
		ld (HL),C
		inc hl
		ld (HL),B
		ret	
		
;=============================================================================================================
;RUTINA DE SINCRONISMO _SYNC() (SYN)
;=============================================================================================================
; esta funcion espera al barrido de pantalla de un modo 
; mas "correcto" que ra rutina del firmware call &bd19
_SYNC:
SYN:
		ld c,0
		ld b,#f5
SYN_lee:
		in a,(c)
		rra
		jr nc,SYN_lee
		ret
;=============================================================================================================
;RUTINA  _PRINT_SPRITE(id,y,x) (PSP)
;=============================================================================================================
;
;  call &XXXX,<sprite_number>,<y>,<x>
; o bien call DDDD,<sprite_number>,<y>,<x>
;    coordenada y entre [0,199] acepta negativos
;    coordenada x entre [0,79] acepta negativos
;
; el ultimo parametro de un call se recoge en (ix+0) y (ix+1)
; el siguiente en (ix+2) y (ix+3), etc
; calculo direccion de pantalla mediante una cache
; Direccion = 0xC000 + ((Linea / 8) * 80) + ((Linea % 8) * 2048) +x
;

; cargamos variable y. toma valores 0-200. pero debo contemplar que
; Y pueda ser negativa, por lo que no me basta con un byte
;
;     origen y coordenadas consideradas:
;	OJO. usamos coordenadas de byte, no de pixel
;     0------------>xmax=80
;     |
;     |
;     V
;     ymax=200
;
;
;---------------------------------------------------------------------
; variables locales 
;-------------------------------------
; estas variables tambien son globales pues se invoca desde esta funcion a la
; funcion _PAINT cuando ya tenemos hecho el clipping y calculada la dir pant y la dir
; del sprite, etc



SPR_ID: 	db 0;id_sprite a imprimir

SPR_sprite:; direccion del sprite (empezando por ancho y alto) que va a usar la rutina de impresion
		dw 0
SPR_sprite_data:; direccion del sprite (datos). simplemente es (SPR_sprite)+2
		dw 0

SPR_coordy:; coordenada y del sprite a imprimir
		dw 0
SPR_coordx:; coordenada x del sprite a imprimir
		dw 0

SPR_anchoalto:; solo es una etiqueta. no ocupa
		;aqui tenemos el ancho y alto original
SPR_ancho:
		db 0
SPR_alto:
		db 0
SPR_anchoaltofinal: ; solo es una etiqueta. no ocupa
SPR_anchofinal:; ancho final del sprite tras el clipping
		db 0
SPR_altofinal:; alto final del sprite tras el clipping
		db 0
SPR_spritefinal: ; direccion de dibujo del sprite tras el clipping
		dw &0000
SPR_dirpant:
		dw &0000; direccion de pantalla donde se va a imprimir



;SPR_offset	dw 0; offset de la tabla de sprites para apuntar a uno concreto


;function body
;-------------------------------------
_PRINT_SPRITE:

PSP:; RUTINA PSP 
		
		; vamos a rellenar las coordenadas
		; ---------------------------------
		ld b,(IX+3); mas signific
		ld c,(IX+2);menos signific
		ld (SPR_coordy), bc
       
 	        ld h,(IX+1); mas signific
		ld l,(IX+0);menos signific
		ld (SPR_coordx), hl


		; voy a extraer el id_sprite 
		;----------------------------
        	ld b, 0;(IX+5);es el mas signific.  en principio es 0 pues solo hay 32 sprites
		ld c,(IX+4);menos signific
		ld a,c
		ld (SPR_ID), a ; ya tenemos cargado el id_sprite 
		;------------------calculo de la direccion de imagen -----------
		call _get_dir_sp; sprite id en c, retorna hl
		; ahora en HL esta la direccion de la entrada del sprite en tabla SPRITES__TABLE
		;-------------------------------------------------------------------------------


PSP_i		ld bc,9;los bytes 9 y 10 guardan la direccion de la imagen del sprite
		add HL,bc
		; ahora en HL esta la direccion donde esta la direccion de la imagen del sprite
		ld c,(hl)
		inc hl
		ld b, (Hl)
		; ahora finalmente en BC ya tenemos la direccion de la imagen del sprite	
		;----------------------------------------------------------------
		ld (SPR_sprite), bc; variable SPR_sprite almacena dir mem sprite
		ld hl, (SPR_sprite)
		ld c, (HL); ancho

		; vamos a rellenar ancho y alto
		; ------------------------------
       		ld a,c
		ld (SPR_ancho), a
		inc hl
		ld b, (HL); alto
 		ld a,b
        	ld (SPR_alto), a
		ld (SPR_anchoaltofinal),bc; con esto ya he rellenado 
		; SPR_ancho_final y SPR_alto_final, aunque quizas los cambiemos, si hay cliping

		; vamos a rellenar la direccion del dibujo
		; ----------------------------------------
		INC HL
		LD (SPR_sprite_data),HL; aqui comienza el dibujo
		ld (SPR_spritefinal),HL; aqui comienza el dibujo. por el momento es igual

		

		; CLIPPING VERTICAL SUPERIOR
		;--------------------------------------------------------------------
PSP_caso1:	; 1er caso el mas frecuente Y>min_Y .
		ld HL,(SPR_coordy); coordy puede ser un numero negativo. 16bit necesario
		ld bc,(SPR_MIN_Y)
		;add a,0; quita acarreo
		and A; pone flag acarreo a cero
		SBC HL,BC
		JP P,PSP_clipVinf; si coordy>techo->no hay clipping superior
		;Jr NC,PSP_clipVinf; si coordy>techo->no hay clipping superior
	
PSP_caso2: 	; HL ha salido negativo
		;--------------------------------
		; 2do caso Y <TECHO and Y< -alto
		ld bc, (SPR_alto)
		ld b,0; el alto solo es un byte
		;add a,0; pone flag acarreo a cero
		and a; pone flag acarreo a cero
		adc hl,bc
		ret M ;nada que imrirmir (negativo)
		ret Z; tambien si el resultado es cero -> nada que imprimir

PSP_caso3: ; HL ha salido positivo al sumar la altura del sprite. es la altura final
		;---------------------------------------------
		; 3er caso  Y<TECHO pero Y> TECHO-alto
		; cabe algo del sprite. Debo cambiar 
 		; la direccion donde empieza el sprite y definir su nueva altura
		ld h,l; meto alto nuevo en h pues esta en l
		ld a, (SPR_ancho)	
		ld l,a 
		ld (SPR_anchoaltofinal),hl; h tiene el alto y l el ancho
		; se debe cambiar la direccion a la que apunta (spritefinal)
		; debo restar a la altura total, la altura nueva, para saber el offset del sprite
		ld a,(SPR_alto)
		sub h;
		ld b,a;; en b ahora estan las lineas de offset
		ld hl, (SPR_sprite_data)
		LD DE,(SPR_ancho)
		ld d,0
	  	
PSP_ajuste:	
 		add hl, de
		djnz PSP_ajuste; basicamente esto permite multiplicar 
		ld (SPR_spritefinal), hl

		;nuevas coordenadas 
		ld bc,(SPR_MIN_Y)
 		ld (SPR_coordy), bc

		; CLIPPING VERTICAL INFERIOR. ojo Y debe ser -255< Y <255
		;--------------------------------------------------------------------
PSP_clipVinf:

		;caso 1. el caso mas frecuente
		ld hl, (SPR_coordy); puede ser un numero negativo
 		ld bc,(SPR_MAX_Y)
		ld de,(SPR_altofinal); es solo un byte
		ld d,0
		add hl,de ; ahora hl contiene coordY+alto
		add a,0; reset acarreo. 
		SBC HL, bc
		;JP M, PSP_clipHder; no hay clipping Vinf
		Jr c, PSP_clipHder; no hay clipping Vinf

		; caso 2 y 3
 		; si estamos aqui es que ha salido positivo o cero
 		; y eso es que hay que recortar el alto
		; cuanto? pues justo el valor de hl

		; si hl-alto es >alto no hay que imprimir
		ld c, l; lo guardo. contiene el "exceso" que se sale de la ventana
		sbc hl,de; alto, es solo un byte
		ret nc; nada que imprimir, el dibujo se sale entero

 		ld de,(SPR_anchoaltofinal)
		ld a,d; alto
		sub c; alto final en A
		ret M; si a es negativo no hay que imprimir  NUNCA SE DARA ESTE CASO
		ret z; ESTE CASO SI SE PUEDE DAR
		ld d,a
		ld (SPR_anchoaltofinal),de
 	 	

		; CLIPPING HORIZONTAL DERECHO
		;-----------------------
PSP_clipHder:
		
		; caso 1 (el mas frecuente)
		ld hl, (SPR_coordx)
		ld de, (SPR_anchoaltofinal)
		ld d,0; e tiene el ancho
		add hl,de; en HL esta la coordenada superior derecha
		ld bc, (SPR_MAX_X)
		;add a,0; para quitar acarreo. 
		and A; pone flag acarreo a cero
		SBC hl,bc
		JP M,PSP_cliphizq;-> no hay clipping derecho

		; si se pasa del ancho no hay que imprimir
		ld c,l; l contiene lo que se ha salido de la pantalla, lo guardo en c
		sbc hl,de
		ret nc

		; caso 2 y3
		ld a,e;ancho esta en e
		sub c; c contiene lo que se ha salido de la pantalla
		ret M; nada que imprimir, esta todo fuera NO SE PUEDE DAR
		ret Z ; ESTE SI SE PUEDE DAR
		ld de, (SPR_anchoaltofinal)
		ld e,a
		ld (SPR_anchoaltofinal), de


		; CLIPPING HORIZONTAL IZQ
		;-----------------------
PSP_cliphizq:	
		;1er caso, el mas frecuente
  		ld HL, (SPR_coordx)
		ld de,(SPR_MIN_X)
		;add a,0 ; desactivar el flag de acarreo
		and a; pone flag acarreo a cero
		SBC HL,de 	
		JP P, PSP_finclippling; positivo. no hay cliping
		JP Z, PSP_finclippling; positivo. no hay cliping

		; si ahora sumo el ancho y HL sigue negativo, no hay nada que imprimir
		and a
		ld a, (SPR_ancho)
		ld e,a
		ld d,0
		adc hl,de
		ret M
		ret Z
		; si es positivo, hay algo que imprimir, y el nuevo ancho es hl
		;--------------------------------------
		ld de, (SPR_anchoaltofinal); ancho en e
		ld e, l
		ld (SPR_anchoaltofinal),de; ancho en e

		ld a,(SPR_ancho)
		sub l
		ld l,a
		ld h,0
		
		; cambio la direccion del dibujo
		ld de, (SPR_spritefinal)
		ADD hl,de
		ld (SPR_spritefinal),HL
		;cambiamos la coordenada x 
 	 	ld hl,(SPR_MIN_X)
  		ld (SPR_coordx),hl

		
PSP_finclippling:
		call _COMPUTE_DIRPANT; HL ahora tiene la dir de pantalla
		ld (SPR_dirpant),hl
		call _PAINT
		ret
		
;=============================================================================================================
; COMPUTE_DIRPANT()  RUTINA DE COMPUTO DE DIRECCIONES PANTALLA COP
;=============================================================================================================
; input SPR_coordy, SPR_coord_x . dos bytes en cada una. la coordx en bytes
; output HL

; variables locales
;-------------------------------------
;ninguna

;function body
;-------------------------------------
_COMPUTE_DIRPANT
COP
		ld a, (SPR_coordy)
		ld e,a
		and %111; me quedo con el resto de la division entre 8
		;ld (COP_resto), a
		srl e
		srl e
		srl e		
		; ahora e =coordy/ 8
		ld H, 80; 80 en binario es 1010000. 80 son los bytes de ancho de la pantalla
		call _MUL8bit; HL=H*E
		; me falta sumar a HL el resto x 2048
		;ld a, (PSP_resto) ya esta cargado. no hace falta asignarlo. esta isntruccion sobra
		; tengo en a el resto
		and a; si es cero no hay nada que sumar
		jp Z, COP_nosuma
		;---------------------------------------
		;hay que multiplicar ax 8 y sumarselo a H, 2048 =0800.  8 en hex es 8 en decimal
		sla a; x 2
		sla a; x 2
		sla a; x 2
		add a,h
		ld h,a
		;---------------------------------------
COP_nosuma	; me queda sumar &c000 y la coordenada x. 
		; lo hago a la vez sumando c0xx
		ld b, &c0
		ld a, (SPR_coordx)
		ld c,a
		add HL, bc
		ret
;=============================================================================================================
; PAINT() invocada internamente desde PRINT_SPRITE()
;=============================================================================================================

; input SPR_dirpant debe contener la direccion de pantalla
; tambien HL debe contenerla. asi ahorro una linea (la primera)
; variables locales
;-------------------------------------
PNT_restoancho dw 0; diferencia entre ancho y ancho tras cliping

;function body
;-------------------------------------
_PAINT:  ; dibujar en pantalla el sprite
PNT:
		;ld hl, (SPR_dirpant); direccion de pant donde vamos a pintar
		ld de,(SPR_spritefinal); direccion de memoria donde se encuentra el sprite
		ld a, (SPR_ancho)
		ld bc,(SPR_anchoaltofinal) ; ancho final en c
		sub c
		ld (PNT_restoancho),a; 
		ld hl, (SPR_dirpant)

		; NO DESHABILITO LAS INTERRUPCIONES, podria ralentizar musica pej.
		; lo malo es que la probabilidad de quedarse a medias imprimiendo aumenta
		
		;di ;disable interrupts. asi no me cortan la impresion desde el firmware
		ex de,hl
		ld a,(SPR_anchofinal)
	
PNT_loop_alto
		push bc; al entrar b contiene el alto, luego se va decrementando
 		push de; pantalla
	
PNT_loop_ancho      
		ld a,(SPR_anchofinal); esto es mas rapido que LD A,C
PNT_scanh
		ldi; es mas rapido que ldir usando a como contador
		dec a
		jr nz, PNT_scanh
	
		; si no se ha transferido todo el ancho
		; debo sumar a HL lo que falta
		ld de,(PNT_restoancho)
		add HL,de 

        	pop DE; saco pant, como si no hubiese sumado el ancho
		ld A,D
		add &08; es decir, 2048 (2KB)

		ld D,A; suma 2048 y lo mete en d
		sub &C0; si ahora salta flag acarreo es porque nos hemos pasado al sumar 2048
	
		jp nc,PNT_sig_linea
		; si llegamos aqui es que ha habido acarreo
		; por lo tanto DE ha desbordado ( el D ahora es D<C0) 
        	; sumando C0 a D es como dejarlo en la linea en la que estaba 
        	; ya que al desbordar queda pej FDA0+800=105A0. 
		; y c5a0 es la linea antes de ser sumado el 800
 	 	; motivo es que cada row es c0 +8+.. + 8 =F8 si sumo 8 queda 100
		; esta hecho asi aposta. no es magia. es ingenioso.
	        ; desborda y el nibble superior queda a cero
 	       ; por eso basta sumar c0 y ya estamos en el punto antes de sumar 8 
		ex de,hl
		ld bc,&c050 ; &c050 =2048   
		add HL,BC   ; le suma el c0 que le ha quitado y el 50
		ex de,hl
PNT_sig_linea
		pop bc; b tiene el alto, c el ancho
 		djnz PNT_loop_alto; dec b y salta. B contiene el alto
		;ei sobra pues no hay di
		ret


;=============================================================================================================
; _UNINSTALL_INTERRUPT()   UNI   tambien la llamaremos _MUSIC_OFF() pues es lo que hace
;=============================================================================================================
;by default, interrupts are enabled. 300 times per second, the Z80 will internally execute the following instructions :
; 	di
; 	call &38
;When Amstrad CPC is started up, we see that at &38 adress there is this instruction :
; jp &B941 (in 6128) or JP &b939 (in 464)
;&B941 adress is part of Amstrad CPC firmware code, that will do internal management of the CPC.
;To implement our own interrupts, the idea is to redirect the jump from &B941 adress to our own code 

;function body
;-------------------------------------
_MUSIC_OFF:
_UNINSTALL_INTERRUPT
UNI:
		di
		call _SALTO_INT
		ld hl, (sal_dir)
		ld (&39),hl
		ei
		; ahora voy a vaciar el buffer de sonido para que deje de sonar
		call &bca7 ; rutina de firmware , valida para 464 y 6128
		ret

;=============================================================================================================
; microrutina _SALTO_INT() SAL  lee y guarda salto actual de interrupciones 
;=============================================================================================================
; las interrupciones en 464 y 6128 hacen que la cpu ejecute lo que hay en la 
; direccion &38. alli hay un JP a una direccion diferente en 464 y 6128
; tras ejecutar nuestra rutina debemos saltar donde debamos segun el modelo
sal_dir		dw 0; aqui guardamos la direccion
sal_done	db 0; flag de direccion guardada
_SALTO_INT
		ld a,(sal_done)
		and a
		ret NZ; ya esta guardada la direccion
		ld a,1
		ld (sal_done),a
		ld hl,(&39); en la 38 hay un jp y en 39 la de salto
		ld (sal_dir),hl
		ld (INS_JP+1), HL; sobreescribe en la direccion del salto
		ret
		
;=============================================================================================================
; _INSTALL_INTERRUPT()   INS  tambien la llamaremos _MUSIC_ON() pues es lo que hace
;=============================================================================================================
; instala una rutina que invoca periodicamente al player de musica

; variables locales
;-------------------------------------
INS_counter	db 6; hay 300 interrupciones por segundo, cada 50 se ejecutara la rutina (6 veces por segundo)
;INS_model	dw &B939; model 464=>&B939 ,model 6128=> &B941. al instalar la interrupcion se corrige solo.
INS_cancion	db 0
INS_speed	db 5
; function body
;-------------------------------------
_MUSIC_ON: ; le damos tambien este nombre a la funcion
_INSTALL_INTERRUPT:
INS:		
		di
		call _SALTO_INT; asegura tener la dir de salto guardada
		ld a,(ix+0)
		ld (INS_speed),a
		ld a,(ix+2)
		ld (INS_cancion),a ; numero de cancion. por defecto=0

		call player
		;IM 1; no hace falta. by default asi es
 		ld hl,INS_rutina;// &b939;interrupt_callback
		ld ( &39 ), hl; en la &38 esta el jp  y en la &39 la direccion a la que vamos

		ei
		ret


INS_rutina:
	
		push af
 		push bc
 		push de
 		push hl
 		push ix
 		push iy

;--------- codigo de la rutina -------
		; EJECUCION DE LA COLA DE PETICIONES DE COMANDOS DESDE BASIC
		; PARA SALTARNOS EL ANALIZADOR SINTACTICO
		;CALL _TUNEL

		ld a, (INS_counter)
		dec a
		LD (INS_counter),A
		AND A ; ES CERO?
		JP nz,INS_fin
		;ld a, 65
		;CALL &BB5D ; esto simplemente es un experimento. imprime una "A" periodicamente

		
		call INICIO; invoca al player de musica
		

		ld a,(INS_speed); deberia ser 6 pero el basic nos hace perder algunas y se relentiza. asi se acelera un pelin
		LD (INS_counter),A	

		
INS_fin:	

	
		
;-----------fin de la rutina -----------
		pop iy
 		pop ix
 		pop hl
 		pop de
 		pop bc
 		pop af
		; este salto se machaca gracias a la rutina _SALTO_INT por eso aqui pongo &0000
		;ret ; y si me lo cargo?
INS_JP		JP &0000 ;&B939;; CPC 464, en CPC6128 hay que ir a &b941
		ret
;============================================================================================================
; _get_dir_sp    
;=============================================================================================================
; esta funcion retorna en HL la direccion del sprite en la tabla SPRITES_TABLE cuyo id esta en c
_get_dir_sp
		;------------------calculo de la direccion del sprite -----------
		ld e,sprite_size; esto es 16 pues es lo que ocupa cada sprite
		ld h,c; numero de sprite
		;El resultado es de 16 bit pues 31x16=496, por eso necesito invocar a MUL
		call _MUL8bit; H*E->HL, corrompe d 
		ld b,h
		ld c,l
		ld HL, _SPR_SPRITES_TABLE
		add HL,bc
		; ahora en HL esta la direccion de la entrada del sprite en tabla SPRITES__TABLE
		;-------------------------------------------------------------------------------
		ret

;============================================================================================================
; _ANIMA_SP(#)   ANS
;=============================================================================================================
; anima un sprite en base a su secuencia de animacion
; no se chequea el flag de animacion automatica a menos que el flag de llamada desde anima_all() este
; activo. dicho flag es la variable ANS_flag
; variables locales
;-------------------------------------
;ANS_id: 	db 0; sprite number
ANS_spaddress:	dw 0; direccion del sprite en la tabla SPRITES_TABLE
ANS_seq_id:	db 0 ; id sequence del sprite
ANS_frameid:	db 0; frame id actual del sprite
ANS_newframeid:	db 0; frame id nuevo del sprite
ANS_seqadd:	dw 0; direccion de la secuencia
ANS_newfradd:	dw 0; direccion de la nueva imagen

; function body
;-------------------------------------
_ANIMA_SP
		ld a, (IX+0); sprite id
ANS_a		;ld (ANS_id), a
		ld c, a
		; calculo de la direccion del sprite
		call _get_dir_sp; A=num sprite, retorna HL con la direccion
		jr ans_sigue

ANS_uno		ld a, (HL); status en A
		AND %00000100; flag animacion 
		RET Z ; 
ANS_sigue		
		ld (ANS_spaddress), HL; guardo la direccion
		ld bc, sp_seq_offset
		add HL, bc; en HL esta la direccion donde se almacena el id de la secuencia
		ld A, (HL); ahora en A esta el id de secuencia de animacion
			  ; ojo si es cero es que no hay secuencia
		and a; es cero?
		ret Z; nada que actualizar
		dec a; si es 1 o superior le resto un 1 para trabajar
		ld (ANS_seq_id), a
		inc HL
		ld a, (HL); en a ahora tengo el fotograma
		ld (ANS_frameid), a
		; ahora voy a la tabla de secuencias a ver que nuevo frame toca
		;ld HL,SEQUENCES
		ld a, (ANS_seq_id)
		ld E, a
		ld h,16; 8 words cada secuencia
		;ld h,14; 7 words cada secuencia
		call _MUL8bit; HL=H*E
		ld BC, SEQUENCES
		add HL,BC ;en HL esta la direccion de la secuencia

		;ld b,0
		;ld c,a
		;add HL,bc; en HL esta la direccion de la secuencia
		ld (ANS_seqadd), HL; guardada

		ld a, (ANS_frameid); recupero el fotograma_id
		cp a,7; frames van de 0 a 7 como mucho. si estamos en 7 hay que ciclar
		jp Z, ANS_fin_seq; ciclamos
		inc a; siguente frame
		ld (ANS_newframeid), a; siguiente frame guardado

		add a,a; mul 2
		ld b,0
		ld c, a
		add HL, bc; en HL la direccion donde se guarda la direccion de la nueva imagen
                
		ld c, (HL)
		inc HL
		ld b, (HL); ahora en BC tengo la dir de la nueva imagen. si es cero then fin secuencia
		ld (ANS_newfradd), bc; la guardo
		ld HL,(ANS_newfradd)
		ld b,0
		ld c, 0
		adc HL,bc
		JP z, ANS_fin_seq 	
		
		ld (ANS_newfradd), HL; guardo la nueva direccion de imagen
		JP ANS_nextframe; estamos en mitad de secuencia	
		
ANS_fin_seq	ld a, 0
		ld (ANS_newframeid), a; siguiente frame es cero
		ld HL, (ANS_seqadd); direccion de la secuencia
		ld c, (HL)
		inc hl
		ld b,(hl)
		ld (ANS_newfradd), bc


ANS_nextframe	; aqui llegamos con la variable de nuevo frame id rellena y 
		; nueva imagen address rellena
		
		; nueva funcionalidad. si el valor de la direccion es 1 es que es una secuencia muerte
		ld HL, (ANS_newfradd)
		ld bc,1
		sbc HL,bc
		JR NZ,ANS_nomuerte

		; si estamos aqui es secuencia muerte
		;ld a, (IX+0); sprite id
		;call _get_dir_sp
		ld HL, (ANS_spaddress)
		ld a,0 ;status cero
		ld (HL),a
		ret


ANS_nomuerte	ld HL, (ANS_spaddress)
		ld bc , sp_frame_offset
		add hl, bc
		ld a, (ANS_newframeid)
		ld (HL), a; frame id actualizado en la tabla de sprites
		; ahora vamos a actualizar la direccion de la imagen en la tabla
		inc hl; ahora hl tiene la dir de la imagen
		ld BC, (ANS_newfradd)
		ld (HL),C
		inc hl
		ld (HL), b; new imagen actualizada en la tabla de sprites
		ret 
	
		
		
;============================================================================================================
; _ANIMA_ALL()   ANI
;=============================================================================================================
; variables locales
;-------------------------------------
ANI_spid	db 0; id sprite en curso
; function body
;-------------------------------------
_ANIMA_ALL
		;ld a, 1
		;ld (ANS_flag),a; flag de llamada desde anima_all

		ld a, NUM_SPRITES-1 ;empezamos por el ultimo sprite
		ld (ANI_spid), a

		ld HL, 27000;new
		push hl;new
		jr ani_call; new
ANI_bucle	
		pop HL
		ld bc, sprite_size
		add HL, bc
		push HL
		
ANI_call	call ANS_uno
		

		ld a, (ANI_spid)
		dec a
		ld (ANI_spid), a
		JP M, ANI_fin; si es negativo es que ya hemos animado el sprite 0
		JP ANI_bucle
		
ANI_fin		;ld a,0
	 	;ld (ANI_spid), a
		
		pop hl
		ret
;============================================================================================================
; _PRINT_LAYOUT(y,x, @string)   LAY
;=============================================================================================================
; esta rutina imprime una fila de sprites para construir el layout o "laberinto" de cada pantalla
; las coordenadas y,x se pasan en formato caracteres, es decir 
; 	y toma valores [0,24] 
;	x toma valores [0,19]
; los sprites a imprimir deben ser de 8x8 pixeles. son "ladrillos" ("bricks" en ingles)
; si deseas usar ladrillos mas grandes deben ser composiciones de bricks
; si usas otros tamanos de sprite, esta funcion no funcionara bien
; Esta funcion actualiza los datos de layout de modo que sera posible detectar colisiones
; el @string es una variable de tipo cadena. no puedes pasar directamente la cadena

; variables locales
;-------------------------------------
;LAY_brick_id	db 0; id sprite del ladrillo 
LAY_coordychar 	db 0; coordenada y [0..24]
LAY_coordy	db 0; coordenada y de la row [0..199]
LAY_coordxchar 	db 0; coordenada x [0..24]
LAY_coordx	db 0; coordenada x de la row [0.79]
;LAY_str		dw 0; direccion bloque descriptor de cadena que llega desde BASIC
LAY_chars	dw 0; direccion donde estan los caracteres de la cadena
LAY_len		db 0; longitud del string
LAY_char	db 0; caracter a procesar

LAY_buffer	ds 6; buffer de parametros para el call print sprite
; function body
;-------------------------------------
_PRINT_LAYOUT

		
		; coord y [0..199]
		;---------
		ld a, (IX+4)
		ld (LAY_coordychar),a
		; la coord y es la row x 8.Bbasta con desplazar 3 bits para multiplicar por 8
		add a,a; x2
		add a,a; x2 
		add a,a; x2 
		ld (LAY_coordy), a

		; coord x. la quiero en bytes [0..79]
		;---------
		ld a, (IX+2)
		ld (LAY_coordxchar),a
		;como es en caracteres multiplico x 4 
		add a,a; x2
		add a,a; x2 
		ld (LAY_coordx), a

		; ahora debo extraer el string y actualizar el layout
		; en (IX+0) y (IX+1) esta la direccion del bloque de descripcion de cadena
		ld l, (IX+0)
		ld h, (IX+1)
		ld a, (HL)
		ld (LAY_len), A; longitud del string
		inc HL
		ld c,(HL)
		inc hl
		ld b, (HL)
		ld (LAY_chars), bc; direccion de memoria donde comienza
		; ahora entro en bucle hasta que se acabe el string
		ld HL, (LAY_chars)
LAY_buc		ld a, (HL); cargamos en A el codigo ASCII
		;actualizacion del layout map
		;----------------------------
		call LAY_update_map
		;-----
		cp 32; check si es SPACE
		Jr Z, LAY_next
		;-------begin rutina impresion brick----------		
		push hl	
		;call &bb5d
		;pop hl
		push ix; ix original de la llamada
		ld ix,LAY_buffer; espacio para almacenar parametros. 
				; uso el mismo buffer que print_sprites		

		; primero debo traducir el char a un sprite_id
		; luego debo invocar a PRINT_SPRITE con las coordenadas que queremos
		; traduccion de char a sprite id
		; he escogido una lista de 32 caracteres facilmente tecleables
		; que no colisionan con asm, por ejemplo los dos puntos colisionan
		sub a, 59;  ahora en A esta el sprite id
		; ";" sprite 0  ASC 59
		; "<" sprite 1  ASC 60
		; "="
		; ">"
		; "?"
		; "@"
		; "A" sprite 6 ASC 65
		; ...
		; "Z" sprite 31 asc 90
		; " " NO SPRITE asc 128

		;----- id_sprite ---------
		ld (ix+5),0
		ld (ix+4),a
		;-----  coordY ------
		ld a, (LAY_coordy)
		ld (ix+3),0
		ld (ix+2),a
		;----- coordX -------
		ld a, (LAY_coordx)
		ld (ix+1),0
		ld (ix+0),a
		;---- imprimimos -----
		ld a,3; 3 parametros
		call _PRINT_SPRITE


		pop ix; lo dejamos como estaba
		pop hl
		;-------end rutina impresion brick----------
		
LAY_next	ld a, (LAY_len)
		dec a
		ret z
		;jp z, LAY_FIN
		ld (LAY_len), A; longitud del string actualizada 
		ld a, (LAY_coordx)
		add a, 4; 8 pix son 4 bytes
		ld (LAY_coordx),a ; coordenada x actualizada
		ld a, (LAY_coordxchar)
		inc a
		ld (LAY_coordxchar),a; coordenada para el mapa de caracteres actualizada
		inc hl; siguiente direccion tiene el siguiente char
		jr LAY_buc


LAY_update_map	
		
		; vamos a actualizar el layout map ubicado en la direccion LAYOUT
		; registro A contiene el ASCII
		push HL
		push BC
		push DE
		ld (LAY_char),a
		ld HL, LAYOUT; direccion de memoria del mapa de caracteres
		ld de, 20; 20 caracteres por linea
		ld a, (LAY_coordychar);[0..24]
		and a; es cero?
		Jr Z, LAY_nosuma
		ld b,a
LAY_suma	add HL, de; suma 20
		DJNZ LAY_suma
LAY_nosuma		
		ld a, (LAY_coordxchar); [0..19]
		ld c,a
		ld b,0
		add HL, bc
		; en  HL ya tengo la direccion a actualizar
		ld a, (LAY_char)
		ld (HL), a
		pop de
		pop BC
		pop HL
		ret

;============================================================================================================
;_SETUP_SPRITE(#, param_number, valor) SET
;=============================================================================================================
; esta rutina carga datos de un sprite en la SPRITES_TABLE
; permite por ejemplo asignar una nueva secuencia de animacion cuando el sprite cambia de 
; direccion, o simplemente cambiar su registro de flags de status
; con esta funcion podemos cambiar cualquier parametro de un sprite, menos X, Y (que se hace con LOCATE_SPRITE)
; aunque solo podremos cambiar un parametro a la vez. 
; el parametro que vamos a cambiar se especifica con param_number
; el param_number es en realidad la posicion relativa del parametro en la SPRITES_TABLE
;
;	param_number=0 --> cambia el status (ocupa 1 byte)
;	param_number=5 --> cambia Vy (ocupa 1byte)
;	param_number=6 --> cambia Vx (ocupa 1byte)
;	param_number=7 --> cambia secuencia (ocupa 1byte)
;	param_number=8 --> cambia frame_id (ocupa 1byte)
;	param_number=9 --> cambia dir imagen (ocupa 2bytes)

; variables locales
;-------------------------------------

; function body
;-------------------------------------
_SETUP_SPRITE;
		; mejora en v21. si hay 4 parametros supongo que es SETUPSP,<id>,5,Vy,Vx
		cp 4
		JR NZ, SET4
		ld c,(ix+6): id
		call _get_dir_sp
		ld c,5 ; es el parametro 5
		ld b,0
		add HL,bc		
		ld a, (IX+2); vy
		ld (HL), a
		inc HL
		ld a, (IX+0); vx
		ld (HL), a
		ret

SET4		ld c,(IX+4);menos signific. aqui tenemos el sprite id
		; ahora hay que localizar la direccion donde se encuentran las
		; variables de estado del sprite
		;------------------calculo de la direccion del sprite -----------
		call _get_dir_sp; sprite id en c, retorna hl
		; ahora voy a ver que parametro se quiere cambiar
		;------------------------------------------------
		ld c, (IX+2); C = param number
		ld b,0
		add HL,bc
		; tenemos en HL la poscion de memoria a modificar
		; vamos a meter el dato
		ld a, (IX+0)
		ld (HL), a
		; si se trata de 1 byte hemos terminado pero a lo mejor es el parametro 9
		ld a, (IX+2)
		cp 9
		;ret NZ
		JR NZ,SET_7
		inc HL; estamos aqui porque es el parametro 9
		ld a, (IX+1)
		ld (HL), a
		ret
		; si se trata del parametro sequence, llamo adicionalmente a anima para que 
		; reemplace el campo de direccion de memoria de imagen, asignando un 7 al frame id
SET_7		cp 7 
		ret NZ
		; voy a poner un 7 en frame id
		inc hl
		ld a,7
		ld (HL), a; frame 7
		; y ahora animamos
		ld a, (IX+4); sprite id lo cargo en A
		call ANS_a; invoco anima con el sprite id en regisro a, asi se pone en primer frame
		ret
;============================================================================================================
;_SETUP_SEQUENCE(#, adr0,adr1,...,adr7) SEQ
;=============================================================================================================
; esta funcion da de alta una secuencia de animacion en la tabla de secuencias de animacion
; variables locales
;-------------------------------------
;SEQ_dir	dw 0; direccion de los parametros (IX+0)
;SEQ_dato db 0
; function body
;-------------------------------------
_SETUP_SEQUENCE		


		; ubico la secuencia
		;ld e,(IX+14)
		ld e,(IX+16); son 8 frames
		;ld H, 14; cada secuencia son 14 bytes
		dec e
		ld H, 16; cada secuencia son 16 bytes
		call _MUL8bit: ; HL=H*E
		ld bc, SEQUENCES
		add HL,bc
		; ahora HL es la direccion de comienzo de la secuencia
		ex Hl,de
		; ahora la secuencia empieza en DE
		
		;ld (SEQ_dir), IX
		;ld hl, (SEQ_dir)
		push IX
		pop HL
		
		;ld bc, 13
		ld bc, 15; de 0 a 15 son datos de frames
		add HL, bc		
		; los parametros de direcciones empiezan en HL

		;ld b,7
		ld b,8 ; 8 fotogramas 
		
SEQ_bucle	; bucle de transferencia
		dec hl; primero el byte menos significativo
		ld a,(HL)
		ld (de),a
		inc hl; parametros. ahora bye mas signific
		inc de; secuencia
		ld a,(HL)
		ld (de),a
		dec hl; parametros
		dec hl
		inc de; secuencia
		dec b
		ret z
		jr SEQ_bucle
		
		
		
;============================================================================================================
; _AUTO_SPRITE(#)   MOV
;=============================================================================================================
; mueve un sprite (cambia sus coordenadas) de acuerdo a su velocidad Vx, Vy
; siempre que tenga el flag de movimiento automatico activado
; no se tienen en cuenta las colisiones con el layout. Eso lo debe chequear el programador
; esta funcion permite mover sprites con trayectorias definidas como por ejemplo 
; un guardia que se mueve de derecha a izquierda o un meteorito.
; donde es muy util es si tenemos una formacion de naves enemigas que se mueven a la vez
; si por ejemplo tienes 24 naves, con MOV_ALL() las moveras todas, evitandote 24 llamadas desde basic
; para movimientos complejos donde hay que chequear el layout es mejor mover el sprite
; chequeando las colisiones con el layout y usando locate_sprite()

; variables locales
;-------------------------------------
MOV_id: 	db 0; sprite number
MOV_address:	dw 0; direccion del sprite en la tabla SPRITES_TABLE

; function body
;-------------------------------------
_AUTO_SPRITE
		ld a, (IX+0); sprite id
		ld (MOV_id), a
		ld c, a
		; calculo de la direccion del sprite
		call _get_dir_sp; A=num sprite, retorna HL con la direccion
		JR MOV_uno; solo voy a mover uno

MOV_i		ld a, (HL); status en A
		AND %1000; cuarto bit es el de movimiento automatico
		RET Z ; si el flag es inactivo no hacemos nada
MOV_uno		ld (MOV_address),hl; guardo la direccion de comienzo del sprite

		;update y
		ld bc, 5
		add hl,bc
		ld c , (HL); en c esta Vy
		ld b,0; ojo puede no ser cero
		bit 7,c
		jr Z, MOV_positivoY; Vy es positivo
		dec b
MOV_positivoY   ld hl, (MOV_address)
		inc hl; me coloco en la posicion Y
		push HL; guardo la direccion de coord Y
		ld e, (Hl)
		inc hl
		ld d, (HL)
		; ahora en de esta la Y
		ex de,hl
		add HL,BC; sumo la velocidad
		; ahora en HL esta la nueva coordenada
		ex de,hl
		pop HL
		; tengo en hl la direccion y en de el valor de coord y
		ld (HL), e
		inc hl
		ld (HL), d

		;update x
		ld hl, (MOV_address)
		ld bc, 6
		add hl,bc
		ld c , (HL); en c esta Vx
		ld b,0
		bit 7,c
		jp Z, MOV_positivoX
		dec b
MOV_positivoX	ld hl, (MOV_address)
		inc hl; me coloco en la posicion X
		inc hl
		inc hl
		push HL; guardo la direccion de coord X
		ld e, (Hl)
		inc hl
		ld d, (HL)
		; ahora en de esta la X
		ex de,hl
		add HL,BC; sumo la velocidad
		; ahora en HL esta la nueva coordenada
		ex de,hl
		pop HL
		; tengo en hl la direccion y en de el valor
		ld (HL), e
		inc hl
		ld (HL), d
		
		ret
		
;============================================================================================================
; _AUTO_ALL()   MOA
;=============================================================================================================
; mueve todos los sprites con flag de movimiento automatico activo en su estado
; no se tienen en cuenta las colisiones con el layout. Eso lo debe chequear el programador
; esta funcion permite mover sprites con trayectorias definidas como por ejemplo 
; un guardia que se mueve de derecha a izquierda o un meteorito.
; donde es muy util es si tenemos una formacion de naves enemigas que se mueven a la vez
; si por ejemplo tienes 24 naves, con MOV_ALL() las moveras todas, evitandote 24 llamadas desde basic
; para movimientos complejos donde hay que chequear el layout es mejor mover el sprite
; chequeando las colisiones con el layout y usando locate_sprite()

; variables locales
;-------------------------------------
MOA_spid: 	db 0; sprite number


; function body
;-------------------------------------
_AUTO_ALL
		ld a, NUM_SPRITES-1 ;empezamos por el ultimo sprite
		ld (MOA_spid), a
		
		ld hl,27496
		push hl 
MOA_bucle	

		;call MOV_a; invoca a animacion de sprite i
		call MOV_i
		ld a, (MOA_spid)
		dec a
		ld (MOA_spid), a
		JP M, MOA_fin; si es negativo es que ya hemos animado el sprite 0
		pop hl
		ld bc,sprite_size
		and a; acarreo a cero
		sbc hl,bc
		push hl
		JR MOA_bucle
		
MOA_fin		;ld a,0
	 	;ld (MOA_spid), a
		pop hl; dejo la pila como estaba
		ret



;============================================================================================================
; _COLISION_LAYOUT(#,@colision)   COL
;=============================================================================================================
; chequea colision de un sprite con el layout
; retorna un valor de colision 
; 0 = no hay colision
; 1 = hay colision

; variables locales
;-------------------------------------
COL_SPDATA:; datos del sprite. en total son 4words = 8bytes
COL_yini	dw 0; coordenada y ini
COL_xini	dw 0; coordenada x ini
COL_yfin	dw 0; coordenada y fin
COL_xfin	dw 0; coordenada x fin

COL_alto	db 0; alto 

COL_char_yini	db 0; coord yini ajustada [0..24]
COL_char_yfin	db 0; coord yfin ajustada [0..24]

COL_ancho	db 0; ancho 

COL_char_xini	db 0; coord xini ajustada [0..19]
COL_char_xfin	db 0; coord xfin ajustada [0..19]


; variables para el bucle anidado de scaneado del layout
COL_char_y	db 0
COL_char_x	db 0
; function body
;-------------------------------------
_COLISION_LAYOUT
		ld a, (IX+2); sprite id es el segundo parametro que llega en el call
COL_try		ld c, a; necesario para llamar a get_dir_sp
		
		push ix		
		ld ix, COL_SPDATA; aqui estan yini,xini,yfin,xfin
		call _get_dir_sp; c=num sprite, retorna HL con la direccion
		call _fill_sp_data; rellena los 4 datos del sp1 sobre [ix+0]..[IX+7]
		pop ix
		
		;ahora voy a pasar coordenadas a chars, teniendo en cuenta los limites
		;----------------------------------------------------------------
		ld hl, (COL_xini); 2 bytes con signo
		call COL_adjustX; a = ajustex(HL) ajusta a los limites de pantalla
		srl a
		srl a ; a=a/4
		ld (COL_char_xini),a; 1 byte unsigned

		ld hl, (COL_xfin)
		call COL_adjustX;a = ajustex(HL) ajusta a los limites de pantalla
		srl a
		srl a ; a=a/4
		ld (COL_char_xfin),a ; 1 byte unsigned

		ld hl, (COL_yini); 2 bytes con signo
		call COL_adjustY; a = ajustey(HL) ajusta a los limites de pantalla
		srl a
		srl a 
		srl a ; a=a/8
		ld (COL_char_yini),a; 1 byte unsigned

		ld hl, (COL_yfin); 2 bytes con signo
		call COL_adjustY; a = ajustey(HL) ajusta a los limites de pantalla
		srl a
		srl a 
		srl a ; a=a/8
		ld (COL_char_yfin),a; 1 byte unsigned
		;---------------------------------------
		; ahora tenemos xini, xfin, yini, yfin en coordenadas de layout[0..19] X [0..24]
		; queda comprobar
		
		
		; bucle for Y
		ld a, (COL_char_yini)
		ld (COL_char_y),a
COL_scany	; bucle for y iteracion
		; -----scan x-----
		; bucle for x
		ld a, (COL_char_xini)
		ld (COL_char_x),a
		
COL_scanx	; bucle for x iteraciones
		; aqui debo hacer el check contra layout
		;---------------------------------------------
		ld a, (COL_char_y)
		ld e,a
		ld a, (COL_char_x)
		ld c,a
		call COL_checkChar   ; input  e=y, c=x, output en A
		and a
		JR NZ,COL_CHOCA
		; aqui nunca se llega

		; end bucle for x
		; ----------------
		ld HL, COL_char_x
		ld b, (HL)
		inc (HL); son caracteres, basta con incrementar 1
		ld a, (COL_char_xfin)				
		cp b
		jr Z, COL_finscanx
		jr NC, COL_scanx
		; end bucle for Y
		;-----------------
COL_finscanx	ld HL, COL_char_y
		; compruebo si es yfin
		ld b, (HL)
		inc (HL)
		ld a, (COL_char_yfin)				
		cp b; compara la y en curso, no la actualizada
		jr Z, COL_finscan 
		jr NC,COL_scany; aun no ha llegado
		; aqui nunca se llega


		
COL_finscan		

COL_NOCHOCA	;no ha chocado
		;retornamos un cero
		ld l, (IX+0)
		ld h,(IX+1)
		ld (hl),0
		ret



COL_CHOCA	;ha chocado
		;retornamos un 1
		ld l, (IX+0)
		ld h,(IX+1)
		ld (hl),1
		ret		




		;====================================================
COL_adjustX	;micro rutina que ajusta la coordenada x a la pantalla 
		; input HL
		; output A 
		bit 7,h; check bit de signo
		jr Z , COL_xp; x es positivo
		ld a,0; si es menor que cero -->lo limito a cero
		ret
		
COL_xp		ld a,l; 
		cp 79; si es mayor que el ancho de pantalla lo limito
		Jr C, COL_xsigue
		ld a,79
COL_xsigue	ret ; 
		;====================================================

		;====================================================
COL_adjustY	;micro rutina que ajusta la coordenada Y a la pantalla 
		; input HL coordenada y , pudiendo ser negativa
		; output A  coordenada y en el rango [0,199]
		bit 7,h; check bit de signo
		jr Z , COL_yp; y es positivo
		ld a,0; si es menor que cero -->lo limito a cero
		ret
		
COL_yp		ld a,l; 
		cp 199; si es mayor que el ancho de pantalla lo limito
		Jr C, COL_ysigue
		ld a,199
COL_ysigue	ret ; 
		;====================================================

		
		;====================================================
COL_checkChar   ; input  e=y, c=x
		; esta micro rutinta dentro de COL_LAYOUT permite chequear un caracter 
		; contra el layout
		ld h,20; una fila son 20 caracteres
		call _MUL8bit; HL=H*E . no toca al registro c
		ld de, LAYOUT
		add HL, de; hl es ahora la fila
		ld b,0
		add hl,bc; hl tiene la direccion del brick
		ld a,(hl); ahora a tiene el caracter ubicado en esa posicion del layout
		;ld (char), a
		sub 32; si es 32 (32 es " ") entonces A sera cero
		ret
		;====================================================		
		
;============================================================================================================
; _COLISION_2_SPRITES(#,#)   CO2
;=============================================================================================================
; esta funcion chequea colision entre 2 sprites
; es una funcion "interna", que se invoca desde _COLISION_SPRITES(#)
; solo comprueba la colision si los sprites tienen flag de colision en status
; inputs CO2_sp1, CO2_sp2 deben estar rellenas
; output A =1 o 0 segun si hay o no hay colision

; variables locales INPUT
;-------------------------------------
CO2_sp1: 	db 0; sprite number
CO2_sp2: 	db 0; sprite number

; variables locales
;-------------------------------------
CO2_sp1data
CO2y1ini	dw 0; yini  variables de sp1
CO2x1ini	dw 0; xini
CO2y1fin	dw 0; yfin
CO2x1fin	dw 0; xfin

CO2_sp2data
CO2y2ini	dw 0; yini variables de sp2
CO2x2ini	dw 0; xini
CO2y2fin	dw 0; yfin
CO2x2fin	dw 0; xfin
; function body
;-------------------------------------
_COLISION_2_SPRITES

		ld a, (CO2_sp1)
		ld c, a
		call _get_dir_sp; A=num sprite, retorna HL con la direccion
		;ld a, (HL); leo status
		;and %010; chequeo flag de colision
		;esta comprobacion sobra porque se supone que el sprite sp1 me interesa
		;JR Z,CO2_NOCHOCA; el sprite no tiene flag. Esta comprobacion sobra
		push ix		
		ld ix, CO2_sp1data
		call _fill_sp_data; rellena los 4 datos del sp sobre ix
		pop ix

CO2_i		ld a, (CO2_sp2)
		ld c, a
		call _get_dir_sp; A=num sprite, retorna HL con la direccion
CO2_j		ld a, (HL); leo status
		and %010; chequeo flag de colision
		JR Z,CO2_NOCHOCA; el sprite no esta activo
		push ix		
		ld ix, CO2_sp2data
		call _fill_sp_data; rellena los 4 datos del sp sobre ix
		pop ix

		; ahora voy a comprobar colision en una coordenada y si no hay colision fin
		; chequeo solape Y
		; -------------------
CO2_MARGENY	ld bc,2; ayudita (2 lineas de margen). 
		and a ; acarreo a cero
		; caso 1 y2ini > y1fin -> no hay solape
		ld hl,(CO2y2ini)
		add HL,bc; ayudita para que no te coman facil **********
		ld de, (CO2y1fin)
		sbc hl, de
		JR NC, CO2_NOCHOCA
		; caso 2 y1ini > y2fin -> no hay solape
		and a ; reset acarreo
		ld hl,(CO2y1ini)
		add HL,bc; ayudita para que no te coman facil ***********
		ld de, (CO2y2fin)
		sbc hl, de
		JR NC, CO2_NOCHOCA
		; si no se cumple uno de los casos anteriores, es que hay solape

		; chequeo solape X
		; -------------------
		; caso 1 x2ini > x1fin -> no hay solape
CO2_MARGENX	ld bc,1; ayudita (1 byte de margen)
		and a ; reset acarreo
		ld hl,(CO2x2ini)
		add HL,bc; ayudita para que no te coman facil ***********
		ld de, (CO2x1fin)
		sbc hl, de
		JR NC, CO2_NOCHOCA
		; caso 2 x1ini > x2fin -> no hay solape
		and a ; reset acarreo
		ld hl,(CO2x1ini)
		add HL,bc; ayudita para que no te coman facil ***********
		ld de, (CO2x2fin)
		sbc hl, de
		JR NC, CO2_NOCHOCA
		; si no se cumple uno de los casos anteriores, es que hay solape
		; llegamos aqui porque hay colision
		ld a,1; a=1 significa colision
		ret

CO2_NOCHOCA	ld a,0; a=0 significa no colision
		ret

;============================================================================================================
; _fill_sp_data()
;============================================================================================================
; esta funcion rellena yini, yfin,xini, xfin
; se usa internamente. es invocada por 
;	_COLISION_LAYOUT() 
;	_COLISION_2_SPRITES()	
; requiere que HL contenga la direccion del sprite en la SPRITES_TABLE
_fill_sp_data
		
		
		
		;rellenamos la coord y
		;---------------------
		inc hl
		ld a, (HL)
		ld (ix+0), a; byte bajo    COL_yini
		inc hl
		ld a, (HL); byte alto
		ld (ix+1), a; ya tenemos la coord y.  COL_yini+1

		;rellenamos la coord x
		;---------------------
		inc hl
		ld a, (HL)
		ld (ix+2), a
		inc hl
		ld a, (HL)
		ld (ix+3), a; ya tenemos la coord x

		; necesito el alto y ancho de la imagen del sprite para calcular yfin y xfin
		;---------------------------------------------------------------
		ld bc, 5
		add hl, bc		
		; ahora en HL esta la direccion donde esta la direccion de la imagen del sprite
		
		ld e,(hl)
		inc hl
		ld d, (Hl)
		ex de,hl
		; ahora finalmente en HL ya tenemos la direccion de la imagen del sprite

		; vamos a rellenar ancho y alto de la imagen
		; --------------------------------------------------------
       		ld a,(hl); ancho en bytes
		ld (COL_ancho), a;
		inc hl; hl tiene la direccion donde se guarda el alto de la imagen
		ld a, (HL); alto
        	ld (COL_alto), a
		
		

		; por ultimo relleno xfin e yfin
		;-------------------------------
		;ld hl,(COL_yini)
		ld l, (ix+0)
		ld h, (ix+1); ahora hl tiene yini

		ld b,0
		;ld a, (COL_alto)redundante
		dec a; es sumar alto-1
		ld c,a
		add hl, bc
		ld (ix+4),l
		ld (ix+5),h
		;ld (COL_yfin), hl

		;ld hl,(COL_xini)
		ld l, (ix+2)
		ld h, (ix+3); ahora hl tiene xini
		;ld b,0 redundante
		ld a, (COL_ancho)
		dec a; es sumar ancho -1
		ld c,a
		add hl, bc
		;ld (COL_xfin), hl
		ld (ix+6),l
		ld (ix+7),h
		;ld (COL_yfin), hl
		ret
		
;============================================================================================================
; _COLISION_SPRITES(#,@spriteid)   COS
;=============================================================================================================
; chequea la colision de un sprite con todos los que tengan el flag de colision activo
; tambien chequea colision con layout
; retona en id el sprite con el que colisiona.si no hay colision retorna 
; como input tenemos # que es el id sprite que queremos chequear
; como output tenemos @spriteid que es el primer sprite activo con el que colisiona
; si no hay colision retorna 32, que es un sprite que no existe pues son 0..31
; el sprite que queremos comprobar (el personaje) no debe tener el flag de colision de lo
; contrario colisionara consigo mismo

; variables locales
;-------------------------------------
COS_return_var	dw 0; direccion de la variable donde se retorna la colision

; function body
;-------------------------------------
_COLISION_SPRITES
		; si llega un solo parametro es que no nos pasan la direccion de 
		; la variable de colision
		cp a,1
		JR Z, COS1param

		cp a,2
		JR Z,COS2param
		
		JR COS3param

COS1param	; puede ser COLSP,<spriteid>	
		ld a, (ix+0); sprite id
		JR COS_OK2		
  
COS2param	; puede ser 
		;     COLSP,33,@var%
		;     COLSP,<spriteid>,@var%
		ld a, (ix+2); sprite id	
		JR COS_OK

COS3param	; si llegan 3 parametros puede ser 
		;    COLSP,32,ini,fin 
		;    COLSP,34,dy,dx		
		ld a, (IX+4); leo el sprite id
		cp 34
		JR Z,COSajusteYX

		; si estoy aqui es que es un 32
		; la instruccion cp ocupa 1 byte
		ld a, (IX+2); valor del sprite inicial a verificar solape
		ld (COS_LIMIT_INI+1),a
		ld a, (IX+0); valor del sprite final a verificar solape
		ld (COS_LIMIT_FIN+1),a
		; debo poner tb la direccion del sprite
		ld c,a
		call _get_dir_sp
		ld (COS_DIR_FIN+1),HL
		ret
		

COSajusteYX     
		ld a, (IX+0)
		ld (CO2_MARGENX+1),a; margen X
		ld a, (IX+2)
		ld (CO2_MARGENY+1),a; margen Y
		ret


COS_OK		ld l, (IX+0)
		ld h, (IX+1)
		ld (COS_return_var),hl ; variable de retorno
		cp 33
		RET Z; si el spriteid=33 es que solo se queria establecer la variable

COS_OK2		ld (CO2_sp1), a
		;----voy a rellenar la estructura de datos del sp1
		ld c, a
		call _get_dir_sp; solo se invoca con el sp1. para los distintos sp2 se incrementa 16
		push ix		
		ld ix, CO2_sp1data
		call _fill_sp_data; rellena los 4 datos del sp sobre ix
		pop ix

		; ahora vamos a chequear la colision del sprite 31 
COS_LIMIT_FIN	ld a, NUM_SPRITES-1 ;empezamos por el ultimo sprite
		ld (CO2_sp2), a
COS_DIR_FIN	ld HL, 27496; direccion sprite numero 31 new
		push HL; guardo dir sp2 new
		call CO2_j; esto chequea la colision de sp1 y sp2
		jr COS_1; primera iteracion
COS_bucle	
		pop HL; direccion sp2 anterior
		LD BC,sprite_size
		AND A; ACARREO A CERO
		SBC HL,BC;ahora HL tiene la siguiente dir de sp2
		push HL;
		call CO2_j ;chequea la colision de sp1 con sp2

COS_1		and a; en A esta el resultado de la colision
		JR NZ, COS_CHOCA

COS_sig		ld a, (CO2_sp2)
		dec a
		ld (CO2_sp2), a
COS_LIMIT_INI	cp 0 ; esta comparacion se altera con |COLSP,32,valor
		JP M, COS_NOCHOCA; si es negativo es que ya hemos chequeado el sprite 0
		JR COS_bucle; esto evita rellenar datos de sp1
		
COS_NOCHOCA	
		ld HL , (COS_return_var)	

		;ld l, (IX+0)
		;ld h,(IX+1)
		ld (hl),32; no hay colision. 
		pop HL; para dejar la pila como estaba
		ret		

COS_CHOCA
		ld a, (CO2_sp2)
		ld HL , (COS_return_var)	
		;ld l, (IX+0)
		;ld h,(IX+1)
		ld (hl),a
		pop HL; para dejar la pila como estaba
		ret		

;=============================================================================================================
; _SCROLL_STARS(buffer, numberOfStars, starcolor,stepy, stepx)   SCS
;=============================================================================================================
; mueve un conjunto de estrellas en cualquier direccion. acepta numeros negativos en stepy, stepx
; pero ojo, solo de +127 a -128
; starcolor es el color del byte a pintar sobre el fondo (que debe ser byte=0)
; se puede mover hasta 20 estrellas, pero puedes poner menos en numberOfstars
; las estrellas hay que crearlas mediante pokes en la ventana de juego y al hacer scroll no se saldran 
; de dicha ventana (las que salgan por abajo entraran por arriba y viceversa y lo mismo para los lados)
; ejemplo de creacion de estrellas en la zona [0..200][20..80], siendo stars la direccion del
; buffer de las estrellas situado en XXXX
; FOR i=0 TO 19
; POKE STARS+i*2,RND*200    
; POKE STARS+i*2+1, RND * 60+20  
; NEXT

; variables locales
;-------------------------------------
SCS_pen		db 64; el byte (2ndo pix mode 0) que vamos a pintar. esto es una constante
SCS_check	db 0

SCS_incy	db 2; lo que vamos a mover en eje y
SCS_incx	db 1; lo que vamos a mover en eje x

SCS_counter	db 20
SCS_number	db 20

star_color	db 64
bkgd_color	db 0

SCS_starbuffer 	dw STARS1; tambien puede tomar el valor STARS2

SCS_initstar	db 0

; function body
;-------------------------------------
_SCROLL_STARS
SCS:
		; optimizacion. si no hay parametros asumo los ultimos
		and a
		jr nz, SCS_sigue
		ld a, (SCS_initstar)
		jr SCS_START
		
SCS_sigue
		ld a, (ix+6)	; numero maximo de estrellas
		ld (SCS_number),a
		ld (SCS_counter),a

		LD A, (ix+0)
		ld (SCS_incx), a
		LD A, (ix+2)
		ld (SCS_incy), a
		LD A, (ix+4)
		;ld (star_color), a
		; voy a decodificar la tinta
		; un byte son 2 pixel ab
		; los bits del byte se reparten asi abababab
		; me interesa el pix b
		ld b,0
		bit 0,a
		jr Z, bit2
		set 6,b; 
bit2		bit 1,a
		jr Z, bit4
		set 2,b; 
bit4		bit 2,a
		jr Z, bit6
		set 4,b; 
bit6		bit 3,a
		jr Z, finbit
		set 0,b; 
finbit		ld a,b
		ld (star_color), a


		; mueve un scroll de estrellas en la ventana definida
		; primero hay que borrar la estrellas en su posicion actual (si contienen el byte de tinta)
		; luego movemos la estrella
		; luego la pintamos si no hay nada en ese lugar
		; repetimos el proceso para todas las estrellas

		; esto me va a servir para todas las impresiones de estrellas
		; el byte mas significativo de Y y de X los pongo a cero
		ld a,0
		ld (SPR_coordy+1), a
		ld a,0
		ld (SPR_coordx+1), a

		
		ld a, (IX+8)
		ld (SCS_initstar),a
		; mejora 22/02/2017
		; vamos a suponer que este primer parametro contiene la
		; estrella de comienzo y asi podremos hacer tantos
		; planos de estrellas como queramos
		; o mover 40 estrellas con un solo comando
SCS_START	sla a
		ld c,a
		ld b,0
		ld HL, STARS0
		add HL,bc; ahora HL esta posicionado
		JR SCS_bucle

		
		; borrado de la estrella
		;------------------------
SCS_bucle	ld a, (star_color)
		ld (SCS_pen),a; actualiza el pen por si se ha cambiado
		ld a, (SCS_pen)
		ld (SCS_check),a; solo borro si encuentro un 255
		ld a, (bkgd_color)
		ld (SCS_pen),a; poner un cero es borrar
		call SCS_paint; no altera HL

		; actualizacion de coord y
		;---------------------------
		push hl
		ld a, (SCS_incy); debe ser del rango -128..+127
		; voy a chequear si es positivo o negativo
		bit 7,a; 
		jp Z,	SCS_incypos ; incremento positivo o nulo. scroll hacia abajo

		; scroll hacia arriba 
		;--------------------
SCS_incyneg	ld c, a; ahora C tiene incy
		ld a, (HL); coord y, pues HL apunta a starbuffer
		ld b, a; y antes	
		add a, c; 
		cp b; y - yant no puede NO dar acarreo. si lo da, hay que saltar
		; si da acarreo es porque y ha cruzado el cero
		jp nc, SCS_Ycycle
		; ahora comparo la y actualizada con ymin
		; ambos los puedo considerar ahora numeros positivos
		ld c,a ; guardo y
		ld a,(SPR_MIN_Y)
		and a; reset acarreo
		cp c;	(a-c = ymin-y)
		jp nc,  SCS_Ycycle; ymin>y, lo cual no debe ocurrir
		; si es cero o positivo (sin acarreo) no hay que salir por abajo
		ld a,c; le vuelvo a dar su valor
		Jr SCS_finwritey; si y > ymin sale negativa la resta	y hay acarreo			

SCS_Ycycle	
		; el problema de ciclar es que tenemos aqui una aritmetica modular de modulo MAX-MIN y no de modulo 255
		; basta con sumar max y restar min 
		LD HL,SPR_MAX_Y
		add a,(HL)
		ld HL, SPR_MIN_Y
		sub (HL)		
		;ld a, (SPR_MAX_Y); sale por ariba , entra por abajo
		dec a; el max es justo el byte que ya no se pinta, debo restar 1
		jr SCS_finwritey

		; scroll hacia abajo 
		;--------------------
SCS_incypos	ld c, a; c tiene incy
		ld a, (HL); coord y, pues HL apunta a starbuffer
		
		add a, c; sumo incy.

		ld HL,  SPR_MAX_Y
		ld c, (hl)
		and a; acarreo a cero
		cp c; 
		jr C, SCS_finwritey; debe haber acarreo si maxy >y


		; vamos a ciclar
		LD HL,SPR_MAX_Y
		sub (HL)
		ld HL, SPR_MIN_Y
		add (HL)
		;ld a,(SPR_MIN_Y); si llego a MAXY tengo que pasar a miny



SCS_finwritey  	pop hl; direccion de coord y
		ld (HL),a; nueva coordenada de la estrella insertada

		; actualizacion de coord x
		;---------------------------
		inc hl ; direccion de la coord x de la estrella
		push hl
		;jp SCS_pintar;------------------------------------------no update x

		ld a, (SCS_incx); debe ser del rango -128..+127
		; voy a chequear si es positivo o negativo
		bit 7,a; 
		jp Z,	SCS_incxpos ; incremento positivo o nulo. scroll hacia derecha

		; scroll hacia izq 
		;--------------------
SCS_incxneg	ld c, a; ahora C tiene incy
		ld a, (HL); coord y, pues HL apunta a starbuffer
		ld b, a; y antes	
		add a, c; 
		cp b; y - yant no puede NO dar acarreo. si lo da, hay que saltar
		; si da acarreo es porque y ha cruzado el cero
		jp nc, SCS_Xcycle
		; ahora comparo la y actualizada con ymin
		; ambos los puedo considerar ahora numeros positivos
		ld c,a ; guardo y
		ld a,(SPR_MIN_X)
		and a; reset acarreo
		cp c;	(a-c = ymin-y)
		jp nc,  SCS_Xcycle; ymin>y, lo cual no debe ocurrir
		; si es cero o positivo (sin acarreo) no hay que salir por abajo
		ld a,c; le vuelvo a dar su valor
		Jr SCS_finwritex; si y > ymin sale negativa la resta	y hay acarreo			

SCS_Xcycle	
		LD HL,SPR_MAX_X
		add a,(HL)
		ld HL, SPR_MIN_X
		sub (HL)				


		;ld a, (SPR_MAX_X); sale por ariba , entra por abajo
		dec a; el max es justo el byte que ya no se pinta, debo restar 1
		jr SCS_finwritex

		; scroll hacia dere 
		;--------------------
SCS_incxpos	ld c, a; c tiene incy
		ld a, (HL); coord y, pues HL apunta a starbuffer
		
		add a, c; sumo incy.

		ld HL,  SPR_MAX_X
		ld c, (hl)
		and a; acarreo a cero
		cp c; 
		jr C, SCS_finwritex; debe haber acarreo si maxy >y
		
		
		; vamos a ciclar
		LD HL,SPR_MAX_X
		sub (HL)
		ld HL, SPR_MIN_X
		add (HL)
		;ld a,(SPR_MIN_X); si llego a MAXY tengo que pasar a miny



SCS_finwritex	pop hl; n
		ld (HL),a
		; --------------------------
		; pinto la estrella
		;-----------------------
		; llego aqui con HL en direccion de memoria de coord x
SCS_pintar	dec hl; me coloco en la coord y
		ld a, (bkgd_color)
		ld (SCS_check),a; solo pinto si encuentro un cero
		ld a, (star_color)
		ld (SCS_pen),a; pintamos con 255
		
		call SCS_paint; input HL=dir tiene dato =y,x
		inc hl
		inc hl; ahora hl tiene nueva direccion estrella

		; actualizo el contador de estrellas
		;----------------------------------
		ld a, (SCS_counter)
		dec a
		ld (SCS_counter),a
		JP NZ,SCS_bucle
		ld a,(SCS_number); 20 estrellas maximo
		ld (SCS_counter),a; lo dejamos como estaba


		
		ret

;===================================================================================
; microrutina que pinta o borra las estrellas
; input HL contiene la direccion donde se guardan las coord de la estrella y,x
; input SCS_check  continene el byte a comprobar. si coincide entonces pintaremos
; input SCS_pen  continene el byte a pintar. puede ser cero y entonces es borrar

SCS_paint
		push HL; para protegerlo.
		push ix; para protegerlo

		push HL
		pop ix; con esto cargo en ix el valor de HL
		
		; cargo coordenadas de estrella en variables y calculo dir pant
		ld a, (ix+0)
		ld (SPR_coordy), a
		ld a, (ix+1)
		ld (SPR_coordx), a

		call _compute_dirpant; retorna en HL la dir pant

		; antes de pintar miro si coincide con check
		ld c, (HL)
		ld a, (SCS_check)
		cp c	
		JP NZ , SCS_nopinta; ya esta pintado con otra cosa (un sprite, etc)
		ld a, (SCS_pen)
SCS_pinta	ld (HL),a; 
SCS_nopinta
		pop ix
		pop HL
		ret
	
;===================================================================================
; microrutina para obtener la direccion de pantalla de un pixel en coordenadas y,x
;_get_dirpant; ix contiene y, x. retorna HL con la direccion
;		ld a,0
;		ld (SPR_coordy+1), a
;		ld a, (ix+0)
;		ld (SPR_coordy), a
;		ld a,0
;		ld (SPR_coordx+1), a
;		ld a, (ix+1)
;		ld (SPR_coordx), a
;		call _compute_dirpant
;		ret		



;		ld c,(ix+0); coord y
;		ld b,0;(ix+1); coord y
;		;ld hl,SPR_cache_pant; cache de dir pantalla. son 400 direcciones
;		add hl,bc; en hl la direccion que quiero consultar
;		add hl,bc; sumar bc dos veces es como sumar bc x 2	
;
;		ld e,(hl); por ejemplo (dir) contiene 00
;		inc hl; por ejemplo (dir+1) contiene C0
;		ld d,(hl); en el ejemplo ahora "de" contiene &C000	

;		ex de,hl; ahora la dir de la scanline esta en hl
;		ld c, (ix+1)
;		ld b,0;(ix+3)
		;tenemos coordenada x en "de"
;        	add hl,bc; 
		; ahora hl tiene la direccion de memoria de pantalla!!
;		ret


;============================================================================================================
; _MOVER_ALL(y,x)   MRA
;=============================================================================================================
; mueve todos los sprites con flag de movimiento relativo , sumandoles el offset en y, y que
; se pasa como parametro 
; no se tienen en cuenta las colisiones con el layout. Eso lo debe chequear el programador
; esta funcion permite mover por ejemplo todos los sprites (casas, arboles...) pudiendo 
; dejar el personaje en el centro de la pantalla y asi dar sensacion de avance en un universo
; los sprites tienen que tener el flag de movimiento relativo activado

; variables locales
;-------------------------------------
MRA_spid: 	db 0; sprite number


; function body
;-------------------------------------
_MOVER_ALL
		; cargo los desplazamientos y,x
		call get_offsets
		
		; recorremos los 32 sprites
		;---------------------------
		ld a, NUM_SPRITES-1 ;empezamos por el ultimo sprite
		ld (MRA_spid), a
		ld HL, _SPR_SPRITES_TABLE		
MRA_bucle	push HL
		call MOVER_i; invoca a movimiento relativo de sprite i
		pop hl
		ld a, (MRA_spid)
		dec a
		ld (MRA_spid), a
		JP M, MRA_fin; si es negativo es que ya hemos animado el sprite 0

		; actualizo el puntero a la direccion de sprite i
		;pop HL
		ld bc, sprite_size
		add HL, bc ; HL apunta al siguiente sprite
		JR MRA_bucle
		
MRA_fin		;ld a,0
	 	;ld (MRA_spid), a
		ret


	
_FIN_RUTINAS:
;============================================================================================================
; _MOVER(#,y,x)   MOR
;=============================================================================================================
; mueve de forma relativa un solo sprite, sumando y,x a sus coordenadas actuales

; variables locales
;-------------------------------------
MOR_y: 	dw 0;
MOR_x: 	dw 0;


; function body
;-------------------------------------
_MOVER
		call get_offsets; esto carga dy y dx en MOR_y y MOR_x
		; cargo el sprite number
		ld c, (ix+4)
		call _get_dir_sp; input c=sprite id, output HL tiene la direccion
		jr MOR_uno; si es un solo sprite no chequeo el flag de status

MOVER_i		ld a, (HL); lee el estado del sprite
		and %10000; comprueba flag de movimiento relativo
		ret Z; si no esta el flag activo, no hay nada que mover

		;coordenada y
		;-----------
MOR_uno		inc HL; me coloco en la coordenada y
		ld e,(HL); byte menos sygnificativo coordy
		inc hl
		ld d,(HL); byte mas significativo coordy
		; ahora en DE esta la coordenada y actual del sprite
		ex DE,HL; les doy la vuelta. ahora DE tiene la direccion
		ld bc, (MOR_y)
		add HL, bc
		ex DE, HL; lo dejo como estaba! ahora hl tiene la direccion y DE el dato a meter
		dec HL; lo coloco en el byte menos significativo
		ld (HL), e
		inc hl
		ld (HL), d

		;coordenada x
		;-----------
		inc HL; me coloco en la coordenada y
		ld e,(HL); byte menos sygnificativo coordy
		inc hl
		ld d,(HL); byte mas significativo coordy
		; ahora en DE esta la coordenada y
		ex DE,HL; les doy la vuelta. ahora DE tiene la direccion
		ld bc, (MOR_x)
		add HL, bc
		ex DE, HL; lo dejo como estaba! ahora hl tiene la direccion y DE el dato a meter
		dec HL; lo coloco en el byte menos significativo
		ld (HL), e
		inc hl
		ld (HL), d

		ret
;----------------------------------------------------------
; microrutina para usar en MOVER y en MOVER_ALL
get_offsets	
		; cargo los desplazamientos y,x
		ld c, (IX+0)
		ld b, (IX+1)
		ld HL, MOR_x
		ld (HL),c
		inc hl
		ld (HL),b
		ld HL, MOR_y
		ld c, (IX+2)
		ld b, (IX+3)
		ld (HL),c
		inc hl
		ld (HL),b	
		ret


;=============================================================================================================
; _PRINT_SPRITES(sync,anima)   PS2
;=============================================================================================================
; esta rutina pinta todos los sprites activos
; puede sincronizar si se lo indicamos con sync!=0
;
; variables locales
;-------------------------------------
PS2_spid	db 0
;PS2_counter	db 0; numero de sprite a imprimir
;PS2_pointer	dw 0;; puntero a los datos del sprite
PS2_buffer	ds 6; buffer de parametros para el call PRINT_SPRITE
		    ; ojo, si pongo de menos se machaca el codigo de la funcion!
PS2_flag_anim	db 0;
PS2_flag_sync	db 0;
;function body
;-------------------------------------
_PRINT_SPRITES

PS2:
		;push af
		;ld a,31
		;call COS_OK2
		;ld a,8
		;call COS_OK2
		;ld a,9
		;call COS_OK2
		;ld a,10
		;call COS_OK2
		;pop af

		; mejora. si los paramtros no llegan supongo lo que pongan los flag
		; que son lo ultimo que se invoco
		and a
		JR NZ, PS2_param
		ld a, (PS2_flag_anim)
		and a
		call NZ, _ANIMA_ALL
		ld a, (PS2_flag_sync)
		and a
		call NZ,_SYNC;
		JR  PS2_all

PS2_param	; primero compruebo animacion pues si primero sincronizo, pierdo el tiempo de barrido		
		ld a,(IX+2);menos signific. si es 0 no habra sync
		;cp a,0
		and A ; es como cp a,0 pero consume solo 1 ciclo.
		ld (PS2_flag_anim),a
		call NZ, _ANIMA_ALL; anima a todos los sprites
				

PS2_noparam	ld a,(IX+0);menos signific. si es 0 no habra sync
		;cp a,0
		and A ; es como cp a,0 pero consume solo 1 ciclo.
		ld (PS2_flag_sync),a
		call NZ,_SYNC; sincronismo con barrido
	
PS2_all:
		; recorremos los 32 sprites
		;---------------------------
		ld a, NUM_SPRITES-1 ;empezamos por el ultimo sprite
		ld (PS2_spid), a
		
		ld HL, _SPR_SPRITES_TABLE		
PS2_bucle	push HL

		; miro estado
		ld a, (HL); en A cargo el status
		;cp a,0
		and %00000001
		JP Z, PS2_next;

		; debo cargar x e y
		inc HL; coord y
		ld a,(hl) ; low byte
		ld (SPR_coordy),a
		inc hl
		ld a,(hl); high byte
		ld (SPR_coordy+1),a
		inc hl
		ld a,(hl) ; low byte
		ld (SPR_coordx),a
		inc hl
		ld a,(hl); high byte
		ld (SPR_coordx+1),a
		dec HL 
		dec hl
		dec hl
		dec hl

		call PSP_i; invoca a print sprite de sprite i
PS2_next	pop hl
		ld a, (PS2_spid)
		dec a
		ld (PS2_spid), a
		JP M, PS2_fin; si es negativo es que ya hemos animado el sprite 0

		; actualizo el puntero a la direccion de sprite i
		ld bc, sprite_size
		add HL, bc ; HL apunta al siguiente sprite
		JR PS2_bucle
		
PS2_fin		;ld a,0
	 	;ld (PS2_spid), a
		ret


;=============================================================================================================
; POKE dir, valor
;=============================================================================================================
; poke de 16 bit (acepta numeros negativos)
;
; variables locales
;-------------------------------------
_POKE
	ld c,(IX+0)
	ld b,(IX+1)
	ld l,(ix+2)
	ld h,(ix+3)
	ld (hl),c
	inc hl
	ld (hl),b
	ret

;-------------- 

;=============================================================================================================
; PEEK dir, @valor
;=============================================================================================================
; peek de 16 bit (acepta numeros negativos)
;
; variables locales
;-------------------------------------
_PEEK
	ld l,(ix+2)
	ld h,(ix+3)

	ld c,(hl)
	inc hl
	ld b,(hl)
	; he leido y lo tengo en bc

	ld l,(IX+0)
	ld h,(IX+1)

	ld (hl),c
	inc hl
	ld (hl),b
	ret
;=============================================================================================================
; _COLSPALL, @colisionador%,@colisionado%  COA
;=============================================================================================================
; esta rutina detecta la colision de los colisionadores (tu nave y tus disparos) con los colisionados (los enemigos)
;
; variables locales
;-------------------------------------
;returnvar_dir	dw 0
COA_spid	db 0
COA_colider	dw 0
;function body
;-------------------------------------
_COLSPALL

COA:
		cp 0
		JR Z, COA_START
		; nos llegan 2 parametros variable basic
		ld l, (IX+2)
		ld h, (IX+3)
		ld (COA_colider),hl

		ld l, (IX+2)
		ld h, (IX+3)
		ld (COA_colider),hl; colisionador

		ld l, (IX+0)
		ld h, (IX+1)
		ld (COS_return_var),hl ; variable de colisionado
		ret
		;ld hl,(COS_return_var)
		;ld (returnvar_dir),hl
		; recorremos los 32 sprites
		;---------------------------
COA_START	ld a, NUM_SPRITES-1 ;contador
		ld (COA_spid), a
COA_DIR_FIN	ld HL, 27496; _SPR_SPRITES_TABLE		
COA_bucle	push HL
		; miro estado
		ld a, (HL); en A cargo el status
		;cp a,0
		and %00100000;bit 5
		JP Z, COA_next;
		; ------------
		; AQUI COLISIONAMOS
		ld a, (COA_spid)
		call COS_OK2
		ld hl,(COS_return_var);
		ld a, (hl)
		cp 32
		JR Z, COA_next
		pop hl
		; tengo en (COA_spid) quien ha colisionado
		ld a, (COA_spid)
		ld HL , (COA_colider)	
		ld (hl),a
		ret
		;-------------
COA_next	pop hl
		ld a, (COA_spid)
		dec a
		ld (COA_spid), a
COA_LIMIT_INI	;cp 27
		JP M, COA_fin; si es negativo es que ya hemos animado el sprite 0

		; actualizo el puntero a la direccion de sprite i
		ld bc, sprite_size
		sbc HL, bc ; HL apunta al siguiente sprite
		JR COA_bucle

COA_fin		
		ld a, 32
		ld HL , (COA_colider)	
		ld (hl),a
		ret

;==================================================================================
_END_8BP

_NOP
	ret









