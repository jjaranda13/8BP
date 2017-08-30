;=============================================================================================================
;   88888
;  8     8
;  8     8
;   88888   bits de poder . Un tributo al AMSTRAD CPC                  
;  8     8                                            
;  8     8   
;   88888
;
; Jose Javier Garcia Aranda 2016
;    Las limitaciones no son un problema. son una fuente de inspiracion
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
;|MAP2SP, y,x			    -> crea sprites para pintar el mundo en juegos con scroll
;|MOVER, #,dy,dx                    -> movimiento relativo de un sprite
;|MOVERALL, dy,dx                   -> movimiento relativo de todos los sprites con flag de mov relativo activo
;|AUTO, #                           -> movimiento automatico de un sprite de acuerdo a su velocidad
;|AUTOALL                           -> movimiento de todos los sprites con flag de mov automatico activo 
;|STARS, starini,numstars,color,dy,dx  -> scroll de un banco de estrellas en cualquier direccion y velocidad
;|SETLIMITS, xmin,xmax,ymin,ymax    -> define la ventana de juego, donde se hace clippling
;|LAYOUT, y,x,@string               -> imprime un layout de imagenes de 8x8 y rellena map layout
;|SETUPSP, #, param_number, valor   -> modifica un parametro de un sprite
;|SETUPSQ, #, adr0,adr1,...,adr7    -> crea una secuencia de animacion
;|MUSIC, cancion,speed              -> comienza a sonar una cancion a la velocidad deseada
;|MUSICOFF                          -> para la musica
;|POKE, direccion, valor	    -> acepta valores negativos. es un poke de 16bit
;|PEEK,dir,@variable	    	    -> lee valores negativos. es un peek de 16bit
;|PRINTAT,flag,y,x,@string          -> imprime una cadena de caracteres (minicaracteres)
;|RINK,salto			    -> Rota un conjunto de tintas (4 u 8) de acuerdo a un patron definible
;|ROUTEALL			    -> cambia la velocidad de los sprites de acuerdo a sus rutas (flag ruta)
;|ALL, tasks			    -> invoca varios comandos a la vez
; tablas de datos accesibles desde BASIC
; -------------------------------------------
; 42540	    STARS0 tabla de 40 estrellas (y,x) 1 byte por coordenada. Usar POKE para rellenarla
; 27000     SPRITES_TABLE tabla de 32 sprites de 16bytes cada uno. Usar |SETUPSP
;                         tambien puedes usar POKE, salvo para coordenadas negativas que
;                         deberas usar LOCATE_SPRITE() o bien |POKE			
; 33500     SEQUENCES_TABLE tabla de secuencias de animacion, 8 words cada una. Usar |SETUPSQ
;	    _SEQUENCES_GROUPS_LIST tabla de grupos de secuencia. editarla en asm, no se puede editar con |SETUPSQ
; 42040	    MAP_TABLE tabla de hasta 82 entradas con el mapa del mundo en imagenes
;--------------------------------------------------------------------------------------------------
; Ensambladas a partir de direccion 26000. La primera instruccion BASIC debe ser memory 25999 para
; colocar HIMEM en 25999 y asi no machacar las rutinas que comienzan en 26000
; los sprites deben dibujarse a partir de direccion 33500 por lo que disponemos de  8KB para graficos
; El programa basic podra ocupar hasta 26KB, pero cuidado, las variables de basic
; tambien ocupan memoria de modo que tu programa debe de ser menor de 26KB
; 
; para salvar las diferentes partes de tu programa ejecuta lo siguiente
; SAVE "8BP.lib",b,26000,6250  version de 8BP especifica de tu juego. es necesario hacerla
; SAVE "music.bin",b,32000,1250 tus musicas
; SAVE "sprites.bin",b,33500,8540 tus sprites
;
; por ultimo, es acosejable que tu programa se cargue mediante un "cargador" que carga la
; libreria 8bp y los sprites y la musica, y a continuacion tu programa
;
;10 MEMORY 25999
;20 LOAD "8bp.lib"   <--- esta libreria, incluye tabla de sprites y layout de pantallas
;30 LOAD "music.bin"  <--- musica (dos ficheros generados por el editor de musica)
;40 LOAD "sprites.bin" <--- graficos y tabla de secuencias
;50 RUN "tujuego.bas"  <--- tu juego se carga al final con RUN, reemplazando este listado BASIC
;
; ----------------------------------------------------------------------
; AMSTRAD CPC464 MAPA DE MEMORIA de 8BP
;
; &FFFF +---------- 
;       |  pantalla + 8 segmentos ocultos de 48bytes cada uno
; &C000 +---------- 
;       |  system (simbolos redefinibles, etc)
; 42619 +---------- 
;       | banco de 40 estrellas (desde 42540 hasta 42619 = 80bytes)
; 42540 +---------- 
;       | map layout de caracteres (25x20 =500 bytes) 
;       | y mapa del mundo (hasta 82 elementos caben en 500 bytes)
;       | ambas cosas se almacenan en la misma zona de memoria 
;       | porque o usas una o usas otra
; 42040 +---------- 
;       | sprites (hasta 8.5KB para dibujos. 
;       |    dispones de 8540 bytes si no hay secuencias ni rutas)
;       +---------- 
;       | definiciones de rutas (de longitud variable cada una)
;       +----------
;	| secuencias de animacion de 8 frames (16 bytes cada una)
;	| y grupos de secuencias de animacion (macrosecuencias)
; 33500 +---------- 
;       | canciones (1.25 KB para musica editada con WYZtracker 2.0.1.0)       
;       |		       
; 32250 +----------
;       |  rutinas 8BP  (6250 bytes)
;       |	 aqui estan todas las rutinas y la tabla de sprites
;       |        incluye el player de musica "wyz" 2.0.1.0
; 26000 +---------- 
;       |  |variables el BASIC
;       |  V
;       |  
;       |  ^ BASIC (texto del programa)
;       |  |
;     0 +---------- 

; En todas estas rutinas:
;   - CADA RUTINA SE IDENTIFICA CON 3 LETRAS <ID_RUTINA>
;     ejemplo "PSP" identifica a la rutina _PRINT_SPRITE
;   - Por claridad escribo todas las etiquetas precedidas del <ID_RUTINA>
;     ejemplo "PSP_sigue" (una etiqueta de la rutina PSP)
;
; ===============================================================================================================
; 8 SEGMENTOS OCULTOS EN LA PANTALLA PARA ALMACENAR VARIABLES TEMPORALES DE LAS RUTINAS
; ojo porque aqui no se puede almacenar codigo, solo variables temporales ( = variables "locales" ) ya que un 
; comando MODE desde basic borra todo el area, de modo que no debe importar que queden a cero.
;
; "HIDDEN SCREEN_SEGMENTS"
;  desde C7D0 hasta C7FF, ambos inclusive
;  desde CFD0 hasta CFFF, ambos inclusive
;  desde D7D0 hasta D7FF, ambos inclusive
;  desde DFD0 hasta DFFF, ambos inclusive
;  desde E7D0 hasta E7FF, ambos inclusive
;  desde EFD0 hasta EFFF, ambos inclusive
;  desde F7D0 hasta F7FF, ambos inclusive
;  desde FFD0 hasta FFFF, ambos inclusive
;
; ===============================================================================================================
_HIDDEN_SCREEN_SEGMENTS
;-----------------------------------------
;-----------------------------------------
org &C7D0
_SCREEN_0_BEGIN
; ROUTEALL
;**********
ROU_SPID	db 0; sprite id
ROU_ID		db 0; identificador de ruta del sprite
ROU_SEG		db 0; segmento id dentro de la ruta
ROU_dir		dw 0; direccion donde se almacena la ruta
;ROU_dirsp	dw 0; direccion sprite

;PRINT_SPRITE
;**************
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
; variables adicionales utiles para la sobreescritura
;-----------------------------------------------
SPR_status	db 1; flags									***
SPR_addr	dw 0; direccion del sprite en la spritetable					***



; PAINT
;**********
PNT_restoancho dw 0; diferencia entre ancho y ancho tras cliping

; PAINT_TRANSP
;**********
PTR_restoancho dw 0; diferencia entre ancho y ancho tras cliping


; ANIMA_SP
;*************
ANS_spaddress:	dw 0; direccion del sprite en la tabla SPRITES_TABLE
ANS_seq_id:	db 0 ; id sequence del sprite
ANS_frameid:	db 0; frame id actual del sprite
ANS_newframeid:	db 0; frame id nuevo del sprite
ANS_seqadd:	dw 0; direccion de la secuencia
ANS_newfradd:	dw 0; direccion de la nueva imagen
;para macrosecuencias
ANS_dirmov	db 0; direccion de movimiento, entre 0 y 8


; ANIMA_ALL
;**************
ANI_spid	db 0; id sprite en curso

; AUTO_SPRITE
;**************
MOV_id: 	db 0; sprite number
MOV_address:	dw 0; direccion del sprite en la tabla SPRITES_TABLE

; AUTO_ALL
;**************
MOA_spid: 	db 0; sprite number

_SCREEN_0_END; esta ultima instruccion debe ensamblarse como mucho en la C7FF	
	NOP
;-----------------------------------------
;-----------------------------------------
org &CFD0
_SCREEN_1_BEGIN 



;COLISION_LAYOUT
;*****************
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


;COLISION_2_SPRITES
;********************
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


; variables locales comando RINK
;-------------------------------------
ink_counter	db 0
ink_cambiar	db 0



_SCREEN_1_END ; esta ultima instruccion debe ensamblarse como mucho en la CFFF
	NOP
;-----------------------------------------
;-----------------------------------------
org &D7D0
_SCREEN_2_BEGIN 


; PRINT_LAYOUT
;****************
LAY_coordychar 	db 0; coordenada y [0..24]
LAY_coordy	db 0; coordenada y de la row [0..199]
LAY_coordxchar 	db 0; coordenada x [0..24]
LAY_coordx	db 0; coordenada x de la row [0.79]
LAY_chars	dw 0; direccion donde estan los caracteres de la cadena
LAY_len		db 0; longitud del string
LAY_char	db 0; caracter a procesar
LAY_buffer	ds 6; buffer de parametros para el call print sprite

;MOVER_ALL
;***************
MRA_spid: 	db 0; sprite number

;MOVER
;***********
MOR_y: 	dw 0;
MOR_x: 	dw 0;

;UPDATE_SEGMENT
;***********************
UPS_PTR		dw 0;puntero a la entrada del sprite en la tabla ROUTE_TABLE


;MAP2SP
;****************
M2S_counter	db 0; contador de map items



;PRINT_SOPRITES
;****************
PS2_spid	db 0
_SCREEN_2_END; esta ultima instruccion debe ensamblarse como mucho en la D7FF
	NOP
;-----------------------------------------
;-----------------------------------------
org &DFD0
_SCREEN_3_BEGIN 

;  DEL PLAYER DE MUSICA WYZ
;*************************
SONIDO_REGS DW 0
EFECTO_REGS DW 0
PUNTERO_EFECTO DW 0

;*******************


; ROUTEALL
;**********
ROU_HL	DW 0; un buffer para guardar HL temporalmente

; MAP2SP
;************
M2S_Xorig: 		dw 0 ; coordx del origen "movil". inicialmente deberia ser 0
M2S_Yorig: 		dw 0 ; coordy del origen "movil". inicialmente deberia ser 0

; COLSPALL (COA)
;******************
COA_spid	db 0; contador de sprites



;INSTALL_INTERRUPT
;**********************
;INS_counter	db 0;ultimo instante en que se toco la musica


; SORTY
;********************************
SOR_yant	dw 0 ; creo que esta se puede poner global
SOR_count	db 0; contador de sprites a ordenar.  


SOR_buffer	dw 0; buffer de 2 bytes. me la he llevado a global


; PRINTAT
;****************************
PAT_coordx dw 0
PAT_coordy dw 0

_SCREEN_3_END; esta ultima instruccion debe ensamblarse como mucho en la DFFF
	NOP
;-----------------------------------------
;-----------------------------------------
org &E7D0
_SCREEN_4_BEGIN 


COR_spriteid db 0
COR_dy db 0
COR_dx db 0


_SCREEN_4_END; esta ultima instruccion debe ensamblarse como mucho en la E7FF
	NOP
;-----------------------------------------
;-----------------------------------------
org &EFD0
_SCREEN_5_BEGIN 

_FLIP_TABLE
; es la tabla para flipear los sprites
; podria usarla en un futuro como una extension del campo status
; 0= normal
; 1= flip arriba/abajo
; 2= flip derecja/izquierda
flip_sp0 db 0
flip_sp1 db 0
flip_sp2 db 0
flip_sp3 db 0
flip_sp4 db 0
flip_sp5 db 0
flip_sp6 db 0
flip_sp7 db 0
flip_sp8 db 0
flip_sp9 db 0
flip_sp10 db 0
flip_sp11 db 0
flip_sp12 db 0
flip_sp13 db 0
flip_sp14 db 0
flip_sp15 db 0
flip_sp16 db 0
flip_sp17 db 0
flip_sp18 db 0
flip_sp19 db 0
flip_sp20 db 0
flip_sp21 db 0
flip_sp22 db 0
flip_sp23 db 0
flip_sp24 db 0
flip_sp25 db 0
flip_sp26 db 0
flip_sp27 db 0
flip_sp28 db 0
flip_sp29 db 0
flip_sp30 db 0
flip_sp31 db 0

FLIP_COUNTER db 0; contador de flipeados para chequeo rapido. debe ser updated en SETUPSP

_SCREEN_5_END; esta ultima instruccion debe ensamblarse como mucho en la EFFF
	NOP
;-----------------------------------------
;-----------------------------------------
org &F7D0
_SCREEN_6_BEGIN 

ROU_NUM_PASOS	db 0; variable temporal de numero de pasos

_ROUTE_TABLE;
_ROUTE_TABLE_0a15;
route_sp0	db 0,0; segmento, cuentaatras
route_sp1	db 0,0
route_sp2	db 0,0
route_sp3	db 0,0
route_sp4	db 0,0
route_sp5	db 0,0
route_sp6	db 0,0
route_sp7	db 0,0
route_sp8	db 0,0
route_sp9	db 0,0
route_sp10	db 0,0
route_sp11	db 0,0
route_sp12	db 0,0
route_sp13	db 0,0
route_sp14	db 0,0
route_sp15	db 0,0


_SCREEN_6_END; esta ultima instruccion debe ensamblarse como mucho en la F7FF
	NOP
;-----------------------------------------
;-----------------------------------------
org &FFD0
_SCREEN_7_BEGIN 

_ROUTE_TABLE_16a31;
route_sp16	db 0,0
route_sp17	db 0,0
route_sp18	db 0,0
route_sp19	db 0,0
route_sp20	db 0,0
route_sp21	db 0,0
route_sp22	db 0,0
route_sp23	db 0,0
route_sp24	db 0,0
route_sp25	db 0,0
route_sp26	db 0,0
route_sp27	db 0,0
route_sp28	db 0,0
route_sp29	db 0,0
route_sp30	db 0,0
route_sp31	db 0,0

_SCREEN__END; esta ultima instruccion debe ensamblarse como mucho en la FFFF
	NOP
;-----------------------------------------
;-----------------------------------------
;================================================================================================================
; EXTENSIONES DE LA V31 comienzan en 25000
; =========================================
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
; PRINTAT, 0, 100,40,@cad$
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

	

;================================================================================================================
; 
; V30 -> comenzamos en 26000 
; el mapa del mundo, que ocupa 390 bytes ahora se almacena solapado con el layout
; pues no tiene sentido un juego con scroll que usa layout
; es necesario desde basic ejecutar memory 25999 al principio del programa
;================================================================================================================
;org 26390
org 26000



;=====================================
; _MAP2SP( Yorig, Xorig ) (M2S)
;=====================================
; recorre el mapa y configura los sprites comenzando desde cero en adelante
; inputs son las coordenadas de referencia, son el origen "movil" desde donde vamos a mirar si cada elemento
; de mapa se encuentra dentro del area de pantalla. En caso de encontrarse dentro total o parcialmente, se da de alta un sprite



; variables globales
;-------------------------------------
; estas variables son globales pero se rellenan aqui.
; por defecto los limites del clipping es la pantalla
;M2S_Xorig 		dw 0 ; coordx del origen "movil". inicialmente deberia ser 0
;M2S_Yorig 		dw 0 ; coordy del origen "movil". inicialmente deberia ser 0

M2SXMARGIN		dw 80; luego se ajusta sumando el max ancho de la tabla map_table
M2SYMARGIN		dw 200; luego se ajusta sumando el max alto de la tabla map_table
M2SXoffset		dw 0; el offset es el margen izq desde donde se considera presencia de sprite
			;     es un numero negativo y se lee de la "map table"


; El mundo es positivo . el origen es "O"
;
;    my +--+----------+
;       |  |          |
;   200 +--+----------+
;       |  |          |
;       |  |   PANT   |
;       |  |          |
;     0 +--O----------+  
;     -mx  0         100
;


M2S_SP_POINTER	dw _SPR_SPRITES_TABLE; puntero al primer sprite a dar de alta
M2S_sprites	db 0; este es un output de la funcion
M2S_sprites_before db 0; num sprites en la invocacion anterior



;M2S_pXorig 		dw 0 ; pointer coordx del origen "movil". inicialmente deberia ser 0
;M2S_pYorig 		dw 0 ; pointer coordy del origen "movil". inicialmente deberia ser 0


;M2S_numparam		db 0; 
;function body
;-------------------------------------
_MAP2SP

		;recogida de parametros
		;----------------------
		;ld (M2S_numparam),a; lo necesito luego		

		; lectura de margen Y
		ld hl,(_MAP_TABLE)
		ld bc,199;200
		add hl,bc; alto pantalla
		ld (M2SYMARGIN),hl

		; lectura de margen x
		ld bc, (_MAP_TABLE+2); direccion donde se encuentra el offset x. Es negativo o cero
		ld (M2SXoffset),bc
		
		; ahora calculo el margenx
		ld hl,79;80
		and a
		sbc hl,bc ; al restar un numero negativo es como sumarlo
		ld (M2SXMARGIN),hl
		
		ld HL,_SPR_SPRITES_TABLE
		ld (M2S_SP_POINTER),hl



		;recogida de parametros de invocacion
		;------------------------------------
M2S_2param		
		; origen X
		;---------
		ld c,(IX+0)
		ld b,(IX+1)
		; aqui debo restar el margen  para comparar bien.
		; todo lo que este entre [o-mx ,o+80] se va a considerar
		
		ld hl,(M2SXoffset); este offset es negativo o cero
		add hl,bc
		ld (M2S_Xorig),hl

		
		; origen Y
		;---------
		ld c,(IX+2)
		ld b,(IX+3)
		ld (M2S_Yorig),bc
M2S_run

		; inicializacion de contador de map items a recorrer
		; lo inicializo con el numero maximo y va decrementansose
		; lectura del numero de items a considerar
		ld a, (_MAP_TABLE+4)
		ld (M2S_counter),a; inicializo contador de map items


		; contador de sprites agregados
		; este contador sirve como "reporte" de esta funcion
		ld a, 0
		ld (M2S_sprites),a


		; iniciamos HL apuntando a la lista de map items
		ld HL,_MAP_TABLE+5
		

	
M2S_bucle      

		push HL; guardo HL
		; cargo en BC la coordenada Y
		ld c,(HL)
		inc hl
		ld b,(HL)
		
		; no solo importa la coordenada Y, sino su alto, ya que aunque este fuera
		; de la pantalla hace falta pintarlo si tiene clipping. Por ello considerare un
		; area de pantalla mayor


		; ahora resto el origen
		push HL; guardo hl
		ld hl, (M2S_Yorig)

		and a
		sbc HL,bc ; Yorig-Ymapitem

		; si se encuentra dentro el resultado debe ser negativo (con acarreo) y menor de <255
		JP NC, M2S_next

		
		ld bc, (M2SYMARGIN) ; 
		and a
		adc HL,BC
		; al sumar margeny debe quedarse en positivo , dando acarreo pues ha pasado de neg a pos
		JP NC, M2S_next

		; la coordenada Y ha resultado estar dentro
		; ahora comprobamos la coordenada X
		pop HL
		push hl
		inc HL; me coloco en la coordenada X
		ld c,(HL)
		inc hl
		ld b,(HL)

		ld hl, (M2S_Xorig)
		and a
		sbc HL,bc
		; si se encuentra dentro el resultado debe negativo pero no tiene porque haber acarreo
		; pues el origen ya es negativo, por ejemplo ox=-20, si x=-10 entonces -20-(-10)=-10. eso si, debe quedar un numero negativo <margenx

		;JR NC, M2S_next
		ld bc, (M2SXMARGIN)
		and a
		adc hl,bc
		JR NC, M2S_next
		
	
		;INSERCION DE SPRITE
		;=============================================
		; se han cumplido las condiciones!!!!
		; insertamos un sprite
		; hay que adaptar las coordenadas, ya que el mundo usa un sistema de coord diferentes
		; Y'= 200-(Y-Yorig)
		; X'= (X-Xorig)
	
		ld HL,(M2S_SP_POINTER)
	
		;status
		;------
		ld a,%00000011;  colision de sprites + printspall
		ld (HL),a

		;coordy
		;------
		inc hl
		ex de,hl;ahora de tiene el pointer a la sprite table


		pop HL; HL contiene la direccion del "map item"
		push HL
		dec hl; ojo esto lo tengo que hacer porque hl no apunta a la primera direccion

		ld c, (HL)
		inc hl
		ld b,(HL); ahora BC contiene la coordenada Y del "map item"
		ld L,c
		ld h,b; ahora HL tiene la coordy del map item

		ld bc, (M2S_Yorig)
		and a
		sbc HL,bc
		ld b, h
		ld c,l

		ld hl,199
		and a
		sbc hl,bc; en hl ahora esta la coord y final
		ex de, hl; ahora esta en DE, y en HL tenemos la direccion del POINTER
	
		ld (HL),e; coordenada y es cargada en sprite_table
		inc hl
		ld (HL),d


		inc hl ; posiciono en coordx de sprite table
		ex de, hl; ahora de contiene el POINTER a la sprite table
		
		;coordx
		;------
		pop HL;  hl con la direccion delmap item
		push HL
		inc hl; me coloco en coordx. basta con un inc
	
		ld c, (HL)
		inc hl
		ld b, (Hl); ahora en bc tengo la coordx del map item
		ld L,c
		ld h,b; ahora HL tiene la coordx del map item
		
		ld bc, (M2S_Xorig); xorig tiene sumado el offset , asi que habra que restarlo
		and a
		sbc HL,BC
		ld bc, (M2SXoffset)
;		and a
;		sbc hl,bc; ya tengo en HL la coordx final
		add hl,bc
		ex de,hl; de contenia la direccion a la que cargar 
		ld (HL),e; coordenada x es cargada en sprite_table
		inc hl
		ld (HL),d
		
		; vy
		inc hl
		ld a,0
		ld (HL),a
		;vx
		inc hl
		ld a,0
		ld (HL),a
		;seq
		inc hl
		ld a,0
		ld (HL),a
		;frame
		inc hl
		ld a,0
		ld (HL),a
		inc hl; lo preparo ya en la direccion de imagen de la tabla sprites
		;image
		ex de,hl; de apunta a la tabla sprites
		pop hl
		push hl
		inc hl
		inc hl
		inc hl
		ld c,(Hl)
		inc hl
		ld b,(HL); ahora en bc esta la imagen
		ex de,hl
		ld (HL), c
		inc hl
		ld (HL),b
		
		; actualizacion de la variable sprites
 		ld a, (M2S_sprites)
		inc a
		ld (M2S_sprites),a
		; actualizacion del puntero
		ld HL,(M2S_SP_POINTER)
		ld bc,16
		add hl,bc
		ld (M2S_SP_POINTER),hl; actualizado para el siguiente sprite

M2S_next	pop Hl; extra que viene de x o de Y
		pop hl; normal
		ld bc, 6
		add HL, BC
		ld a, (M2S_counter)
		dec a
		;ret Z
		JR Z, M2S_fin
		ld (M2S_counter),a
		JP M2S_bucle
		
M2S_fin		; hemos terminado
		; pero si un sprite ha desaparecido, por ejemplo antes habia 3 y ahora dos pero
		; al haber sido reubicados, puede que el que antes era 3 ahora sea 2 y los datos del 3 siguen ahi
		; por lo tanto hay que desactivarlo
		ld a, (M2S_sprites)
		ld b,a
		ld a, (M2S_sprites_before)
		sub b
		JR Z, M2S_fin2; if no ha cambiado el numero de sprites, entonces ret
		; si estamos aqui es por que ha cambiado el numero de sprites vivos. si son mas no importa pero si son menos si
		; vamos a desactivar a los sprites en exceso que habia antes
		JR C,M2S_fin2; hay acarreo luego son mas.

		ld d, a; en d ahora esta el exceso de sprites que habia antes

M2S_finbuc	ld HL, (M2S_SP_POINTER)
		ld a,0
		ld (HL),a
		ld bc, 16
		add hl,bc
		ld (M2S_SP_POINTER),hl
		dec d
		JR NZ,M2S_finbuc
M2S_fin2
		ld a, (M2S_sprites)
		ld (M2S_sprites_before),a; actualizacion
		ret


;=====================================
; _ROUTEALL() ROU
;=====================================
; cambia las Vy,Vx de los sprites que tengan flag de ruta
; luego han de ser movidos con AUTO_ALL() 
; 
; variables locales
;-------------------------------------
;tabla interna de segmento y contador de paso asociado a la ruta de cada sprite. ocupa 64Bytes (64=32 x 2 bytes)
; esta tabla tiene dos campos
;     [ segmento, contador decreciente ]
; segmento=0 + contador =1 significa que no hemos empezado. el primer segmento es el 1
; el segmento 0 es de inicializacion, antes de empezar a recorrer la ruta


;_ROUTE_TABLE;
;_ROUTE_TABLE_0a15;
;route_sp0	db 0,0; segmento, cuentaatras
;route_sp1	db 0,0
;route_sp2	db 0,0
;route_sp3	db 0,0
;route_sp4	db 0,0
;route_sp5	db 0,0
;route_sp6	db 0,0
;route_sp7	db 0,0
;route_sp8	db 0,0
;route_sp9	db 0,0
;route_sp10	db 0,0
;route_sp11	db 0,0
;route_sp12	db 0,0
;route_sp13	db 0,0
;route_sp14	db 0,0
;route_sp15	db 0,0

;_ROUTE_TABLE_16a31;
;route_sp16	db 0,0
;route_sp17	db 0,0
;route_sp18	db 0,0
;route_sp19	db 0,0
;route_sp20	db 0,0
;route_sp21	db 0,0
;route_sp22	db 0,0
;route_sp23	db 0,0
;route_sp24	db 0,0
;route_sp25	db 0,0
;route_sp26	db 0,0
;route_sp27	db 0,0
;route_sp28	db 0,0
;route_sp29	db 0,0
;route_sp30	db 0,0
;route_sp31	db 0,0



_ROUTEALL
		; recorremos la tabla de sprites
		ld a, NUM_SPRITES-1 ;empezamos por el ultimo sprite
		ld (ROU_spid), a

		ld HL, 27496;_SPR_SPRITES_TABLE;
		push hl; v28
		;ld (ROU_dirsp), HL ; v28

		jr ROU_call; new. esto enruta el sprite 31. ojo es un jr, no un call
ROU_bucle	
		pop HL
		;ld hl, (ROU_dirsp)

		ld bc, 16;sprite_size aun no es conocido (se ensambla luego), he tenido que poner 16 a fuego
		and a
		sbc HL, bc
		push HL; v28
		;ld (ROU_dirsp), HL ; v28
		
		
ROU_call
;	JR ROUTE_SP
;-------------------------------------------------
ROUTE_SP; rutina invocada desde ROUTEALL por cada sprite. 
	; se invoca usando jr porque necesita la pila
;-------------------------------------------------

		; check flag de ruta en status
		ld a,(HL)
		and %10000000
		JR Z,ROU_cont
		;RET Z; nada que hacer
	
ROU_mas		; actualizacion paso (decremento)
		ld HL,_ROUTE_TABLE
		;ld b,0
		ld a, (ROU_SPID)


		; mejora v28c-------
		cp 16
		jp M, ROU_0a16
		ld HL,_ROUTE_TABLE_16a31
		sub 16
ROU_0a16	ld b,0			
		;end mejora---------

		add a,a; x2, ya que cada entrada son 2 bytes
		ld c,a
		add HL, BC
		ld (UPS_PTR),HL; guardamos puntero a la entrada en la tabla
		ld a,(HL)
		ld (ROU_SEG),a; segmento actual del sprite
		inc hl
		ld a,(HL); leo el contador de pasos
		and a

		JP Z,ROU_INIRUTA; detectado comienzo de ruta  v28( antes era jr)
		;JR Z,ROU_INIRUTA; detectado comienzo de ruta
		dec a
		ld (HL),a; actualizo el contador de pasos
		
		; si paso es cero, actualizacion de segmento y contador de pasos
		; la primera vez el contador deberia de ser 1
		; si no es cero, no hay nada que hacer pues la Vy,Vx son son correctas en el segmento en curso
		JR Z, _UPDATE_SEGMENT
		;ret
		;JR ROU_cont


	
ROU_cont
		ld a, (ROU_spid)
		dec a
		ld (ROU_spid), a
		Jp M, ROU_fin; si es negativo es que ya hemos animado el sprite 0		
		Jr ROU_bucle
		
ROU_fin		
		pop hl
		ret

	
;=====================================
;_UPDATE_SEGMENT(sp_id) UPS
;=====================================
; cambia las Vy,Vx del sprite
; luego han de ser movidos con AUTO_ALL() 
; 
; variables locales
;-------------------------------------


_UPDATE_SEGMENT
	;ret
	; lectura de ruta en ROU_ID
	pop hl; contiene la direccion del sprite
	push hl
	;ld hl, (ROU_dirsp)
	;ret

	ld bc,15
	add hl,bc; ahora hl tiene la direccion del campo "ruta" del sprite
	ld a,(HL)
	ld (ROU_ID),a; a tiene la ruta
	; calculo de su direccion de memoria en la definicion de rutas
	ld HL, ROUTE_LIST
	add a,a; ruta x2 para sumarlo a HL y obtener la dir ruta
	ld b,0
	ld c,a
	add HL,BC; ya tengo en HL la direccion donde esta la direccion de la ruta

	; hay que hacer una indireccion
	ld a,(hl)
	ld e,a
	inc hl
	ld a, (hl)
	ld d,a
	ex de, hl; ahora hl tiene la direccion de la ruta!
	ld (ROU_dir), hl

ROU_sigseg
	;lectura del siguiente segmento
	ld a, (ROU_SEG)
	inc a; siguiente segmento 
	ld (ROU_SEG),a
	ld c,a; guardo a
	add a,a
	add a,c; con esto es como multiplicar ax3. cada segmento son 3 bytes. 
		; V28
		;----------------
		; OJO, esto significa que los segmentos de cambio de estado o cambio de secuencia deben tener dos campos
		; aunque solo se use uno, es decir algo como 
		;   255,37,0  se pone status=37
		;   254,10,0 se pone la secuencia 10
	ld c,a
	ld b,0
	add hl,bc; hl posicionado en el segmento siguiente
	
	; si es cero, lectura del primer segmento y asignacion de vx,vy al sprite
ROU_leepaso	ld a,(HL); a contiene numero de pasos
		;ld (ROU_NUM_PASOS),a
		and a; pone acarreo a cero
		JR z, ROU_cicla	; si el numero de pasos es cero, es que es indicador de fin=ciclar la ruta

	; MEJORA v28. cambio de status, secuencia o imagen en mitad de ruta
	;------------------------------------------------------------------
		;and a
		cp 250
		jr c,ROU_normal; si es menor de 250 entonces no hay cambios de estado ni nada

		inc HL; ahora apunta al parametro (estado o secuencia o dirimagen)
		ld (ROU_HL), HL; lo guardo, ROU_Hl es un simple buffer temporal

		; si el numero de pasos es 255 entonces es que hay que cambiar de status
		;and a
;		ld c,a ; guardo a

		cp 253
		JR NZ, ROU_no253
		; estamos aqui porque nos han pasado un 253 = cambio de imagen
		ex de,hl; ahora DE= dir image param, hl=corrupt
		pop hl
		push hl; hl=dir sprite
		ld bc,9
		add hl,bc; hl= sprite dir image
		ex de, hl; DE= sprite dir image , HL= dir image param
		ld bc ,2
		ldir; mete en (DE) la direccion de la imagen (2 bytes) = actualiza la imagen
		jr ROU_kkk

ROU_no253	; estamos aqui porque el parametro es 1 byte (no 253 =casos 255 y 254 y 252)
		; mejora v28c----------------
		cp 252
		jr NZ,ROU_no252

		; hay que invocar a reset ruta con a= id_sprite
		push hl; hl tiene la direccion del parametro (=valor de nueva ruta)
		ld a, (ROU_spid) 
		call _resetruta; ponemos segmento y paso a cero
		pop hl
		
		ld a, (hl); valor de nueva ruta
		pop hl; dir sprite
		push hl
		ld bc,15
		add hl,bc
		ld (hl),a
		;jp ROU_sigseg
		jp ROU_mas;bucle 
		;jr ROU_CONT esta funciona
		;jr _update_segment

		;ld a,252; regenero A pues se toca en el call
		;ld bc,15
		;ld (ROU_off+1),bc;15
		; ojo, lo malo es que hay que resetear la entrada en ROUTETABLE!
		; pero es facil si el cambio ruta solo se acepta al final
		;jr ROU_no253b




ROU_no252       ;ld bc,7
		;ld (ROU_off+1),bc
		; end mejora v28c-------------

ROU_no253b	; pasamos por aqui si el parametro no es 253
		cp 255
		;JR NZ, ROU_normal

		ld a, (HL); lee el parametro
		pop HL; hl tiene la dir sprite (donde esta justo el estado)
		push hl
		;ld hl, (ROU_dirsp)

		JR Z, ROU_kk1; si es 0 es que es 255 y cambia estado
		; estamos aqui porque nos han pasado un 254 = cambio de secuencia o un 252 pero hay que hacer lo mismo
		; ya que el 7 se ha cambiado antes por un 15 si es 252

ROU_off		ld bc, 7; posiciono hl para cambio de secuencia
		add hl,bc; hl= sprite dir sequence

ROU_kk1		ld (hl),a; actualiza la secuencia o el estado
ROU_kkk		ld hl, (ROU_dir); cargo en HL la direccion de esta ruta, que la tengo en ROU_dir

		;ld a, (ROU_NUM_PASOS)
		;cp 252
		;jP Z, _UPDATE_SEGMENT
		
		jp ROU_sigseg
		

;ROU_NUM_PASOS	db 0


ROU_normal
	ld (ROU_dir), hl; ahora la variable apunta al segmento y no a la ruta
	ld a, (HL) ; ahora a tiene el numero de pasos 

	;------------------------------

	; si estoy aqui es que no ha ciclado. puedo actualizar el segmento
	;ld a, (ROU_SEG)
	;inc a; 
	;ld (ROU_SEG),a


	;JR z, ROU_cicla	
	
ROU_update
	;JR vuelve	
	;ret
	;entramos aqui si hay cambio de segmento
	;-----------------------------------------
	
	; actualizacion de segmento y contador de pasos
	ld hl, (UPS_PTR); ptr al item en la tabla de segmentos y pasos (Route_table)
	inc hl
	ld (hl),a; numero de pasos
	ld a,(ROU_SEG)
	dec hl
	ld (HL),a; id_segmento
	; falta asignar vy, vx
	ld HL, (ROU_dir); direccion del segmento
	inc hl; ahora apunta a vy

	ex de, hl
	pop hl
	push hl
	ld bc, 5
	add hl,bc
	ex de, hl
	ld bc,2
	ldir

		
	JP ROU_cont
	;ret
		
ROU_cicla
	ld a,0
	ld (ROU_SEG),a; segmento=0
	ld HL, (ROU_dir);direccion de la ruta=direccion del segmento
;	ld a,(HL); aqui esta el numero de pasos del segmento cero
;	JR ROU_update
	JP ROU_leepaso	; v28

ROU_INIRUTA
	; venimos desde _UPDATE_SEGMENT porque se ha detectado un comienzo de ruta
	ld a,255; asi al sumar un 1 pasara a cero
	ld (ROU_SEG),a
	ld a,0; nuevo paso
	;JR _UPDATE_SEGMENT
	JP _UPDATE_SEGMENT ; v28




;=====================================
;_MACROSEQ
;=====================================
; esta rutina  se invoca desde _ANIMA_SP cuando la secuencia de animacion es una 
; "macrosecuencia" , tambien llamada "grupo de secuencias"
;
_MACROSEQ
		; estamos ante una macrosecuencia
		; debo determinar la secuencia en funcion de Vy,Vx y almacenarla en el registro A
		sub 32
		ld (ANS_seq_id),a; guardo la macrosecuencia
		push hl
		
		ld HL,(ANS_spaddress); direccion del sprite
		ld bc,5
		add hl,bc; hl= direccion de vy
		ld a, (HL); vy
		and a
		ld b,0
		JR Z, macro_h
		bit 7,a
		JR NZ,macro_ypos

macro_yneg	
		ld a,6
		JR finmacroy
macro_ypos	
		ld a,3
		JR finmacroy

macro_h		ld a,0
		
finmacroy	ld (ANS_dirmov),a

		; ahora analizo vx
		inc hl
		ld a, (HL); vx
		and a
		JR Z, macro_v
		bit 7,a
		JR Z,macro_xpos

macro_xneg	
		ld a,1
		JR finmacrox
macro_xpos	
		ld a,2
		JR finmacrox

macro_v		ld a,0
		
finmacrox	ld b,a
		ld a, (ANS_dirmov)
		add b
		; ahora hay que multiplicar por 8

		;ld a,b; en a esta el offset de la verdadera secuencia [0..9]
		ld (ANS_dirmov),a
		ld HL, _MACRO_SEQUENCES
		ld a, (ANS_seq_id); ya tiene restado el 32
		;hay que multiplicar a*9
		ld b,a
		add a
		add a
		add a
		add b
		ld b,0	
		ld c,a
		add HL,BC; ahora hl apunta a la macrosecuencia
		ld a, (ANS_dirmov)
		ld c,a
		add HL,BC; hl apunta a la secuencia
		ld a, (HL); ya tengo la secuencia en A !!!!

		
		pop hl

		ret


;=============================================================================================================
; _SORTY (mode),   SOR
;=============================================================================================================
; esta rutina ordena los sprites en funcion de su coordenada Y
; tambien puede dejarlos en estado default si entramos con SOR_mode=0

; variables globales
;--------------------
;SOR_changes	db 0; 0 =ordenado completamente . en v28 lo he quitado. no aporta a nivel de programador
SOR_mode	db 0; 0=set default values, 1=orden en coord y 

; variables locales
;-------------------------------------
;SOR_count	db 0; contador de sprites a ordenar.  
SOR_ant		dw 0; direccion de coordy de sprite anterior
SOR_sig		dw 0; direccion de coordy de sprite siguiente
SOR_ini		dw 0; direccion del sprite inicial


;variables locales para modo=1 (orden)
;-------------------------------------
;SOR_yant	dw 0 ; creo que esta se puede poner global

;SOR_buffer	dw 0; buffer de 2 bytes. me la he llevado a global

;--------------------------------

_SORTY
_SOR		
		ld a, (SOR_mode); 0=default, 1= orden 16 segun coordy
		and a
		JR NZ,SOR_orden

SOR_default
		; estamos aqui porque se quiere "resetear" a default values
		; lo hacemos con los 32 sprites
		ld a, 32
		ld (SOR_count),a; contador de sprites

		ld bc, 0
		ld (SOR_ant),bc; primer anterior es cero

		ld HL, _spr_sprites_table+1; coordy
SOR_bucle	push hl; guardo ant

		; reset status
		;-------------
		; esto lo hago porque solo se invoca este ordenamiento default al invocar 
		; la instalacion de comandos RSX
		dec hl
		ld (HL), 0
		inc hl
		;------------

		ld bc, 10
		add HL,bc; posicion 11 y 12
		ld bc ,(SOR_ant) ;  "anterior"
		ld (HL),c
		;ld (hl), 0;<--- inserto cero porque no la uso en printsprites ni en sortY
		inc hl
		ld (HL), b
		;ld (hl), 0;<--- inserto cero porque no la uso en printsprites ni en sortY
		; ahora ya he metido la direccion "anterior" en posiciones 11 y 12
		inc hl
		push hl
		pop de; guardo direccion "siguiente" en de (posicion 13 y 14)
		ld bc, 4
 		add HL,bc; posicion de coordy de siguiente sprite
		ex de, hl; AHORA HL  tiene direccion "siguiente"
		ld (HL), e
		inc hl
		ld (HL),d
		ld bc,3
		add HL,bc; me coloco en siguiente coord y
	
		pop bc
		ld (SOR_ant),bc
		
		;ld a,(SOR_count)
		dec a
		;ld (SOR_count),a
		JR NZ,SOR_bucle
		; si hemos terminado entonces el ultimo sprite siguiente esta mal puesto, ya que no hay siguiente
		
		ld HL, 27509
		ld (HL),0; no hay siguiente
		inc HL
		ld (HL),0; no hay siguiente
		ld hl,27001 
		ld (SOR_ini), hl; 


		;ld HL, 27497
		;ld (SOR_fin), hl ; NO ES NECESARIO, NO SE USA
		ret
		
SOR_orden	


		;ld a,10;31; contador
		ld a,(PS2_orden); numero de sprites a ordenar desde 0 hasta PS2_orden

		; en cada ordenacion se considera un sprite y el siguiente 
		ld (SOR_count), a
		; debo recorrer desde el primero buscando un fallo de ordenacion y cambiarlo
		;ld a, (PS2_orden)
		;and a
		;JR NZ, SOR_noini
		ld hl, (SOR_ini)
		;JR SOR_bucley

SOR_noini	;inc a
		;ld h,a
		;ld e,16
		;call _mul8bit;HL=H*E
		;ld bc, 27001; asi si A=0 entonces estamos en 27001. si A es 31 no tiene sentido y no llegamos aqui
		;add hl,bc
		;ahora HL apunta a coordy del primer sprite a ordenar
		;ld HL, 27257;(SOR_ini); ahora HL apunta a coordy del primer sprite. 27257 es el 16
		
		;ld hl, (SOR_ini)
		

SOR_bucley	;jp SOR_finbuc
		ld (SOR_ant), HL
		ld c,(HL)
		inc hl
		ld b, (HL)
		ld (SOR_yant), bc; ya tengo la coordenada Y

		;ld a, (HL)
		;ld (SOR_yant), a; guardo la coordenada y

		; vamos a por la siguiente
		;ld bc, 12
		ld bc, 11
		add hl,bc
		; ahora hl contiene la direccion donde se encuenta la direccion del siguiente


		ld e,(HL)
		inc hl
		ld d,(HL)

		; si de es cero es que ya hemos terminado
		; si el contador y el valor inicial de HL son coherentes no ocurrira !!!

		; ----check fin
		;ld bc,0
		;and a
		;ex hl, de
		;sbc hl,bc
		;JR Z, SOR_RET
		;ex hl,de
		;-------------


		ld (SOR_sig), de; lo guardo				
		; -----optimizacion
		;ld a, (SOR_count)
		;cp 20
		
		;JR C, SOR_finbuc
		;-------fin optimizacion

		ld hl, (SOR_yant)
		;bit 7,h
		;JR NZ,SOR_finbuc; no chequeo Y negativas

		;ld a, (de)
		;ld c,a
		ld a, (de)
		ld c,a
		inc de
		ld a, (de)
		ld b, a; ahora Y_sig esta en bc
		dec de		
		;bit 7,b
		;JR NZ,SOR_finbuc; no chequeo Y negativas

		;ld hl, (SOR_yant)
		;ld (SOR_ysig), bc; no hace falta
		and a; acarreo a cero
		sbc hl, bc; yant debe ser menor que ysig
	
		;ld a,(SOR_yant)
		;cp c; a debe ser menor que c
		JR Z,SOR_finbuc; son iguales
		JR NC, SOR_fallo
		;JP P,SOR_fallo
		
SOR_finbuc	; fin del bucle
		; preparo HL

		;ex de, hl
		ld hl, (SOR_sig)
;		ld hl, (SOR_sig)
		; ya esta listo!
		ld a, (SOR_count)
		dec a
		ld (SOR_count), a
		JR NZ, SOR_bucley

SOR_ret		;ld a,0 
		;ld (SOR_changes),a; no ha habido ningun cambio. completamente ordenado
		ret

SOR_fallo	
		; hay un fallo de orden y vamos a corregirlo
		; hay que corregir 5 valores
		
		; SOR_ant contiene la direccion de la coordY del sprite1 
		; SOR_sig contiene la direccion de la coordY del sprite2
		
		; voy a corregir al sprite0 que ahora debe apuntar a sprite2
		;-------------------------------------------------------------------------
		; ojo, solo si existe!!!!
		ld HL, (SOR_ant)
		ld bc, 10
		add hl, bc
		ld e,(HL)
		inc hl
		ld d,(HL); ahora en de esta la direccion del sprite0
		;de puede ser cero!!!
		ex hl, de

		;ld (SOR_buffer),hl; he almacenado la direccion "anterior", la del sprite0


		ld bc, 0
		and a 
		sbc HL,bc
		
		JR NZ, SOR_nocero
		; SOR_ANT era el primero! y ahora debe ser sor_sig		

		ld hl, (SOR_sig)
		ld (SOR_ini), hl; se usa SOR_ini como direccion del primer sp a imprimir
		JR SOR_cero

SOR_nocero	
		ld bc, 12
		add hl, bc
		; ahora debo meter en (hl) la direccion de sprite2
		ld de, (SOR_sig)
		ld (HL), e
		inc HL
		ld (HL), d


SOR_cero	; ahora voy a almacenar los datos de sprite1 en un buffer 
		;--------------------------------------------------------
		ld HL, (SOR_ant)
		ld bc, 10
		add hl, bc
		
		ld c,(HL)
		inc hl
		ld b, (HL)
		ld (SOR_buffer),bc; he almacenado la direccion "anterior", la del sprite0 (que puede ser 0)

		; HL esta apuntando a anterior

		
		; ahora voy a arreglar sprite1 dir ant
		;-------------------------------------
		;ld HL, (SOR_ant)
		;ld bc, 10
		;add hl, bc

		dec hl

		;ld bc, (SOR_sig)
		;ld (HL), c
		;inc hl
		;ld (HL), b

		ld de, (SOR_sig); uso de para despues poder hacer ex en la siguiente
		ld (HL), e
		inc hl
		ld (HL), d

		; ahora voy a arreglar sprite1 dir sig
		;-------------------------------------
		;ld hl, (SOR_sig); sprite 2
		ex de,hl
		
		ld bc,12
		add hl, bc
		
		ld e, (HL)
		inc hl
		ld d,(HL); ahora en de esta la dir de sprite3 (puede ser 0)

		ld hl, (SOR_ant)
		ld bc, 12
		add hl, bc
		ld (HL), e
		inc hl
		ld (hl), d

		; ahora voy a arreglar sprite2 dir ant
		;---------------------------------------
		ld HL, (SOR_sig)
		ld bc, 10
		add hl, bc
		ld bc, (SOR_buffer); contiene la que era la direccion del sprite0
		ld (HL), c
		inc hl
		ld (HL), b


		; ahora voy a arreglar sprite2 dir sig
		;---------------------------------------
		;ld HL, (SOR_sig)
		;ld bc, 12
		;add hl, bc
		
		inc hl; con esto ya tengo hl colocado en sp2 dir sig


		ld bc, (SOR_ant)
		ld (HL), c
		inc hl
		ld (HL), b

		; por ultimo hay que arreglar sprite3 dir ant, que debe apuintar a sprite1
		;--------------------------------------------------------------------
		ld HL, (SOR_ant); como ya esta actualizado , saco sprite3 de aqui
		ld bc, 12
		add hl, bc
		ld e,(HL)
		inc hl
		ld d,(HL); ahora en de esta la direccion del sprite3
		; ojo si es cero entonces fin
		ex hl, de
		ld bc,0
		and a; acarreo a cero
		sbc HL, bc
		JR Z,SOR_end
		;ret z
		ld bc, 10
		add hl, bc
		; ahora debo meter en (hl) la direccion de sprite1
		ld de, (SOR_ant)
		ld (HL), e
		inc HL
		ld (HL), d

SOR_end		;ld a,1 v28
		;ld (SOR_changes),a; ha habido un cambio. puede no estar completamente ordenado
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

SPR_DIFX	db 80
SPR_DIFY	db 200
;function body
;-------------------------------------
_SET_LIMITS:

		ld h, (IX+7);es el mas signific. no lo necesito
		ld l,(IX+6);menos signific
		ld (SPR_MIN_X), hl

		ld B, H
		ld c,l

		ld h, (IX+5);es el mas signific. no lo necesito
		ld l,(IX+4);menos signific
		ld (SPR_MAX_X), hl

		and a
		SBC HL,BC
		ld a,l
		ld (SPR_DIFX),a

		ld h, (IX+3);es el mas signific. no lo necesito
		ld l,(IX+2);menos signific
		ld (SPR_MIN_Y), hl

		ld B, H
		ld c,l


		ld h, (IX+1);es el mas signific. no lo necesito
		ld l,(IX+0);menos signific
		ld (SPR_MAX_Y), hl

		and a
		SBC HL,BC
		ld a,l
		ld (SPR_DIFY),a


		ret

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

;=============================================================================================================
;RUTINA  _NOP para medir tiempos de invocacion y paso de parametros. ES EL RET DE MUL8BIT !!! asi ahorro 1 byte
;=============================================================================================================
_NOP		ret


;=============================================================================================================
;RUTINA  _SETUPSP parametro 15
;=============================================================================================================

		; mejora v28c
_resetruta	ld HL,_ROUTE_TABLE
		cp 16
		jp M, SET_0a16
		ld HL,_ROUTE_TABLE_16a31
		sub 16
SET_0a16	ld b,0			
		;end mejora
		add a,a; x2, ya que cada entrada son 2 bytes
		ld c,a
		add HL, BC
		ld a, 0
		ld (HL),a; reset segmento
		inc hl
		ld (HL),a; reset paso
		ret


;==========================================================================================
; algunas variables de la rutina stars las he traido aqui
SCS_pen		db 64; el byte (2ndo pix mode 0) que vamos a pintar. esto es una constante
SCS_check	db 0

SCS_incy	db 2; lo que vamos a mover en eje y
SCS_incx	db 1; lo que vamos a mover en eje x

SCS_counter	db 20
SCS_number	db 20

star_color	db 64

_FIN_27000
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
		dw 0 ; direccion de sprite anterior (posiciones 11 y 12). para ordenar
		dw 0 ; direccion de sprite anterior (posiciones 13 y 14). para ordenar
		db 0 ; ruta_id , posicion 15
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
	dw 0 ; direccion de sprite anterior (posiciones 11 y 12). para ordenar
	dw 0 ; direccion de sprite anterior (posiciones 13 y 14). para ordenar
	db 0 ; ruta_id
	let COUNTER = COUNTER-1
	wend


org 27000+512 ; la tabla de sprites ocupa 32 x 16bytes = 512 bytes


;=============================================================================================================
;RUTINA  INSTALL_RSX() 	RSX
;=============================================================================================================
; instala los comandos RSX para usar desde basic
_INSTALL_RSX
		JP _INSTALL_RSX2

		
		; ES MUY IMPORTANTE EL ORDEN, CUANTO MAS ABAJO, MAS TARDA, HASTA 2ms adicionales
RSX_TABLE	defw RSX_NAMETB
		JP _PRINT_SPRITES	;|PRINTSPALL, orden,animall,sync
		JP _COLSPALL		;|COLSPALL
		JP _AUTO_ALL		;|AUTOALL
		JP _MOVER_ALL		;|MOVERALL, dy,dx
		JP _MAP2SP		;|MAP2SP,yo,xo
		JP _SCROLL_STARS	;|SCROLLSTARS, bank,num,color,dy,dx
		JP _COLISION_LAYOUT	;|COLAY, #,@colision
		JP _SETUP_SPRITE	;|SETUPSP, #, param_number, valor
		JP _LOCATE_SPRITE	;|LOCATESP, #,y,x
		JP _PEEK		;|PEEK,dir,@variable
		JP _POKE		;|POKE,dir,@variable
		JP _ANIMA_SP		;|ANIMA, #
		JP _COLISION_SPRITES	;|COLSP, #,@id
		JP _RINK		;|RINK,step
		JP _ANIMA_ALL		;|ANIMALL		
		JP _ROUTEALL		;|ROUTEALL
		JP _PRINT_SPRITE	;|PRINTSP, #,y,x
		JP _MOVER		;|MOVER, #,dy,dx
		JP _AUTO_SPRITE		;|AUTO, #,dy,dx
		JP _PRINT_LAYOUT	;|LAYOUT, y,x,string
		JP _SETUP_SEQUENCE	;|SETUPSQ, #, adr0,adr1,...,adr6
		JP _MUSIC_ON		;|MUSIC, cancion,speed
		JP _MUSIC_OFF		;|MUSICOFF
		JP _SET_LIMITS		;|SETLIMITS, xmin,xmax,ymin,ymax
		JP _PRINTAT		;|PRINTAT,y,x,string
		JP _NOP			;|NOP no es un comando, solo es para medir
RSX_space	db 0,0,0,0

RSX_NAMETB	

		defM "PRINTSPAL"
		db "L"+&80
		defM "COLSPAL"
		db "L"+&80
		defM "AUTOAL"
		db "L"+&80
		defM "MOVERAL"
		db "L"+&80
		defM "MAP2S"
		db "P"+&80
		defM "STAR"
		db "S"+&80
		defM "COLA"
		db "Y"+&80
		defM "SETUPS"
		db "P"+&80
		defM "LOCATES"
		db "P"+&80
		defM "PEE"
		db "K"+&80
		defM "POK"
		db "E"+&80
		defM "ANIM"
		db "A"+&80
		defM "COLS"
		db "P"+&80
		defM "RIN"
		db "K"+&80
		defM "ANIMAL"
		db "L"+&80
		defM "ROUTEAL"
		db "L"+&80
		defM "PRINTS"
		db "P"+&80
		defM "MOVE"
		db "R"+&80
		defM "AUT"
		db "O"+&80
		defM "LAYOU"
		db "T"+&80
		defM "SETUPS"
		db "Q"+&80
		defM "MUSI"
		db "C"+&80
		defM "MUSICOF"
		db "F"+&80
		defM "SETLIMIT"
		db "S"+&80
		defM "PRINTA"
		db "T"+&80
		defM "NO"
		db "P"+&80
		

		db 0
ENDRSX
_INSTALL_RSX_end



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
_AT		ld b, (IX+3);es el mas signific. 
		ld c,(IX+2);menos signific
		ld (SPR_coordy), bc; NUEVO v27b
		ld (HL),C
		inc hl
		ld (HL),B
		;----- coord x -----
		inc HL
		ld b, (IX+1);es el mas signific. 
		ld c,(IX+0);menos signific
		ld (SPR_coordx), bc; NUEVO v27b
		ld (HL),C
		inc hl
		ld (HL),B
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


; aqui habia variables pero me las he llevado a un segmento oculto de pantalla






;function body
;-------------------------------------
_PRINT_SPRITE:

PSP:; RUTINA PSP 
		cp 1 ; 1 parametro es que no trae coordenadas
		JR NZ,PSP_xy		
		
		ld (PS2_spid), a; meto un 1 para que PRINTSPALL solo imprima 1
		ld a,(IX+0)
		ld (SPR_ID), a
		ld c,a
		call _get_dir_sp;sprite id en c, retorna hl
		call PS2car; invoca a una parte de PRINTSPALL y ya hace ret desde alli
		; esto ya hace ret solo


PSP_xy
		CALL _LOCATE_SPRITE
		dec hl
		dec hl
		dec hl
		dec hl ; estamos en status

		; vamos a rellenar las coordenadas
		; ---------------------------------
		;ld b,(IX+3); mas signific
		;ld c,(IX+2);menos signific
		;ld (SPR_coordy), bc
       
 	        ;ld h,(IX+1); mas signific
		;ld l,(IX+0);menos signific
		;ld (SPR_coordx), hl


		; voy a extraer el id_sprite 
		;----------------------------
        	;ld b, 0;(IX+5);es el mas signific.  en principio es 0 pues solo hay 32 sprites
		;ld c,(IX+4);menos signific
		;ld a,c
		;ld (SPR_ID), a ; ya tenemos cargado el id_sprite 
		;------------------calculo de la direccion de imagen -----------
		;call _get_dir_sp; sprite id en c, retorna hl
		; ahora en HL esta la direccion de la entrada del sprite en tabla SPRITES__TABLE
		;-------------------------------------------------------------------------------


PSP_i		ld a ,(HL);guardo byte de status para comprobar sobrescritura    			***
		ld (SPR_status), a; guardo el status del sprite						***
		ld (SPR_addr), HL; guardo la dir del sprite (la de la sprite table)			***

		ld bc,9;los bytes 9 y 10 guardan la direccion de la imagen del sprite
		add HL,bc
		; ahora en HL esta la direccion donde esta la direccion de la imagen del sprite
		ld c,(hl)
		inc hl
		ld b, (Hl)
		
		; ahora finalmente en BC ya tenemos la direccion de la imagen del sprite	
		;----------------------------------------------------------------

		
PSP_done

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

		ld a, (SPR_status);										
		and a, %1000000; flag de sobrescritura								
		JR NZ, PSP_owr;	//"owr" es "overwrite"	


PSP_FLIPPING   
		;JR PSP_FLIP_NORMAL`
		; esto hay que arreglarlo usando IX +i 
		;ld a, (FLIP_counter)
		;and a
		;jr z,PSP_FLIP_NORMAL
		; estamos aqui porque algun sprite tiene flip
		;call FLIP_CHECK
              
PSP_FLIP_NORMAL			
		call _PAINT
		ret
		;--------------------- SOBREESCRITURA -----------------------------------------------
PSP_owr	
						
		; si estamos aqui es que hay sobreescritura
		
		call _PAINT_TRANSP
		
		ret



		
;=============================================================================================================
; COMPUTE_DIRPANT()  RUTINA DE COMPUTO DE DIRECCIONES PANTALLA COP
;=============================================================================================================
; inputs
;  SPR_coordy, SPR_coord_x . dos bytes en cada una. la coordx en bytes, la coordy en lineas (=pixels)
; outputs HL

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
		;sla a; x 2
		;sla a; x 2
		;sla a; x 2
		
		add a,a
		add a,a
		add a,a		


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


;function body
;-------------------------------------
_PAINT:  ; dibujar en pantalla el sprite

PNT:
		;ld hl, (SPR_dirpant); direccion de pant donde vamos a pintar
		ld de,(SPR_spritefinal); direccion de memoria donde se encuentra la imagen a pintar
		ld a, (SPR_ancho)
		ld bc,(SPR_anchoaltofinal) ; ancho final en c
		sub c
		ld (PNT_restoancho),a; 
		ld hl, (SPR_dirpant); direccion de memoria de pantalla

		; NO DESHABILITO LAS INTERRUPCIONES, podria ralentizar musica pej.
		; lo malo es que la probabilidad de quedarse a medias imprimiendo aumenta
		
		;di ;disable interrupts. asi no me cortan la impresion desde el firmware
		ex de,hl
		ld a,(SPR_anchofinal)
	
PNT_loop_alto
		push bc; al entrar b contiene el alto, luego se va decrementando
 		push de; pantalla
	
PNT_loop_ancho      
		ld a,b;(SPR_anchofinal); esto es mas rapido que LD A,C
		ld b,0
;PNT_NOP1	NOP; ex de,hl; para pintar en el buffer en lugar de en pantalla					***
PNT_scanh
		ldir; es mas rapido que ldir usando a como contador
		;dec a
		;jr nz, PNT_scanh
		ld b,a
;PNT_NOP2	NOP; ex de,hl; para pintar en el buffer en lugar de en pantalla					***
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
;;		ei; sobra pues no hay di
		ret



;=============================================================================================================
; PAINT_TRANSP() invocada internamente desde PRINT_SPRITE()
;=============================================================================================================

; input SPR_dirpant debe contener la direccion de pantalla
; tambien HL debe contenerla. asi ahorro una linea (la primera)
; variables locales
;-------------------------------------


;function body
;-------------------------------------
_PAINT_TRANSP:  ; dibujar en pantalla el sprite
		;----------------------------------------------

PTR:
		;ld hl, (SPR_dirpant); direccion de pant donde vamos a pintar
		ld de,(SPR_spritefinal); direccion de memoria donde se encuentra el sprite
		ld a, (SPR_ancho)
		ld bc,(SPR_anchoaltofinal) ; ancho final en c
		sub c
		ld (PTR_restoancho),a; 
		ld hl, (SPR_dirpant)

		; NO DESHABILITO LAS INTERRUPCIONES, podria ralentizar musica pej.
		; lo malo es que la probabilidad de quedarse a medias imprimiendo aumenta
		
		;di ;disable interrupts. asi no me cortan la impresion desde el firmware
		ex de,hl
		ld a,(SPR_anchofinal)
	
PTR_loop_alto
		push bc; al entrar b contiene el alto, luego se va decrementando
 		push de; pantalla
	
PTR_loop_ancho      
		ld a,c;(SPR_anchofinal); esto es mas rapido que LD A,C falso
		ld b,a;***

;PTR_NOP1	NOP; ex de,hl; para pintar en el buffer en lugar de en pantalla					***
PTR_scanh
		ld a, (HL); 2 pixels del sprite
		;and a,%10111111
		ld c, a; 		
		and a,%11000000
		;and a,%11111111
		JR Z,PTR_fondo; todo ceros es para reestablecer el fondo en los 2 pixels transp o no transp
		cp %11000000; si los dos son 1, entonces no hacemos nada, no hay que reestablecer nada
		JR Z,PTR_transp; 


		; si estamos aqui es porque solo 1 bit esta a uno

		


		ld a, (HL); 2 pixels del sprite

		

PTR_der		;and a, %01000000
		bit 6,c; comprueba el bit 6 
		JR Z, PTR_izq
		; si estoy aqui es que ese bit no es cero y por lo tanto el pixel a pintar debe ser el de pantalla
		; es decir, no alterar nada
		res 6,c; lo pongo a cero
		ld a, (DE); leo la pantalla
		and a, %01010101; pixel derecho de la pantalla. cojo lo que tenga,incluido el fondo
		or  a,c; no modifico los 1's del pixel izq del sprite, almacenados en c
		ld c,a

		;---mejora de velocidad
		;bit 7,c
		;JR Z, PTR_pinta
		;jr PTR_izq2
		JR  PTR_fondo
		;----fin mejora velocidad


PTR_izq		; si llego aqui a la fuerza el bit es 1
		
		;bit 7,c
		;JR Z, PTR_fondo
		
		; si estoy aqui es que ese bit no es cero y por lo tanto el pixel a pintar debe ser el de pantalla
		; es decir, no alterar nada
		res 7,c 
		;ld a, c
		;and a,%00111111
		;ld c,a; solo el color

PTR_izq2	ld a, (DE)
		and a, %10101010; pixel derecho de la pantalla
		;and a, %01010101; pixel derecho de la pantalla
		or a,c
		ld c,a
		;JR PTR_pinta


PTR_fondo	ld a, (DE); (DE) contiene el fondo
		AND A,%11000000; bin %11100110 192 (192 es 128+64, es decir los dos 1). en total 230 192 
		; el orden es 00221133	

		or a,c; OR del pixel con el fondo (fondo en "A" y pixel en "C")

PTR_pinta	ld (DE), a


PTR_transp	inc de
		inc hl
		;ldi; es mas rapido que ldir usando a como contador
		dec b
		jr nz, PTR_scanh
	
;PTR_NOP2	NOP; ex de,hl; para pintar en el buffer en lugar de en pantalla					***
		; si no se ha transferido todo el ancho
		; debo sumar a HL lo que falta
		ld de,(PTR_restoancho)
		add HL,de 

        	pop DE; saco pant, como si no hubiese sumado el ancho
		ld A,D
		add &08; es decir, 2048 (2KB). ES COMO SUMAR &800
		ld D,A; tras sumar 2048 , lo mete en d
		sub &C0; si ahora salta flag acarreo es porque nos hemos pasado de 64KB al sumar 2048
	
		jp nc,PTR_sig_linea
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
PTR_sig_linea
		pop bc; b tiene el alto, c el ancho
 		djnz PTR_loop_alto; dec b y salta. B contiene el alto
		;ei sobra pues no hay di
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
; _INSTALL_INTERRUPT()   INS  tambien la llamaremos _MUSIC_ON() pues es lo que hace
;=============================================================================================================
; instala una rutina que invoca periodicamente al player de musica

; variables locales
;-------------------------------------
INS_counter	db 0;ultimo instante en que se toco la musica. de una invocacion a otra hay que mantener este valor

;INS_model	dw &B939; model 464=>&B939 ,model 6128=> &B941. al instalar la interrupcion se corrige solo.
INS_cancion	db 0
INS_speed	db 5; una velocidad "normal" es 6. si ponemos 5 estamos acelerando un poco la musica


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
INS_init	ld hl,INS_rutina;// &b939;interrupt_callback
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


		ld a, (INS_speed)
		ld c, a

		LD a, (INS_counter); ultima vez que se toco
		ld b,a
		call &bd0d; TIME PLEASE. DEHL contiene el time en 1/300 fracciones de segundo. cada 6 son 50ms
		ld a, l
		sub b; a-b . Tnow-Tlast =possitive number.
			
		and a; acarreo a cero
		cp c; comparamos con speed

		JR C, INS_FIN

		; si estamos aqui es que hay que tocar musica ya que no hay acarreo por lo que Tnow>=Tlast+speed
		; si l es 254 y b es 5 no salta el acarreo pero no hemos llegado!!
		
		;JR NC, INS_FIN

		; actualizacion del contador
		ld a,l
		;ld hl, INS_speed
		;add a,(hl); a=contador anterior cuando se toco la musica + speed(=demora)
		LD (INS_counter),a; guardo el contador


		;ld a, 65
		;CALL &BB5D ; esto simplemente es un experimento. imprime una "A" periodicamente

tocar		
		call INICIO; invoca al player de musica
		

		;ld a,(INS_speed); deberia ser 6 pero el basic nos hace perder algunas y se relentiza. asi se acelera un pelin
		;LD (INS_counter),A	

		
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
		ret Z; nada que actualizar, pues la secuencia asignada es cero = no secuencia

		;----nuevo v25 para macrosecuencias
		cp 32
		JR C, ANS_nomacro
		CALL _MACROSEQ
		and a
		ret Z; una macrosecuencia no puede ser de muerte
		;---- end v25 macrosecuencias -----------------

ANS_nomacro
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

; function body
;-------------------------------------
_ANIMA_ALL
		ld a, NUM_SPRITES-1 ;empezamos por el ultimo sprite
		ld (ANI_spid), a

		ld HL, _SPR_SPRITES_TABLE;27000;new
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
		
ANI_fin		
	
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
LAY_PAT1	add a,a; x2 
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
LAY_PAT2	call LAY_update_map
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
LAY_PAT3	add a, 4; 8 pix son 4 bytes
		ld (LAY_coordx),a ; coordenada x actualizada
		ld a, (LAY_coordxchar)
		inc a
		ld (LAY_coordxchar),a; coordenada para el mapa de caracteres actualizada
		inc hl; siguiente direccion tiene el siguiente char
		jr LAY_buc

		; yo creo que aqui falta un ret
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
;	param_number=7 --> cambia secuencia (ocupa 1byte). se puede poner macrosecuencia
;	param_number=8 --> cambia frame_id (ocupa 1byte)
;	param_number=9 --> cambia dir imagen (ocupa 2bytes)
;	param_number=15 --> cambia ruta (ocupa 1byte)

; variables locales
;-------------------------------------

; function body
;-------------------------------------
_SETUP_SPRITE;
		; mejora en v21. si hay 4 parametros supongo que es SETUPSP,<id>,5,Vy,Vx
		cp 4
		JR NZ, SET3param
SET4param	ld c,(ix+6); id_sprite
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

SET3param	ld c,(IX+4);menos signific. aqui tenemos el sprite id
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


		; mejora v26	
		dec hl
		call _check_image_list; INPUT HL con la direccion, y su contenido la imagedir o el image_number
		;----------fin mejora
		ret
		; si se trata del parametro sequence, llamo adicionalmente a anima para que 
		; reemplace el campo de direccion de memoria de imagen, asignando un 7 al frame id
SET_7		cp 7 
		JP NZ,SET15
		;ret NZ
		; voy a poner un 7 en frame id, para que en la proxima animacion cicle a frame=0
		inc hl
		ld a,7
		ld (HL), a; frame 7
		; y ahora animamos
		ld a, (IX+4); sprite id lo cargo en A
		call ANS_a; invoco anima con el sprite id en regisro a, asi se pone en primer frame
		ret

		; queda comparar con parametro 15, que es la ruta
		; lo hago en el tramo de codigo 26000 a 27000
		;JP SET15

SET15		cp 15
		RET NZ
		;ya hemos puesto la ruta.
		;falta resetear la entrada en la tabla de segmentos y pasos
		; actualizacion paso (decremento)
		;ld HL,_ROUTE_TABLE
;		ld b,0
		ld a, (IX+4); spriteid
		call _resetruta;
		ret
		
;---------------------------------------------------------------------------------
;_check_image_list   CIL
;minirutina para transformar imagenumber en imagedir 
;input HL con la direccion y su contenido la imagedir o el imagenumber
_check_image_list
		;--protecciones
		push hl
		push bc
		;
		push hl; guardo la direccion donde hay que almacenar la imagedir
		ld c, (hl)
		inc hl
		ld b,(hl)
		push bc; guardo direccion imagen o imagenumber, aun no se lo que es
		ld h, b
		ld l,c
		ld bc,255
		and a
		sbc hl,bc
		JR NC, CIL_imagedir
		pop hl; aqui tengo un numero # <255
		push hl
		ld bc,16
		and a
		sbc hl,bc
		JR C, CIL_imagedir
		pop hl; aqui tengo un numero 15> # <255

		ld bc, 16
		and a
		sbc hl,bc
		add hl, hl; hl=hlx2
		ld bc, IMAGE_LIST
		add hl,bc
		ld c,(hl)
		inc hl
		ld b, (Hl)
		pop hl
		ld (hl),c
		inc hl
		ld (hl),b
		
		jr cil_end

CIL_imagedir	pop bc ; si llegamos aqui con JR NC es que el registro BC contenia una direccion
		pop hl


CIL_END		;--protecciones
		pop bc
		pop hl
		;

		ret

;============================================================================================================
;_SETUP_SEQUENCE(#, adr0,adr1,...,adr7) SEQ
;=============================================================================================================
; esta funcion da de alta una secuencia de animacion en la tabla de secuencias de animacion
; variables locales
;-------------------------------------

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
		; ----mejora v26
		call _check_image_list; INPUT HL con la direccion, y su contenido la imagedir o el image_number
		;---- end mejora
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


; function body
;-------------------------------------
_AUTO_SPRITE
		ld a, (IX+0); sprite id
		ld (MOV_id), a
		ld c, a
		; calculo de la direccion del sprite
		call _get_dir_sp; A=num sprite, retorna HL con la direccion
		JR MOV_uno; solo voy a mover uno

_MOV_i		ld a, (HL); status en A
		;AND %10001000; cuarto bit es el de movimiento automatico
		AND %1000; cuarto bit es el de movimiento automatico
		RET Z ; si el flag es inactivo no hacemos nada

		; si estamos aqui es porque el sprite tiene flag de mov auto o ruta
		; voy a ver si tiene de ruta
		;cp %10001000
		;JR NZ, MOV_uno
		; estamos aqui porque hay que hacerle el routeall
		


MOV_uno		ld (MOV_address),hl; guardo la direccion de comienzo del sprite

		;update y
		ld bc, 5
		add hl,bc
		ld c , (HL); en c esta Vy
		ld b,0; ojo puede no ser cero
		bit 7,c
		jr Z, MOV_positivoY; Vy es positivo
		dec b; ahora b=255 ya que c es un numero negativo
MOV_positivoY   ld hl, (MOV_address)
		inc hl; me coloco en la posicion Y
		push HL; guardo la direccion de coord Y
		ld e, (Hl)
		inc hl
		ld d, (HL)
		; ahora en DE esta la Y
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

MOA_flag_route	db 0

; function body
;-------------------------------------
_AUTO_ALL
		
		and a
		JR Z,MOA_noparam
		ld a, (IX+0)
		ld (MOA_flag_route),a
MOA_noparam	ld a,(MOA_flag_route)
		cp 1
		CALL Z, _ROUTEALL; invoca a ROUTEALL si hay flag de ruta

		ld a, NUM_SPRITES-1 ;empezamos por el ultimo sprite
		ld (MOA_spid), a
		
		ld hl,27496
		push hl 
MOA_bucle	

		;call MOV_a; invoca a animacion de sprite i
		call _MOV_i
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


; variable umbral ASCII para considerar colision, introducida en version v23b
; si el caracter con el que colisiona es superior al umbral, entonces hay colision
COL_umbral	db 32; por defecto es el espacio en blanco " ", cuyo ASCII es 32

; function body
;-------------------------------------
_COLISION_LAYOUT

		cp a, 3; si hay 3 parametros es que llega el umbral de colision
		JR NZ, COL_noumbral
		ld a, (IX+4)
		ld (COL_umbral),a

COL_noumbral
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
		
		ld c,a
		and a; quito el flag C
		ld a, (COL_umbral); 
		sub c; si c es superior al umbral, hay acarreo

		;sub 32; si es 32 (32 es " ") entonces A sera cero
		
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
CO2_MARGENY	ld bc,2; ayudita (2 lineas de margen). se modifican por configuracion con COLSP,34,dy,dx
		;and a ; acarreo a cero
		; caso 1 y2ini > y1fin -> no hay solape
		ld hl,(CO2y2ini)
		add HL,bc; ayudita para que no te coman facil **********
		ld de, (CO2y1fin)
		and a ; acarreo a cero
		sbc hl, de
		JP P, CO2_NOCHOCA
		;JR NC, CO2_NOCHOCA
		; caso 2 y1ini > y2fin -> no hay solape
		;and a ; reset acarreo
		ld hl,(CO2y1ini)
		add HL,bc; ayudita para que no te coman facil ***********
		ld de, (CO2y2fin)
		and a ; acarreo a cero
		sbc hl, de
		;JR NC, CO2_NOCHOCA
		JP P, CO2_NOCHOCA
		; si no se cumple uno de los casos anteriores, es que hay solape

		; chequeo solape X
		; -------------------
		; caso 1 x2ini > x1fin -> no hay solape
		; OJO!!! si x2ini es negativo esto no funciona!!!!!!
CO2_MARGENX	ld bc,1; ayudita (1 byte de margen)
		;and a ; reset acarreo
		ld hl,(CO2x2ini)
		add HL,bc; ayudita para que no te coman facil ***********
		ld de, (CO2x1fin)
		and a ; reset acarreo
		sbc hl, de
		;JR NC, CO2_NOCHOCA
		;JR Z,  CO2_NOCHOCA
		JP P,  CO2_NOCHOCA
		; caso 2 x1ini > x2fin -> no hay solape
		;and a ; reset acarreo
		ld hl,(CO2x1ini)
		add HL,bc; ayudita para que no te coman facil ***********
		ld de, (CO2x2fin)
		and a ; reset acarreo
		sbc hl, de
		;JR NC, CO2_NOCHOCA
		;JR Z,  CO2_NOCHOCA
		JP P,  CO2_NOCHOCA
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

; me he llevado algunas a la zona que acaba en 27000 para ganar unos bytes y asi
; poder chequear si num stars =0 y retornar

;SCS_pen		db 64; el byte (2ndo pix mode 0) que vamos a pintar. esto es una constante
;SCS_check	db 0

;SCS_incy	db 2; lo que vamos a mover en eje y
;SCS_incx	db 1; lo que vamos a mover en eje x

;SCS_counter	db 20
;SCS_number	db 20

;star_color	db 64
bkgd_color	db 0


SCS_initstar	db 0



; function body
;-------------------------------------
_SCROLL_STARS
SCS:
		; optimizacion. si no hay parametros asumo los ultimos
		and a
		jr nz, SCS_sigue
		LD A, (SCS_number)
		and a
		ret Z; si num estrellas =0 entonces no hay nada que hacer
		ld a, (SCS_initstar)
		jr SCS_START
		
SCS_sigue
		ld a, (ix+6)	; numero maximo de estrellas
		ld (SCS_number),a
		ld (SCS_counter),a
		and a
		ret Z; si num estrellas =0 entonces no hay nada que hacer

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
		ld (SCS_check),a; solo borro si encuentro un SCS_pen
		ld a, (bkgd_color)
		ld (SCS_pen),a; poner un bkgd_color es borrar

		;----modo borra
		;ld a,0
		;ld (SCS_type),a
		;-----

		call SCS_paint; no altera HL

		;----modo pinta
		;ld a,1
		;ld (SCS_type),a
		;-----

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
		
		;ld b, a; y antes	
		add a, c; 
		;cp b; y - yant no puede NO dar acarreo. si lo da, hay que saltar
		; si da acarreo es porque y ha cruzado el cero
		jr nc,SCS_Ycycle
		;jp nc, SCS_Ycycle
		; ahora comparo la y actualizada con ymin
		; ambos los puedo considerar ahora numeros positivos
		ld c,a ; guardo y
		inc c
		ld a,(SPR_MIN_Y)
		and a; reset acarreo
		cp c;	(a-c = ymin-y)
		jp nc,  SCS_Ycycle; ymin>y, lo cual no debe ocurrir
		dec c
		; si es cero o positivo (sin acarreo) no hay que salir por abajo
		ld a,c; le vuelvo a dar su valor
		Jr SCS_finwritey; si y > ymin sale negativa la resta	y hay acarreo			

SCS_Ycycle	
		; el problema de ciclar es que tenemos aqui una aritmetica modular de modulo MAX-MIN y no de modulo 255
		; basta con sumar max y restar min 
		;LD HL,SPR_MAX_Y
		;add a,(HL)
		;ld HL, SPR_MIN_Y
		;sub (HL)		

		ld HL,SPR_DIFY
		add a,(HL)



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
SCS_incxneg	ld c, a; ahora C tiene incx
		ld a, (HL); coord x, pues HL apunta a starbuffer
		;ld b, a; y antes	
		add a, c; EL REGISTRO c CONTIENE UN NUMERO NEGATIVO, por lo que es una resta.
		; si el resultado desborda es que ha ciclado. 

		JR nc, SCS_Xcycle
		; Si no desborda aun asi puede que tengamos que ciclar
		; ahora comparo la y actualizada con ymin
		; ambos los puedo considerar ahora numeros positivos
		ld c,a ; guardo x nueva
		inc c; esto era para que no de cero cuando sean iguales
		
		ld a,(SPR_MIN_X)
		and a; reset acarreo
		
		cp c;	(a-c = ymin-y)
		jp nc,  SCS_Xcycle; ymin>y, lo cual no debe ocurrir
		
		dec c; lo dejo como estaba
		; si es cero o positivo (sin acarreo) no hay que salir por abajo
		ld a,c; le vuelvo a dar su valor
		Jr SCS_finwritex; si y > ymin sale negativa la resta	y hay acarreo			

SCS_Xcycle	
		;LD HL,SPR_MAX_X; pej 80
		;add a,(HL)
		;ld HL, SPR_MIN_X; pej 0
		;sub (HL)				

		ld HL,SPR_DIFX
		add a,(HL)



		;ld a, (SPR_MAX_X); sale por ariba , entra por abajo
		dec a; el max es justo el byte que ya no se pinta, debo restar 1
		jr SCS_finwritex

		; scroll hacia dere 
		;--------------------
SCS_incxpos	ld c, a; c tiene incy
		ld a, (HL); coord y, pues HL apunta a starbuffer
		
		add a, c; sumo incx.

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
		ld (HL),a; actualizacion de la coordenada x
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



; function body
;-------------------------------------
_MOVER_ALL
		; si no hay parametros hay que cargar los desplazamientos desde los punteros
		and a
		JR NZ,MRA_param

		call get_offsets_from_pointers
		JR MRA_noparam

		; cargo los desplazamientos y,x
MRA_param	call get_offsets
MRA_noparam		
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


	

;============================================================================================================
; _MOVER(#,dy,dx)   MOR
;=============================================================================================================
; mueve de forma relativa un solo sprite, sumando y,x a sus coordenadas actuales
; si #=32 entonces como es un sprite que no existe se considera que nos estan dando las direciones
; de las variables donde se almacenan dy, dx para invocar a MOVERALL sin parametros, es decir
;  MOVER, 32, @dy,@dx
;
; variables locales
;-------------------------------------
MOR_ypointer dw 0; direccion de una variable basic dy
MOR_xpointer dw 0; direccion de una variable basic dx

; function body
;-------------------------------------
_MOVER
		; si no hay parametros se usan las variables de los punteros configuradas con MOVER, 32, @dy,@dx
		cp 1
		JR NZ, MOR_params
		call get_offsets_from_pointers
		ld c, (IX+0)
		JR MOR_noparams

MOR_params	call get_offsets; esto carga dy y dx en MOR_y y MOR_x
		; cargo el sprite number
		ld c, (ix+4)

MOR_noparams	; mejora. V26
		; IF #=32 entonces es un comando de control para usar punteros en el offset
		ld a,c
		cp 32
		JR NZ, MOR_param
		; si estamos aqui es que nos han dado el sp=32 y por lo tanto MORY y MORX son direcciones de memoria
		ld a,(MOR_y)
		ld l,a
		ld a,(MOR_y+1)
		ld h,a
		ld (MOR_ypointer),HL
		
		ld a,(MOR_x)
		ld l,a
		ld a,(MOR_x+1)
		ld h,a
		ld (MOR_xpointer),HL
		ret
		; fin mejora v26

MOR_param
		call _get_dir_sp; input c=sprite id, output HL tiene la direccion
		jr MOR_uno; si es un solo sprite no chequeo el flag de status

MOVER_i		
		ld a, (HL); lee el estado del sprite
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

get_offsets_from_pointers
		ld HL, (MOR_ypointer); hl es una direccion
		ex de,hl
		ld a,(de)
		ld l,a
		inc de
		ld a,(de)
		ld h,a
		ld (MOR_y),hl
		ld HL, (MOR_xpointer); hl es una direccion
		ex de,hl
		ld a,(de)
		ld l,a
		inc de
		ld a,(de)
		ld h,a
		ld (MOR_x),hl
		ret


;=============================================================================================================
; _PRINT_SPRITES(spriteid_final_orden, anima, sync)   PS2
;=============================================================================================================
; esta rutina pinta todos los sprites activos
; puede sincronizar si se lo indicamos con sync!=0
; puede animar los sprites antes de imprimirlos si anima!=0 (vale 1 o mayor)
; puede ordenar por coord y desde el sprite 0 hasta el sprite que se indique
; si sprite_id_final =0 no hay ordenamiento y se recorre secuencialmente (mas rapido)
;
; variables locales
;-------------------------------------
;PS2_spid	db 0
PS2_flag_anim	db 0;
PS2_flag_sync	db 0;
PS2_orden	db 0; flag de ordenar y recorrer en orden


;function body
;-------------------------------------
_PRINT_SPRITES

PS2:


		; mejora. si los paramtros no llegan supongo lo que pongan los flag
		; que son lo ultimo que se invoco
		and a
		JR Z, PS2_noparam; si es NZ es que han llegado parametros
	
		; si estamos aqui es que hay parametros
		cp 3
		JR NZ,PS2_param
		
		ld a,(IX+4);menos signific. 
		;cp a,0
		;and A ; es como cp a,0 pero consume solo 1 ciclo.
		;ld (PS2_flag_orden),a
		ld (PS2_orden),a



PS2_param	; primero compruebo animacion pues si primero sincronizo, pierdo el tiempo de barrido		
		ld a,(IX+2);menos signific. si es 0 no habra sync
		;cp a,0
		;and A ; es como cp a,0 pero consume solo 1 ciclo.
		ld (PS2_flag_anim),a
		
		; aqui falta recoger el parametro de flag de orden y el de sincronismo
		ld a,(IX+0)
		ld (PS2_flag_sync),a

PS2_noparam

		;CALL _AUTO_ALL
		ld a, (PS2_flag_anim)
		and a
		call NZ, _ANIMA_ALL

		
PS2_mas		ld a, (PS2_orden)
		and a
		;cp 31 ; si Sprite>=31  no se ordena nada, se recorre en modo secuencial
	 	;JR NC,PS2_ns ; ns es NO SORT = no ordenar. en ese caso se recorren secuencialmente

		JR Z, PS2_ns; si es cero es que no sort

		; ordenamiento de la tabla de sprites
		ld a,1; modo ordenar por coord Y
		ld (SOR_mode),a
		call _SORTY
		;------------

		ld de, PS2_sort
		ld (PS2_sd+1), de; para rellenar un JR PS2_sort
		ld de, PS2_sortsig
		ld (PS2_sig+1),de
		ld bc, (SOR_ini)
		dec bc
		ld (PS2_dini+1), bc 
		JR PS2_chksyn

PS2_ns		; modo ns ("no SORT") (no se llama a SORTY y se recorre secuencialmente)
		ld de, PS2_nosort
		ld (PS2_sd+1), de
		ld de, PS2_nosortsig
		ld (PS2_sig+1),de
		ld bc, _SPR_SPRITES_TABLE
		ld (PS2_dini+1), bc


		; ahora chequeamos sincronismo
PS2_chksyn	;ld a,(IX+0);menos signific. si es 0 no habra sync
		;and A ; es como cp a,0 pero consume solo 1 ciclo.
		ld a, (PS2_flag_sync)
		
ps2_chk3	and a
		JR z, PS2_all
		; sincronismo con barrido
		call _SYNC
		;call &bd19


; llegamos aqui tras animar y sincronizar con barrido
PS2_all:

		; recorremos los 32 sprites desde el 0 hasta el 31
		;---------------------------
		ld a, NUM_SPRITES;-1 ;empezamos por el ultimo sprite. OJO esto solo es un contador. no es el sprite id
		ld (PS2_spid), a
		; la direccion de memoria es el verdadero contador de sprites
		;ld a, (PS2_flag_orden)
		;and a
		;JR Z, PS2_ini
		;ld HL, (SOR_ini);impresion ordenada
		;dec hl
		;JR PS2_bucle
		
PS2_ini		;ld HL, _SPR_SPRITES_TABLE; EMPEZAMOS A IMPRIMIR EL CERO		

PS2_dini	ld HL, 0;direccion del sprite inicial (se rellena antes, no es cero)		

PS2_bucle	

		push HL

PS2_sd		JP PS2_nosort; modo ordenado y no ordenado. la direccion de salto se sobreescribe si es modo sort

		; recorrido ordenado (codigo extra). 
		;-------------------------------------------------
		;push hl
PS2_sort	ld bc, 13
		add HL,bc; hl ahora esta en la direccion donde se guarda siguiente
		;ahora debo leer lo que hay en esa direccion. debe de indicar el siguiente sprite+1
		ld e,(hl);2
		inc hl;1
		ld d,(hl);2 ciclos
		;ld (SOR_next),bc
		
		ld (PS2_dirsig+1),de; esto ahorra una indireccion
		dec hl
		sbc hl, bc; lo dejo como estaba
		;pop hl
		;----------------------
PS2_nosort
		;ld (SPR_ID), a; A NO CONTIENE EL SPRITE ID							***


		; miro estado
		ld a, (HL); en A cargo el status
		and %00000001
		JR Z, PS2_next;

		

PS2car		; debo cargar x e y
		inc HL; coord y
		ld a,(hl) ; low byte
		ld (SPR_coordy),a
		inc hl
		ld a,(hl); high byte
		ld (SPR_coordy+1),a

		; la coordenada Y ya esta cargada
		;-------------------------------------------------------
 
PS2_fase	; ahora cargamos la coordenada X
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
		
PS2_noc		

		dec a
		ld (PS2_spid), a
		;JP M, PS2_fin; si es negativo es que ya hemos animado el sprite 0
		JR Z, PS2_fin; si es negativo es que ya hemos animado el sprite 0
		
PS2nos

PS2_sig		JP PS2_nosortsig; la direccion se altera segun el flag

		; actualizo el puntero a la direccion de sprite i
PS2_nosortsig	ld bc, sprite_size
		add HL, bc ; HL apunta al siguiente sprite  <----se imrime primero el 0 y se va sumando hasta el 31
		JR PS2_bucle

		; actualizacion con sprites ordenados
		;------------------------------------
PS2_sortsig	
		;ld HL,(SOR_next)
PS2_dirsig	ld HL,0; la direccion se sobreescribe antes, no es cero
		dec hl; porque guarda la dir de la coordy. CAMBIARLO para que guarde dir sprite.. solo es 1 ciclo
		JR PS2_bucle
		
PS2_fin		
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
	ld b,(IX+1); en bc tengo el dato
	ld l,(ix+2)
	ld h,(ix+3); en hl la direccion
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
	ld h,(ix+3); en hl tengo la direccion

	ld c,(hl)
	inc hl
	ld b,(hl); en bc tengo el dato
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
; variables globales
;-------------------------------------
COA_colider	dw 0; direccion de memoria de colider

; variables locales
;-------------------------------------
;COA_spid	db 0; contador


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

;=============================================================================================================
;RUTINA  _RINK 				(INK)
; usos:
;   RINK t_ini,t1,t2,t3,t4,t5,t6,t7,t8  para establecer patron de 8 tintas de rotacion
;   RINK t_ini,t1,t2,t3,t4   para establecer patron de 4 tintas de rotacion
;   RINK step  para mover las tintas un step, que puede ser mayor o menor segun velocidad deseada
;=============================================================================================================
; esta funcion hace una rotacion de tintas 
; puede tener 9 parametros o solo 1
; si se invoca con 9 parametros estamos pasando la tinta inicial donde comienzan las 8 que van a rotar y 
; el patron de 8 tintas a mover. por ejemplo si invocamos con RINK, 8,3,3,3,3,24,24,24,24
; significa que las tintas [8..15] van a rotar con un patron de franjas (4 rojas y 4 amarillas)
; si se invoca con 5 parametros estamos pasando la tinta inicial donde comienzan las 4 que van a rotar y 
; el patron de 4 tintas a mover. por ejemplo si invocamos con RINK, 8,3,3,24,24
; significa que las tintas [8..11] van a rotar con un patron de franjas (2 rojas y 2 amarillas)
; si se invoca con 1 parametro estamos pasando el step
; para dar sensacion de mas velocidad simplemente hay que aumentar el step
; t1...t8 es el patron de color que se va a hacer rotar. pueden ser franjas o cualquier cosa


;local variables
;---------------------
;ink_tinta	db 2; current tinta a cambiar
ink_index	db 0; valor puntero. de una invocacion a la siguiente hay que preservarlo
		; ink_index es la tinta a la que le toca ser t1 en esta invocacion.

ink_tini	db 1; tinta inicial de rango 
;ink_tfin	db 10; tinta final de rango
ink_t1		db 3; tinta 
ink_t2		db 3; tinta 
ink_t3		db 3; tinta 
ink_t4		db 3; tinta 
ink_t5		db 24; tinta 
ink_t6		db 24; tinta 
ink_t7		db 24; tinta 
ink_t8		db 24; tinta 
ink_step	db 0; salto a dar

;ink_len		db 8; longitud de patron 8 o 4 (meto 7 o 3)

ink_counter_aux db 0;longitud de patron 8 o 4 (meto 7 o 3)
;function body
;-------------------------------------

;carga de parametros de entrada
_RINK
		; recogida de los 8 colores de franja
		cp a,1
		jr z, ink_noparam

		; Si llegamos aqui es porque nos estan pasando un patron
		
		
		
		push IX
;		pop hl

		cp a,5; patron corto
		jr nz, ink8

ink4		ld BC,ink_t4
		ld d,4; contador
		dec a
		jr _inkbuc
		
ink8		ld BC,ink_t8
		ld d,8; contador
		dec a
_inkbuc		

		ld (ink_counter_aux),a		
		dec a; a= num param -1
		;ld (ink_counter_aux),a		


		ld hl, ink_and1+1
		ld (hl),a
		ld hl, ink_and2+1
		ld (hl),a
		ld a,0		
		ld (ink_index),a

		pop hl
		
_inkbuc8		
		
		
		
		ld a,(hl)
		ld (BC),a
		inc hl
		inc hl
		dec bc
		dec d

		JR nz,_inkbuc8
		; voy a recoger ink_tini que es el ultimo parametro
		ld a,(hl)
		ld (ink_tini),a

		ret

ink_noparam	; recogida de step
		
		ld a,(ix+0); aqui esta el step, es el unico parametro
		ld (ink_step),a
		ld b,a
;ink_noparam
		ld a, (ink_index)
		add b ;b tiene el step
ink_and1	and a, %111; si index+step se sale de rango pues nos colocamos al ppio con aritmetica modular

		ld (ink_index),a; actualizado el index [0..7]
		;ld a, 8
		;ld (ink_counter),a
		ld a, (ink_counter_aux)
		ld (ink_counter), a

		ld a,(ink_tini)
		dec a
		ld (ink_cambiar),a; si tini es 1, entonces ink_cambiar inicialmente es cero, pero es para sumar 

		;call &bd19
		DI; nuevo. Que nos corten a la mitad puede provocar un fallo de color grave
		;aunque no he visto fallos pero por si acaso
ink_bucle       
		;seleccion de tinta a alterar
		ld a, (ink_cambiar)
		inc a
		ld (ink_cambiar),a; la primera vez es tini
		
		;seleccion de tinta a poner
		ld a, (ink_index)
		inc a
ink_and2	and %111

		ld (ink_index),a
		ld c,a
		ld b,0
		ld hl, ink_t1
		add hl, bc
		ld a,(hl)
		ld b,a
		ld c,b
		; comando ink
		ld a,(ink_cambiar)
		call &bc32; rutina de firmware de cambio de tinta

ink_finbucle		
		ld a, (ink_counter)
		dec a
		JR z, ink_fin
		ld (ink_counter),a; decremento contador
		jr ink_bucle
		
ink_fin		EI; NUEVO
	
		ret




;=============================================================================================================
;RUTINA DE SINCRONISMO _SYNC() (SYN)
;=============================================================================================================
; esta funcion espera al barrido de pantalla de un modo 
; mas "correcto" que ra rutina del firmware call &bd19

; se puede eliminar para ahorrar memoria, reemplazandola por call &bd19, aunque ocupa poco (6 bytes)

; de momento el sitio desde donde se invoca (PRINTSPALL lo he cambiado por call &bd19

_SYNC:

SYN:

		ld c,0
		ld b,#f5; PPI port B
SYN_lee:
		in a,(c)
;		; (bit 0 = "1" if vsync is active,
;		;  or bit 0 = "0" if vsync is in-active)
		rra; put bit 0 into carry flag
		jr nc,SYN_lee
SYN_ret		ret
		
_END_8BP

