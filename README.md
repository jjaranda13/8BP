# 8BP
8 bits de poder ( 8 bits of power)


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
;|STARS, bank,num,color,dy,dx       -> scroll de un banco de estrellas en cualquier direccion y velocidad
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
;       | banco 1 de 20 estrellas (desde 42580 hasta 42619)
; 42580 +---------- 
;       | banco 0 de 20 estrellas (desde 42540 hasta 42579)
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
;       |  rutinas 8BP   ( y sobran 540 bytes)
;       |	 aqui estan todas las rutinas y la tabla de sprites
;       |     incluye el player de musica "wyz"
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
