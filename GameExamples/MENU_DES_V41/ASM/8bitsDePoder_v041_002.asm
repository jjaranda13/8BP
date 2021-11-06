;=============================================================================================================
;   8888   BBBBBB   PPPPPP
;  88  88   BB  BB   PP  PP
;  88  88   BB  BB   PP  PP
;   8888    BBBBB    PPPPP     8 bits de poder . Un tributo al AMSTRAD CPC                  
;  88  88   BB  BB   PP                                      
;  88  88   BB  BB   PP
;   8888   BBBBBB   PPPP
;
; Jose Javier Garcia Aranda 2016-2020
;    Las limitaciones no son un problema. son una fuente de inspiracion
;
; CONJUNTO DE RUTINAS ASM PARA PROGRAMAS (JUEGOS) BASIC
; ------------------------------------------------------------------------------------------------------------
; las funciones usables desde basic las denoto con etiquetas asm con formato  "_<function name>"
;
; tras invocar "call _INSTALL_RSX" desde BASIC, usando "CALL &6b78" dispondras de los siguientes comandos
;
;|ANIMA, #                          -> cambia el fotograma de un sprite segun su secuencia
;|ANIMALL                           -> cambia el fotograma de los sprites con flag animacion activado
;|AUTO, #                           -> movimiento automatico de un sprite de acuerdo a su velocidad
;|AUTOALL                           -> movimiento de todos los sprites con flag de mov automatico activo 
;|COLAY, umbral,@col,#              -> detecta la colision con el layout y retorna 1 si hay colision
;|COLSP, #,@id                      -> retorna primer sprite con el que colisiona #
;|MAP2SP, y,x			    -> crea sprites para pintar el mundo en juegos con scroll
;|MOVER, #,dy,dx                    -> movimiento relativo de un sprite
;|MOVERALL, dy,dx                   -> movimiento relativo de todos los sprites con flag de mov relativo activo
;|LAYOUT, y,x,@string               -> imprime un layout de imagenes de 8x8 y rellena map layout
;|LOCATESP, #,y,x                   -> cambia las coordenadas de un sprite (sin imprimirlo)
;|MUSIC,ch_c,loopflag,cancion,speed -> comienza a sonar una cancion a la velocidad deseada. sin parametros para la musica
;|POKE, direccion, valor	    -> acepta valores negativos. es un poke de 16bit
;|PEEK,dir,@variable	    	    -> lee valores negativos. es un peek de 16bit
;|PRINTAT,flag,y,x,@string          -> imprime una cadena de caracteres (minicaracteres)
;|PRINTSP, #,y,x                    -> imprime un sprite sin tener en cuenta byte de status               
;|PRINTSPALL,ini,fin,anima,sync     -> imprime todos los sprites 
;|RINK,salto			    -> Rota un conjunto de tintas (4 u 8) de acuerdo a un patron definible
;|ROUTEALL			    -> cambia la velocidad de los sprites de acuerdo a sus rutas (flag ruta)
;|SETUPSP, #, param_number, valor   -> modifica un parametro de un sprite
;|SETLIMITS, xmin,xmax,ymin,ymax    -> define la ventana de juego, donde se hace clippling
;|STARS, starini,numstars,color,dy,dx  -> scroll de un banco de estrellas en cualquier direccion y velocidad
;|UMAP,dirmapini, dirmapfin,yini,yfin,xini,xfin ->actualiza el mapa del mundo 
;
; tablas de datos accesibles desde BASIC
; -------------------------------------------
; 42540	    STARS0 tabla de 40 estrellas (y,x) 1 byte por coordenada. Usar POKE para rellenarla
; 27000     SPRITES_TABLE tabla de 32 sprites de 16bytes cada uno. Usar |SETUPSP o |LOCATE para tocarla
; 42040	    MAP_TABLE tabla de hasta 82 entradas con el mapa del mundo en imagenes
;--------------------------------------------------------------------------------------------------
; Ensambladas a partir de direccion 24000. La primera instruccion BASIC debe ser memory 23999 para
; colocar HIMEM en 23999 y asi no machacar las rutinas que comienzan en 24000
; los sprites deben dibujarse a partir de direccion 33600 por lo que disponemos de  8.4KB para graficos
; El programa basic podra ocupar hasta 24KB, pero cuidado, las variables de basic
; tambien ocupan memoria de modo que tu programa debe de ser menor de 24 KB
; 
; Salvar un programa creado con 8bp
; ---------------------------------
; Para salvar las diferentes partes de tu programa ejecuta lo siguiente
;  SAVE "8BP.lib",b,24000,8200  version de 8BP especifica de tu juego. es necesario hacerla
;  SAVE "music.bin",b,32200,4300 tus musicas
;  SAVE "sprites.bin",b,33600,8440 tus sprites
;  SAVE "mapa.bin",b,42040,500 tu mapa
;
; Para salvar tu juego mas facil puedes salvar todo el binario de una sola vez
;  SAVE "tujuego.bin",b,24000,18620,&6b78
;
; Por ultimo, es acosejable que tu programa se cargue mediante un "cargador" que carga la
; libreria 8bp y los sprites y la musica, y a continuacion tu programa
;
;10 MEMORY 23999
;20 LOAD "!8bp.lib"   <--- esta libreria, incluye tabla de sprites y layout de pantallas
;30 LOAD "!music.bin"  <--- musica (dos ficheros generados por el editor de musica)
;40 LOAD "!sprites.bin" <--- graficos y tabla de secuencias
;45 LOAD "!mapa.bin" <--- mapa del mundo
;50 RUN "!tujuego.bas"  <--- tu juego se carga al final con RUN, reemplazando este listado BASIC
;
; Tambien puedes simplificar el cargador si has optado por hacer un solo binario
;10 MEMORY 23999
;20 LOAD "!tujuego.bin"   <--- carga libreria, graficos y musica
;30 RUN "!tujuego.bas"  <--- tu juego se carga al final con RUN, reemplazando este listado BASIC
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
;       | sprites (casi 8.5KB para dibujo) 
;       |    
;       +---------- 
;       | definiciones de rutas (de longitud variable cada una)
;       +----------
;	| secuencias de animacion de 8 frames (16 bytes cada una)
;	| y grupos de secuencias de animacion (macrosecuencias)
; 33600 +---------- 
;       | canciones (1.4 KB para musica editada con WYZtracker 2.0.1.0)       
;       |		       
; 32200 +----------
;       |  rutinas 8BP  (8200 bytes)
;       |	 aqui estan todas las rutinas y la tabla de sprites
;       |        incluye el player de musica "wyz" 2.0.1.0
; 24000 +---------- 
;       |  |variables el BASIC
;       |  V
;       |  
;       |  ^ BASIC (texto del programa)
;       |  |
;     0 +---------- 
;
; En el codigo asm de todas estas rutinas:
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

SPR_image:; direccion de la imagen (empezando por ancho y alto) que va a usar la rutina de impresion
		dw 0
SPR_image_data:; direccion de la imagen (datos). simplemente es (SPR_image)+2
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
SPR_imagefinal: ; direccion de dibujo del sprite tras el clipping
		dw &0000
SPR_dirpant:
		dw &0000; direccion de pantalla donde se va a imprimir
; variables adicionales utiles para la sobreescritura
;-----------------------------------------------
SPR_status	db 1; flags									***
SPR_addr	dw 0; direccion del sprite en la spritetable (la que comienza en 27000)					***



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



;UPDATE_SEGMENT
;***********************
UPS_PTR		dw 0;puntero a la entrada del sprite en la tabla ROUTE_TABLE


;MAP2SP
;****************
M2S_counter	db 0; contador de map items
;-----------------------------------------

_SCREEN_0_END; esta ultima instruccion debe ensamblarse como mucho en la C7FF	
	NOP
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




; algunas variables de la rutina stars las he traido aqui
;---------------------------------------------------------
SCS_pen		db 64; el byte (2ndo pix mode 0) que vamos a pintar. esto es una constante
SCS_check	db 0

SCS_incy	db 2; lo que vamos a mover en eje y
SCS_incx	db 1; lo que vamos a mover en eje x

SCS_counter	db 20
SCS_number	db 20

star_color	db 64
;-------------------------


; PRINT_LAYOUT
;****************
LAY_coordychar 	db 0; coordenada y [0..24]
LAY_coordy	db 0; coordenada y de la row [0..199]
LAY_coordxchar 	db 0; coordenada x [0..24]
LAY_coordx	db 0; coordenada x de la row [0.79]
LAY_chars	dw 0; direccion donde estan los caracteres de la cadena


;------------------------
_SCREEN_1_END ; esta ultima instruccion debe ensamblarse como mucho en la CFFF
	NOP
;-----------------------------------------
;-----------------------------------------
org &D7D0
_SCREEN_2_BEGIN 


; PRINT_LAYOUT
;****************
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





;PRINT_SPRITES
;****************
PS2_spid	db 0


; PRINTSP
;************
PRINTSP_flag db 0; este flag es para que printspall sepa que no debe animar pues la llamada viene de printsp

; para el player de musica
;BUFFER_DEC_CANAL_A ds 32


_SCREEN_2_END; esta ultima instruccion debe ensamblarse como mucho en la D7FF
	NOP
;-----------------------------------------
;-----------------------------------------
org &DFD0
_SCREEN_3_BEGIN 

; para el player de musica
;BUFFER_DEC_CANAL_C ds 32


;*******************


; ROUTEALL
;**********
ROU_HL	DW 0; un buffer para guardar HL temporalmente

; MAP2SP
;************
M2S_Xorig: 		dw 0 ; coordx del origen "movil". inicialmente deberia ser 0, tiene en cuenta el offset x
M2S_Yorig: 		dw 0 ; coordy del origen "movil". inicialmente deberia ser 0
M2S_Xinput		dw 0; xo en invocacion



;  DEL PLAYER DE MUSICA WYZ. segmento 3
;*************************
;SONIDO_REGS DW 0
;EFECTO_REGS DW 0
;PUNTERO_EFECTO DW 0





_SCREEN_3_END; esta ultima instruccion debe ensamblarse como mucho en la DFFF
	NOP
;-----------------------------------------
;-----------------------------------------
org &E7D0
_SCREEN_4_BEGIN 


COR_spriteid db 0
COR_dy db 0
COR_dx db 0


; funcion 3D_PAINT_SEGMENT
;************************************
PNTS_deltax 	db 0; delta de x multiplicado por 4 
   		    ; el delta esta almacenado junto con la imagen, despues de ancho y alto
PNTS_xini	db 0; x donde se dibuja la scanline y que va evolucionando desde x1 hasta x2 o clipping
PNTS_dx1	db 0; dx que viene definido en la image
;PNTS_dx2pos	db 0; el diferencial de x en positivo en 8 bit, considerando segmento recto (x2=x1 sin proyectar)

PNTS_dx2pos	dw 0; el diferencial de x en positivo en 8 bit, considerando segmento recto (x2=x1 sin proyectar)

PNTS_dxsigno	db 0; signo de dx2
PNTS_dxacumul	db 0; cada scan se incrementa dx2 y si es >N se pone a 0 y se suma 1 a x 

SPR_x1		dw 0; coordx proyecada del punto1
SPR_y1		dw 0; coordy proyecada del punto1
PNTS_alto	db 0; dato que viene en la image

PNTS_pintar	db 0; 0=no pintar, 1=pintar
PNTS_sumax2	dw 0
; _3d_proyecta_xy
;************************************
XY3D_SIGNO	db 0 ; 0=pos, 1=neg
XY3D_center_projection	dw 160;40
XY3D_ratiox	db 0;
XY3D_offsetY	db 0; 
SPR_coordx_no3d	dw 0
SPR_coordy_no3d dw 0; sin 3d pero con cliplingV 
SPR_altorestado db 0; ; lo que se resta a alto debido al clipping Vsuperior
SPR_coordy_no3d_noclipV dw 0; sin 3d y sin cliplingV 
SPR_segment 	db 0; es un segmento o no
; variables locales comando RINK
;-------------------------------------
ink_counter	db 0
ink_cambiar	db 0


ink_index	db 0; valor puntero. de una invocacion a la siguiente hay que preservarlo
		; ink_index es la tinta a la que le toca ser t1 en esta invocacion.
ink_tini	db 1; tinta inicial de rango 
ink_t1		db 3; tinta 
ink_t2		db 3; tinta 
ink_t3		db 3; tinta 
ink_t4		db 3; tinta 
ink_t5		db 24; tinta 
ink_t6		db 24; tinta 
ink_t7		db 24; tinta 
ink_t8		db 24; tinta 
ink_step	db 0; salto a dar
ink_patron_len	db 0; longitud de patron de colores (desde 1 a 16)

flip_flag	db 0; flip flag

_SCREEN_4_END; esta ultima instruccion debe ensamblarse como mucho en la E7FF
	NOP
;-----------------------------------------
;-----------------------------------------
org &EFD0
_SCREEN_5_BEGIN 
; PRINTAT
;****************************
PAT_coordx dw 0
PAT_coordy dw 0
PAT_from    db 0

; variables locales comando UPDATE_MAP
;-------------------------------------
UMA_xini	dw 0
UMA_xfin	dw 0
UMA_yini	dw 0
UMA_yfin	dw 0
;UMA_dirmap_fin	dw 0
UMA_dirmap_ini	dw 0
UMA_item_count 	db 0; contador de items metidos
UMA_dirmap_ptr	dw 0; puntero
UMA_item_y	dw 0;
UMA_item_x	dw 0;
UMA_map_ptr	dw 0;debe apuntar a _MAP_TABLE+5

; variables locales comando ROUTE_ALL
;------------------------------------
ROU_dirsp 	dw  0



; variables comando MAP2SP
;---------------------------
M2S_SP_POINTER	dw _SPR_SPRITES_TABLE; puntero al primer sprite a dar de alta
M2S_sprites	db 0; este es un output de la funcion


; variables comando SET_LIMITS y SWAP_LIMITS
;---------------------------
LIMITS_BACKUP
SPR_MIN_X2: 	; limite horizontal para el clipping
		dw 0;15
SPR_MAX_X2:	; limite horizontal para el clipping
		dw 80; ojo, es el primer byte que no se pinta!!!
SPR_MIN_Y2:	; limite vertical para el clipping
		dw 0;20
SPR_MAX_Y2:	; limite vertical para el clipping
		dw 200; ojo, es el primer scanline que no se pinta!!!

; variables de la funcion SET_LIMITS
;-------------------------------------
SPR_DIFX2	db 80
SPR_DIFY2	db 200

;variables _GET_MODE
;---------------------
GM_mode		db 0; modo de pantalla

; variables ROUTESP
;--------------------
RS_pasos 	db 0




_SCREEN_5_END; esta ultima instruccion debe ensamblarse como mucho en la EFFF



		NOP
;-----------------------------------------
;-----------------------------------------
org &F7D0
_SCREEN_6_BEGIN 

; 9 bytes para un buffer de sonido de la libreria minibasic.h. es la direccion d7de
;_SOUND_BUF	db 0,0,0,0,0,0,0,0,0,0 ; le doy un byte mas

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

; 9 bytes para un buffer de sonido de la libreria minibasic.h. es la direccion d7de
; ojo esta es la f7f1. la he cambiado porque no funcionaba bien. puede que consuma mas de 9 bytes?
_SOUND_BUF	db 0,0,0,0,0,0,0,0,0,0 ; le doy un byte mas

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
SOR_ant		dw 0; direccion de coordy de sprite anterior
SOR_sig		dw 0; direccion de coordy de sprite siguiente



SOR_buffer	dw 0; buffer de 2 bytes. me la he llevado a global

_SCREEN_7_END; esta ultima instruccion debe ensamblarse como mucho en la FFFF
_SCREEN__END; esta ultima instruccion debe ensamblarse como mucho en la FFFF
	NOP
;-----------------------------------------
;-----------------------------------------
;================================================================================================================
;org 24400; v33_012
org 24000; v33_013

; variable local de SORTY
;---------------------------
SOR_DIRSTART	dw 0; direccion del sprite anterior al que se va a empezar a ordenar

; variables locales de _MUSIC_ON()
;-------------------------------------
INS_counter	db 0;ultimo instante en que se toco la musica. de una invocacion a otra hay que mantener este valor
;INS_model	dw &B939; model 464=>&B939 ,model 6128=> &B941. al instalar la interrupcion se corrige solo.
INS_cancion	db 0
INS_speed	db 5; una velocidad "normal" es 6. si ponemos 5 estamos acelerando un poco la musica


; ALGUNAS VARS LCALES


;=================================================
; Tabla de alturas de sprites. esta tabla se ubica en la memoria de sprites
;=================================================
;_SPRITE_HEIGHTS_TABLE
;SPRITEH_0	db 0; altura sprite 0
;SPRITEH_1	db 0; altura sprite 1
;SPRITEH_2	db 0; altura sprite 2
;SPRITEH_3	db 0; altura sprite 3
;SPRITEH_4	db 0; altura sprite 4
;SPRITEH_5	db 0; altura sprite 5
;SPRITEH_6	db 0; altura sprite 6
;SPRITEH_7	db 0; altura sprite 7
;SPRITEH_8	db 0; altura sprite 8
;SPRITEH_9	db 0; altura sprite 9
;SPRITEH_10	db 0; altura sprite 10
;SPRITEH_11	db 0; altura sprite 11
;SPRITEH_12	db 0; altura sprite 12
;SPRITEH_13	db 0; altura sprite 13
;SPRITEH_14	db 0; altura sprite 14
;SPRITEH_15	db 0; altura sprite 15
;SPRITEH_16	db 0; altura sprite 16
;SPRITEH_17	db 0; altura sprite 17
;SPRITEH_18	db 0; altura sprite 18
;SPRITEH_19	db 0; altura sprite 19
;SPRITEH_20	db 0; altura sprite 20
;SPRITEH_21	db 0; altura sprite 21
;SPRITEH_22	db 0; altura sprite 22
;SPRITEH_23	db 0; altura sprite 23
;SPRITEH_24	db 0; altura sprite 24
;SPRITEH_25	db 0; altura sprite 25
;SPRITEH_26	db 0; altura sprite 26
;SPRITEH_27	db 0; altura sprite 27
;SPRITEH_28	db 0; altura sprite 28
;SPRITEH_29	db 0; altura sprite 29
;SPRITEH_30	db 0; altura sprite 30
;SPRITEH_31	db 0; altura sprite 31

FLAG_YMAX	db 0; 0 indica ymin, 2 indica ymax ( se usa el bit 1)
;=============================================================================
;_SET_HEIGHT
;=============================================================================
_SET_HEIGHT
		push hl
		;push bc
;		ld a,b
		ld hl, (SPR_addr)
		;ld bc, _SPR_SPRITES_TABLE
		;and a
		;sbc hl,bc	
		; ahora en hl esta el sprite_id * 16
		; DESPLAZO 4 VECES PORQUE EL ANCHO DE LA TABLA ES 16
		; como 27000 /16 =1687 ese sera el offset que quedara. lo resto al sumar _SPRITE_HEIGHTS_TABLE y asi optimizo
		;SRL H
		;RR L
		;SRL H
		;RR L
		;SRL H
		;RR L
		;SRL H
		;RR L

		; optimizacion 56 ciclos frente a 64
  LD A, L
  SRL H
  RRA
  SRL H
  RRA
  SRL H
  RRA
  SRL H
  RRA
  LD L, A
;  ld a,b

		; ahora en hl tengo el sprite id, es decir, en L
;		ld bc,  _SPRITE_HEIGHTS_TABLE-1687; - _SPR_SPRITES_TABLE
		ld de,  _SPRITE_HEIGHTS_TABLE-1687; - _SPR_SPRITES_TABLE
		;add hl,bc
		add hl,de
		;ld (hl), a
		ld (hl), b
	
		;pop bc
		pop hl
		ret
;=============================================================================
;_ADD_HEIGHTS , _SUB_HEIGHTS, _OPER_HEIGHTS
;=============================================================================
; esta funcion suma o resta la altura de los sprite a la coord y de los sprites.
; actua sobre los 32 sprites sin diferenciar si se imprimen o no.
; se invoca desde PRINTSPRITES en caso de requerir ordenacion. Y se invoca antes de invocar a SORTY
; tambien se invoca desde PRINTSPRITES despues de SORTY, para dejar la coordy como estaba
; variables locales
;-------------------------------------
add_counter db 31
_SUB_HEIGHTS
		ld hl, &42ed ; sbc hl,bc = &ed42
		ld (add_oper) , hl
		jr _OPER_HEIGHTS

_ADD_HEIGHTS
		ld hl, 09 ; add hl,bc = 09
		ld (add_oper) , hl
		

_OPER_HEIGHTS
		ld a,31; este valor es dinamico y es el num sprites ordenados
		ld (add_counter),a	

		; recorrer la tabla heights y sumar a la tabla _SPR_sprites_table en su coord y
		ld de, _SPR_SPRITES_TABLE+1; coord y
		ld hl, _SPRITE_HEIGHTS_TABLE

add_bucle:
		
		push hl; en pila ahora esta dir height
		ld b,0
		ld c, (hl)
		; ahora en bc esta la altura
		ex hl, de; de es dir height, hl es dir coordy
		push hl; en pila ahora esta dir coordy
		ld a, (hl); hl es dir coordy
		inc hl
		ld h, (HL)
		ld l,a; ahora en hl esta la coord y
		; esta es la funcion que suma la altura o la resta		
		;-------------------------------------------------
		and a; accarreo a 0
add_oper	
		;sbc hl,bc ; son 2 bytes
		;add hl, bc; es un byte 
		
		nop
		nop
		;ahora en hl esta yfin (caso add)

		;--- fin oper
		ex de,hl; en de esta yfin y en hl ahora esta dir height
		pop hl; dir coordy. acabo de perder dir height
		ld (hl),e
		inc hl
		ld (hl),d; ahora en coordy esta yfin
		ld a, (add_counter)
		dec a
		jr z, add_fin
		ld (add_counter),a
		ld bc, 15
		add hl, bc; siguiente ycoord
		ex de, hl; en de esta dir next coordy
		pop hl; en hl esta dir height
		inc hl
		JR add_bucle
	
add_fin	
		pop hl
		ret
	


;=============================================================================
;_LIMITS
;=============================================================================
; variables locales
;-------------------------------------
; estas variables son globales pero se rellenan aqui.
; por defecto los limites del clipping es la pantalla
; me las he llevado a otro sitio
;LIMITS
;SPR_MIN_X: 	; limite horizontal para el clipping
;		dw 0;15
;SPR_MAX_X:	; limite horizontal para el clipping
;		dw 80; ojo, es el primer byte que no se pinta!!!
;SPR_MIN_Y:	; limite vertical para el clipping
;		dw 0;20
;SPR_MAX_Y:	; limite vertical para el clipping
;		dw 200; ojo, es el primer scanline que no se pinta!!!

;SPR_DIFX	db 80
;SPR_DIFY	db 200

LIMITS_DEFAULT
SPR_MIN_X3: 	; limite horizontal para el clipping
		dw 0;15
SPR_MAX_X3:	; limite horizontal para el clipping
		dw 80; ojo, es el primer byte que no se pinta!!!
SPR_MIN_Y3:	; limite vertical para el clipping
		dw 0;20
SPR_MAX_Y3:	; limite vertical para el clipping
		dw 200; ojo, es el primer scanline que no se pinta!!!

;SPR_DIFX3	db 80
;SPR_DIFY3	db 200


;=============================================================================
;_SET_DEFAULT_LIMITS  establece los limites por defecto, haciendo un backup previo
;=============================================================================

_SET_DEFAULT_LIMITS
	; esta funcion

	ld hl,LIMITS
	ld DE,LIMITS_BACKUP
	ld bc, 10
	LDIR

	ld hl,LIMITS_DEFAULT
	ld DE,LIMITS
	ld bc, 10
	LDIR
	ret
;=============================================================================
;_SET_DEFAULT_LIMITS  establece los limites definidos en el backup previo
;=============================================================================

_SET_BACKUP_LIMITS
	ld hl,LIMITS_BACKUP
	ld DE,LIMITS
	ld bc, 10
	LDIR ; (DE)<-(HL) till bc=0
	ret

;=============================================================================
; viene de ROUTEALL
;============================================================================


;ROU_V34
;	ld a, (ROU_SPID)
;	CALL ANS_a
;	jP ROU_kkk

;ROU_INIRUTA
;	; venimos desde _UPDATE_SEGMENT porque se ha detectado un comienzo de ruta
;	ld a,255; asi al sumar un 1 pasara a cero
;	ld (ROU_SEG),a
;	xor a; nuevo paso
;	;JR _UPDATE_SEGMENT
;	Jp _UPDATE_SEGMENT ; v28




;=============================================================================
;_GET_MODE  
;=============================================================================
; consulta y guarda el modo grafico
;variables locales
;==================
;GM_mode db 0 --> esta en segmento oculto
_GET_MODE
	call &bc11
	ld (GM_mode),a
	ret


;=============================================================================
;_SET_PNT_TRANSP SPT
;=============================================================================
; establece la direccion para pintar transparente en modo 0 y 1
;variables locales
;==================
_SET_PNT_TRANSP
	ld a, (GM_mode)
	and a
	Jr Z, SPT_mode0
SPT_mode1
	ld Hl, PNT_TRANSP_mode1
	JP PSP_go_paint
SPT_mode0
	ld Hl, PNT_TRANSP
	JP PSP_go_paint

;=============================================================================
;_SET_PNT_FLIPN SPF
;=============================================================================
; establece la direccion para pintar flipeado en modo 0 y 1
_SET_PNT_FLIPN
	ld a, (GM_mode)
	and a
	Jr Z, SPF_mode0
SPF_mode1
	ld hl,PNT_FLIPN_mode1
	JP PSP_go_paint
SPF_mode0
	ld hl,PNT_FLIPN
	JP PSP_go_paint

;=============================================================================
;_SET_PNT_FLIP_TANSP SPFT
;=============================================================================
_SET_PNT_FLIP_TRANSP
	ld a, (GM_mode)
	and a
	Jr Z, SPFT_mode0
SPFT_mode1
	ld hl,PNT_FLIP_TRANSP_mode1
	JP PSP_go_paint
SPFT_mode0
	ld hl, PNT_FLIP_TRANSP
	JP PSP_go_paint

;=============================================================================
;PNT_TRANSP_mode1     , version TRANSP mode 1
;=============================================================================

PNT_TRANSP_mode1

		ld a,c;(SPR_anchofinal); esto es mas rapido que LD A,C falso
		ld b,a;***
m1PTR2_scanh
		ld a, (HL); 2 pixels del sprite ( en mode 1 son 4 pixels)

		CALL m1_TRANSP

m1PTR2_pinta	ld (DE), a

m1PTR2_transp	inc de
		inc hl
		djnz,m1PTR2_scanh; opt
		jP PNT_PAINTED

;=============================================================================
;PNT_FLIPN_mode1   VERSION FLIP NORMAL mode 1
;=============================================================================


		;------------- VERSION FLIP NORMAL mode 1 -----------------------
PNT_FLIPN_mode1
		;LD A,C
		;LD B,A ; ancho final en b
		;ld b,c; no tiene sentido

		; en c esta el anchofinal, pero debo restar el restoancho


		ld b,0
		add hl,bc; me coloco pix ultimo
		dec hl; ajuste pues 1+4=5, 
		ld b,c; ancho en b
m1PNTFN_scanh

		ld a, (HL); pixels del sprite

		CALL m1_FLIP



m1PNTFN_pinta	ld (DE), a

m1PNTFN_transp	inc de


		;inc hl 
		dec hl; cambiamos el inc por un dec pues estamos flipeando
		;dec b
		;jp nz, PNTFN_scanh

		djnz,m1PNTFN_scanh; opt

		; reajuste final de HL
		ld a,(SPR_anchofinal)
		ld b,0
		ld c,a
		add hl,bc;
		inc hl; para compensar el ultimo dec
		jp PNT_PAINTED



;=============================================================================
;PNT_FLIP_TRANSP_mode1  VERSION FLIP TRANSP mode 1
;=============================================================================

		;------------- VERSION FLIP TRANSP-----------------------
PNT_FLIP_TRANSP_mode1
		;LD A,C
		;LD B,A ; ancho final en b
		;ld b,c; esta instruccion no tiene sentido

		ld b,0
		add hl,bc; me coloco pix ultimo
		dec hl; ajuste pues 1+4=5, 
		ld b,c; ancho en b
m1PNTF_scanh

		ld a, (HL); 2 pixels del sprite

		; ahora se flipea el pixel, en mode 1 es costoso
		CALL m1_FLIP

		; ahora la transparencia

		CALL m1_TRANSP

m1PNTF_pinta	ld (DE), a

m1PNTF_transp	inc de


		;inc hl 
		dec hl; cambiamos el inc por un dec pues estamos flipeando
		
		;dec b
		;jp nz, PNTF_scanh
		djnz,m1PNTF_scanh; opt

		; reajuste final de HL
		ld a,(SPR_anchofinal)
		ld b,0
		ld c,a
		add hl,bc;
		inc hl; para compensar el ultimo dec
		Jp PNT_PAINTED
		;-------------------------------------------------
;============================================================================
m1_FLIP

		and a,%10001000
		;srl a
		;srl a
		;SRL a
		; 3 srl a es lo mismo que 4 rotaciones y un and v37
		rrca 
		rrca
		rrca
		and %00011111
	
		ld c,a
	
		ld a,(HL)
		and a,%01000100
		srl a
		or c
		ld c,a

		ld a,(HL)
		and a,%00100010
		ADD A,A
		or c
		ld c,a
	

		ld a,(HL)
		and a,%00010001
		ADD A,A
		ADD A,A
		ADD A,A
		or c

		RET
;============================================================================
m1_TRANSP

		ld c, a; guarda  pixel en C		
m1PTR2_bin1	;and a,%11000000; o bien %11001100
		and a,%11110000; 
		JR Z,m1PTR2_fondo; todo ceros es para reestablecer el fondo en los 4 pixels transp o no transp
		; NOTA he observado que siembre salta a PTR_fondo porque pinto con colores que no usan los bits de fondo
		; pero si hubiese color 1, entonces se usaria para redondear el contorno de sprites
m1PTR2_bin2	;cp %11000000; si los dos son 1, entonces no hacemos nada, no hay que reestablecer nada
		cp %00001111; si todos son 1, entonces no hacemos nada, no hay que reestablecer nada

		;JP Z,m1PTR2_transp; 
		;JP Z, m1PTR2_pinta ; v35b esto creo que debe ser asi
		ret Z; v35b esto creo que debe ser asi

		
		; si estamos aqui es porque algun bit esta a 1
		;JR m1PTR2_fondo
		

		ld a,c
		bit 4,c; comprueba el bit 4 
		JR Z, m1PTR2_5
		; si estoy aqui es que ese bit no es cero y por lo tanto el pixel a pintar debe ser el de pantalla
		; es decir, no alterar nada
		res 4,c; lo pongo a cero
		ld a, (DE); leo la pantalla
		and a, %00010001; pixel 4
		or  a,c; no modifico los 1's del pixel del sprite, almacenados en c
		ld c,a
m1PTR2_5
		bit 5,c; comprueba el bit 5 
		JR Z, m1PTR2_6
		; si estoy aqui es que ese bit no es cero y por lo tanto el pixel a pintar debe ser el de pantalla
		; es decir, no alterar nada
		res 5,c; lo pongo a cero
		ld a, (DE); leo la pantalla
		and a, %00100010; pixel 5
		or  a,c; no modifico los 1's del pixel del sprite, almacenados en c
		ld c,a

m1PTR2_6
		bit 6,c; comprueba el bit 5 
		JR Z, m1PTR2_7
		; si estoy aqui es que ese bit no es cero y por lo tanto el pixel a pintar debe ser el de pantalla
		; es decir, no alterar nada
		res 6,c; lo pongo a cero
		ld a, (DE); leo la pantalla
		and a, %01000100; pixel 5
		or  a,c; no modifico los 1's del pixel del sprite, almacenados en c
		ld c,a
m1PTR2_7
		bit 7,c; comprueba el bit 5 
		JR Z, m1PTR2_fondo
		; si estoy aqui es que ese bit no es cero y por lo tanto el pixel a pintar debe ser el de pantalla
		; es decir, no alterar nada
		res 7,c; lo pongo a cero
		ld a, (DE); leo la pantalla
		and a, %10001000; pixel 7
		or  a,c; no modifico los 1's del pixel del sprite, almacenados en c


		;ld c,a
		ret;



		
m1PTR2_fondo	ld a, (DE); (DE) contiene el fondo "manchado" con restos del sprite en el frame anterior
		

m1PTR2_bin3	;AND A,%11000000; bin %11100110 192 (192 es 128+64, es decir los dos 1). en total 230 192 , o bien  %11001100
		
		AND A,%11110000; bin %11100110 192 (192 es 128+64, es decir los dos 1). en total 230 192 , o bien  %11001100
		; el orden es 00221133	
		or a,c; OR del pixel con el fondo (fondo en "A" y pixel en "C")

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
		;call &bca7 ; rutina de firmware , valida para 464 y 6128
		;ret
		JP &bca7; optimize call +ret




;org 24500
;org 24000

;=============================================================================
;_UPDATE_MAP   ; UMA     (dirmapini, dirmapfin,yini,yfin,xini,xfin)
;=============================================================================
; copia en _MAP_TABLE los items del mapa definido entre dirmapini y dirmapfin
; que cumplan encontrarse entre los limites impuestos
; ademas, modifica el contador de items de la _MAP_TABLE

;variables locales
;==================
;UMA_xini	dw 0
;UMA_xfin	dw 0
;UMA_yini	dw 0
;UMA_yfin	dw 0
;UMA_dirmap_fin	dw 0
;UMA_item_count 	db 0; contador de items metidos
;UMA_dirmap_ptr	dw 0; puntero
;UMA_item_y	dw 0;
;UMA_item_x	dw 0;
;UMA_map_ptr	dw 0;debe apuntar a _MAP_TABLE+5
; function body
;===============
_UPDATE_MAP
_UMA
   	
	; pongo el contador de items a cero
	xor a
	ld (UMA_item_count),a

	; pongo el puntero a map en el origen
	ld hl,_MAP_TABLE+5
	ld (UMA_map_ptr),hl

	; recoge parametros
	ld l, (IX+0)
	ld h, (IX+1)
	ld (UMA_xfin),hl

	; recoge parametros
	ld l, (IX+2)
	ld h, (IX+3)
	ld (UMA_xini),hl

	; recoge parametros
	ld l, (IX+4)
	ld h, (IX+5)
	ld (UMA_yfin),hl

	; recoge parametros
	ld l, (IX+6)
	ld h, (IX+7)
	ld (UMA_yini),hl

	; recoge parametros
	;ld l, (IX+8)
	;ld h, (IX+9)
	;ld (UMA_dirmap_ptr),hl;* reverse orden .hl se debe igualar al dirmap_fin

	; recoge parametros
	ld l, (IX+10)
	ld h, (IX+11)
	ld (UMA_dirmap_ini),hl ; esta instruccion y la variable sobra. no sobra
	
	; v36_007 he metido este paramtetro despues para que hl quede bien cargado

	; recoge parametros
	ld l, (IX+8)
	ld h, (IX+9)
	ld bc, -6 ; v36_007
	add hl,bc; v36_007
	ld (UMA_dirmap_ptr),hl;* reverse orden .hl se debe igualar al dirmap_fin
	; ahora un sencillo bucle
	;ld hl, (UMA_dirmap_fin)	;* reverse orden .hl se debe igualar al dirmap_fin

	;ld (UMA_dirmap_ptr),hl
UMA_buc

	;ld (UMA_dirmap_ptr),hl; guardo la direccion del current item

	; cargamos un item
	; un item tiene y,x,dirimage (6 bytes)
	ld e,(HL)
	inc hl
	ld d, (HL)
	; DE contiene ahora la coordY del item

	; miramos yfin
	;--------------
	ex de, hl
	ld (UMA_item_y),hl; guardo y
	ld bc, (UMA_yfin)
	and a; carry off
	sbc hl,bc
	JR NC, UMA_bucnext; NC significa que HL>yfin
	; ha cumplido yfin. ahora miramos yini
	;--------------
	ld hl, (UMA_item_y)
	;add hl,bc; optim es equivalente	

	ld bc, (UMA_yini)
	and a; carry off
	sbc hl,bc
	JR C, UMA_bucnext; C significa que HL<yini

	; la coordY es correcta
	; miramos xfin
	;--------------
	ex de, hl; ahora hl es la direccion
	inc hl
	ld e,(HL)
	inc hl
	ld d, (HL)
	ex de, hl
	ld (UMA_item_x),hl; guardo x

	; miramos Xfin
	;--------------
	ld bc, (UMA_xfin)
	and a; carry off
	sbc hl,bc
	JR NC, UMA_bucnext; NC significa que HL>yfin

	; ahora miramos xini
	;--------------
	ld hl,(UMA_item_x)
	ld bc, (UMA_xini)
	and a; carry off
	sbc hl,bc
	JR C, UMA_bucnext; C significa que HL<xini
	
	; si estamos aqui es porque hay que meter el item
	; son 6 bytes de puntero a puntero
	;----------------------------------------------
	; incrementamos el contador de items
	;ld a, (UMA_item_count)
	;inc a
	;ld (UMA_item_count),a

	ld hl,UMA_item_count; opti
	inc (hl);opti
	
	;metemos el item
	;----------------
	ld hl, (UMA_dirmap_ptr)
	ld bc, 6
	ld de, (UMA_map_ptr); puntero al MAP
	ldir
	; actualizacion del puntero al map
	ex hl, de
	;inc hl


	
	ld (UMA_map_ptr), hl 
		

UMA_bucnext
	ld hl, (UMA_dirmap_ptr)
	;ld bc, 6  ; <--- entre item e item hay 6 bytes. * (inverse =-6)
	ld bc,-6  ; <--- entre item e item hay 6 bytes. * (inverse =-6)

	add hl, bc; coloco hl en siguiente posicion
	ld (UMA_dirmap_ptr),hl;

	;ld bc, (UMA_dirmap_fin) ;* <---- direccion final del mapa
	ld bc, (UMA_dirmap_ini) ;* <---- direccion final del mapa

	and a
	sbc hl,bc
	;jR P, UMA_fin 

	;JR Z,UMA_fin;* (inverse =JP N,)
	JR c,UMA_fin;* (inverse =JP N,)


	;jr NC, UMA_fin;por si acaso el fin no nos lo dan con precision
	ld hl, (UMA_dirmap_ptr)
;	ld bc, 6
;	add hl, bc; coloco hl en siguiente posicion
	JR UMA_buc
	
UMA_fin
	; antes de salir actualizamos el contador de items en el MAP_TABLE
	ld hl, _MAP_TABLE+4
	ld a, (UMA_item_count)
	ld (Hl), a
	ret
	
	

;============================================================================
_AJUSTA_SEGMENTO ;  (AJS)
; funcion interna, invocada desde printsprite
;==============================================================================
;si es un segmento se debe guardar las coord y desplazar coordx si hay clipvsup
; entramos aqui sabiendo que estamos ante un segmento
;beginajuste

		ld a,1
		ld (SPR_segment),a
		ld bc, 0
		ld (PNTS_sumax2),bc; lo que hay que sumar a x2 al pintar segmento


		; guardado de coordenadas con cliping vertical
		;---------------------------------------------

		ld hl,(SPR_coordx)
		ld (SPR_coordx_no3d),hl
		ld hl,(SPR_coordy)
		ld (SPR_coordy_no3d),hl
		; ajuste de coordx
		;------------------
		ld hl,(SPR_image); direccion de la imagen, no donde comienza el dibujo, es decir, 
				; en spr_image esta el ancho



		inc hl; alto
		inc hl; dx1
		ld a,(hl); a=dx1
		ld (PNTS_dx1),a
		and a
		ret z;
;		jp Z, no_ajuste

		bit 7, a 
		JR NZ, AJS_dx1neg
		
AJS_dx1pos; LOGICA DE AJUSTE SEGMENTO PARA CASO DX1 POSITIVO
;-------------------------------------------------------------
		ld b,a
		ld  a, (SPR_altorestado); puede ser cero
		and a
		cp b; cual es mayor? altorestado o dx1?
		jr c , AJS_dxmayor_dxpos
		; dx menor-->restamos -dx
		;-----------------------
		;ld a,b
		;neg 
		xor a;opt
		sub b;opt


		ld c,a
AJS_dxmenor255	ld b,255
		and a
		jr AJS_finajustepos

AJS_dxmayor_dxpos	; dx>altorestado--> restamos -altorestado
		and a
		JR NZ, AJS_algo
		ld bc, 0
		Jr AJS_finajustepos
AJS_algo	neg
		ld c,a
		;jr dxmenor255
		ld b,255
		and a
		Jr AJS_finajustepos

AJS_dx1neg; LOGICA DE AJUSTE SEGMENTO PARA EL CASO DX1 NEGATIVO
;----------------------------------------------------------
		neg; dx1 ahora es positivo
		ld b,a
		ld  a, (SPR_altorestado); puede ser cero
		and a
		cp b; cual es mayor? altorestado o dx1?
		jr c , AJS_dxmayor
		; dx menor-->restamos dx
		;-----------------------
		ld c,b
		jr AJS_finajuste		
AJS_dxmayor		; dx>altorestado--> restamos altorestado, hasta que altorestado sea cero
		ld c,a	
AJS_finajuste
		ld b,0
AJS_finajustepos
		ld hl,(SPR_coordx)
		sbc hl, bc ; restamos 
		ld (SPR_coordx),hl
		ld (SPR_coordx_no3d),hl
	 	ld (PNTS_sumax2),bc
		ret

;===============================================================================================
_INSTALL_RSX2
		ld bc, RSX_TABLE
		ld HL, RSX_space
		call &bcd1

		; ordenamiento de la tabla de sprites
		;xor a; mode default de ordenamiento ( esto es a=0)
		;ld (SOR_mode),a
		;call _SORTY; se ordenan los sprites del 0 al 31
		;ret
		ld a, &36
		ld (SOR_RESET),a
		CALL _SORTY ; optimize call +ret
		xor a
		ld (SOR_RESET),a
		LD (SOR_DIRSTART),a
		LD (SOR_DIRSTART+1),a
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

;PAT_from    db 0
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
	
		;xor a; fix bug v33
		;ld (flip_flag),a
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

		;v38 mejora indirecion
		;ld a,(hl)
		;inc hl
		;ld h,(hl)
		;ld l,a
		;ld (LAY_chars), bc; direccion de memoria donde comienza el string

		ld c,(HL)
		inc hl
		ld b, (HL)
		ld (LAY_chars), bc; direccion de memoria donde comienza el string

		; pongo spr_status a 1 pues lo necesita la rutina de impresion
		;ld a,(PAT_over)
		;ld (SPR_status),a

		CALL _SET_DEFAULT_LIMITS
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

		; modificacion v32
		;cp 0; check a=0
		or a; opt  optimizacion
		jr Z, PAT_NOT_found; con esto lo que hago es imprimir el ultimo caracter definido
		; end modificacion
		
		cp b
		jr Z, PAT_found


		inc c ; contador de chars en la alphalist
		inc hl
		jr pat_busca

PAT_NOT_found

		;para imprimir el ultimo definido
		dec c
		;or a; carry off


PAT_found			
		
		ld h,c; ahora h tiene el contador
		ld a, (ALPHA_tamano)		
		ld e, a
		call _MUL8bit  ; this routine performs the operation HL=H*E
		ld bc , ALPHA_LETTERS
		add hl,bc; ya estamos en el grafico de la letra
		LD (SPR_image_data),HL;
		LD (SPR_imagefinal),HL;
	
		;-------rutina impresion letra --------------
		ld a,1
		ld (PAT_from),a

		ld a,(ALPHA_ancho)
		ld c,a
		ld (SPR_ancho), a
		ld a,(ALPHA_alto)
		ld (SPR_alto), a
		ld b,a
		ld (SPR_anchoaltofinal),bc;

		;el problema del clipping es que altera SPR_coordx, SPR_coord_y para la siguiente impresion
		
		;call Z, PSP_caso1	
		call PSP_caso1	
		

		;-------end rutina impresion letra-------------
PAT_next	;ld a, (LAY_len)
		;dec a
		;jr z, pat_fin
		;ld (LAY_len), A; longitud del string actualizada 

		ld hl,LAY_len
		dec (HL)
		jr z, pat_fin


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

PAT_fin		
		xor a
		ld (PAT_from),a

		pop hl


		CALL _SET_BACKUP_LIMITS
		ret


;=============================================================================================================
; PAINT_SEGMENT() invocada internamente desde PRINT_SPRITE()    [PNTS]
;=============================================================================================================

; esta funcion imprime un sprite de tipo segmento
; un segmento es una imagen que puede tener cualquier alto y ancho pero en sus datos solo se encuentra
; la primera linea, que se ha de imprimir una y otra vez, tantas veces como la altura tenga el segmento
; 
; Adicionalmente un segmento se puede  "torcer", util para pintar curvas
; para ello el primer byte de los datos de la imagen debe ser el deltax
; dicho deltax es un byte con signo (-127..+127)
;
; los segmentos llegan sin el cliping hecho, aunque el cliping vertical ya lo hace map2sp
; si la imagen esta por encima o debajo de la pantalla, ya se ha eliminado
; ahora hace falta hacer el cliping horizontal y el vertical de la parte inferior del segmento (cliping vertical inferior)

; variables locales
;-------------------------------------
;PNTS_deltax 	db 0; delta de x multiplicado por 4 
   		    ; el delta esta almacenado junto con la imagen, despues de ancho y alto
;PNTS_xini	db 0; x donde se dibuja la scanline y que va evolucionando desde x1 hasta x2 o clipping
;PNTS_dx1	db 0; dx que viene definido en la image
;PNTS_dx2pos	db 0; el diferencial de x en positivo en 8 bit, considerando segmento recto (x2=x1 sin proyectar)
;PNTS_dxsigno	db 0; signo de dx2
;PNTS_dxacumul	db 0; cada scan se incrementa dx2 y si es >N se pone a 0 y se suma 1 a x 

;SPR_x1		dw 0; coordx proyecada del punto1
;SPR_y1		dw 0; coordy proyecada del punto1
;PNTS_alto	db 0; dato que viene en la image

;PNTS_pintar	db 0; 0=no pintar, 1=pintar

PNTS_pt2_clipvinf	db 0; 0=noclipvinf pt2 , 1=si clipvinf pt2

;function body
;-------------------------------------
_3D_PAINT_SEGMENT:  ; dibujar en pantalla el sprite de tipo segmento

		; v33
		;ld a, (SPR_STATUS)
		;and 64
		;JR Z, PNTS_notr
		;ld a,&cd
		;ld (pnts_PINTA_NOTRANSP), a;&CD ; metemos call
		;ld HL, PINTA_SEG_TR
		;ld (pnts_PINTA_NOTRANSP+1), HL ; metemos la direccion del call

PNTS_notr	

		;---------------------


                ; rellenamos algunas variables
		;----------------------------
		; hay variables que ya estan rellenas antes de llegar aqui y que rellena PRINTSPALL
		; tales como SPR_anchoalto y SPR_anchoaltofinal
		ld hl,(SPR_image); direccion de la imagen, no donde comienza el dibujo
		inc hl; alto, ya cargado en SPR_anchoaltofinal
		inc hl; dx1
		ld a,(hl)
		ld (PNTS_dx1),a
		inc hl; dibujo
		ld (SPR_imagefinal),hl; la imagen se encuentra 4 bytes mas lejos, debido al ancho, alto y deltax
		LD (SPR_image_data),HL;
		
		; chequeo si estoy en modo 3d o no
		;----------------------------------
		ld a, (R3d_mode)
		and a
		JR NZ, PNTS_3D
		;-------- CASO NO 3D -------------
		; en caso no3d las coord no estan proyectadas, y tampoco estan en SPR_coord_no3d
		; las copio porque luego las usare. en caso 3d ya han sido guardadas en SPR_coord_no3d justo
		; antes de ser proyectadas
		ld hl,(SPR_coordx)
		ld (SPR_coordx_no3d),hl
		ld hl,(SPR_coordy)
		ld (SPR_coordy_no3d),hl
		;-------------------------------

PNTS_3D
		; en la rutina printsprite, se hace computedirpant tras el cliping, pero hemos
		; llegado aqui sin hacer cliping ni, logicamente, computedirpant.
		; solo se ha hecho el clipV y antes he guardado en SPR_coordy_no3d_noclip
		;----------------------------------------------------------------------------
		; SPR_coordx es el punto1. ya esta proyectado, aunque puede salirse de la pantalla
		ld hl, (SPR_coordx)








		ld (SPR_x1), hl; guardo el x1 proyectado aunque sea fuera de pantalla
	
	;jr PNTS_3D_inrange

		; ojo, si hl >255 no puedo llenar el xini con un solo byte
		; y lo mismo si hl <0


		ld bc, 127
		sbc hl, bc
		RET P; coordx>127 o incluso negativo
		ld hl, (SPR_coordx)

		;ld a ,h
		;and a 
		bit 7,h
		JR Z, PNTS_3D_inrange; salta si no es negativo. ya he comprobado lado pos. .... o si es <255, y como ya se que es <127 pues eso
		; tengo que pasar a 8 bit el valor de hl

		; los limites van a ser los que soporta 1 byte, es decir desde -127 hasta +127
		ld bc, 127
		add HL, BC; si al sumar 127 sigue siendo negativo es que es muy negativo


		ld a, h
		and a
		;bit 7,h; v33

		RET NZ; aun negativo. muy lejos como para pintarlo (x<-127)
		; si es negativo queda pasarlo a un byte
		; por ejemplo -100 = &FF9C 
		; FF9C + 256 = &9C (1 byte) y &9C es precisamente -100

		ld hl, (SPR_coordx)
		ld bc, 256
		add hl, bc; 
						
PNTS_3D_inrange	ld a,L
		ld (PNTS_xini),a; coordenada x donde empezara a pintar la primera scanline. puede ser negativa!
				; y tambien podria ser mayor de 80, de hecho puede ser hasta +/- 127



		;         clipping horizontal inicial
		;-------------------------------------------------
		ld hl,(SPR_imagefinal);
		CALL _3D_CLIP_SCANLINE
		ld  (SPR_imagefinal),hl;
		ld h,0
		ld a,(PNTS_xini)
		ld l,a
		ld (SPR_coordx),hl; 
		;----------------------------

		
		; guardo la coordenada y del punto 1 proyectado
		ld hl, (SPR_coordy); esta direccion luego se usa para el punto2
		ld (SPR_y1), hl; esta siempre sera Y1
		;-----------------------------------

		call _COMPUTE_DIRPANT; HL ahora tiene la dir de pantalla de punto1
		ld (SPR_dirpant),hl

		

		; calculo del punto 2 coord y del segmento en el mundo 2D (sin proyectar)
		;------------------------------------------------------------------------		
		; SPR_coordy , SPR_coordx estan ya proyectadas si estamos en modo 3D
		; pero si estamos en modo NO3D, no estan proyectadas

		;ld a,0
		;ld (PNTS_pt2_clipvinf), a

		ld a, (SPR_coordy_no3d); coord y del punto 1 sin proyectar (es la z)
		;ld a, (SPR_coordy_no3d_noclipV); coord y del punto 1 sin proyectar (es la z) y sin clipv

		ld bc,(SPR_anchoaltofinal) ;el alto aun es sin proyectar
		;ld bc,(SPR_anchoalto) ;el alto aun es sin proyectar y sin clip

		;inc a
		add a,b; b es el alto, c es el ancho
		AND A ; CARRY OFF

		;ld e,a

		ld b,a	; coord sin proyectar del pt2
		ld a, (SPR_MAX_Y); aunqe maxy es un word, como mucho sera 200
		
		cp b 
		JR C, PNTS_CLIP

		
PNTS_NOclipVinf    
		ld a, b
PNTS_CLIP	ld (SPR_coordy),a; esto es Punto2y antes de ser proyectado

		;xor a; pone a=0
		;ld (SPR_coordy+1),a; esto no se si realmente lo necesito pero conviene 

		; calculo del punto2 coord x en el mundo 2D (sin proyectar)
		;----------------------------------------------------------------
		; estrategia es usar pt1x como coordenada de punto2x, luego sumaremos el dx
		ld hl,(SPR_coordx_no3d); coord x del pt1 sin proyectar, que de momento es la misma q punto2
		ld bc, (PNTS_sumax2)
		add hl,bc


		; AHORA HAY QUE SUMAR EL DX1

		ld a ,(PNTS_dx1); puede ser negativo
		bit 7,a;and a
		JR Z, PNTS_dx1pos;JP P, PNTS_dx1pos
		neg
		ld b,0
		ld c,a
		sbc hl,bc; resta

		JR PNTS_dx1sumado
PNTS_dx1pos     ld b,0
		ld c,a
		add hl, bc;suma

PNTS_dx1sumado
        	ld (SPR_coordx),hl; lo calculo inicialmente como un segmento recto sin inclinacion


;		      1----+
;                    /    /
;                   /    /
;                  2----+   
		; despues debo calcular la coordenada proyectada de punto2
		; llamando a _3d_computexy para proyectar dicha esquina
		
		ld a, (R3d_mode)
		and a
		JR Z, PNTS_despues_proyectar

		; si estamos aqui es que hay que proyectar el punto2 (modo 3d)
		;-------------------------------------------------------------
PNTS_proyectar	call _3D_PROYECTA_xy; proyecta punto2 (x2,y2)
		; las coordenadas proyectadas del punto2 estan ahora en  SPR_coordx, SPR_coordy
		; ojo porque puede estar fuera de pantalla pero no importa porque de momento no voy a 
		; calcular su direccion. tan solo la del punto 1. calcularemos el dx y viajaremos desde
                ; punto1 hasta punto2 haciendo cliping. no calculamos la dirpant de punto2
		
PNTS_despues_proyectar
		; calculo el nuevo alto y lo inserto en SPR_anchoaltofinal
		; para calcular el nuevo alto debo restar la coordy proyectada del punto 2 menos la del punto 1
		; Es y2-y1 pues y2>y1. asi el nuevo alto sera positivo
		ld hl, (SPR_coordy) ; es punto2 proyectado
		ld bc, (SPR_y1); es punto 1 proyectado
		and a
		sbc hl,bc; el alto final ahora esta en L, pues es <255. 
		ld a,l
		and a
		ret z ; esto es necesario porque despues de proyectar puede ocurrir que pt1 y pt2 sean la misma linea
		ld (SPR_altofinal),a; YA TENGO ALTO FINAL, proyectado

		; calculo del dx a sumar en cada scanline
		;------------------------------------------
		; de momento contempla un segmento no torcido, pues hemos asignado pt2x=pt1x antes de proyectar
		; sin embargo tras proyectar, tenemos un dx debido a la proyeccion
		; el dx lo calcularemos *N, para poder trabajar con enteros y no perder precision
		; ahora calculo dx=(SPR_coordx-SPR_1x)*N/alto , es decir uso x2-x1 proyectadas
		; ojo porque puede ser negativo. lo necesito en positivo
		ld hl, (SPR_coordx) ; es punto2 proyectado (sin proyectar es el mismo valor que pt1x)
		ld bc, (SPR_x1); es punto 1 proyectado
		xor a ; pongo A=0 para signo positivo
		and a; acarreo a cero
		sbc hl,bc; hl= x2-x1. ojo porque x2 puede ser negativo
		JP P, PNTS_dxpos; si el resultado es posivo
		;JR Z, PNTS_dxpos; tambien en caso cero. esta incluido en pos

		; estoy aqui porque dx es negativo
		; hay que transformarlo en positivo
		; no puedo usar neg porque neg hace el complemento a 2 de un registro de 8 bit y no hay 
		; equivalente para uno de 16 bit. (neg = xor 255 +1)
		ld a, h
		xor %11111111
		ld H,a
		ld a,L
		xor  %11111111; 
		ld l,a
		inc hl
		ld a,1; 1 es dx<0

PNTS_dxpos	; tenemos el dx en HL. dx es la variacion de x tras proyectar un segmento recto (no torcido)
		; ojo , este signo puede cambiar cuando sumemos el dx1

		

		ld (PNTS_dxsigno),a; 0= pos, 1= neg

		; proteccion, aunque dy=1, el dx quedara como mucho de 127
		;ld a, l
		;cp 127; 64x4=255
		;JR C, dxok
		;ld l,127;
;dxok

		
		
		; debo multiplicar el dx por N  para que al dividir no desaparezca
		;esto es mas rapido que rotar pues rotar son 2 ciclos por cada 8 bit (4 ciclos)
		; y una suma son 3 ciclos
		add hl,hl; x2
		add hl,hl; x4
		add hl,hl; x8
		add hl,hl; x16
		add hl,hl; x32
		;add hl,hl; x64
		VECES  equ 32;64;32;64

		;el dx*N queda en L, supongo que es inferior a 255
		
		;ojo, si es mayor

		; queda dividir entre el alto final
		; resto N veces y por cada vez sumo 1 al registro e
		ld e, 0 ; voy a usar de como resultado
		ld b,0


		; diferencio dos casos, segun ha habido clipV inf o no
		;--------------------------------------------------
		ld a, (PNTS_pt2_clipvinf)
		and a
		jr Z, PNTS_nopt2v

		; si dx1 es 0 no es alto sino altofinal
		ld a, (PNTS_dx1)
		and a
		JR Z,PNTS_nopt2v

		ld a,(SPR_alto) ; AQUI TENDRIA QUE SER ALTO
		JR PNTS_sipt2v

PNTS_nopt2v	ld a,(SPR_altofinal); esto modifica alto en anchoaltofinal porque es la misma direccion
PNTS_sipt2v	ld c,a; ahora bc tiene el alto
		and a; quito acarreo

		;ret z ; si a es cero entonces el alto es cero
		
		xor a;

PNTS_div	sbc hl, bc ; BUG. si HL=0 y BC=0 este es infinito
		JR C, PNTS_divfin2
		;JR Z, PNTS_divfin
		inc e
		;JR C, PNTS_divfin1
		ld a,e
		cp 255
		JR Z, PNTS_divfin1; e es 127!!!
;		and a; acarreo a cero
		JR PNTS_div

PNTS_divfin1	ld e,255

PNTS_divfin2	; ahora DE contiene la division, es decir dx a aplicar en cada scanlinex64
		; DE nunca sera negativo
		

		ld a,e

		; proteccion, 
		;cp 127; 64x4=255
		;JR C, dxok
		;ld a,127; A VECES DESBORDA!!!!!!
dxok




		ld (PNTS_dx2pos),a

		;ld (PNTS_dx2pos),de

		;JR PNTS_dx2fin


PNTS_dx2fin	
		; ponemos a cero el acumulador de diferenciales
		xor a
		;ld a,63
		ld (PNTS_dxacumul),a




;-----------------------------------------------------------






;-----------------------------------------------------------
		; ahora comienza la rutina de impresion
		;--------------------------------------
PNTS:
		ld de,(SPR_imagefinal); direccion de memoria donde se encuentra la imagen a pintar
		ld bc,(SPR_anchoaltofinal) ; ancho final en c, que es el de la scan
		ld hl, (SPR_dirpant); direccion de memoria de pantalla donde vamos a pintar
		ex de,hl; ahora en DE esta la dir pantalla donde vamos a pintar
			; en HL esta la dir de la imagen a pintar

		ld a,(SPR_anchofinal); este es el ancho de la scanline
	
PNTS_loop_alto
		push bc; al entrar b contiene el alto, luego se va decrementando. y c contiene el ancho
 		push de; dir pantalla
	

PNTS_loop_ancho      
;		ld a,b; b contiene el alto, que se va decrementando por cada scanline
		ld b,0; ahora como b=0 , BC contiene el ancho final 


PNTS_scanh	

DEL_PAINT_SEGMENT
		;nop 
		;nop
		;nop


		; PINTA una scanline!!!!!
		;**************************
		; SI bc<=0 ENTONCES NO DEBO IMPRIMIR. bc contiene el ancho
		;bit 7,c
		;JR NZ, pnts_NOPINTA
		DEC C 
		JP M,pnts_noPINTA; cubre el caso c=0 y c<0, pues he hecho dec c
pnts_PINTA	INC C

pnts_PINTA_NOTRANSP
		
		ldir; (DE)<--(HL) till bc=0
		; la instruccion LDIR ocupa 2 bytes "ED B0"
		nop; para poder cambiar LDIR+NOP por CALL PAINT_TRANSP_SCAN


pnts_NOPINTA
;		ld b,a; recupero el alto . esto sobra creo yo

		; -------esto lo comento porque es de la rutina de impresion "Normal"------
		; si no se ha transferido todo el ancho (por cliping Horizontal)
		; debo sumar a HL lo que falta
		; ld de,(PNT_restoancho)
		; add HL,de 
		;--------------------------------------------------------------------------
		; en un segmento lo que se debe hacer es retornar hl a su valor
		ld d,0
		ld a,(SPR_anchofinal)
		ld e,a
		and a
		sbc hl, de
		;---------------------------------------------------------------------------
		

PNTS_saca_pant
        	pop DE; saco pant, como si no hubiese sumado el ancho

		
		; APLICACION DEL DX a la direccion de pantalla (DE)
		;--------------------------------------------------------------------

		ld a, (PNTS_dxacumul) ; acumulador de dx hasta llegar a N (N=veces=64)
PNTS_bucNold	ld b, a
		ld a,(PNTS_dx2pos)
		add a,b; suma dx2 al dxacumul
		ld (PNTS_dxacumul),a
PNTS_bucN	cp VECES; al estar el dx2pos multiplicado x 4, debo sumar cuando llegue a 4
		JR C, PNTS_menor_N; salta si es  menor que N
		;JP M, PNTS_menor_N; salta si es  menor que N
		; hemos llegado a N o lo hemos pasado
		; hay q que sumar 1 o mas
		; segun el signo hay que sumar o restar 1
		ld bc,1;estoy es un bucle, se pueden sumar varias veces

		; pero ojo, cada b

		ld a,(PNTS_dxsigno)
		and a
		JR Z , PNTS_spos
		; si estoy aqui es que el dx es negativo
		ld bc ,-1; bc=-1 esto es un bucle, se pueden restar varias veces -1


		ld a, (PNTS_xini)
		dec a
		ld (PNTS_xini),a


		JR PNTS_suma

PNTS_spos
		ld a, (PNTS_xini)
		inc a
		ld (PNTS_xini),a

PNTS_suma	;actualizacion de la direccion de pantalla (DE)
		ex de,hl
		add hl, bc; suma un 1 o un -1 a hl, el cual contiene DE
		ex de,hl ; ahora DE ha quedado como DE+1 o DE -1
		ld a,(PNTS_dxacumul)
		sub VECES; resto N al acumulador de dx
		ld (PNTS_dxacumul),a
		JR PNTS_bucN
PNTS_menor_N	ld (PNTS_dxacumul),a
		;----------------------------------------------------

		CALL _3D_CLIP_SCANLINE
		pop bc; BC contenia c=ancho b=alto no puedo hacer esto por que el call ha metido un PC en la pila
		ld a, (SPR_anchofinal)
		ld c,a
		push bc
			

		; continuamos con la rutina de impresion
		;---------------------------------------
		ld A,D
		add &08; es decir, 2048 (2KB)

		ld D,A; suma 2048 y lo mete en d
		sub &C0; si ahora salta flag acarreo es porque nos hemos pasado al sumar 2048
	
		jr nc,PNTS_sig_linea
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
PNTS_sig_linea
		pop bc; b tiene el alto, c el ancho
		;dec b
		;JP NZ, PNTS_loop_alto
 		djnz PNTS_loop_alto; dec b y salta. B contiene el alto

		ret

PNTS_out_clipizq
		pop de

PNTS_out_clipizq2
		pop bc
		ret







;=============================================================================================================
; _PRINT_SPRITES(spriteid_final_orden, anima, sync)   PS2
; desde BASIC es |PRINTSPALL
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
_printspall
_PRINT_SPRITES

PS2:


		; mejora. si los parametros no llegan supongo lo que pongan los flag
		; que son lo ultimo que se invoco
		and a
		JR Z, PS2_noparam; si es NZ es que han llegado parametros
	
		; si estamos aqui es que hay parametros

		;cp 1
		dec a ; v37

		JR NZ,PS2_check2param
		; estamos aqui por que hay un unico parametro
		ld a,(IX+0); parametro orden total
		
		;cp 4; este modo significa ordenar los sprites del 0 al 31 sin resetearlos, es quitarles el orden
			; como en realidad siempre se imprimen con el orden que tengan, es una forma de quitarles el orden
			; aunque ahora si cambia N en una llamada a printspall, les quita el orden
			;por lo tanto este valor "4" es mejor que no exista
		;JR NZ,PS2_type
		;JP SOR_default; call +ret

PS2_type
		ld (FLAG_YMAX),a ; v36 un numero entre 0 y 3 
		;or a; opt
		and a, %00000001 
		jr nz, PS2_set_orden_total
		ld (PS2_sort_total), a ; escribe un cero
		ld (PS2_sort_total+1), a; escribe un cero 
		ret

PS2_set_orden_total
		ld a, &20
		ld (PS2_sort_total), a
		ld a,&fA
		ld (PS2_sort_total+1), a
		ret


PS2_check2param
;		cp 2
		dec a; v37
		JR Z,PS2_2param
		; estamos aqui porque hay 3 o 4 param
PS2_check3param
;		cp 3
		dec a; v37
		JR Z,PS2_3param

PS2_4param	; si estamos aqui es que hay 4 param
		ld a, (IX+6)
		; a=a*16
		add a,a; *2
		add a,a;*4
		add a,a;*8
		add a,a;*16
		ld c,a
		ld b,0	
		ld HL,27000
		add hl,bc
		ld (SOR_DIRSTART),HL
		

PS2_3param	; si estamos aqui  es que hay 3 parametros 
		ld a,(IX+4);menos signific, este parametro contiene N = num sprites a ordenar
		;cp a,0
		;and A ; es como cp a,0 pero consume solo 1 ciclo.
		;ld (PS2_flag_orden),a

		ld c,a
		ld a, (PS2_orden)
		cp a,c; comparo para ver si ha cambiado N desde la ultima vez
		ld a,c
		ld (PS2_orden),a
		ld (_OPER_HEIGHTS+1),a; v36b
		JR Z, PS2_sameN; Z activo si a y c son iguales
		; si estamos aqui es porque ha cambiado N, el numero de sprites a ordenar
		call SOR_default

PS2_sameN	;nada que hacer


PS2_2param	

		; primero compruebo animacion pues si primero sincronizo, pierdo el tiempo de barrido		
		ld a,(IX+2);menos signific. si es 0 no habra sync
		ld (PS2_flag_anim),a
		
		; aqui falta recoger el parametro de flag de orden y el de sincronismo
		ld a,(IX+0)
		ld (PS2_flag_sync),a

PS2_noparam
		CALL _GET_MODE ; v34 obtiene el modo grafico

		;ld a, (PS2_flag_anim)    ;v39
		;and a                    ;v39
		;call NZ, _ANIMA_ALL      ;v39

		
PS2_mas		ld a, (PS2_orden)
		and a
		;cp 31 ; si Sprite>=31  no se ordena nada, se recorre en modo secuencial
	 	;JR NC,PS2_ns ; ns es NO SORT = no ordenar. en ese caso se recorren secuencialmente

		JR Z, PS2_ns; si es cero es que no sort

		; ordenamiento de la tabla de sprites
		;ld a,1; modo ordenar por coord Y


		;V36 esta instruccion sobra?
		; no sobra. Si N=0 (N se guarda en PS2_orden) entonces no llegamos aqui, no se ordena
		; si N>0 entonces hay que ordenar N+1 sprites y dicho numero es lo que se guarda en SOR_MODE
		; sin embargo, es una variable que solo se usa para diferenciar entre cero y distinto de cero
		; al invocar a SORTY, de modo que se podria simplificar y asignar un simple 1, o incluso
		; usar PS2_orden en su lugar y ahorrar esta variable y su asignacion.

		;inc a ; 
		;ld (SOR_mode),a


		; begin v36
		ld a , (FLAG_YMAX)
		and a,%00000010
		JR Z, PS2_sortagain
		CALL _ADD_HEIGHTS
		; end v36


PS2_sortagain	;call _SORTY
		; llamo a SOR_ORDEN y me ahorro el chequeo de SOR_MODE
		CALL SOR_orden
		
		and a

PS2_sort_total 
		;si solo hay un param es para poner sort total o sort parcial
		;esto se escribe en tiempo de ejecucion
		;JR NZ, PS2_sortagain ; = 20 FA
		nop
		nop
		


		; begin v36
		ld a , (FLAG_YMAX)
		and a,%00000010
		JR Z, PS2_sortdone

		CALL _SUB_HEIGHTS
		; end v36
		;------------
PS2_sortdone	; AQUI LLEGAMOS CON LA ORDENACION HECHA
		ld de, PS2_sort
		ld (PS2_sd+1), de; para rellenar un JR PS2_sort
		ld de, PS2_sortsig
		ld (PS2_sig+1),de
		ld bc, (SOR_ini)
		dec bc
		ld (PS2_dini+1), bc 
		JR PS2_chksyn

PS2_ns		; modo ns ("no SORT") (no se llama a SORTY y se recorre secuencialmente)
		; todo esto son modificaciones de codigo fuente
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

	;	cp NUM_SPRITES-6
	;	CALL Z, _SYNC


PS2_sd		; este JP no puede ser un JR porque se escribe en tiempo de ejecucion
		Jp PS2_nosort; modo ordenado y no ordenado. la direccion de salto se sobreescribe si es modo sort

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


DELSP_PS2
;---------------------seccion _DELSP -----------------
;		and a
;		ld (SPR_ID), a;
;DELSP_PS2INI
;		cp 33; se modifica luego. sprid empieza en 32
;		JR NC,PS2_next
;		and a; quito el acarreo, que hay seguro si estoy aqui
;DELSP_PS2fin
;		cp 0
;		JR C,PS2_next
;-----------------------end seccion _DELSP --------------

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
		dec hl; deja HL en posicion de sprite status
		


	
PS2_NO3D
		call PSP_i; invoca a print sprite de sprite i
		
		; v36 aqui puedo meter un salto en tiempo de ejecucion a PS2_next en caso no_sort
		; y si es sort entonces guardo la altura en la tabla



PS2_next	pop hl; HL contiene la direccion del sprite que se acaba de imprimir
		ld a, (PS2_spid);OJO esto solo es un contador. no es el sprite id
		
PS2_noc		

		dec a
		ld (PS2_spid), a
		;JP M, PS2_fin; si es negativo es que ya hemos animado el sprite 0
		JR Z, PS2_fin; si es negativo es que ya hemos animado el sprite 0
		
PS2nos

PS2_sig		; no se puede cambiar por JR porque se modifica en tiempo ejecucion
		JP PS2_nosortsig; la direccion se altera segun el flag

		; actualizo el puntero a la direccion de sprite i
PS2_nosortsig	ld bc, 16;sprite_size


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

		;xor a
		;ld (flag3D),a

		;v39 he cambiado esto de sitio. ahora la animacion se hace al final

		;begin mejora v41_001		
		; si venimos desde printsp no hay que animar
		ld a, (PRINTSP_flag) 
		and a
		jr z, PS2_noprintsp

		ld a,0
		ld (PRINTSP_flag),a
		ret
		;end mejora v41_001

PS2_noprintsp
		ld a, (PS2_flag_anim)
		and a
		call NZ, _ANIMA_ALL

		ret



;==============================================================================================================
;cache. son  150 bytes en total, gracias a las optimizaciones
; CACHE Y=f(z), desde z=200 hasta z=50. a partir de z=49, y=z
; ------------
; la cachex x=f(y) iria desde x(100)= 16 hasta x(0)=64, simplemente cada 2y reduce 1 la x, por lo que x=(y-100+28)/2 
; es decir x= (y-100+28)>>1, por lo que no hace falta cachex

; AQUI HAY QUE PONER EL PROGRAMA QUE GENERA ESTA CACHE
;20 REM array de y=f(z) con una cache de 200 bytes
;21 DIM fy(200)
;31 ddy=0.0045 
;32 print #8,"; CACHE Y=f(z)"
;33 print #8,"; ------------"

;40 FOR z=200 TO 0 STEP -1
;50 fy(z)=int(y+0.5)
;51 if (z<=49)then  fy(z)=z
;60 dy=dy+ddy
;61 y=y-dy
;65 PRINT "fy(";z;")=";fy(z); " dy=";dy
;66 print #8,"db ";200-fy(z)
;70 NEXT


;=====================================
; _3D_PROYECTA_XY() XY3D
;=====================================
;
;  INPUTS 
;   SPR_coordx, SPR_coordy
;  primero se hace y=f(z), siendo z la SPR_coordy
;  despues se calcula la x comprimiendola respecto el centro, lo mas alejado (y mas arriba) se comprime mas
;  la proyeccion que se hace es transformar la pantalla de 80x200 en un trapecio. 
;  en el caso mode3d=2, el lado superior visualiza ahora 320, por lo que todo se vera 4 veces mas pequeno. 
;  se multiplica por 0.25  el lado inferior se multiplica por 1, y queda igual, 80
;
;                 320                      80
;          +-------------+             +---------+
;           \           /  ----->      |         |
;            \   80    /               |   80    |
;             +------ +                +---------+
;
; el resto de modos son
; mode 1 = arriba es 160 y abajo 80
; mode 3 = arriba es 320 y abajo es 40

; variables locales
;----------------------
;XY3D_SIGNO	db 0 ; 0=pos, 1=neg
;XY3D_center_projection	dw 160;40
;XY3D_ratiox	db 0;
;SPR_coordx_no3d	dw 0
;SPR_coordy_no3d dw 0


_3D_PROYECTA_XY

	;push hl; guardamos HL lo primero
	; vamos a guardar las coordenadas sin proyectar para no perderlas
	; si usamos segmentos, las necesitaremos
	;------------------------------------------------------------
	;ld hl,(SPR_coordx)
	;ld (SPR_coordx_no3d),hl


	
	


XY3D_dx1zero	
	;ld hl,(SPR_coordy)
	;ld (SPR_coordy_no3d),hl


	

	; map2sp ya ha colocado las coord bien (son relativas a (xo,yo), de modo que coordy va de 0 a 200
	; ademas, aqui se llega con el cliping vertical hecho (ajustado alto final)
	; OJO, el clip horizontal no esta hecho pues la coord x va a cambiar

	; analizamos el caso. hemos de tener en cuenta que z=0 se corresponde con coordy=200
	; y z=200 se corresponde con coordy=0, es decir z=200-coordy
	
	;1)  caso z<50 . coordy =[150..200] 
	; -----------------------------------
	; como map2sp ya ha eliminado todo aquello que esta por debajo de la pantalla de visualizacion,
	; es como si ya se hubiese hecho un clipping vertical.
	; para z<50-->y en [150,200] se usa y'=y

	ld hl,(SPR_coordy)
	ld bc, 149
	and a
	SBC hl,bc
	JR NC,XY3D_X; se va a proyectar la X

	;2) caso 50<z<110--> coordy=[90..149] 
	;--------------------
	; para z en [110,150] -->y en [90,150] se usa y'=120+(y-90)/2 es decir se divide en 2 el intervalo
	ld hl,(SPR_coordy)
	ld bc, 89;//100
	and a
	SBC hl,bc
	JR C,XY3D_Y2
	; estoy aqui porque coordy>90 , es decir z<110 . (ahorro otros 60 bytes)
	; debo hacer y=120+(100-z)/2 
	;  y=120+(100-200+coordy)/2 =120 +(coordy-100)/2=120+coordy/2-50 =80+coordy/2
	;ld hl,(SPR_coordy)
	SRL H	
	RR L;dividido entre 2
	ld bc,122;//74 pongo 73 para dar coherencia al no uso de cache en tramo 3
	add hl, bc
	ld (SPR_coordy),hl
	JR XY3D_X



XY3D_Y2
; nuevo ajuste
	;ld hl,(SPR_coordy)  
	;ld bc, 50
	;sbc hl, bc
	;JR NC, XY3D_Y3
	;ld hl, 100
	;ld (SPR_coordy),hl
	;JR XY3D_X

	; caso z>110--> y=[0..89]
	; ------------------------------------------------
	; aqui no voy a hacer el cliping. esto ahorra cache
	; para z en [0,110] -->y en [0,90] se usa y'=100+(y)/4 es decir se divide en 4 el intervalo
XY3D_Y3	ld hl,(SPR_coordy)
	SRL H	
	RR L;dividido entre 2
	SRL H	
	RR L;dividido entre 4
	ld bc,100;//74
	add hl, bc
XY3D_Y2fin	
	ld (SPR_coordy),hl


XY3D_X  ; mapping de X a 3d 
	;-----------------
	; 3D-MODE =2
	;---------------
	; ratiox=[(y-100 +32)/2 ] y pertenece a [16 <--> 64]. al dividir entre 64 quedara un ratio [0.25 <--> 1.0]
	; en realidad para llegar a 64 debe ser 28 y no 32, y para llegar a 16 debe ser 32 y no 28.
	; de modo que pongo 30 y listo
        ; la x final debe ser 
	; x'= (40-x)*ratiox /64  si x'>0 es lado izquierdo
        ;si x'<0 es que es el lado derecho de la carretera, en ese caso  xfinal= 40-x'  

 	ld hl,(SPR_coordy)
	ld de, 100-30; 70; mode 2 -> 70 (normal) usar 72 es llegar a 128/2=64. si uso 70 es llegar a 65
	and a; pone acarreo a 0
	SBC HL, de; hl=hl-100+30

	; 3D-MODE =1
	;---------------
;	;ratiox=[(y-100 +141)/4 ] --> faltan 111 por sumar 
;	ld a, (R3D_mode)
;	cp 2
; 	jr z, xy3d_div

;xy3d_mode1; en mode 1 dividimos 2 veces pues es division entre 4
;	ld bc, 128-30;//111; 
;	add HL,bc ; 

;XY3D_div1; division entre 2
;	SRL H	
; 	RR L; 

xy3d_div ; ahora divido entre 2
	SRL H	
	RR L


	; almacenamos el resultado
	LD A, L
	LD (XY3D_ratiox),a

	; centrado de la coordenada x en 160
	;------------------------------------
	ld hl,(SPR_coordx)
	ex de,hl
	
MID_HORIZON
	ld hl, 160; centro del horizonte. en _3D_RENDER() se pone a 160
	and a; pone acarreo a 0 . no hace falta pues uso JP P ?????
	sbc hl,de; ahora hl es 160-x
	
 	;JP P, XY3D_POS; 
	JR NC, XY3D_POS; V33


	; si estamos aqui es que x' =es negativo
	;---------------------------------------
	; y por lo tanto estamos en el lado derecho de la carretera
	ld a, 1
	ld (XY3D_SIGNO),a
	
	add hl,de;; se queda como estaba hl=160, de=x
	ex de,hl; intercambio los valores
	sbc hl,de; y se hace la resta al reves 	
 


XY3D_POS
	; si hemos llegado aqui es por que estamos en el lado izquierdo (x<160)
	; si es >255 debo de considerar que no se va a imprimir y ademas no podre multiplicarlo por ratio
	;ld a,h
	;and a
	bit 7,h

	JR Z, XY3D_in_range
	ld hl, 255; esto es una chapuza. me llevo la x al maximo .Asi queda [-255 <---> +255]
	; este 255 es lo que se va a multiplicar por el ratio. Esto significa que no se puede proyectar nada que se 
	; encuentre en un campo de [-255 a +255] considerando como cero el centro de la pantalla
	jr XY3D_prefin

xy3d_in_range
	ld a, (XY3D_ratiox)
	ld e,a

	ld h,l; en h ahora esta 160-x
        ; ahora h contiene x centrada y E contiene el ratiox
	CALL _mul8bit;  HL=H*E
	; tras multiplicar, HL se ha vuelto enorme, ahora dividimos

	;ld a, (R3D_DIV)
	;ld b,a
	ld b, 6; opt v33 eliminacion de r3div


XYBUC	; en cada bucle divido entre 2
        SRL H	
	RR L
	DJNZ XYBUC		
	
        ; el resultado debe ir de 0 a 255 aunque queda tener en cuenta si es positivo o negativo
	; el horizonte se ha comprimido
	; el suelo no se ha comprimido

XY3D_prefin
	ld a, (XY3D_SIGNO)
	and a
	JR NZ, XY3D_DERE
			
	ex de,hl
	ld hl,40;//(XY3D_center_screen) 
	sbc hl, de
	;puede ser menor de cero, saliendose de la pantalla
	

	JR XY3D_fin
	
XY3D_DERE 
	; signo a 0 , para la proxima vez que entre en la funcion
	ld a, 0
	ld (XY3D_SIGNO),a
	ex de,hl; 
	ld hl, 40;//(XY3D_center_screen)
	add hl, de
	; puede ser mayor de 80, puede salirse de la pantalla

XY3D_fin
	 
	ld (SPR_coordx),hl

XY3D_fin2
	ld hl, (SPR_coordy)
	ld b,0
	ld a, (XY3D_offsetY)
	ld c,a
	and a
	SBC hl, bc
	ld (SPR_coordy),hl

	;pop hl
	ret








;========================================================================
; RENDER3D    R3D (flag3d,spritefin,offset)  comando |3D
; si flag3d es cero entonces los demas parametros no hacen falta
;
;    |3D,1,#,offsety
;    |3D,0
;
;
; sprite_fin es el ultimo sprite que se proyecta en 3d. sprites superiores a ese umbral se proyectan en 2d
;      por defecto su valor es 31
;========================================================================

; variables locales
;-------------------------------------
R3D_mode db 0;
;R3D_DIV	db 6; 6 veces entre 2 es dividir entre 64 . v33 optimizacion eliminada

R3D_MAX_sprite_Dir dw 25000; por defecto ninguno se proyecta
;32000;27480 por defecto todos pueden proyectarse en 3d
;R3D_MAX_sprite_Dir dw 32000;25000;por defecto ninguno se proyecta

;function body
;-------------------------------------


_3D_RENDER3D
_RENDER3D
	; si lle
	;cp 1
	dec a; opt
	jr Z,_3D_no; si llega un solo parametro supongo que es un cero

	ld a,(ix+0); parametro offset
	ld (XY3D_offsetY), a


	ld a,(ix+2); parametro spritefin
	;ld c,a
	call _get_dir_sp	

;	ld h, a
;	ld e, 16;, a;(R3D_spritefin), a
;	CALL _mul8bit;  HL=H*E
;	ex hl, de
;	ld hl, 27000
;	add hl, de
	inc hl; asi entra el sprite indicado
	ld (R3D_MAX_sprite_Dir), hl
	
	ld a,(ix+4); parametro mode 3d
	ld (R3D_mode), a

	and a
	Jr NZ, _3D_SI; 

	; MODE 0 = no hay 3D
        ;--------------------
_3D_no	; ponemos ancho =80 en MAP2SP
	ld hl, 79
	ld (M2S_ANCHOVISIBLE), hl
	;ld hl, 25000; con esto todos los sprites son superiores a HL y ninguno se proyecta
	;ld (R3D_MAX_sprite_Dir), hl
	ld (R3D_MAX_sprite_Dir), hl ; opti el 79 tambien vale como 25000
	ret

;_R3D_fin	



_3D_SI	; llegamos aqui desde RENDER3D, porque R3D_mode <>0

R3D_modes12

;	ld a,6 
;	ld (R3D_DIV),a; divisor 6 es dividir entre 64

R3D_2		
	ld hl, 360; algo mas de 320
	ld (M2S_ANCHOVISIBLE), hl
	ld hl, 160
	ld (MID_HORIZON+1), hl
	ret
R3d_fin


;_END_8BP

;_FIN_26000 ya no hace falta
	

;================================================================================================================
; 
; V30 -> comenzamos en 26000 
; el mapa del mundo, que ocupa 390 bytes ahora se almacena solapado con el layout
; pues no tiene sentido un juego con scroll que usa layout
; es necesario desde basic ejecutar memory 25999 al principio del programa
;================================================================================================================
;org 26000



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


;M2S_SP_POINTER	dw _SPR_SPRITES_TABLE; puntero al primer sprite a dar de alta
;M2S_sprites	db 0; este es un output de la funcion
M2S_sprites_before db 0; num sprites en la invocacion anterior
M2S_ANCHOVISIBLE	dw 79; ancho en bytes visibles en la pantalla. el byte 80 no es visible





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


;M2S_SP_POINTER	dw _SPR_SPRITES_TABLE; puntero al primer sprite a dar de alta
;M2S_sprites	db 0; este es un output de la funcion
;M2S_sprites_before db 0; num sprites en la invocacion anterior



;M2S_pXorig 		dw 0 ; pointer coordx del origen "movil". inicialmente deberia ser 0
;M2S_pYorig 		dw 0 ; pointer coordy del origen "movil". inicialmente deberia ser 0


;M2S_numparam		db 0; 
;function body

;M2S_ANCHOVISIBLE	dw 79; ancho en bytes visibles en la pantalla. el byte 80 no es visible
;-------------------------------------
_MAP2SP

		;recogida de parametros
		;----------------------
		;ld (M2S_numparam),a; lo necesito luego		
		;cp 1; si solo llega un param es el status para los sprites
		dec a ; opt
		JR NZ, M2S_no1

		ld a, (IX+0)
		ld hl, _MAP2SP_STATUS+1
		ld (hl),a
		; queda modificar la funcion de impresion de los segmentos 3d
		
		and 64
		JR NZ, M2S_PNTS_tr
		ld hl, &B0ED ; ldir
		ld (pnts_PINTA_NOTRANSP), hl; meto ldir
		ld (pnts_PINTA_NOTRANSP+2),a; a es cero y por tanto esto es un NOP
		ret

M2S_PNTS_tr
		ld a,&cd
		ld (pnts_PINTA_NOTRANSP), a;&CD ; metemos call
		ld HL, PINTA_SEG_TR
		ld (pnts_PINTA_NOTRANSP+1), HL ; metemos la direccion del call


		ret

M2S_no1

		; lectura de margen Y
		ld hl,(_MAP_TABLE); justo aqui se encuentra el max alto
		ld bc,199;200
		add hl,bc; alto pantalla
		ld (M2SYMARGIN),hl

		; lectura de margen x
		ld bc, (_MAP_TABLE+2); direccion donde se encuentra el offset x. Es negativo o cero
		ld (M2SXoffset),bc
		
		; ahora calculo el margenx
	
		;ld hl,79;80 en lugar de hacerlo a fuego lo hago con una variable para que sea compatible con 3d
		ld hl,(M2S_ANCHOVISIBLE); 

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
		
		;---------3d
		ld l,c
		ld h,b
		ld (M2S_Xinput),hl; lo guardo para usar en 3D
		;---------

		ld hl,(M2SXoffset); este offset es negativo o cero
		add hl,bc; por lo tanto esto es una resta
		
		; comprobamos 3d por si hay que restar 160 al xo
		;---------------------------------------------
		;ld a, (flag3D)
		;and a
		;JR Z, M2S_xo
		;ld bc, 160
		;sbc hl,bc


M2S_xo
		ld (M2S_Xorig),hl

		
		; origen Y
		;---------
		ld c,(IX+2)
		ld b,(IX+3)
		ld (M2S_Yorig),bc

		; si hay 3 parametros es el flag 3d. este tercer parametro es opcional
		; --------------------------------------------------------------------
		;ld a, (flag3D)
		;and a
		;JR Z, M2S_NO3D

M2S_3D		; llegamos aqui si hay flag de 3d
		; -------------------------------
		; mapeamos una ventana rectangular de 320 de ancho, para poder
		; albergar un trapecio de lado mayor 320 y lado menor 80, por 200 de alto
		; que es lo que se va a proyectar en PRINTSPALL al usar flag 3d
		;
		;               320
		;         +-------------+
		;          \           /    
		;           \   80    /   
		;            +-------+
		;----------------------------------------------
		;ld hl,320
		;ld (M2S_ANCHOVISIBLE),hl
		;JR M2S_run

M2S_NO3D	;ld hl,79
		;ld (M2S_ANCHOVISIBLE),hl
M2S_run

		; inicializacion de contador de map items a recorrer
		; lo inicializo con el numero maximo y va decrementansose
		; lectura del numero de items a considerar
		ld a, (_MAP_TABLE+4)
		ld (M2S_counter),a; inicializo contador de map items
		and a
		ret Z; importante . si no hay items y no hago esto, la funcion falla
		

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
		; si se encuentra dentro el resultado debe ser negativo pero no tiene porque haber acarreo
		; es el caso de si el origen es negativo, por ejemplo ox=-20, si x=-10 entonces -20-(-10)=-10. 
		;eso si, debe quedar un numero negativo <margenx

		;JR NC, M2S_next
		ld bc, (M2SXMARGIN)
		and a; acarreo a cero
		add hl, bc
		;adc hl,bc para afectar flag acarreo basta add
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
_MAP2SP_STATUS  ; con POKE a esta direccion+1 podemos modificar esto
		;ld a,%00000011;  colision de sprites + printspall
		;ld (HL),a
		ld (HL),%00000011 ; opt

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

		; aqui deberia sumar 160
		;correccion
		;-------------------------
		;ld a, (flag3d)
		;and a
		;jr Z, M2S_nosuma160
		;ld bc, 80
		;sbc hl,bc

M2S_nosuma160		

		ex de,hl; de contenia la direccion a la que cargar 
		ld (HL),e; coordenada x es cargada en sprite_table
		inc hl
		ld (HL),d
		
		; vy
		inc hl
		;xor a
		;ld (HL),a
		ld (HL),0; opt

		;vx
		inc hl
		;xor a
		;ld (HL),a
		ld (HL),0;opt

		;seq
		inc hl
		;xor a
		;ld (HL),a
		ld (HL),0; opt

		;frame
		inc hl
		;xor a
		;ld (HL),a
		ld (HL),0;opt
		inc hl; lo preparo ya en la direccion de imagen de la tabla sprites


		

		;image
		ex de,hl; de apunta a la tabla sprites
		pop hl
		push hl
		inc hl
		inc hl
		inc hl
		
		;call _check_image_list; he hecho este cambio en V32 para que se pueda pokear el mapa con numeros de imagen

		ld c,(Hl)
		inc hl
		ld b,(HL); ahora en bc esta la imagen
		ex de,hl
		ld (HL), c
		inc hl
		ld (HL),b; se acaba de cargar la direccion de la imagen
		
		; actualizacion de la variable sprites
 		;ld a, (M2S_sprites)
		;cp 31; maximo numero de sprites
		;ret z
		;jr z, M2S_next
		;inc a
		;ld (M2S_sprites),a



		ld hl, M2S_sprites;opti
		inc (hl) ; opti

		; actualizacion del puntero
		ld HL,(M2S_SP_POINTER)
		ld bc,16
		add hl,bc
		ld (M2S_SP_POINTER),hl; actualizado para el siguiente sprite

M2S_next	pop Hl; extra que viene de x o de Y
		pop hl; normal
		ld bc, 6
		add HL, BC
		ld a, (M2S_sprites)
		cp 32
		JR Z, M2S_fin
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
		;xor a
		;ld (HL),a
		ld (HL),0; opt
	
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

;ROU_dirsp 	dw  0

_ROUTEALL
		; recorremos la tabla de sprites
		ld a, NUM_SPRITES-1 ;empezamos por el ultimo sprite
		ld (ROU_spid), a

		ld HL, 27496;direccion del sprite 31 en la _SPR_SPRITES_TABLE



		;push hl; v28
		ld (ROU_dirsp), HL ; v32


ROU_bucle	
		;jr ROU_call; new. esto enruta el sprite 31. ojo es un jr, no un call. 
		call ROUTE_SP; v32
		;call RS_1sp



				
;ROU_bucle	
		;pop HL
		;ld hl, (ROU_dirsp)

		;ld bc, 16;sprite_size aun no es conocido (se ensambla luego), he tenido que poner 16 a fuego
		;and a
		;sbc HL, bc
		;push HL; v28
		;ld (ROU_dirsp), HL ; v28
		
		
;ROU_call

		;call ROUTE_SP; v32


	
ROU_cont
		;ld a, (ROU_spid)
		;dec a
		;ret M; v32
		;ld (ROU_spid), a
		
		ld hl,ROU_spid; opti		
		dec (hl);opti
		ret M ;opti


		ld hl, (ROU_dirsp)

		ld bc, 16;sprite_size aun no es conocido (se ensambla luego), he tenido que poner 16 a fuego
		and a
		sbc HL, bc
		;push HL; v28
		ld (ROU_dirsp), HL ; v28



		Jr ROU_bucle
		
ROU_fin		
		;pop hl v32
		;ret



;	JR ROUTE_SP



;-------------------------------------------------
;_ROUTE_SP, spriteid, [pasos]; se puede invocar desde basic
;-------------------------------------------------
_ROUTE_SP

;		cp 1
		dec a ; v37
		JR NZ, RS_2
		; solo hay un parametro
		ld a,1
		ld (RS_pasos),a
		ld a, (IX+0); spritid
		JR RS_1

RS_2		ld a, (IX+0) ; new v34_004
		ld (RS_pasos),a; new v34_00 si solo es un parametro pasos=1
		and a 
		ret z; si pasos es cero no hay nada que hacer

		ld a, (IX+2); spritid
RS_1		ld (ROU_SPID),a
		;ld c,a
		
		call _get_dir_sp ; input A, output HL

		ld (ROU_dirsp), HL ; v32
		;JR ROUTE_SP; optimize call +ret ; new v34_004
RS_route	call ROUTE_SP
		ld a, (RS_pasos)
		and a ;39
		ret z;39
		dec a
		;ret z
		;dec a
		;ret M ;v39  OJO solo podremos dar 128 pasos
		;ret C
		ld (RS_pasos),a
		ld hl, (ROU_dirsp)
		call MOV_uno
		ld hl, (ROU_dirsp)
		JR RS_ROUTE
		ret
;-------------------------------------------------
ROUTE_SP; rutina invocada desde ROUTEALL por cada sprite. 
	; se invoca usando jr porque necesita la pila
;-------------------------------------------------

		; check flag de ruta en status
		ld a,(HL)
		and %10000000
		;JR Z,ROU_cont
		RET Z; nada que hacer v32
	
ROU_mas		; actualizacion paso (decremento)
		ld HL,_ROUTE_TABLE
		;ld b,0
		ld a, (ROU_SPID)


		; mejora v28c-------
		cp 16
		jp M, ROU_0a16
		ld HL,_ROUTE_TABLE_16a31
		sub 16; resto al id_sprite 16 pues va de 16 a 31
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

		Jp Z,ROU_INIRUTA; detectado comienzo de ruta  v28( antes era jr)
		
		;dec a
		;ld (HL),a; actualizo el contador de pasos
		dec (HL) ; opti		

		; si paso es cero, actualizacion de segmento y contador de pasos
		; la primera vez el contador deberia de ser 1
		; si no es cero, no hay nada que hacer pues la Vy,Vx son son correctas en el segmento en curso
		JR Z, _UPDATE_SEGMENT
		
		ret; v32		

	
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
	;pop hl; contiene la direccion del sprite
	;push hl
	ld hl, (ROU_dirsp) ;v32
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


	;v38
	; hay que hacer una indireccion
	ld a,(hl)
	inc hl
	ld h, (hl)
	ld l,a; ahora hl tiene la direccion de la ruta!
	ld (ROU_dir), hl

	; hay que hacer una indireccion
;	ld a,(hl)
;	ld e,a
;	inc hl
;	ld a, (hl)
;	ld d,a
;	ex de, hl; ahora hl tiene la direccion de la ruta!
;	ld (ROU_dir), hl

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
		; si el numero de pasos es cero, es que es indicador de fin=ciclar la ruta
		;Jp z, ROU_cicla	; v40_001

	; MEJORA v28. cambio de status, secuencia o imagen en mitad de ruta
	;------------------------------------------------------------------
		;and a
		cp 251
		jr c,ROU_normal; si es menor de 250 entonces no hay cambios de estado ni nada

		inc HL; ahora apunta al parametro (estado o secuencia o dirimagen)
		ld (ROU_HL), HL; lo guardo, ROU_Hl es un simple buffer temporal

		; si el numero de pasos es 255 entonces es que hay que cambiar de status
		;and a
;		ld c,a ; guardo a

		; v34
		;JP ROU_V34
		cp 251
		JP Z, ROU_V34;no251

		;JP NZ, ROU_no251; v40_001




ROU_no251
		cp 253
		JR NZ, ROU_no253
		; estamos aqui porque nos han pasado un 253 = cambio de imagen
		ex de,hl; ahora DE= dir image param, hl=corrupt
		;pop hl
		;push hl; hl=dir sprite
		ld hl, (ROU_dirsp) ; v32

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
		;pop hl; dir sprite
		;push hl
		ld hl, (ROU_dirsp); v32

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
		;pop HL; hl tiene la dir sprite (donde esta justo el estado)
		;push hl

		;begin v40_001
		inc hl
		ld d,(hl); valor del segundo parametro (254,seq,flag)
		;end v40_001

		ld hl, (ROU_dirsp); v32

		JR Z, ROU_kk1; si es 0 es que es 255 y cambia estado
		; estamos aqui porque nos han pasado un 254 = cambio de secuencia o un 252 pero hay que hacer lo mismo
		; ya que el 7 se ha cambiado antes por un 15 si es 252

ROU_off		ld bc, 7; posiciono hl para cambio de secuencia
		add hl,bc; hl= sprite dir sequence

		;begin v40_001
		; si el segundo param es 1, entonces reinicio secuencia
		ld c,a
		ld a,d
		cp 1
		ld a,c
		jr nz,ROU_kk1
		
		inc hl; posicion frame
		ld (hl),0; valor del segundo parametro (254,seq,flag)
		dec hl
		;end v40_001
		



ROU_kk1		ld (hl),a; actualiza la secuencia o el estado
ROU_kkk		ld hl, (ROU_dir); cargo en HL la direccion de esta ruta, que la tengo en ROU_dir

		;ld a, (ROU_NUM_PASOS)
		;cp 252
		;jP Z, _UPDATE_SEGMENT
		
		jr ROU_sigseg
		

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
	;pop hl
	;push hl
	ld hl, (ROU_dirsp)

	ld bc, 5
	add hl,bc
	ex de, hl
	ld bc,2
	ldir

		
	;JP ROU_cont
	ret ; v32
		
ROU_cicla
	xor a
	ld (ROU_SEG),a; segmento=0
	ld HL, (ROU_dir);direccion de la ruta=direccion del segmento
;	ld a,(HL); aqui esta el numero de pasos del segmento cero
;	JR ROU_update

	;Jr ROU_leepaso	; v28



	jp ROU_leepaso	; v40_001




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

macro_h		xor a
		
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
		;inc a ; es igual en este caso a ld a,1
		JR finmacrox
macro_xpos	
		ld a,2
		JR finmacrox

macro_v		xor a
		
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


;SOR_MODE YA NO HACE FALTA
;SOR_mode	db 0; 0=set default values (sin orden), N=orden para N sprites

; variables locales
;-------------------------------------
;SOR_count	db 0; contador de sprites a ordenar.  
;SOR_ant		dw 0; direccion de coordy de sprite anterior
;SOR_sig		dw 0; direccion de coordy de sprite siguiente
SOR_ini		dw 0; direccion del sprite inicial

;SOR_DIRSTART	dw 0; direccion del sprite anterior al que se va a empezar a ordenar
;variables locales para modo=1 (orden)
;-------------------------------------
;SOR_yant	dw 0 ; creo que esta se puede poner global

;SOR_buffer	dw 0; buffer de 2 bytes. me la he llevado a global

;--------------------------------

_SORTY
_SOR		
		;ld a, (SOR_mode); 0=default(sin orden), N= orden de N sprites
		;and a
		;JR NZ,SOR_orden

SOR_default
		; estamos aqui porque se quiere "resetear" a default values
		; lo hacemos con los 32 sprites
		; no solo se ordenan secuencialmente sino que se pone todo a cero, (reset status)
		ld a, 32
		ld (SOR_count),a; contador de sprites

		ld bc, 0
		ld (SOR_ant),bc; primer anterior es cero

		ld HL, _spr_sprites_table+1; coordy de sprite 0
SOR_bucle	push hl; guardo ant

		; reset status
		;-------------
		; esto lo hago porque solo se invoca este ordenamiento default al invocar 
		; la instalacion de comandos RSX
		dec hl
SOR_RESET	ld (HL), 0 ; esto es &36 &00
SOR_fin_R	inc hl
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


		;ld a,8 ; v36b

		; en cada ordenacion se considera un sprite y el siguiente 
		ld (SOR_count), a
		; debo recorrer desde el primero buscando un fallo de ordenacion y cambiarlo
		;ld a, (PS2_orden)
		;and a
		;JR NZ, SOR_noini

		ld hl, (SOR_ini); inicialmente vale 27001, antes de ordenar
		;ld hl,27257; v36b
		;ld hl,27033

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
		ld (SOR_ant), HL ; inicialmente HL vale (SOR_INI)
		ld c,(HL)
		inc hl
		ld b, (HL);ya tengo la coordenada Y en BC
		ld (SOR_yant), bc; ya tengo la coordenada Y

		;begin v36
;		push bc ; ahorrando el ld (sor_yant),bc
;		ld bc, offset-2; offset es tabla height - 27000--> tabla -(27000+2)
;		add hl,bc
;		ld c, (hl)
;		ld b, 0; ahora en bc esta la altura
;		pop hl; recoge yant
;		add hl, bc; suma altura
;		ld (SOR_yant),hl
;		ld hl,(SOR_ant)
;		inc hl
		; end v36



		; vamos a por la siguiente
		ld bc, 11; suma 11 para llegar a la posicion 13 del registro del sprite
		add hl,bc
		; ahora hl contiene la direccion donde se encuenta la direccion del siguiente

		ld e,(HL)
		inc hl
		ld d,(HL)

		ld (SOR_sig), de; lo guardo				
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


		;begin v36
;		push bc; guarda ysig. hay que sumar el alto
;		ld h, d; hl tiene (soryant) de modo que luego lo cargo
;		ld l,e
;		ld bc, offset-1-2
;		add hl,bc
;		ld a,(hl); a tiene la altura
;		pop bc
;		ld h,b
;		ld l,c
;		ld c,a
;		ld b,0
;		add hl,bc
;		ld c,l
;		ld b,h ; ahora bc tiene y_sig
;		ld hl, (sor_yant); puedo eliminar la carga anterior. ahora hl tiene y_ant
		;end v36


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
		;JR NC, SOR_bucley

SOR_ret		;xor a 
		;ld (SOR_changes),a; no ha habido ningun cambio. completamente ordenado

		xor a; ordeguay

		ret

SOR_fallo	
		
		; v37 no hacemos caso si sprite < sprite_min
		ld hl,(SOR_ANT)
		ld bc,(SOR_DIRSTART);direccion del sprite anterior al que se va a empezar a ordenar
		
		sbc hl,bc; se que no hay acarreo antes
		JR C,SOR_finbuc
		; end modificacion v37

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
		;ret;v37

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
		ld a,1; ordeguay
		ret


;=============================================================================================================
;RUTINA  _SET_LIMITS(xmin,xmax,ymin,ymax)
;=============================================================================================================
; variables locales
;-------------------------------------
; estas variables son globales pero se rellenan aqui.
; por defecto los limites del clipping es la pantalla
;SPR_MIN_X: 	; limite horizontal para el clipping
;		dw 0;15
;SPR_MAX_X:	; limite horizontal para el clipping
;		dw 80; ojo, es el primer byte que no se pinta!!!
;SPR_MIN_Y:	; limite vertical para el clipping
;		dw 0;20
;SPR_MAX_Y:	; limite vertical para el clipping
;		dw 200; ojo, es el primer scanline que no se pinta!!!

;SPR_DIFX	db 80
;SPR_DIFY	db 200
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
		;ld a, 0
		
		;ld (HL),a; reset segmento
		ld (HL),0; opt

		inc hl
		;ld (HL),a; reset paso
		ld (HL),0; reset paso
		ret


;==========================================================================================
; algunas variables de la rutina stars las he traido aqui
;SCS_pen		db 64; el byte (2ndo pix mode 0) que vamos a pintar. esto es una constante
;SCS_check	db 0
;SCS_incy	db 2; lo que vamos a mover en eje y
;SCS_incx	db 1; lo que vamos a mover en eje x
;SCS_counter	db 20
;SCS_number	db 20
;star_color	db 64




;=============================================================================================================
;RUTINA DE SINCRONISMO _SYNC() (SYN)
;=============================================================================================================
; esta funcion espera al barrido de pantalla de un modo 
; mas "correcto" que ra rutina del firmware call &bd19
; se puede eliminar para ahorrar memoria, reemplazandola por call &bd19, aunque ocupa poco (10 bytes)
; en caso de cambiarlo, el sitio desde donde se invoca a _SYNC es PRINTSPALL
_SYNC:

SYN:

		;ld c,0
		;ld b,#f5; PPI port B
		ld bc, #f500; optimize

SYN_lee:
		in a,(c)
		; (bit 0 = "1" if vsync is active,
		;  or bit 0 = "0" if vsync is in-active)
		rra; put bit 0 into carry flag
		jr nc,SYN_lee
SYN_ret		ret



;=============================================================
; _3D_GET_ZOOM_IMAGE(sprite_id)   (ZOM)
;=============================================================
;asigna bc(=dir image) segun coordy sin proyectar
; para ello se usan los limites que aparecen en el fichero de imagenes


_3D_GET_ZOOM_IMAGE
; entra con bc =dir image y retorna con bc final
	;push hl; no tocar hl
	and a; acarreo a cero
	ld l,c
	ld h,b
;	ld de,_3D_ZOOM_IMAGES
	ld de,_BEGIN_3D_ZOOM_IMAGES
	sbc hl,de
	RET C;
        ;JR C, ZOM_fin;
	; ojo, tambien puede ser un segmento no zoom
	ld l,c
	ld h,b
;	ld de,_3D_ZOOM_IMAGES_END
	ld de,_END_3D_ZOOM_IMAGES
	sbc hl,de
        ;JR NC, ZOM_fin;
	ret NC

	; debemos asignar bc(=dir image) segun coordy sin proyectar
	; ojo si coordy<0 
	ld hl, (SPR_coordy)
	bit 7,h
	JR NZ, ZOM_mini; si coordy<0 ese bit esta a 1
	ld a,(_ZOOM_LIMIT_A)
	cp l;135 por ejemplo
	JR C, ZOM_grande
	;JP M, ZOM_grande
	ld a,(_ZOOM_LIMIT_B)
	and a
	cp l;110 por ejemplo
	JR C, ZOM_medio
	;JP M, ZOM_medio
ZOM_mini	
	ld de,2
	jr ZOM_set

ZOM_medio
	ld de, 4
	jr ZOM_set

ZOM_grande
	ld de,6

ZOM_SET	
	ld h,b
	ld l,c
	add hl,de

	ld c,(hl)
	inc hl
	ld b,(hl)
	
	

ZOM_fin	;pop hl
	ret
		
;=======================================================================


;=============================================================================================================
;RUTINA  _MUL8bit(H,E) (MUL)
;=============================================================================================================
; es una rutina interna auxiliar para multiplicar de forma eficiente numeros de 8 bit
; se basa en desplazamientos en lugar de en repetir N veces una suma
; el resultado queda en HL (16bit) y como mucho es 65536 (255x255=65535)
; es mejorable protegiendo d mediante un push/pop o con una simple asignacion a una variable byte. 
; por velocidad he preferido evitar proteger d, aunque apenas tendria impacto.
_MUL8bit:                           ; this routine performs the operation HL=H*E
		
  		;and a ;v33 creo que puedo comentarlo, pues add sube y baja ese flag

  		ld d,0                         ; clearing D and L
  		ld l,d
  		ld b,8                         ; we have 8 bits
MUL_Loop:
  		add hl,hl ; advancing a bit. consume 3 ciclos, mientras que un desplazamiento son 6 ciclos
		jr nc,MUL_Skip; if zero, we skip the addition (jp is used for speed)
  		add hl,de    ; adding to the product if necessary
MUL_Skip:
  		djnz MUL_Loop

;=============================================================================================================
;RUTINA  _NOP para medir tiempos de invocacion y paso de parametros. ES EL RET DE MUL8BIT !!! asi ahorro 1 byte
;=============================================================================================================
_NOP		ret





;=============================================================================================================
;RUTINA  _DELSP (spini, sp_fin)
;=============================================================================================================
; borra los n primeros sprites. si no estan ordenados, desde el 0 hasta el sp_fin son borrados
; ambos inclusive
_DELSP



;		ld a, (IX+0); fin
;		ld b,a
;		ld a,32
;		sub b
;		ld (DELSP_PS2FIN+1), a; 


		; que solo se borren desde ini
;		ld a, (IX+2);
;		ld b,a
;		ld a,33
;		sub b
;		ld (DELSP_PS2INI+1), a

		; --- modificacion PAINT ----
;		LD HL,DELETE_SPRITE
;		ld a, 33
;		ld (DEL_PAINT),a
;		ld (DEL_PAINT+1),HL
		; ---modificacion PAINT TRANSP
;		ld (DEL_PAINT_TR),a
;		ld (DEL_PAINT_TR+1),HL

		; ---modificacion PAINT TSEGMENTS
;		ld (DEL_PAINT_SEGMENT),a
;		ld (DEL_PAINT_SEGMENT+1),HL

;		CALL PS2_noparam; es _PRINT_SPRITES sin parametros

		; ahora ponemos NOP en las instrucciones que hemos escrito antes
		; ----PAINT---
;		ld hl, 0
;		xor a
;		ld (DEL_PAINT),a
;		ld (DEL_PAINT+1),HL
		; ----PAINT_TR---
;		ld (DEL_PAINT_TR),a
;		ld (DEL_PAINT_TR+1),hl
;		; ---modificacion PAINT TSEGMENTS
;		ld (DEL_PAINT_SEGMENT),a
;		ld (DEL_PAINT_SEGMENT+1),HL


		; que se impriman todos
;		ld (DELSP_PS2FIN+1), a; 
;		ld a, 33
;		ld (DELSP_PS2INI+1), a
;		
;		ret

		

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
		Jr NZ , SCS_nopinta; ya esta pintado con otra cosa (un sprite, etc)
		ld a, (SCS_pen)
SCS_pinta	ld (HL),a; 
SCS_nopinta
		pop ix
		pop HL
		ret	



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
;============================================================================================================
; _get_dir_sp    (A -> HL)
;=============================================================================================================
; esta funcion retorna en HL la direccion del sprite en la tabla SPRITES_TABLE cuyo id esta en A
_get_dir_sp
		;------------------calculo de la direccion del sprite -----------
		;ld e,sprite_size; esto es 16 pues es lo que ocupa cada sprite
		;ld e,16
		;ld h,c; numero de sprite
		;;El resultado es de 16 bit pues 31x16=496, por eso necesito invocar a MUL
		;call _MUL8bit; H*E->HL, corrompe d 
		;ld bc, _SPR_SPRITES_TABLE
		;add HL,bc
		;; ahora en HL esta la direccion de la entrada del sprite en tabla SPRITES__TABLE
		;;-------------------------------------------------------------------------------
		;ret

		; suponemos que spriteid llega en A
		RLCA ; x2
		RLCA ; x4
		RLCA ; x8
		ld l,a
		ld h,0
		add hl,hl ;x16
		ld bc, _SPR_SPRITES_TABLE
		add HL,bc
		; ahora en HL esta la direccion de la entrada del sprite en tabla SPRITES__TABLE
		;-------------------------------------------------------------------------------
		ret

		;ld l,c
		;ld h,0
		;add hl,hl
		;add hl,hl
		;add hl,hl
		;add hl,hl
		;ld bc, _SPR_SPRITES_TABLE
		;add HL,bc
		; ahora en HL esta la direccion de la entrada del sprite en tabla SPRITES__TABLE
		;-------------------------------------------------------------------------------
		;ret


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
		;ld a,1
		inc a ; es lo mismo que ld a,1 en este caso
		ld (sal_done),a
		ld hl,(&39); en la 38 hay un jp y en 39 la de salto
		ld (sal_dir),hl
		ld (INS_JP+1), HL; sobreescribe en la direccion del salto
		ret



_END_27000
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

SEQUENCES equ _SEQUENCES_LIST;33500; direccion de memoria de las secuencias

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
		dw 0 ; direccion de sprite siguiente (posiciones 13 y 14). para ordenar
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

; 
;=============================================================================================================
;RUTINA  INSTALL_RSX() 	RSX este es el call &6b78
;=============================================================================================================
; instala los comandos RSX para usar desde basic
_INSTALL_RSX

		JP _INSTALL_RSX2
		; ya hago ret desde alli

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
		JP _MOVER		;|MOVER, #,dy,dx
		JP _PRINT_SPRITE	;|PRINTSP, #,y,x
		JP _PRINTAT		;|PRINTAT,y,x,string
		;JP _DELSP		;|DELSP,spini, spfin
		JP _AUTO_SPRITE		;|AUTO,#
		JP _ROUTE_SP		;|ROUTESP,#
		JP _UPDATE_MAP		;|UMAP,dirmapini, dirmapfin,yini,yfin,xini,xfin
		;JP _ANIMA_ALL		;|ANIMALL				
		JP _ROUTEALL		;|ROUTEALL
		JP _PRINT_LAYOUT	;|LAYOUT, y,x,string
		;JP _SETUP_SEQUENCE	;|SETUPSQ, #, adr0,adr1,...,adr6
		JP _MUSIC_ON		;|MUSIC, loop_flag, cancion,speed
		;JP _MUSIC_OFF		;|MUSICOFF
		JP _SET_LIMITS		;|SETLIMITS, xmin,xmax,ymin,ymax
		JP _3D_RENDER3D		;|3D, spritefin, mode
;		JP _NOP			;|NOP no es un comando, solo es para medir
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
		defM "MOVE"; se usa mas que UMAP,ya que UMAP es para usar de vez en cuando
		db "R"+&80
		defM "PRINTS"
		db "P"+&80
		defM "PRINTA"
		db "T"+&80
		;defM "UMA"
		;db "P"+&80
		;defM "DELS"
		;db "P"+&80
		defM "AUT"
		db "O"+&80
		defM "ROUTES"
		db "P"+&80
		defM "UMA" ; cambiado orden por routeall, que no se usa
		db "P"+&80
		;defM "ANIMAL"
		;db "L"+&80; cambiado orden pues animall apenas se usa
		defM "ROUTEAL"
		db "L"+&80
		defM "LAYOU"
		db "T"+&80
		;defM "SETUPS"
		;db "Q"+&80
		defM "MUSI"
		db "C"+&80
;		defM "MUSICOF"
;		db "F"+&80
		defM "SETLIMIT"
		db "S"+&80
		defM "3"
		db "D"+&80
;		defM "NO"
;		db "P"+&80
		db 0
ENDRSX
_INSTALL_RSX_end





;=====================================
; variables de la funcion SET_LIMITS
;======================================
LIMITS
SPR_MIN_X: 	; limite horizontal para el clipping
		dw 0;15
SPR_MAX_X:	; limite horizontal para el clipping
		dw 80; ojo, es el primer byte que no se pinta!!!
SPR_MIN_Y:	; limite vertical para el clipping
		dw 0;20
SPR_MAX_Y:	; limite vertical para el clipping
		dw 200; ojo, es el primer scanline que no se pinta!!!

; estas me las llevo antes de 27000
;SPR_DIFX	db 80
;SPR_DIFY	db 200



;----------------VARIABLES QUE ME HE TRAIDO AQUI --------------------------------


;de MOVER
MOR_ypointer dw 0; direccion de una variable basic dy
MOR_xpointer dw 0; direccion de una variable basic dx

; de _STARS
bkgd_color	db 0
SCS_initstar	db 0

;_end_24500
;-------------------------------------------------------------------------------

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
		;ld c,(IX+4);menos signific. aqui tenemos el sprite id ; v3708
		ld a,(IX+4);menos signific. aqui tenemos el sprite id
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
		;ld (SPR_coordy_no3d),bc; nuevo v32
		
		ld (HL),C
		inc hl
		ld (HL),B
		;----- coord x -----
		inc HL
		ld b, (IX+1);es el mas signific. 
		ld c,(IX+0);menos signific
		ld (SPR_coordx), bc; NUEVO v27b
		;ld (SPR_coordx_no3d),bc; nuevo v32
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
;		cp 3; v33
;		JR Z,PSP_xy; v33

;		cp 1;1 parametro es que no trae coordenadas
;		JR Z,PSP_sp
		

		cp 1; no se puede hacer dec a
		JR Z,PSP_sp; 1param
		cp 3
		JR Z,PSP_xy; 3param

		;------------------ v33 2 param ---------------------
		ld a,(IX+2)
		cp 32
		ret nz

		; estamos aqui porque ha llegado un 32
		; veamos cuantos bits de fondo quiere
		;ld a, (IX+0)
		;CP 1
		;dec a; opt

		dec (IX+0);opti
		
		JR NZ, PSP_2bitTR
PSP_1bitTR
		ld a,%11000000
		JR  PSP_confTR
PSP_2bitTR	
		ld a,%11001100
PSP_confTR		
		;ld (PTR2_bin1+1),a; esto no debo hacerlo, es para tinta 1
		;ld (PTR2_bin2+1),a;esto no debo hacerlo, es para tinta 1
		ld (PTR2_bin3+1),a
		;ld (PSTR_bin1+1),a;esto no debo hacerlo, es para tinta 1
		;ld (PSTR_bin2+1),a;esto no debo hacerlo, es para tinta 1
		ld (PSTR_bin3+1),a
		; flip
		ld (PNTF_bin3+1),a

		ret
		;----------------------------------------------------



PSP_sp
		ld (PS2_spid), a; meto un 1 para que PRINTSPALL solo imprima 1

		ld (PRINTSP_flag),a; V41_001 flag para que printspall no anime

		;CALL _GET_MODE ; v34
		ld a,(IX+0)


		ld (SPR_ID), a
		;ld c,a ; v38
		call _get_dir_sp;sprite id en c, retorna hl

		call PS2car; invoca a una parte de PRINTSPALL y ya hace ret desde alli
		;ret; este ret no hace nada, pues call ps2car ya hace ret debido a que el 
		; program counter se almacena en la pila y hay un pop sin push

PSP_xy
		; la funcion locate_sprite rellena SPR_coordx y SPR_coordy, ademas meter las coord en las
		; direcciones de memoria de la tabla de sprites.
		CALL _LOCATE_SPRITE

		CALL _GET_MODE ; v34		

		dec hl
		dec hl
		dec hl
		dec hl ; estamos en status, es decir en SPR_sprite

		

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


PSP_i		
		; si hemos llegado a PSP_i desde printsprites(), ya se han rellenado las 
		; variables SPR_coordx y SPR_coord_y
		; HL contiene la direccion del status, es decir, del sprite

		; comienza la parte 3D. esto no puede estar aqui sino en PSP_i
		; -------------------
		;ld a, (R3D_mode); esto hay que optimizarlo para no hacerlo 32 veces (una por sprite)
		;and a
		;JR Z, PSP_NO3D
	
		; necesito ver si es inferior a R3D_MAX_sprite_Dir
		;--------------------------------------------------
; BEGIN 3d





;end 3d

		;xor a; fix bug v33
		;ld (flip_flag),a; fix bug v33

		ld a ,(HL);guardo byte de status para comprobar sobrescritura    			
		ld (SPR_status), a; guardo el status del sprite						
		ld (SPR_addr), HL; guardo la dir del sprite (la de la sprite table)			

		ld bc,9;los bytes 9 y 10 guardan la direccion de la imagen del sprite
		add HL,bc
		; ahora en HL esta la direccion donde esta la direccion de la imagen del sprite













		ld c,(hl)
		inc hl
		ld b, (Hl)

		; --- begin mejora V32 -----------
		; si bc<255 then call_check_image_list
		ld a,b
		;cp 0
		or a; opt
		JR NZ, PSP_mayor255
		dec hl
		call Z, _check_image_list; he hecho este cambio en V32 para que se pueda pokear el mapa con numeros de imagen
  					 ; y tambien se puede pokear la direccion de imagen sin setupsp

		ld c,(hl)
		inc hl
		ld b, (Hl)
		; --- end mejora V32 -----------


PSP_mayor255
		
		; ahora finalmente en BC ya tenemos la direccion de la imagen del sprite	
		;-----------------------------------------------------------------
		; SI ES UNA ZOOM IMAGE, HAY QUE CAMBIAR LA DIRECCION DE LA IMAGEN
		; SOLO SI ESTAMOS EN 3D
		; la imagen final se elige segun la coordenada Y sin proyectar. No podria elegirse 
		; segun la proyectada porque antes de proyectar se hace el cliping vertical y eso
		; significa que hay que conocer las dimensiones de la imagen antes del cliping.
		ld a, (R3D_mode)
		and a
PSP_zoom	CALL NZ,_3D_GET_ZOOM_IMAGE; entra con bc =dir image y retorna con bc final
		; si la imagen no es zoomed, retorna sin tocar nada

		;------ v33 -----------------
PSP_CHECK_FLIP	; comprobacion flip
;		ld hl, _FLIP_IMAGES_END
		xor a; a=0
		ld hl, _END_FLIP_IMAGES-1; el -1 es importante para el JR C
		sbc hl,bc
		JR C, PSP_noflip

		;v39 ojo, debo comprobar si es mayor que BEGIN_FLIP
		xor a ; acarreo a cero
		ld hl,_BEGIN_FLIP_IMAGES-1

;		ld b,d
;		ld c,e
		sbc hl,bc
;		JR Z, hayflip
		JR NC,PSP_noflip
		;add hl,bc
		;JR NC, PSP_noflip

		;ld a,1; flip_flag
hayflip:
		ld a, (BC)
		inc bc
		ld h,a
		ld a, (BC)
		ld b,a
		ld c,h
		ld a,1; flip_flag
		;JR PSP_endflip		
PSP_noflip	;ld a,0
		;xor a
PSP_endflip	ld (flip_flag),a
		;-----------------------------
		ld (SPR_image), bc; variable SPR_image almacena dir mem sprite
		;ld hl, (SPR_image)
		ld h, b
		ld l, c

;		ld c, (HL); ancho

		; vamos a rellenar ancho y alto
		; ------------------------------

		ld c, (hl)
		inc hl
		ld b,(Hl)
		ld (SPR_anchoalto),bc; en C el ancho, en B el alto


;----------------------------------------
PSP_setheight
		; V36
		; solo se debe hacer esto si hay que ordenar

		; en (SPR_addr) se guarda la dir del sprite (la de la sprite table)
		; en _SPRITE_HEIGHTS_TABLE estan las alturas de los sprites
		; offset = (_SPRITE_HEIGHTS_TABLE-27000) =_SPRITE_HEIGHTS_TABLE - SPR_SPRITES_TABLE
		; tengo que hacer algo como LD ((SPR_addr)-offset),b
		ld a, (PS2_orden)
		and a
		JR Z, PSP_endHeight
		;JR PSP_endHeight

		call _SET_HEIGHT


PSP_endHeight
;------------------------------------




		ld (SPR_anchoaltofinal),bc; con esto ya he rellenado 
		; SPR_ancho_final y SPR_alto_final, aunque quizas los cambiemos, si hay cliping


		; <3d>
		; lo que viene a continuacion no habria que hacerlo si se trata de un segmento 3d!
		; pero se hace de modo que ya se corregira

		INC HL
		LD (SPR_image_data),HL; aqui comienza el dibujo
		ld (SPR_imagefinal),HL; aqui comienza el dibujo. por el momento es igual



		; guardado del alto restado para clip segmentos
		;-----------------------------------------
		xor a
		ld (SPR_altorestado), a; pone altorestado a cero ooo por si no hay clipvsuperior


		; CLIPPING VERTICAL SUPERIOR
		;--------------------------------------------------------------------
PSP_caso1:	; 1er caso el mas frecuente Y>min_Y .
		ld HL,(SPR_coordy); coordy puede ser un numero negativo. 16bit necesario

		ld (SPR_coordy_no3d_noclipV), hl; guardo coordy sin clip ni proyeccion 	ooo

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
		and a; pone flag acarreo a cero
		adc hl,bc; es necesario adc para afectar a flag S y Z
		;add hl,bc
		ret M ;nada que imrirmir (negativo)
		ret Z; tambien si el resultado es cero -> nada que imprimir

PSP_caso3:      ; HL ha salido positivo al sumar la altura del sprite. es la altura final
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
		; en a ahora esta lo que se ha restado.

		
		ld (SPR_altorestado), a; lo que hemos restado al alto debido al clipV superior ooo




		ld b,a;; en b ahora estan las lineas de offset
		ld hl, (SPR_image_data)
		LD DE,(SPR_ancho)
		ld d,0
	  	
PSP_ajuste:	
 		add hl, de
		djnz PSP_ajuste; basicamente esto permite multiplicar 
		ld (SPR_imagefinal), hl

		;nuevas coordenadas 
		ld bc,(SPR_MIN_Y)
 		ld (SPR_coordy), bc


; aqui deberia proyectarse y pintar segmento 
;*********************************************************************
PSP_clipVinf:



;*********************************************************************


		; CLIPPING VERTICAL INFERIOR. ojo Y debe ser -255< Y <255
		;--------------------------------------------------------------------


PSP_clipVinf2:


		xor a
		ld (PNTS_pt2_clipvinf), a


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

		ld a,1
		ld (PNTS_pt2_clipvinf), a


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
 	 	
PSP_clipHder:
;***********************************************************************


		; si hemos llegado desde PRINTAT, no hay que chequear limite ni proyectar
  		ld a, (PAT_from)
		and a
		Jr NZ,PSP_clipHder2


		;Jr NZ,PSP_finclippling
; PSP_clipVinf2; si PAT_from=1 entonces es que venimos desde PRINTAT




		;si es un segmento se debe guardar las coord y desplazar coordx si hay clipvsup
		;------------------------------------------------------------------------------
 		xor a
		and a
		ld (SPR_segment),a
		ld hl,(SPR_image)
;		ld BC, _3D_SEGMENTS
		ld BC, _BEGIN_3D_SEGMENTS
		SBC hl,bc
		CALL NC, _AJUSTA_SEGMENTO

PSP_nosegment

		; chequeo de que el sprite se debe proyectar
		ld hl, (SPR_addr)
		;------------------
		ex hl, de
		ld HL, (R3D_MAX_sprite_Dir)
		sbc hl, de; DE (=spritedir) debe ser inferior a HL en caso 3d
		ex hl, de; lo dejo como estaba para que hl sea la direccion del sprite
		JR C, PSP_NO3D
		; es importante proyectar sin hacer cliping?
		; el motivo es que puede que al proyectar entre dentro de la zona dibujable
		; aunque se encuentre fuera de pantalla
		; aun asi creo que hay que hacer el clip V antes de proyectar, con limites 0 y 200
		
PSP_3D 		

		


PSP_PROY
;		; la funcion prooyecta() respeta el valor de HL que tuviese antes de entrar
;		; ademas, guarda los valores de las coordenadas sin proyectar para que no se pierdan
		

		CALL _3D_PROYECTA_XY; esto ocupa 3 bytes, por eso el salto es 03
PSP_NO3D
		;----------------
		;ld hl, (SPR_image); aqui esta el ancho
		;inc hl; alto


        	; si es un segmento no hago cliping horizontal
		;-------------------------------------
		;ld hl,(SPR_image)
		;ld BC, _3D_SEGMENTS
		;SBC hl,bc
		;JR C, PSP_nosegment
		ld a, (SPR_segment)
		and a
		JR Z, PSP_nopaintsegment		
		;CALL _3D_PAINT_SEGMENT
		;ret	
		jP _3D_PAINT_SEGMENT; optimize call +ret 

PSP_nopaintsegment		




;***********************************************************************
		; CLIPPING HORIZONTAL DERECHO
		;-----------------------
PSP_clipHder2:
		
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

		;si hay cliping y flip debo recolocar hl
		ld d, a
		ld a, (flip_flag)
		and a
		jr Z, PSP_noflipD
		ld hl, (SPR_imagefinal)
		ld b,0
	        add hl,bc
		ld (SPR_imagefinal),hl
		


PSP_noflipD     ld a, d

		ld de, (SPR_anchoaltofinal)
		ld e,a
		ld (SPR_anchoaltofinal), de
		
		; si ha habido cliping izq, entonces no puede haberlo derecho
		JR PSP_finclippling

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
		;JP Z, PSP_finclippling; positivo. no hay cliping

		; si ahora sumo el ancho y HL sigue negativo, no hay nada que imprimir
		and a
		ld a, (SPR_ancho)
		ld e,a
		ld d,0
		adc hl,de
		;add hl,de
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

		; si hay flip no hay que restar nada
		ld a,(flip_flag)
		and a
		JR Z, PSP_restar
		ld l,0
		

		
		; cambio la direccion del dibujo
PSP_restar	ld de, (SPR_imagefinal)
		ADD hl,de
		ld (SPR_imagefinal),HL
		;cambiamos la coordenada x 
 	 	ld hl,(SPR_MIN_X)
  		ld (SPR_coordx),hl

		
PSP_finclippling:
		call _COMPUTE_DIRPANT; HL ahora tiene la dir de pantalla
		ld (SPR_dirpant),hl

		;   eleccion entre los 4 tipos de impresion PNT_NORMAL,PNT_FLIPN,PNT_TRANSP,PNT_FLIP_TRANSP
		; --------------------------------------------------------------------------------------
		ld a, (SPR_status);										
		and a, %1000000; flag de sobrescritura								
		;JR NZ, PSP_owr;	//"owr" es "overwrite"	
		JR Z,PSP_NORMAL
		              
	

		;--------------------- IMPRESION CON SOBREESCRITURA CON Y SIN FLIP ------------------------
PSP_owr	
		ld a, (flip_flag)
		and a
		JR Z, PSP_paintT
		; ponemos la direccion en el JP de la rutina de impresion

		JP _SET_PNT_FLIP_TRANSP
		;ld hl, PNT_FLIP_TRANSP
		;JR PSP_go_paint
PSP_paintT	
		JP _SET_PNT_TRANSP
		;ld Hl, PNT_TRANSP
		;JR PSP_go_paint

		;--------------------- IMPRESION NORMAL  CON Y SIN FLIP ---------------------------------
PSP_NORMAL			
		; ponemos la direccion en el JR de la rutina de impresion
		ld a, (flip_flag)
		and a
		JR Z, PSP_paintN ; igual para mode 0 y 1 (normal y sin flip)
		; ponemos la direccion en el JR de la rutina de impresion
		
		JP _SET_PNT_FLIPN
		;ld  hl,PNT_FLIPN
		;JR PSP_go_paint
		
		; ponemos la direccion en el JP de la rutina de impresion
PSP_paintN
		ld  hl,PNT_NORMAL
		;JR PSP_go_paint


PSP_go_paint
		ld (PNT_scanh+1), HL
		JR _PAINT 
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
		jr Z, COP_nosuma
		;---------------------------------------
		;hay que multiplicar ax 8 y sumarselo a H, 2048 =0800.  8 en hex es 8 en decimal
		;ADD A,A; x 2
		;ADD A,A; x 2
		;ADD A,A; x 2
		
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
; tambien HL debe contenerla. asi ahorro una linea (la primera)<-- esto no hace falta
; variables locales
;-------------------------------------


;function body
;-------------------------------------
_PAINT:  ; dibujar en pantalla el sprite


PNT:
		ld de,(SPR_imagefinal); direccion de memoria donde se encuentra la imagen a pintar
		ld a, (SPR_ancho); ancho original de la imagen
		ld bc,(SPR_anchoaltofinal) ; ancho final en c
		sub c
		ld (PNT_restoancho),a; 
		
		ld hl, (SPR_dirpant); direccion de memoria de pantalla donde vamos a pintar

		; NO DESHABILITO LAS INTERRUPCIONES, podria ralentizar musica pej.
		; lo malo es que la probabilidad de quedarse a medias imprimiendo aumenta
		
		;di ;disable interrupts. asi no me cortan la impresion desde el firmware
		ex de,hl; ahora en DE esta la dir pantalla donde vamos a pintar
			; en hl esta la dir de la imagen a pintar
			
		ld a,c;(SPR_anchofinal)






	
PNT_loop_alto
		push bc; al entrar b contiene el alto, luego se va decrementando
 		push de; dir pantalla
	
PNT_loop_ancho      
		;ld a,b;guardo b en A. B contiene el alto -- eliminado en v33, pues no se usa
		ld b,0; ahora como b=0 , BC contiene el ancho final
		

PNT_scanh
		JP PNT_NORMAL;VERSION . este salto es modificado en ejecucion


		;------------- NORMAL
PNT_NORMAL
		ldir;  (DE)<--(HL) till bc=0
;		jr PNT_PAINTED

		;-------------------------------------------------
PNT_PAINTED
		;ld b,a; recupero el alto
		; si no se ha transferido todo el ancho (por cliping Horizontal)
		; debo sumar a HL lo que falta
		ld de,(PNT_restoancho)
		add HL,de 

        	pop DE; saco pant, como si no hubiese sumado el ancho
		ld A,D
		add &08; es decir, 2048 (2KB)

		ld D,A; suma 2048 y lo mete en d
		sub &C0; si ahora salta flag acarreo es porque nos hemos pasado al sumar 2048
	
		jr nc,PNT_sig_linea
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

		;dec b
		;jp nz, PNT_loop_alto
 		djnz PNT_loop_alto; dec b y salta. B contiene el alto

;;		ei; sobra pues no hay di


		xor a; fix bug v33
		ld (flip_flag),a; fix bug v33

		ret



		;JR PNT_NORMAL; esta direccion se modifica en tiempo de ejecucion segun tipo de impresion
		;JR PNT_FLIPN
		;------------- VERSION TRANSP ---------------------
PNT_TRANSP

		ld a,c;(SPR_anchofinal); esto es mas rapido que LD A,C falso
		ld b,a;***
PTR2_scanh
		ld a, (HL); 2 pixels del sprite
		ld c, a; guarda  pixel en C		
PTR2_bin1	and a,%11000000; o bien %11001100
		JR Z,PTR2_fondo; todo ceros es para reestablecer el fondo en los 2 pixels transp o no transp
		; NOTA he observado que siembre salta a PTR_fondo porque pinto con colores que no usan los bits de fondo
		; pero si hubiese color 1, entonces se usaria para redondear el contorno de sprites
PTR2_bin2	cp %11000000; si los dos son 1, entonces no hacemos nada, no hay que reestablecer nada
		JR Z,PTR2_transp; 

		
		; si estamos aqui es porque solo 1 bit esta a uno (solo un pixel del byte en mode 0)
		ld a,c
		bit 6,c; comprueba el bit 6 (pixel derecho mode 0)
		JR Z, PTR2_izq
		; si estoy aqui es que ese bit no es cero y por lo tanto el pixel a pintar debe ser el de pantalla
		; es decir, no alterar nada
		res 6,c; lo pongo a cero
		ld a, (DE); leo la pantalla
		and a, %01010101; pixel derecho de la pantalla. cojo lo que tenga,incluido el fondo
		or  a,c; no modifico los 1's del pixel izq del sprite, almacenados en c
		ld c,a

		JR PTR2_fondo ; v39

PTR2_izq 	res 7,c 
		ld a, (DE)
		and a, %10101010; pixel izq de la pantalla
		or a,c
		ld c,a


		
PTR2_fondo	ld a, (DE); (DE) contiene el fondo "manchado" con restos del sprite en el frame anterior
PTR2_bin3	AND A,%11000000; bin %11100110 192 (192 es 128+64, es decir los dos 1). en total 230 192 , o bien  %11001100
		; el orden es 00221133	
		or a,c; OR del pixel con el fondo (fondo en "A" y pixel en "C")

PTR2_pinta	ld (DE), a

PTR2_transp	inc de
		inc hl
		djnz,PTR2_scanh; opt
		jr PNT_PAINTED


		;------------- VERSION NO TRANSP -----------------
;PNT_NORMAL
;		ldir;  (DE)<--(HL) till bc=0
;		jr PNT_PAINTED
		;---------------------------------

		; aqui
		;------------- VERSION FLIP TRANSP-----------------------
PNT_FLIP_TRANSP
		;LD A,C
		;LD B,A ; ancho final en b
		;ld b,c; esta instruccion no tiene sentido

		ld b,0
		add hl,bc; me coloco pix ultimo
		dec hl; ajuste pues 1+4=5, 
		ld b,c; ancho en b
PNTF_scanh

		ld a, (HL); 2 pixels del sprite
		and %10101010;izq
		srl a; ahora el izq esta en derecho
		ld c,a
		ld a, (HL); 2 pixels del sprite
		and %01010101;dere
		ADD A,A;
		or c
		ld c,a

PNTF_bin1	and a,%11000000; o bien %11001100
		JR Z,PNTF_fondo; todo ceros es para reestablecer el fondo en los 2 pixels transp o no transp
		; NOTA he observado que siembre salta a PTR_fondo porque pinto con colores que no usan los bits de fondo
		; pero si hubiese color 1, entonces se usaria para redondear el contorno de sprites
PNTF_bin2	cp %11000000; si los dos son 1, entonces no hacemos nada, no hay que reestablecer nada
		JR Z,PNTF_transp; 

		; si estamos aqui es porque solo 1 bit esta a uno
		ld a,c
		bit 6,c; comprueba el bit 6 
		JR Z, PNTF_izq
		; si estoy aqui es que ese bit no es cero y por lo tanto el pixel a pintar debe ser el de pantalla
		; es decir, no alterar nada
		res 6,c; lo pongo a cero
		ld a, (DE); leo la pantalla
		and a, %01010101; pixel derecho de la pantalla. cojo lo que tenga,incluido el fondo
		or  a,c; no modifico los 1's del pixel izq del sprite, almacenados en c
		ld c,a

PNTF_izq 	res 7,c 
		ld a, (DE)
		and a, %10101010; pixel derecho de la pantalla
		or a,c
		ld c,a
		
PNTF_fondo	ld a, (DE); (DE) contiene el fondo "manchado" con restos del sprite en el frame anterior
PNTF_bin3	AND A,%11000000; bin %11100110 192 (192 es 128+64, es decir los dos 1). en total 230 192 , o bien  %11001100
		; el orden es 00221133	
		or a,c; OR del pixel con el fondo (fondo en "A" y pixel en "C")

PNTF_pinta	ld (DE), a

PNTF_transp	inc de


		;inc hl 
		dec hl; cambiamos el inc por un dec pues estamos flipeando
		
		;dec b
		;jp nz, PNTF_scanh
		djnz,PNTF_scanh; opt

		; reajuste final de HL
		ld a,(SPR_anchofinal)
		ld b,0
		ld c,a
		add hl,bc;
		inc hl; para compensar el ultimo dec
		Jp PNT_PAINTED
		;-------------------------------------------------

		;------------- VERSION FLIP NORMAL-----------------------
PNT_FLIPN
		;LD A,C
		;LD B,A ; ancho final en b
		;ld b,c; no tiene sentido

		; en c esta el anchofinal, pero debo restar el restoancho


		ld b,0
		add hl,bc; me coloco pix ultimo
		dec hl; ajuste pues 1+4=5, 
		ld b,c; ancho en b
PNTFN_scanh

		ld a, (HL); 2 pixels del sprite
		and %10101010;izq
		srl a; ahora el izq esta en derecho
		ld c,a
		ld a, (HL); 2 pixels del sprite
		and %01010101;dere
		ADD A,A;
		or c



PNTFN_pinta	ld (DE), a

PNTFN_transp	inc de


		;inc hl 
		dec hl; cambiamos el inc por un dec pues estamos flipeando
		;dec b
		;jp nz, PNTFN_scanh

		djnz,PNTFN_scanh; opt

		; reajuste final de HL
		ld a,(SPR_anchofinal)
		ld b,0
		ld c,a
		add hl,bc;
		inc hl; para compensar el ultimo dec
		jp PNT_PAINTED




;=============================================================================================================
; _INSTALL_INTERRUPT()   INS  tambien la llamaremos _MUSIC_ON() pues es lo que hace
;=============================================================================================================
; instala una rutina que invoca periodicamente al player de musica

; variables locales me las he llevado a otro sitio
; variables locales de _MUSIC_ON()
;-------------------------------------
;INS_counter	db 0;ultimo instante en que se toco la musica. de una invocacion a otra hay que mantener este valor
; esta no existe	;INS_model	dw &B939; model 464=>&B939 ,model 6128=> &B941. al instalar la interrupcion se corrige solo.
;INS_cancion	db 0
;INS_speed	db 5; una velocidad "normal" es 6. si ponemos 5 estamos acelerando un poco la musica


;variables de MUSIC
INS_LOOP	db 0

; function body
;-------------------------------------
_MUSIC_ON: ; le damos tambien este nombre a la funcion
_INSTALL_INTERRUPT:
		or a
		JP Z, _music_off
		;**************canal c
		ld hl,CANAL_C_LIBRE+1
		cp 4
		jr nz, INS1
		;han llegado 4 para
		ld a,(ix+6)
		or a ; =cp 0
		JR z,INS1
		ld bc,begin_no_tocar_c
		JR INS2

		;******************
INS1		
		ld bc,fin_no_tocar_c
INS2		ld (hl),c
		inc hl
		ld (hl),b

INS:		
		di
		call _SALTO_INT; asegura tener la dir de salto guardada
		
		


		ld a,(ix+0)
		ld (INS_speed),a
		ld a,(ix+2)
		ld (INS_cancion),a ; numero de cancion. por defecto=0
		ld a,(ix+4)
		ld (INS_LOOP),a

		call player; aqui se pone INTERR a &12, que es 18 en decimal. INTERR tiene 5 bits  = loop,sfx,efectos,player,carga =10010 =18

		ld a, (INS_LOOP)
		or a
		JR Z, INS_init
		ld a,2  ; es igual pero sin el bit de loop (18-16 =2)
		ld (INTERR),a
		
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

;		ex af,af'
;		exx

 		push ix
 		push iy; v40 

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
		; si l es 254 y b es 5 no salta el acarreo pero no hemos llegado!! pero eso nunca va a ocurrir
		; porque nos invocan muy a menudo. b es last time y l no puede ser mayor que last_time + 1 en teoria
		; a veces nos invocan tarde y pasan 2 tics
		
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

		pop iy;  V40
 		pop ix

;		ex af,af'
;		exx

 		pop hl
 		pop de
 		pop bc
		pop af


		; este salto se machaca gracias a la rutina _SALTO_INT por eso aqui pongo &0000
		;ret ; y si me lo cargo?
INS_JP		JP &0000 ;&B939;; CPC 464, en CPC6128 hay que ir a &b941
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
		;ld c, a v3708
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

		ld (ANS_seqadd), HL; guardada

		ld a, (ANS_frameid); recupero el fotograma_id
		cp a,7; frames van de 0 a 7 como mucho. si estamos en 7 hay que ciclar
		jr Z, ANS_fin_seq; ciclamos
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
		;ld HL,(ANS_newfradd)
		ld h,b
		ld l,c

		;ld b,0
		;ld c, 0

		; si hl es cero es porque no tenia direccion de imagen asignada. por eso el jr z
		; asi una secuencia puede tener menos de 8 frames
		ld bc, 0
		adc HL,bc
		Jr z, ANS_fin_seq 	
		
		ld (ANS_newfradd), HL; guardo la nueva direccion de imagen
		Jr ANS_nextframe; estamos en mitad de secuencia	
		
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
		ld HL, (ANS_spaddress)
		ld (hl),0; status cerp
		;tras secuencia muerte ponemos frame id  cero v40_001
		ld bc,8; v40_001
		add hl, bc; v40_001
		ld (hl),0;tras secuencia muerte ponemos frame id  cero  ; v40_001


		ret


ANS_nomuerte	ld HL, (ANS_spaddress)
		ld bc , sp_frame_offset ; esta constante vale 8
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
SET4param	;ld c,(ix+6); id_sprite v3708
		ld a,(ix+6); id_sprite v3708
		call _get_dir_sp

		;ld c,5 ; es el parametro 5
		;ld b,0

		ld bc, 5; opt

		add HL,bc		
		ld a, (IX+2); vy
		ld (HL), a
		inc HL
		ld a, (IX+0); vx
		ld (HL), a
		ret

SET3param	;ld c,(IX+4);menos signific. aqui tenemos el sprite id  v3708
		ld a,(IX+4);menos signific. aqui tenemos el sprite id  v3708
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
		;call _check_image_list; INPUT HL con la direccion, y su contenido la imagedir o el image_number
		;ret
		;----------fin mejora
		JR _check_image_list; optimize call +ret
		; si se trata del parametro sequence, llamo adicionalmente a anima para que 
		; reemplace el campo de direccion de memoria de imagen, asignando un 7 al frame id
SET_7		cp 7 
		Jr NZ,SET15
		;ret NZ
		; voy a poner un 7 en frame id, para que en la proxima animacion cicle a frame=0
		inc hl
		ld a,7
		ld (HL), a; frame 7
		; y ahora animamos
		ld a, (IX+4); sprite id lo cargo en A
		;call ANS_a; invoco anima con el sprite id en regisro a, asi se pone en primer frame
		;ret
		Jp ANS_a; optimize call +ret

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
		;call _resetruta;
		;ret
		JP _resetruta; optimize call +ret
		
;---------------------------------------------------------------------------------
;_check_image_list   CIL
;minirutina para transformar imagenumber en imagedir 
;input HL con la direccion y su contenido la imagedir o el imagenumber
;output el contenido de la direccion apuntada por hl es ahora una direccion de imagen( si ya lo era antes pues se queda como estaba)
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
		; ahora se actualiza la direccion en la tabla de sprites
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
;_SETUP_SEQUENCE		
;
;		; ubico la secuencia
;		ld e,(IX+16); son 8 frames
;		dec e
;		ld H, 16; cada secuencia son 16 bytes
;		call _MUL8bit: ; HL=H*E
;		ld bc, SEQUENCES
;		add HL,bc
;		; ahora HL es la direccion de comienzo de la secuencia
;		ex Hl,de
;		; ahora la secuencia empieza en DE
;		push IX
;		pop HL
;		
;		ld bc, 15; de 0 a 15 son datos de frames
;		add HL, bc		
;		; los parametros de direcciones empiezan en HL
;
;		ld b,8 ; 8 fotogramas 
;		
;SEQ_bucle	; bucle de transferencia
;		dec hl; primero el byte menos significativo
;		; ----mejora v26
;		call _check_image_list; INPUT HL con la direccion, y su contenido la imagedir o el image_number
;		;---- end mejora
;		ld a,(HL)
;		ld (de),a
;		inc hl; parametros. ahora bye mas signific
;		inc de; secuencia
;		ld a,(HL)
;		ld (de),a
;		dec hl; parametros
;		dec hl
;		inc de; secuencia
;		dec b
;		ret z
;		jr SEQ_bucle
		
		
		
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
		;ld c, a v3708
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
		jr Z, MOV_positivoX
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
; _AUTO_ALL()   MOA "MOvimiento Automatico"
;=============================================================================================================
; mueve todos los sprites con flag de movimiento automatico activo en su estado
; no se tienen en cuenta las colisiones con el layout. Eso lo debe chequear el programador
; esta funcion permite mover sprites con trayectorias definidas como por ejemplo 
; un guardia que se mueve de derecha a izquierda o un meteorito.
; donde es muy util es si tenemos una formacion de naves enemigas que se mueven a la vez
; si por ejemplo tienes 24 naves, con AUTO_ALL() las moveras todas, evitandote 24 llamadas desde basic
; para movimientos complejos donde hay que chequear el layout es mejor mover el sprite
; chequeando las colisiones con el layout y usando locate_sprite()

; variables locales
;-------------------------------------

; me llevo esta variable antes de 27000
;MOA_flag_route	db 0; flag de invocacion a ROUTEALL

; function body
;-------------------------------------
_AUTO_ALL
;		CALL _ROUTEALL
;		JR oo

		and a
		JR Z,MOA_noparam
		ld a, (IX+0)
MOA_inteno	ld (MOA_flag_route),a
MOA_noparam	ld a, (MOA_flag_route)
		;and a

		

;		cp 1
		dec a ; v37
		CALL Z, _ROUTEALL; invoca a ROUTEALL si hay flag de ruta

		;CALL _ROUTEALL; invoca a ROUTEALL si hay flag de ruta

		ld a, NUM_SPRITES-1 ;empezamos por el ultimo sprite
		ld (MOA_spid), a
		
		ld hl,27496; direccion del sprite 31
		push hl 
MOA_bucle	

		;call MOV_a; invoca a animacion de sprite i
		call _MOV_i

		;ld a, (MOA_spid)
		;dec a
		;ld (MOA_spid), a

		ld hl, MOA_spid;opti
		dec (HL);opti

		JP M, MOA_fin; si es negativo es que ya hemos animado el sprite 0
		pop hl
		ld bc,sprite_size
		and a; acarreo a cero
		sbc hl,bc
		push hl
		JR MOA_bucle
		
MOA_fin		;xor a
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
; me las llevo antes de 27000

;COL_umbral	db 32; por defecto es el espacio en blanco " ", cuyo ASCII es 32
;var_col		dw 0; //direccion de la variable col
;col_numsp	db 0; guardamos el id sprite de una llamada a la siguiente para ganar velocidad v37

; function body
;-------------------------------------
_COLISION_LAYOUT
		or a
		JR Z, col_noparam
;		cp a, 1
		dec a
		JR Z, col_1param
;		cp a,2
		dec a
		JR z, col_2param
		; si lleganis aqui es porque 
		; hay 3 parametros y por tanto llega el umbral de colision, la variable de colision y el sprite
		ld a, (IX+4)
		ld (COL_umbral),a

COL_2param
		ld l, (IX+2)
		ld h,(IX+3)
		ld (var_col),hl

COL_1param

		ld a, (IX+0); sprite id es el segundo parametro que llega en el call
		ld (col_numsp),a
col_noparam	ld a,(col_numsp)
COL_try		;ld c, a; necesario para llamar a get_dir_sp  v3708
		
		push ix		
		ld ix, COL_SPDATA; aqui estan yini,xini,yfin,xfin
		call _get_dir_sp; c=num sprite, retorna HL con la direccion
		call _fill_sp_data; rellena los 4 datos del sp1 sobre [ix+0]..[IX+7].rellena los 4 datos del sp1 sobre [ix+0]..[IX+7] . esta funcion la usa COLAY, COLSP y COLSPALL
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
;		srl a
;		srl a 
;		srl a ; a=a/8
		; v37 3 srl es lo mismo que 3 rrca y un and
		rrca
		rrca
		rrca
		and %00011111


		ld (COL_char_yini),a; 1 byte unsigned

		ld hl, (COL_yfin); 2 bytes con signo
		call COL_adjustY; a = ajustey(HL) ajusta a los limites de pantalla
;		srl a
;		srl a 
;		srl a ; a=a/8
		; v37 3 srl es lo mismo que 3 rrca y un and
		rrca
		rrca
		rrca
		and %00011111



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
		
		;and a; lo comento en v36
		;JR NZ,COL_CHOCA; lo quito en v36
		JR C,COL_CHOCA; v36
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
		;ld l, (IX+0) ;v37
		;ld h,(IX+1);v37
		;ld (hl),0;v37
		;ret;v37

		ld hl, (var_col)
		ld (hl),0 ;v37
		ret



COL_CHOCA	;ha chocado
		;retornamos un 1
		;ld l, (IX+0);v37
		;ld h,(IX+1) ;v37
		;ld (hl),1 ;v37

		ld hl, (var_col)
		ld (hl),1 ;v37
		ret		




		;====================================================
COL_adjustX	;micro rutina que ajusta la coordenada x a la pantalla 
		; input HL
		; output A 
		bit 7,h; check bit de signo
		jr Z , COL_xp; x es positivo
		xor a; si es menor que cero -->lo limito a cero
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
		xor a; si es menor que cero -->lo limito a cero
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
; inputs CO2_sp1, CO2_sp2 deben estar rellenas con los sprite_ID
; output A =1 o 0 segun si hay o no hay colision



; function body
;-------------------------------------
_COLISION_2_SPRITES

		ld a, (CO2_sp1)
		;ld c, a v3708
		call _get_dir_sp; C=num sprite, retorna HL con la direccion
		;ld a, (HL); leo status
		;and %010; chequeo flag de colision
		;esta comprobacion sobra porque se supone que el sprite sp1 me interesa
		;JR Z,CO2_NOCHOCA; el sprite no tiene flag. Esta comprobacion sobra
		push ix		
		ld ix, CO2_sp1data
		call _fill_sp_data; rellena los 4 datos del sp sobre ix
		pop ix

CO2_i		ld a, (CO2_sp2)
		;ld c, a v3708
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

		JR Z, CO2_AUNNOCHOCA;v36b
		;JR NC, CO2_NOCHOCA;v36b
		JP P, CO2_NOCHOCA; v38
		
CO2_AUNNOCHOCA	; caso 2 y1ini > y2fin -> no hay solape
		;and a ; reset acarreo
		ld hl,(CO2y1ini)
		add HL,bc; ayudita para que no te coman facil ***********
		ld de, (CO2y2fin)
		and a ; acarreo a cero
		sbc hl, de

		JR Z,CO2_MARGENX;v36b
		;JR NC, CO2_NOCHOCA; v36b
		JP P, CO2_NOCHOCA ; v38
		

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


		JR Z,  CO2_QUIZASCHOCA;v36b si son iguales estan solapados al menos en 1 byte
		JP P,  CO2_NOCHOCA ; v38
		;JR NC, CO2_NOCHOCA;v36b
		

		; caso 2 x1ini > x2fin -> no hay solape
		;and a ; reset acarreo
CO2_QUIZASCHOCA	ld hl,(CO2x1ini)
		add HL,bc; ayudita para que no te coman facil ***********
		ld de, (CO2x2fin)
		and a ; reset acarreo
		sbc hl, de
		; con cero debe de chocar!! v36b

		JR Z,  CO2_CHOCA;v36b
		;JR NC, CO2_NOCHOCA
		JP P,  CO2_NOCHOCA; v38
		; si no se cumple uno de los casos anteriores, es que hay solape
		; llegamos aqui porque hay colision
CO2_CHOCA	ld a,1; a=1 significa colision
		ret

CO2_NOCHOCA	xor a; a=0 significa no colision
		ret

;============================================================================================================
; _fill_sp_data()
;============================================================================================================
; esta funcion rellena yini, yfin,xini, xfin
; se usa internamente. es invocada por 
;	_COLISION_LAYOUT() 
;	_COLISION_2_SPRITES()	
;       _COLISION_SPRITES
; requiere que HL contenga la direccion del sprite en la SPRITES_TABLE

;fill	dw  0

_fill_sp_data
		
		
		

		;rellenamos la coord y
		;---------------------
		inc hl
		
;		ld (fill),ix este metodo tarda un poquitin mas aunque ocupa menos lineas para cargar x, y
;		ld DE,(fill)
;		ld BC,4
;		LDIR
				
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
;__AAA
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
		; ojo, no es compatible con haber asignado una imagen <255 con poke
		; en el word donde se almacena la imagen del sprite debe haber ya una direccion de imagen

		; V33 debemos saber si es flipped
		; -----------------------------------
		ld d,h
		ld e,l
		ld bc, _END_FLIP_IMAGES-1


		xor a
		sbc hl, bc
		JR NC, fill_noflip
		; si estamos aqui es que la imagen es flipeada

		;v39 ojo BEGIN_FLIP
		xor a ; acarreo a cero
		ld hl,_BEGIN_FLIP_IMAGES-1
		;ld b,d
		;ld c,e

		;ld bc,de
		sbc hl,de
		JR NC,fill_noflip

		;add hl,bc
		;JR NC, fill_noflip




		ld a, (de)
		ld c,a
		inc de
		ld a, (de)
		ld d,a ; ahora en de esta la verdadera direccion sprite
		ld e,c

fill_noflip	ld h,d
		ld l,e
		;------------end check flip ----------




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
_colsp
_COLISION_SPRITES
		; si llega un solo parametro es que no nos pasan la direccion de 
		; la variable de colision
		;cp a,1
		dec a ; v3701
		JR Z, COS1param

		;cp a,2
		dec a;v3701
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
		;ld c,a v3708
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
		;ld c, a v3708
		call _get_dir_sp; solo se invoca con el sp1. para los distintos sp2 se incrementa 16
		push ix		
		ld ix, CO2_sp1data
		call _fill_sp_data; rellena los 4 datos del sp sobre ix
		pop ix

		; ahora vamos a chequear la colision del sprite 31 
COS_LIMIT_FIN	ld a, NUM_SPRITES-1 ;empezamos por el ultimo sprite (sp2 = 31)
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

COS_sig		ld a, (CO2_sp2) ; v34  la optimizacion he tenido que retirarla pues el cp es con registro a
		dec a
		ld (CO2_sp2), a

		;ld hl, CO2_sp2; opti
		;dec (hl);opti
		;and a; byte stado a cero v34
		
COS_LIMIT_INI	cp 0 ; esta comparacion se altera con |COLSP,32,valor .  v34, es necesario
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
;bkgd_color	db 0


;SCS_initstar	db 0



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
		xor a
		ld (SPR_coordy+1), a
		xor a
		ld (SPR_coordx+1), a

		
		ld a, (IX+8)
		ld (SCS_initstar),a
		; mejora 22/02/2017
		; vamos a suponer que este primer parametro contiene la
		; estrella de comienzo y asi podremos hacer tantos
		; planos de estrellas como queramos
		; o mover 40 estrellas con un solo comando
SCS_START	ADD A,A
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
		;xor a
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
		jr Z,	SCS_incypos ; incremento positivo o nulo. scroll hacia abajo

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
		jr nc,  SCS_Ycycle; ymin>y, lo cual no debe ocurrir
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
		jr Z,	SCS_incxpos ; incremento positivo o nulo. scroll hacia derecha

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
		jr nc,  SCS_Xcycle; ymin>y, lo cual no debe ocurrir
		
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
		;ld hl, SCS_counter;opti mal. no se puede tocar aqui hl
		;dec (HL); opti

		Jp NZ,SCS_bucle
		ld a,(SCS_number); 20 estrellas maximo
		ld (SCS_counter),a; lo dejamos como estaba


		
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

; me las he llevado a antes de 27000
;MOR_ypointer dw 0; direccion de una variable basic dy
;MOR_xpointer dw 0; direccion de una variable basic dx

;------------------------------------
;variables globales de _MOVER
;---------------------------
; las he llevado a otra zona de memoria
;MOR_ypointer dw 0; direccion de una variable basic dy
;MOR_xpointer dw 0; direccion de una variable basic dx




; function body
;-------------------------------------
_MOVER
		; si no hay parametros se usan las variables de los punteros configuradas con MOVER, 32, @dy,@dx
;		cp 1
		dec a; v37
		JR NZ, MOR_params
		call get_offsets_from_pointers
		ld c, (IX+0)
		JR MOR_noparams

MOR_params	

		call get_offsets; esto carga dy y dx en MOR_y y MOR_x


		; cargo el sprite number
		ld c, (ix+4)

MOR_noparams	; mejora. V26
		; IF #=32 entonces es un comando de control para usar punteros en el offset
		ld a,c
		cp 32
		JR NZ, MOR_param
		; si estamos aqui es que nos han dado el sp=32 y por lo tanto MORY y MORX son direcciones de memoria
		LD hl,(MOR_y)

;		ld a,(MOR_y)
;		ld l,a
;		ld a,(MOR_y+1)
;		ld h,a
		ld (MOR_ypointer),HL
		
		LD hl,(MOR_x)
;		ld a,(MOR_x)
;		ld l,a
;		ld a,(MOR_x+1)
;		ld h,a
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
		inc HL; me coloco en la coordenada x
		ld e,(HL); byte menos sygnificativo coordx
		inc hl
		ld d,(HL); byte mas significativo coordx
		; ahora en DE esta la coordenada x
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
		ld l, (IX+0)
		ld h, (IX+1)
		ld (MOR_x),HL
		ld l, (IX+2)
		ld h, (IX+3)
		ld (MOR_y),HL
		ret

get_offsets_from_pointers
		ld HL, (MOR_ypointer); hl es una direccion
		ld a,(hl)
		inc hl
		ld h,(hl)
		ld l,a
		ld (MOR_y),hl


		ld HL, (MOR_xpointer); hl es una direccion
		ld a,(hl)
		inc hl
		ld h,(hl)
		ld l,a
		ld (MOR_x),hl


;		ld HL, (MOR_ypointer); hl es una direccion
;		ex de,hl
;		ld a,(de)
;		ld l,a
;		inc de
;		ld a,(de)
;		ld h,a
;		ld (MOR_y),hl

;		ld HL, (MOR_xpointer); hl es una direccion
;		ex de,hl
;		ld a,(de)
;		ld l,a
;		inc de
;		ld a,(de)
;		ld h,a
;		ld (MOR_x),hl
		ret






;=============================================================================================================
; _COLSPALL, @colisionador%,@colisionado%  COA
;=============================================================================================================
; esta rutina detecta la colision de los colisionadores (tu nave y tus disparos) con los colisionados (los enemigos)
;
; variables globales
;-------------------------------------
; movida a otra zona
;COA_colider	dw 0; direccion de memoria de colider

; variables locales
;-------------------------------------
;COA_spid	db 0; contador


;function body
;-------------------------------------
_COLSPALL

COA:
		;cp 0

		or a
		JR Z, COA_START

COA1param; mejora para un colspall desde un collider en lugar de empezar en 31
		dec a
		JR NZ, COA2param
		ld a,(ix+0)
		dec a ; v39 empezamos a explorar a partir del numero de sprite -1
		ld (COA_START+1),a	
		ld e,a
		ld h,16
		call _MUL8bit;hl=h*e
		ld bc,27000
		add hl,bc
		ld (COA_DIR_FIN+1),hl	
		call COA_START
		;ahora dejamos todo como estaba
		ld hl,27496
		ld (COA_DIR_FIN+1),hl
		ld a,31
		ld (COA_START+1),a
		ret

COA2param
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
		Jr Z, COA_next;
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
COA_next	
		;pop hl
		;ld a, (COA_spid)
		;dec a
		;ld (COA_spid), a

		ld hl, COA_spid; opti
		dec (HL);optimizacion. disminuye el sprite ID del posible colisionador
		pop hl;opti . no toca byte status

COA_LIMIT_INI	
		JP M, COA_fin; si es negativo es que ya hemos colisionado el sprite 0

		; actualizo el puntero a la direccion de sprite i
		ld bc, sprite_size
		sbc HL, bc ; HL apunta al siguiente sprite
		JR COA_bucle

COA_fin		
		;ld a, 32
		ld HL , (COA_colider)	
		;ld (hl),a
		ld (hl),32; opti
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
;ink_index	db 0; valor puntero. de una invocacion a la siguiente hay que preservarlo
		; ink_index es la tinta a la que le toca ser t1 en esta invocacion.
;ink_tini	db 1; tinta inicial de rango 
;ink_t1		db 3; tinta 
;ink_t2		db 3; tinta 
;ink_t3		db 3; tinta 
;ink_t4		db 3; tinta 
;ink_t5		db 24; tinta 
;ink_t6		db 24; tinta 
;ink_t7		db 24; tinta 
;ink_t8		db 24; tinta 
;ink_step	db 0; salto a dar
;ink_counter_aux db 0;longitud de patron 8 o 4 (meto 7 o 3)

;ink_patron_len	db 0

;function body
;-------------------------------------
_RINK
		; recogida de los 8 colores de franja
		;cp a,1
		dec a;v3701
		jr z, ink_noparam

		; Si llegamos aqui es porque nos estan pasando un patron
		push IX; mete en pila un puntero a la ultima tinta

		;dec a; A=len patron v3701 no hace falta
		ld (ink_patron_len),a; len 
		ld d,a; contador

		ld Hl,ink_t1; primer color
		ld c,a; C=len
		ld b,0
		dec c
		add hl,bc; hl=ultima tinta (del 0 al 7 por ejemplo)

		ld b,h
		ld c,l; BC= ultima tinta, da igual longitud patron

_inkbuc	
		; preparacion del bucle para cargar colores en variables
		;-------------------------------------------------------	
		xor a; a=0		
		ld (ink_index),a; 
		pop hl; con esto cargo IX en hl. IX tiene lista param (ix+0)= ultimo color
		
_inkbuc_N		
		; ahora vamos a cargar los N colores en ink_t8 ...int_t1
		;------------------------------------------------------
		; son N colores, no necesariamente 8
		ld a,(hl) ; A= ultimo color
		ld (BC),a ; ultimo color= A, queda almacenado
		inc hl
		inc hl
		dec bc
		dec d

		JR nz,_inkbuc_N
		; voy a recoger ink_tini que es el ultimo parametro esta en ix+len
		; ink_tini no es un color, es una tinta a partir de la cual se asignan los colores y se rota
		ld a,(hl)
		ld (ink_tini),a

		ret

ink_noparam	; recogida de step
		ld a,(ink_patron_len); len 		
		ld d,a

		ld a,(ix+0); aqui esta el step, es el unico parametro
		ld (ink_step),a
		ld b,a ; B=step

		ld a, (ink_index)
		add b ;b tiene el step
ink_and1	
		;and a, %111; si index+step se sale de rango pues nos colocamos al ppio con aritmetica modular
ink_nc1		and a
		cp d
		JR C, INK_menor
		sub d
		jr ink_nc1; proteccion por si step >2 len

INK_menor

		ld (ink_index),a; actualizado el index [0..7]
		ld a, (ink_patron_len)
		ld (ink_counter), a

		ld a,(ink_tini)
		dec a
		ld (ink_cambiar),a; si tini es 1, entonces ink_cambiar inicialmente es cero, pero es para sumar 

		;DI; nuevo. Que nos corten a la mitad puede provocar un fallo de color grave
		;aunque no he visto fallos pero por si acaso
ink_bucle       
		;este bucle se ejecuta N veces ( veces= len patron)
		;--------------------------------------------------
		;seleccion de tinta a alterar
		;ld a, (ink_cambiar)
		;inc a
		;ld (ink_cambiar),a; la primera vez es tini
		
		ld hl, ink_cambiar;opti
		inc (HL) ; opti

		;seleccion de tinta a poner
		ld a, (ink_index)
		inc a
ink_and2	

		;and %111
		and a
ink_nc2		cp d
		JR C, INK_menor2
		sub d
		jr ink_nc2; proteccion por si step >2 len

INK_menor2
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
		; se destruye AF,BC,DE HL
		ld a,(ink_patron_len); len 		
		ld d,a

ink_finbucle		
		;ld a, (ink_counter)
		;dec a
		;JR z, ink_fin
		;ld (ink_counter),a; decremento contador

		ld hl, ink_counter;opti
		dec (HL);opti
		JR z, ink_fin;opti


		jr ink_bucle
		
ink_fin		;EI; NUEVO
	
		ret




;=============================================================================================================
; _CLIP_SCANLINE	(CLIP)
;=============================================================================================================
; esta funcion se usa desde 3d_paint_segment y hace un clip horizontal de la scanline
; inputs
;---------
;   SPR_xini 
;   HL direccion de datos de scanline en image
;   DE direccion de pantalla
;   SPR_anchofinal
;   SPR_ancho
; outputs
;----------
;   SPR_xini a 0 ( o a LIMITS_XMIN) si hay cliping izquierdo. 
;   HL ajustada 
;   DE ajustada
;   SPR_anchofinal ajustado
;   si no hay nada que imprimir, SPR_anchofinal <=0

_3D_CLIP_SCANLINE	

		; empezamos por el cliping izquierdo
		; ------------------------------------
		ld a, (SPR_MIN_X); 
		ld c, a; guardo minx
		ld a, (PNTS_xini); la primera vez es el x1 proyectado. ojo puede ser negativo!!
		;and a no hace falta pues no miro acarreo
		cp c
		;RET P; incluye el caso cero
		JP M, CLIP_IZQ; hay que hacer cliping izq

		; veamos el cliping derecho
		;---------------------------
CLIP_DERE	ld a, (PNTS_xini); la primera vez es el x1 proyectado. ojo puede ser negativo!!
		
		ld c, a
		;ld  a, (SPR_anchofinal) ; 
		ld  a, (SPR_ancho);final) ; 
		add c; a= xini+anchofin
		ld c,a; c=xini+anchofin
		ld a, (SPR_MAX_X); 
		sub c ; ahora es sub y no cp. A= max-(ini+anchofin)
		RET P; si es positivo es que  xini+anchofinal <= xmax
		; si estoy aqui es porque hay que hacer clip dere
		; A = cuanto se pasa, en negativo
		neg
		ld c, a; c= max- (xini+anchofinal) es negativo pero con neg lo he pasado a pos
		;ld a ,(SPR_anchofinal);		
		ld a ,(SPR_ancho);		
		sub c; restamos lo que se pasa
		JP P, CLIP_algo
CLIP_nada	
		ld a,(SPR_MAX_X); quizas esto de xini no sea necesario
		ld (PNTS_xini),a
		xor a; no hay que imprimir nada
CLIP_algo	ld (SPR_anchofinal),a
		ret


		
		; si estoy aqui es que hay que hacer cliping izq
CLIP_IZQ	neg ; lo paso a positivo
		ld c,a; C=A contiene cuantos bytes me paso por la izquierda
		

		; xini =0 
		;--------
		xor a; esto es a=0
		ld (PNTS_xini),a		
		
		; si bc > ancho actual entonces no hay nada que imprimir
		;----------------------------------------------------
		ld a ,(SPR_anchofinal); no puedo poner ancho pues xini no es SPR_coordx sino otra cosa
		; ld a ,(SPR_ancho); no puedo poner ancho pues xini no es SPR_coordx sino otra cosa.
		; mas abajo, donde se actualiza la direccion de pantalla se explica porque no se puede usar
		; ancho. basicamente es debido a que en el fotograma anterior DE debe ser una dir valida
		sub  c	
		JR NC, CLIP_IZN
		xor a; asi no es negativo
CLIP_IZN	ld (SPR_anchofinal),a

		; correccion de sprite final
		;--------------------------
		; c debe ser lo que me paso respecto de la ultima direccion hl
		; podria ser cuanto me paso respecto el limite
		ld b,0
		;ld HL, (SPR_image_data)
		add hl,bc; b=0, c=bytes a sumar
		;ld (SPR_imagefinal),hl

		; correccion de dirpant (en DE). 
		;----------------------------------
		;ha sido desplazada al  aplicar el dx y ahora hay que contrarrestarlo
		; c debe ser lo que se excede respecto de la ultima direccion de pantalla DE , la cual debe ser valida
		; es decir como minimo DE contiene la direccion correspondiente a xini=0
		; por eso C no puede ser cuanto se pasa el segmento sino cuanto se ha pasado mas desde la ultima vez
		; si fuese cuanto se pasa el segmento respecto del limite izquierdo, entonces DE debe calcularse 
		; con un diferencial y no con ese valor pues el valor anterior de DE es el de xini=0
		ex de,hl
		add hl,bc
		ex de,hl
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
		
		;pop hl
		;ld a, (MRA_spid)
		;dec a
		;ld (MRA_spid), a

		ld hl, MRA_spid; opti
		dec (hl); opti
		pop hl; opti


		JP M, MRA_fin; si es negativo es que ya hemos animado el sprite 0

		; actualizo el puntero a la direccion de sprite i
		;pop HL
		ld bc, sprite_size
		add HL, bc ; HL apunta al siguiente sprite
		JR MRA_bucle
		
MRA_fin		;xor a
	 	;ld (MRA_spid), a
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
		

		;ld a, (ANI_spid)
		;dec a
		;ld (ANI_spid), a
		ld hl, ANI_spid; opti
		dec (HL); opti

		JP M, ANI_fin; si es negativo es que ya hemos animado el sprite 0
		JP ANI_bucle
		
ANI_fin		
	
		pop hl
		ret
	
;============================================================================================================
; _PINTA_SEG_TR PSTR 
;=============================================================================================================
; pinta una scanline de un segmento transparente
; variables locales
;-------------------------------------

; function body
;-------------------------------------

PINTA_SEG_TR
		;ldir ;(DE)<--(HL) till bc=0
		;ret

		ld b,c; guardo bc en b
PSTR_scanh
		ld a,(HL) ; 2 pix de sprite
		ld c,a 
PSTR_bin1	and a,%11000000; o bien %11001100
		jr z, PSTR_fondo
PSTR_bin2	cp %11001100
		jr z,PSTR_transp
		ld a,c

PSTR_der
		bit 6,c
		jr z, PSTR_izq
		res 6,c
		ld a,(de)
		and a, %01010101; pix der
		or a,c
		ld c,a
		jr PSTR_fondo
PSTR_izq	
		res 7,c
PSTR_fondo	ld a,(DE); (DE) contiene el fondo
PSTR_bin3	and a,%11000000
		or a,c; OR del pixel con el fondo (fondo en "A" y pixel en "C")

PSTR_pinta	ld (DE),a
PSTR_transp	inc de
		inc hl
		;dec b
		;jr nz, PSTR_scanh	
		djnz, PSTR_scanh; opt
		ret

_CALL_COMBINADO; no merece la pena
	ld a,1
	call MOA_inteno
	xor a
	call _printspall
	xor a
	call _colspall
	ret

;------------------ viene de routesp
ROU_V34
	ld a, (ROU_SPID)
	CALL ANS_a
	jP ROU_kkk

ROU_INIRUTA
	; venimos desde _UPDATE_SEGMENT porque se ha detectado un comienzo de ruta
	ld a,255; asi al sumar un 1 pasara a cero
	ld (ROU_SEG),a
	xor a; nuevo paso
	;JR _UPDATE_SEGMENT
	Jp _UPDATE_SEGMENT ; v28
	




; variables locales de colspall
;------------------------------
COA_colider	dw 0; direccion de memoria de colider

; variables locales de colay
;------------------------------
COL_umbral	db 32; por defecto es el espacio en blanco " ", cuyo ASCII es 32
var_col		dw 0; //direccion de la variable col
col_numsp	db 0; guardamos el id sprite de una llamada a la siguiente para ganar velocidad v37

; variables de la funcion SET_LIMITS
;-------------------------------------
SPR_DIFX	db 80
SPR_DIFY	db 200

; variables de autoall
;-----------------------------------
MOA_flag_route	db 0; flag de invocacion a ROUTEALL