;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (MINGW64)
;--------------------------------------------------------
	.module ciclo
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _reverse
	.globl _DisplayChar
	.globl __8BP_umap_inv6
	.globl __8BP_moverall_inv2
	.globl __8BP_mover_inv3
	.globl __8BP_map2sp_inv2
	.globl __8BP_layout_inv3
	.globl __8BP_stars_inv5
	.globl __8BP_setupsp_inv4
	.globl __8BP_setupsp_inv3
	.globl __8BP_setlimits_inv4
	.globl __8BP_routesp_inv2
	.globl __8BP_printspall_inv4
	.globl __8BP_printsp_inv2
	.globl __8BP_printsp_inv3
	.globl __8BP_printat_inv
	.globl _getDescriptor
	.globl __8BP_music_inv4
	.globl __8BP_locatesp_inv3
	.globl __8BP_colspall_inv2
	.globl __8BP_colsp_inv2
	.globl __8BP_colsp_inv3
	.globl __8BP_colay_inv2
	.globl __8BP_colay_inv3
	.globl __8BP_3D_inv3
	.globl _comandos_8BP_V42
	.globl _strlen
	.globl _abs
	.globl _ruta
	.globl _puntos_str
	.globl _puntos
	.globl _rescol
	.globl _cod
	.globl _cor
	.globl _ex
	.globl _e
	.globl _y
	.globl _x
	.globl _sp
	.globl _last
	.globl _c
	.globl __basic_rnd_x
	.globl __8BP_rink_N_inverse_list
	.globl __8BP_rink_N_color1
	.globl _CHAR_CR
	.globl __8BP_3D_3
	.globl __8BP_3D_1
	.globl __8BP_anima_1
	.globl __8BP_animall
	.globl __8BP_auto_1
	.globl __8BP_autoall_1
	.globl __8BP_autoall
	.globl __8BP_colay
	.globl __8BP_colay_2
	.globl __8BP_colay_1
	.globl __8BP_colay_3
	.globl __8BP_colsp_3
	.globl __8BP_colsp_2
	.globl __8BP_colsp_1
	.globl __8BP_colspall
	.globl __8BP_colspall_1
	.globl __8BP_colspall_2
	.globl __8BP_locatesp_3
	.globl __8BP_music_4
	.globl __8BP_music
	.globl __8BP_printat_4
	.globl __8BP_printsp_3
	.globl __8BP_printsp_2
	.globl __8BP_printsp_1
	.globl __8BP_printspall_4
	.globl __8BP_printspall_1
	.globl __8BP_printspall
	.globl __8BP_routeall
	.globl __8BP_routesp_2
	.globl __8BP_routesp_1
	.globl __8BP_setlimits_4
	.globl __8BP_setupsp_3
	.globl __8BP_setupsp_4
	.globl __8BP_stars_5
	.globl __8BP_stars
	.globl __8BP_layout_3
	.globl __8BP_map2sp_2
	.globl __8BP_map2sp_1
	.globl __8BP_mover_3
	.globl __8BP_mover_1
	.globl __8BP_moverall_2
	.globl __8BP_moverall
	.globl __8BP_peek_2
	.globl __8BP_poke_2
	.globl __8BP_rink_1
	.globl __8BP_rink_N
	.globl __8BP_umap_6
	.globl __basic_time
	.globl __basic_rnd
	.globl __basic_border
	.globl __basic_print
	.globl __basic_inkey
	.globl __basic_str
	.globl __basic_call
	.globl __basic_locate
	.globl __basic_sound
	.globl __basic_ink
	.globl __basic_peek
	.globl __basic_poke
	.globl __basic_pen_txt
	.globl __basic_pen_graph
	.globl __basic_paper
	.globl __basic_plot
	.globl __basic_move
	.globl __basic_draw
	.globl _rutina_colision
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
__8BP_rink_N_color1::
	.ds 1
__8BP_rink_N_inverse_list::
	.ds 34
__basic_str_buffer_65536_273:
	.ds 11
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
__basic_rnd_x::
	.ds 2
_c::
	.ds 2
_last::
	.ds 2
_sp::
	.ds 2
_x::
	.ds 2
_y::
	.ds 2
_e::
	.ds 2
_ex::
	.ds 2
_cor::
	.ds 2
_cod::
	.ds 2
_rescol::
	.ds 2
_puntos::
	.ds 2
_puntos_str::
	.ds 2
_ruta::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;mini_BASIC/minibasic.h:178: static char buffer[]="          ";
	ld	hl, #__basic_str_buffer_65536_273
	ld	(hl), #0x20
	ld	hl, #(__basic_str_buffer_65536_273 + 0x0001)
	ld	(hl), #0x20
	ld	hl, #(__basic_str_buffer_65536_273 + 0x0002)
	ld	(hl), #0x20
	ld	hl, #(__basic_str_buffer_65536_273 + 0x0003)
	ld	(hl), #0x20
	ld	hl, #(__basic_str_buffer_65536_273 + 0x0004)
	ld	(hl), #0x20
	ld	hl, #(__basic_str_buffer_65536_273 + 0x0005)
	ld	(hl), #0x20
	ld	hl, #(__basic_str_buffer_65536_273 + 0x0006)
	ld	(hl), #0x20
	ld	hl, #(__basic_str_buffer_65536_273 + 0x0007)
	ld	(hl), #0x20
	ld	hl, #(__basic_str_buffer_65536_273 + 0x0008)
	ld	(hl), #0x20
	ld	hl, #(__basic_str_buffer_65536_273 + 0x0009)
	ld	(hl), #0x20
	ld	hl, #(__basic_str_buffer_65536_273 + 0x000a)
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;8BP_wrapper/8BP.h:103: void comandos_8BP_V42(){
;	---------------------------------
; Function comandos_8BP_V42
; ---------------------------------
_comandos_8BP_V42::
;8BP_wrapper/8BP.h:133: __endasm;
	_3D	== 0x6BDE;
	ANIMA	== 0x6BB7;
	ANIMALL	== 0x7479;no se usa
	AUTO	== 0x6BC9;
	AUTOALL	== 0x6B9C;
	COLAY	== 0x6BA8;
	COLSP	== 0x6BBA;
	COLSPALL	== 0x6B99;
	LAYOUT	== 0x6BD5;
	LOCATESP	== 0x6BAE;
	MAP2SP	== 0x6BA2;
	MOVER	== 0x6BC0;
	MOVERALL	== 0x6B9F;
	MUSIC	== 0x6BD8;
	PEEK	== 0x6BB1;
	POKE	== 0x6BB4;
	PRINTAT	== 0x6BC6;
	PRINTSP	== 0x6BC3;
	PRINTSPALL	== 0x6B96;
	RINK	== 0x6BBD;
	ROUTESP	== 0x6BCC;
	ROUTEALL	== 0x6BD2;
	SETLIMITS	== 0x6BDB;
	SETUPSP	== 0x6BAB;
	STARS	== 0x6BA5;
	UMAP	== 0x6BCF;
;8BP_wrapper/8BP.h:134: }
	ret
;8BP_wrapper/8BP.h:137: void _8BP_3D_inv3(int offsety,int sp_fin, int flag)
;	---------------------------------
; Function _8BP_3D_inv3
; ---------------------------------
__8BP_3D_inv3::
;8BP_wrapper/8BP.h:148: __endasm;			
	ld	a, #3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	call	_3D ;
;8BP_wrapper/8BP.h:150: }
	ret
;8BP_wrapper/8BP.h:152: void _8BP_3D_3(int flag, int sp_fin,int offsety)  
;	---------------------------------
; Function _8BP_3D_3
; ---------------------------------
__8BP_3D_3::
;8BP_wrapper/8BP.h:154: _8BP_3D_inv3(offsety,sp_fin,flag);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_3D_inv3
	pop	af
	pop	af
	pop	af
;8BP_wrapper/8BP.h:155: }
	ret
;8BP_wrapper/8BP.h:157: void _8BP_3D_1(int flag) 
;	---------------------------------
; Function _8BP_3D_1
; ---------------------------------
__8BP_3D_1::
;8BP_wrapper/8BP.h:164: __endasm;			
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	call	_3D ;
;8BP_wrapper/8BP.h:166: }
	ret
;8BP_wrapper/8BP.h:168: void _8BP_anima_1(int sp) 
;	---------------------------------
; Function _8BP_anima_1
; ---------------------------------
__8BP_anima_1::
;8BP_wrapper/8BP.h:175: __endasm;			
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	call	ANIMA ;
;8BP_wrapper/8BP.h:177: }
	ret
;8BP_wrapper/8BP.h:179: void _8BP_animall() 
;	---------------------------------
; Function _8BP_animall
; ---------------------------------
__8BP_animall::
;8BP_wrapper/8BP.h:184: __endasm;			
	ld	a,#0
	call	ANIMALL ;
;8BP_wrapper/8BP.h:186: }
	ret
;8BP_wrapper/8BP.h:188: void _8BP_auto_1(int sp) 
;	---------------------------------
; Function _8BP_auto_1
; ---------------------------------
__8BP_auto_1::
;8BP_wrapper/8BP.h:195: __endasm;			
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	call	AUTO ;
;8BP_wrapper/8BP.h:197: }
	ret
;8BP_wrapper/8BP.h:199: void _8BP_autoall_1(int flag) 
;	---------------------------------
; Function _8BP_autoall_1
; ---------------------------------
__8BP_autoall_1::
;8BP_wrapper/8BP.h:206: __endasm;			
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	call	AUTOALL ;
;8BP_wrapper/8BP.h:208: }
	ret
;8BP_wrapper/8BP.h:210: void _8BP_autoall() 
;	---------------------------------
; Function _8BP_autoall
; ---------------------------------
__8BP_autoall::
;8BP_wrapper/8BP.h:215: __endasm;			
	ld	a, #0
	call	AUTOALL ;
;8BP_wrapper/8BP.h:217: }
	ret
;8BP_wrapper/8BP.h:219: void _8BP_colay_inv3( int sp,int* colision,int umbral)
;	---------------------------------
; Function _8BP_colay_inv3
; ---------------------------------
__8BP_colay_inv3::
;8BP_wrapper/8BP.h:226: __endasm;		
	ld	a, #3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLAY
;8BP_wrapper/8BP.h:228: }
	ret
;8BP_wrapper/8BP.h:230: void _8BP_colay()
;	---------------------------------
; Function _8BP_colay
; ---------------------------------
__8BP_colay::
;8BP_wrapper/8BP.h:235: __endasm;		
	ld	a, #0
	CALL	COLAY
;8BP_wrapper/8BP.h:237: }
	ret
;8BP_wrapper/8BP.h:239: void _8BP_colay_inv2(int sp, int* colision)
;	---------------------------------
; Function _8BP_colay_inv2
; ---------------------------------
__8BP_colay_inv2::
;8BP_wrapper/8BP.h:246: __endasm;		
	ld	a, #2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLAY
;8BP_wrapper/8BP.h:248: }
	ret
;8BP_wrapper/8BP.h:249: void _8BP_colay_2(int* colision, int sp)
;	---------------------------------
; Function _8BP_colay_2
; ---------------------------------
__8BP_colay_2::
;8BP_wrapper/8BP.h:251: _8BP_colay_inv2(sp, colision);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_inv2
	pop	af
	pop	af
;8BP_wrapper/8BP.h:252: }
	ret
;8BP_wrapper/8BP.h:255: void _8BP_colay_1(int sp)
;	---------------------------------
; Function _8BP_colay_1
; ---------------------------------
__8BP_colay_1::
;8BP_wrapper/8BP.h:262: __endasm;		
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLAY
;8BP_wrapper/8BP.h:264: }
	ret
;8BP_wrapper/8BP.h:267: void _8BP_colay_3(int umbral, int* colision, int sp)
;	---------------------------------
; Function _8BP_colay_3
; ---------------------------------
__8BP_colay_3::
;8BP_wrapper/8BP.h:269: _8BP_colay_inv3( sp,colision,umbral);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_colay_inv3
	pop	af
	pop	af
	pop	af
;8BP_wrapper/8BP.h:270: }
	ret
;8BP_wrapper/8BP.h:274: void _8BP_colsp_inv3( int b, int a,int operation)
;	---------------------------------
; Function _8BP_colsp_inv3
; ---------------------------------
__8BP_colsp_inv3::
;8BP_wrapper/8BP.h:283: __endasm;		
	ld	a, #3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSP
;8BP_wrapper/8BP.h:285: }
	ret
;8BP_wrapper/8BP.h:287: void _8BP_colsp_inv2(int* colision,int sp)
;	---------------------------------
; Function _8BP_colsp_inv2
; ---------------------------------
__8BP_colsp_inv2::
;8BP_wrapper/8BP.h:295: __endasm;		
	ld	a, #2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSP
;8BP_wrapper/8BP.h:297: }
	ret
;8BP_wrapper/8BP.h:299: void _8BP_colsp_3(int operation, int a, int b)  
;	---------------------------------
; Function _8BP_colsp_3
; ---------------------------------
__8BP_colsp_3::
;8BP_wrapper/8BP.h:301: _8BP_colsp_inv3(b,a,operation);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_colsp_inv3
	pop	af
	pop	af
	pop	af
;8BP_wrapper/8BP.h:302: }
	ret
;8BP_wrapper/8BP.h:304: void _8BP_colsp_2(int sp, int* colision)  
;	---------------------------------
; Function _8BP_colsp_2
; ---------------------------------
__8BP_colsp_2::
;8BP_wrapper/8BP.h:306: _8BP_colsp_inv2(colision, sp);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colsp_inv2
	pop	af
	pop	af
;8BP_wrapper/8BP.h:307: }
	ret
;8BP_wrapper/8BP.h:309: void _8BP_colsp_1(int sp)  
;	---------------------------------
; Function _8BP_colsp_1
; ---------------------------------
__8BP_colsp_1::
;8BP_wrapper/8BP.h:318: __endasm;		
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSP
;8BP_wrapper/8BP.h:319: }
	ret
;8BP_wrapper/8BP.h:321: void _8BP_colspall_inv2(int* collided,int* collider) 
;	---------------------------------
; Function _8BP_colspall_inv2
; ---------------------------------
__8BP_colspall_inv2::
;8BP_wrapper/8BP.h:329: __endasm;
	ld	a, #2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSPALL
;8BP_wrapper/8BP.h:330: }
	ret
;8BP_wrapper/8BP.h:332: void _8BP_colspall() 
;	---------------------------------
; Function _8BP_colspall
; ---------------------------------
__8BP_colspall::
;8BP_wrapper/8BP.h:337: __endasm;	
	ld	a, #0
	CALL	COLSPALL
;8BP_wrapper/8BP.h:338: }
	ret
;8BP_wrapper/8BP.h:340: void _8BP_colspall_1(int collider_ini) __critical
;	---------------------------------
; Function _8BP_colspall_1
; ---------------------------------
__8BP_colspall_1::
	ld	a,i
	di
	push	af
;8BP_wrapper/8BP.h:348: __endasm;	
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSPALL
;8BP_wrapper/8BP.h:349: }
	pop	af
	ret	PO
	ei
	ret
;8BP_wrapper/8BP.h:351: void _8BP_colspall_2(int* collider, int* collided) 
;	---------------------------------
; Function _8BP_colspall_2
; ---------------------------------
__8BP_colspall_2::
;8BP_wrapper/8BP.h:353: _8BP_colspall_inv2(collided,collider);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colspall_inv2
	pop	af
	pop	af
;8BP_wrapper/8BP.h:354: }
	ret
;8BP_wrapper/8BP.h:356: void _8BP_locatesp_inv3(int x, int y, char sp)
;	---------------------------------
; Function _8BP_locatesp_inv3
; ---------------------------------
__8BP_locatesp_inv3::
;8BP_wrapper/8BP.h:365: __endasm;	
	ld	a, #3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	LOCATESP
;8BP_wrapper/8BP.h:367: }
	ret
;8BP_wrapper/8BP.h:369: void _8BP_locatesp_3(char sp, int y, int x) 
;	---------------------------------
; Function _8BP_locatesp_3
; ---------------------------------
__8BP_locatesp_3::
;8BP_wrapper/8BP.h:371: _8BP_locatesp_inv3( x, y, sp);
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	push	af
	inc	sp
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_locatesp_inv3
	pop	af
	pop	af
	inc	sp
;8BP_wrapper/8BP.h:372: }
	ret
;8BP_wrapper/8BP.h:375: void _8BP_music_inv4(int speed, int song, int flag_repetition, int flag_c) 
;	---------------------------------
; Function _8BP_music_inv4
; ---------------------------------
__8BP_music_inv4::
;8BP_wrapper/8BP.h:386: __endasm;		
	ld	a, #4
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MUSIC
;8BP_wrapper/8BP.h:387: }
	ret
;8BP_wrapper/8BP.h:389: void _8BP_music_4(int flag_c, int flag_repetition,int song, int speed)  
;	---------------------------------
; Function _8BP_music_4
; ---------------------------------
__8BP_music_4::
;8BP_wrapper/8BP.h:391: _8BP_music_inv4(speed, song, flag_repetition, flag_c);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_music_inv4
	pop	af
	pop	af
	pop	af
	pop	af
;8BP_wrapper/8BP.h:393: }
	ret
;8BP_wrapper/8BP.h:395: void _8BP_music()
;	---------------------------------
; Function _8BP_music
; ---------------------------------
__8BP_music::
;8BP_wrapper/8BP.h:400: __endasm;		
	ld	a, #0
	CALL	MUSIC
;8BP_wrapper/8BP.h:401: }
	ret
;8BP_wrapper/8BP.h:403: void getDescriptor(char* desc,char *cad)
;	---------------------------------
; Function getDescriptor
; ---------------------------------
_getDescriptor::
;8BP_wrapper/8BP.h:407: char len=strlen(cad);
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_strlen
	pop	af
	ld	c, l
;8BP_wrapper/8BP.h:408: desc[0]=len;
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
;8BP_wrapper/8BP.h:410: p=desc+1;
	inc	hl
;8BP_wrapper/8BP.h:411: *p=cad;
	ld	iy, #4
	add	iy, sp
	ld	c, 0 (iy)
	ld	a, 1 (iy)
	ld	(hl), c
	inc	hl
	ld	(hl), a
;8BP_wrapper/8BP.h:414: }
	ret
;8BP_wrapper/8BP.h:416: void _8BP_printat_inv(char *descriptor , int x, int y,int flag) 
;	---------------------------------
; Function _8BP_printat_inv
; ---------------------------------
__8BP_printat_inv::
;8BP_wrapper/8BP.h:426: __endasm;			
	ld	a, #4
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTAT
;8BP_wrapper/8BP.h:428: }
	ret
;8BP_wrapper/8BP.h:430: void _8BP_printat_4(int flag,int y,int x, char* cad)  
;	---------------------------------
; Function _8BP_printat_4
; ---------------------------------
__8BP_printat_4::
	push	af
	dec	sp
;8BP_wrapper/8BP.h:433: char descriptor[3]={0,0,0};
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	xor	a, a
	ld	(de), a
	ld	c, e
	ld	b, d
	inc	bc
	xor	a, a
	ld	(bc), a
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl), #0x00
;8BP_wrapper/8BP.h:434: char len=strlen(cad);
	push	bc
	ld	hl, #13
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_strlen
	pop	af
	pop	bc
	ld	a, l
;8BP_wrapper/8BP.h:435: descriptor[0]=len;
	ld	(de), a
;8BP_wrapper/8BP.h:437: p=descriptor+1;
	ld	l, c
	ld	h, b
;8BP_wrapper/8BP.h:438: *p=cad;  
	ld	iy, #11
	add	iy, sp
	ld	c, 0 (iy)
	ld	a, 1 (iy)
	ld	(hl), c
	inc	hl
	ld	(hl), a
;8BP_wrapper/8BP.h:441: _8BP_printat_inv(descriptor, x, y, flag);   
	ld	iy, #5
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	push	de
	call	__8BP_printat_inv
	pop	af
	pop	af
	pop	af
	pop	af
;8BP_wrapper/8BP.h:443: } 
	pop	af
	inc	sp
	ret
;8BP_wrapper/8BP.h:445: void _8BP_printsp_inv3(int x,int y, int sp)  
;	---------------------------------
; Function _8BP_printsp_inv3
; ---------------------------------
__8BP_printsp_inv3::
;8BP_wrapper/8BP.h:455: __endasm;	
	ld	a, #3 ; se envian 3 parametros
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTSP
;8BP_wrapper/8BP.h:456: }
	ret
;8BP_wrapper/8BP.h:458: void _8BP_printsp_inv2(int bits, int sp) 
;	---------------------------------
; Function _8BP_printsp_inv2
; ---------------------------------
__8BP_printsp_inv2::
;8BP_wrapper/8BP.h:467: __endasm;	
	ld	a, #2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	call	PRINTSP ;
;8BP_wrapper/8BP.h:469: }
	ret
;8BP_wrapper/8BP.h:471: void _8BP_printsp_3(int sp, int y, int x)  
;	---------------------------------
; Function _8BP_printsp_3
; ---------------------------------
__8BP_printsp_3::
;8BP_wrapper/8BP.h:473: _8BP_printsp_inv3( x, y,  sp);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_printsp_inv3
	pop	af
	pop	af
	pop	af
;8BP_wrapper/8BP.h:474: }
	ret
;8BP_wrapper/8BP.h:476: void _8BP_printsp_2(int sp,int bits_background)  
;	---------------------------------
; Function _8BP_printsp_2
; ---------------------------------
__8BP_printsp_2::
;8BP_wrapper/8BP.h:478: _8BP_printsp_inv2( bits_background,  sp);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_printsp_inv2
	pop	af
	pop	af
;8BP_wrapper/8BP.h:479: }
	ret
;8BP_wrapper/8BP.h:481: void _8BP_printsp_1(int sp)  
;	---------------------------------
; Function _8BP_printsp_1
; ---------------------------------
__8BP_printsp_1::
;8BP_wrapper/8BP.h:489: __endasm;	
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTSP
;8BP_wrapper/8BP.h:492: }
	ret
;8BP_wrapper/8BP.h:494: void _8BP_printspall_inv4(int flag_sync,int flag_anima, int fin, int ini)
;	---------------------------------
; Function _8BP_printspall_inv4
; ---------------------------------
__8BP_printspall_inv4::
;8BP_wrapper/8BP.h:504: __endasm;	
	ld	a, #4
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTSPALL
;8BP_wrapper/8BP.h:505: }
	ret
;8BP_wrapper/8BP.h:507: void _8BP_printspall_4(int ini, int fin, int flag_anima, int flag_sync)  
;	---------------------------------
; Function _8BP_printspall_4
; ---------------------------------
__8BP_printspall_4::
;8BP_wrapper/8BP.h:509: _8BP_printspall_inv4(flag_sync, flag_anima, fin, ini);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_printspall_inv4
	pop	af
	pop	af
	pop	af
	pop	af
;8BP_wrapper/8BP.h:510: }
	ret
;8BP_wrapper/8BP.h:512: void _8BP_printspall_1(int order_type)  
;	---------------------------------
; Function _8BP_printspall_1
; ---------------------------------
__8BP_printspall_1::
;8BP_wrapper/8BP.h:519: __endasm;	
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTSPALL
;8BP_wrapper/8BP.h:520: }
	ret
;8BP_wrapper/8BP.h:522: void _8BP_printspall() 
;	---------------------------------
; Function _8BP_printspall
; ---------------------------------
__8BP_printspall::
;8BP_wrapper/8BP.h:527: __endasm;	
	ld	a, #0
	CALL	PRINTSPALL
;8BP_wrapper/8BP.h:528: }
	ret
;8BP_wrapper/8BP.h:530: void _8BP_routeall()
;	---------------------------------
; Function _8BP_routeall
; ---------------------------------
__8BP_routeall::
;8BP_wrapper/8BP.h:535: __endasm;	
	ld	a, #0;
	CALL	ROUTEALL
;8BP_wrapper/8BP.h:537: }
	ret
;8BP_wrapper/8BP.h:540: void _8BP_routesp_inv2(int pasos, int sp) 
;	---------------------------------
; Function _8BP_routesp_inv2
; ---------------------------------
__8BP_routesp_inv2::
;8BP_wrapper/8BP.h:548: __endasm;	
	ld	a, #2 ;
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	ROUTESP
;8BP_wrapper/8BP.h:549: }
	ret
;8BP_wrapper/8BP.h:551: void _8BP_routesp_2(int sp, int pasos)  
;	---------------------------------
; Function _8BP_routesp_2
; ---------------------------------
__8BP_routesp_2::
;8BP_wrapper/8BP.h:553: _8BP_routesp_inv2(pasos,sp) ;
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_routesp_inv2
	pop	af
	pop	af
;8BP_wrapper/8BP.h:554: }
	ret
;8BP_wrapper/8BP.h:556: void _8BP_routesp_1(int sp)  
;	---------------------------------
; Function _8BP_routesp_1
; ---------------------------------
__8BP_routesp_1::
;8BP_wrapper/8BP.h:563: __endasm;	
	ld	a, #1 ;
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	ROUTESP
;8BP_wrapper/8BP.h:565: }
	ret
;8BP_wrapper/8BP.h:567: void _8BP_setlimits_inv4(int ymax, int ymin, int xmax,int xmin)
;	---------------------------------
; Function _8BP_setlimits_inv4
; ---------------------------------
__8BP_setlimits_inv4::
;8BP_wrapper/8BP.h:574: __endasm;	
	ld	a, #4 ;
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	SETLIMITS
;8BP_wrapper/8BP.h:577: }
	ret
;8BP_wrapper/8BP.h:579: void _8BP_setlimits_4(int xmin,int xmax, int ymin, int ymax)
;	---------------------------------
; Function _8BP_setlimits_4
; ---------------------------------
__8BP_setlimits_4::
;8BP_wrapper/8BP.h:581: _8BP_setlimits_inv4( ymax,  ymin,  xmax, xmin);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_setlimits_inv4
	pop	af
	pop	af
	pop	af
	pop	af
;8BP_wrapper/8BP.h:582: }
	ret
;8BP_wrapper/8BP.h:584: void _8BP_setupsp_inv3(int value,int param, int sp) 
;	---------------------------------
; Function _8BP_setupsp_inv3
; ---------------------------------
__8BP_setupsp_inv3::
;8BP_wrapper/8BP.h:593: __endasm;	
	ld	a, #3 ; se envian 3 parametros
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	SETUPSP
;8BP_wrapper/8BP.h:594: }
	ret
;8BP_wrapper/8BP.h:596: void _8BP_setupsp_inv4(int value2,int value1,int param, int sp) 
;	---------------------------------
; Function _8BP_setupsp_inv4
; ---------------------------------
__8BP_setupsp_inv4::
;8BP_wrapper/8BP.h:606: __endasm;	
	ld	a, #4 ;
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	SETUPSP
;8BP_wrapper/8BP.h:607: }
	ret
;8BP_wrapper/8BP.h:609: void _8BP_setupsp_3(int sp,int param, int value)  
;	---------------------------------
; Function _8BP_setupsp_3
; ---------------------------------
__8BP_setupsp_3::
;8BP_wrapper/8BP.h:611: _8BP_setupsp_inv3(value,param, sp);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_setupsp_inv3
	pop	af
	pop	af
	pop	af
;8BP_wrapper/8BP.h:612: }
	ret
;8BP_wrapper/8BP.h:614: void _8BP_setupsp_4(int sp,int param, int value1,int value2) 
;	---------------------------------
; Function _8BP_setupsp_4
; ---------------------------------
__8BP_setupsp_4::
;8BP_wrapper/8BP.h:616: _8BP_setupsp_inv4(value2,value1,param, sp);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_setupsp_inv4
	pop	af
	pop	af
	pop	af
	pop	af
;8BP_wrapper/8BP.h:617: }
	ret
;8BP_wrapper/8BP.h:620: void _8BP_stars_inv5(int dx, int dy, int color, int num_stars,int star_ini)
;	---------------------------------
; Function _8BP_stars_inv5
; ---------------------------------
__8BP_stars_inv5::
;8BP_wrapper/8BP.h:631: __endasm;	
	ld	a, #5
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	STARS
;8BP_wrapper/8BP.h:632: }
	ret
;8BP_wrapper/8BP.h:634: void _8BP_stars_5(int star_ini, int num_stars,int color, int dy, int dx)  
;	---------------------------------
; Function _8BP_stars_5
; ---------------------------------
__8BP_stars_5::
;8BP_wrapper/8BP.h:636: _8BP_stars_inv5(dx, dy, color, num_stars,star_ini);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_stars_inv5
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;8BP_wrapper/8BP.h:637: }	
	ret
;8BP_wrapper/8BP.h:639: void _8BP_stars() 
;	---------------------------------
; Function _8BP_stars
; ---------------------------------
__8BP_stars::
;8BP_wrapper/8BP.h:644: __endasm;	
	ld	a, #0
	CALL	STARS
;8BP_wrapper/8BP.h:646: }
	ret
;8BP_wrapper/8BP.h:648: void _8BP_layout_inv3(char* descriptor, int x,int y)
;	---------------------------------
; Function _8BP_layout_inv3
; ---------------------------------
__8BP_layout_inv3::
;8BP_wrapper/8BP.h:655: __endasm;
	ld	a,#3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	LAYOUT
;8BP_wrapper/8BP.h:657: }
	ret
;8BP_wrapper/8BP.h:659: void _8BP_layout_3(int y, int x, char* cad)
;	---------------------------------
; Function _8BP_layout_3
; ---------------------------------
__8BP_layout_3::
	push	af
	dec	sp
;8BP_wrapper/8BP.h:662: char descriptor[3]={0,0,0};
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	xor	a, a
	ld	(de), a
	ld	c, e
	ld	b, d
	inc	bc
	xor	a, a
	ld	(bc), a
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl), #0x00
;8BP_wrapper/8BP.h:663: char len=strlen(cad);
	push	bc
	ld	hl, #11
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_strlen
	pop	af
	pop	bc
	ld	a, l
;8BP_wrapper/8BP.h:664: descriptor[0]=len;
	ld	(de), a
;8BP_wrapper/8BP.h:666: p=descriptor+1;
	ld	l, c
	ld	h, b
;8BP_wrapper/8BP.h:667: *p=cad;  
	ld	iy, #9
	add	iy, sp
	ld	c, 0 (iy)
	ld	a, 1 (iy)
	ld	(hl), c
	inc	hl
	ld	(hl), a
;8BP_wrapper/8BP.h:669: _8BP_layout_inv3(descriptor, x,  y );
	ld	iy, #5
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	push	de
	call	__8BP_layout_inv3
	pop	af
	pop	af
	pop	af
;8BP_wrapper/8BP.h:671: }
	pop	af
	inc	sp
	ret
;8BP_wrapper/8BP.h:673: void _8BP_map2sp_inv2(int x, int y)
;	---------------------------------
; Function _8BP_map2sp_inv2
; ---------------------------------
__8BP_map2sp_inv2::
;8BP_wrapper/8BP.h:680: __endasm;	
	ld	a,#2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MAP2SP
;8BP_wrapper/8BP.h:681: }
	ret
;8BP_wrapper/8BP.h:682: void _8BP_map2sp_2(int y, int x)
;	---------------------------------
; Function _8BP_map2sp_2
; ---------------------------------
__8BP_map2sp_2::
;8BP_wrapper/8BP.h:685: _8BP_map2sp_inv2(x,y);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_map2sp_inv2
	pop	af
	pop	af
;8BP_wrapper/8BP.h:686: }
	ret
;8BP_wrapper/8BP.h:688: void _8BP_map2sp_1(unsigned char status)
;	---------------------------------
; Function _8BP_map2sp_1
; ---------------------------------
__8BP_map2sp_1::
;8BP_wrapper/8BP.h:695: __endasm;	
	ld	a,#1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MAP2SP
;8BP_wrapper/8BP.h:697: }
	ret
;8BP_wrapper/8BP.h:699: void _8BP_mover_inv3(int dx,int dy,int sp)
;	---------------------------------
; Function _8BP_mover_inv3
; ---------------------------------
__8BP_mover_inv3::
;8BP_wrapper/8BP.h:706: __endasm;	
	ld	a,#3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MOVER
;8BP_wrapper/8BP.h:708: }
	ret
;8BP_wrapper/8BP.h:709: void _8BP_mover_3(int sp, int dy,int dx)
;	---------------------------------
; Function _8BP_mover_3
; ---------------------------------
__8BP_mover_3::
;8BP_wrapper/8BP.h:711: _8BP_mover_inv3(dx,dy,sp);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_mover_inv3
	pop	af
	pop	af
	pop	af
;8BP_wrapper/8BP.h:712: }
	ret
;8BP_wrapper/8BP.h:713: void _8BP_mover_1(int sp)
;	---------------------------------
; Function _8BP_mover_1
; ---------------------------------
__8BP_mover_1::
;8BP_wrapper/8BP.h:720: __endasm;	
	ld	a,#1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MOVER
;8BP_wrapper/8BP.h:723: }
	ret
;8BP_wrapper/8BP.h:724: void _8BP_moverall_inv2(int dx, int dy)
;	---------------------------------
; Function _8BP_moverall_inv2
; ---------------------------------
__8BP_moverall_inv2::
;8BP_wrapper/8BP.h:731: __endasm;	
	ld	a,#2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MOVERALL
;8BP_wrapper/8BP.h:733: }
	ret
;8BP_wrapper/8BP.h:734: void _8BP_moverall_2(int dy, int dx)
;	---------------------------------
; Function _8BP_moverall_2
; ---------------------------------
__8BP_moverall_2::
;8BP_wrapper/8BP.h:736: _8BP_moverall_2(dx,dy);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_moverall_2
	pop	af
	pop	af
;8BP_wrapper/8BP.h:737: }
	ret
;8BP_wrapper/8BP.h:739: void _8BP_moverall()
;	---------------------------------
; Function _8BP_moverall
; ---------------------------------
__8BP_moverall::
;8BP_wrapper/8BP.h:744: __endasm;	
	ld	a,#0
	CALL	MOVERALL
;8BP_wrapper/8BP.h:746: }
	ret
;8BP_wrapper/8BP.h:748: void _8BP_peek_2(int address, int* dato)
;	---------------------------------
; Function _8BP_peek_2
; ---------------------------------
__8BP_peek_2::
;8BP_wrapper/8BP.h:751: p=(int *)address;	
	pop	bc
	pop	hl
	push	hl
	push	bc
;8BP_wrapper/8BP.h:752: *dato=*p; //mas facil imposible
	ld	iy, #4
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;8BP_wrapper/8BP.h:753: }
	ret
;8BP_wrapper/8BP.h:755: void _8BP_poke_2(int address,int dato)
;	---------------------------------
; Function _8BP_poke_2
; ---------------------------------
__8BP_poke_2::
;8BP_wrapper/8BP.h:758: p=(int *)address;
	pop	de
	pop	bc
	push	bc
	push	de
;8BP_wrapper/8BP.h:759: *p=dato; //mas facil imposible
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	(bc), a
	inc	bc
	ld	a, 1 (iy)
	ld	(bc), a
;8BP_wrapper/8BP.h:760: }
	ret
;8BP_wrapper/8BP.h:763: void _8BP_rink_1(int step)
;	---------------------------------
; Function _8BP_rink_1
; ---------------------------------
__8BP_rink_1::
;8BP_wrapper/8BP.h:770: __endasm;	
	ld	a,#1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	RINK
;8BP_wrapper/8BP.h:771: }
	ret
;8BP_wrapper/8BP.h:775: void _8BP_rink_N(int num_params,int* ink_list)
;	---------------------------------
; Function _8BP_rink_N
; ---------------------------------
__8BP_rink_N::
	push	af
;8BP_wrapper/8BP.h:781: _8BP_rink_N_color1=num_params;
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	(__8BP_rink_N_color1+0), a
;8BP_wrapper/8BP.h:784: for (i=0;i<num_params;i++)
	ld	bc, #0x0000
00103$:
	ld	hl, #4
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00118$
	xor	a, #0x80
00118$:
	jp	P, 00101$
;8BP_wrapper/8BP.h:785: _8BP_rink_N_inverse_list[i]=ink_list[num_params-i-1];
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	de, #__8BP_rink_N_inverse_list
	add	hl, de
	ex	(sp), hl
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, c
	ld	e, a
	ld	a, 1 (iy)
	sbc	a, b
	ld	d, a
	dec	de
	sla	e
	rl	d
	ld	a, e
	ld	hl, #6
	add	hl, sp
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
;8BP_wrapper/8BP.h:784: for (i=0;i<num_params;i++)
	inc	bc
	jr	00103$
00101$:
;8BP_wrapper/8BP.h:794: __endasm;	
	ld	hl, #__8BP_rink_N_color1;
	ld	a,(hl)
	ld	ix, #__8BP_rink_N_inverse_list;
	CALL	RINK
;8BP_wrapper/8BP.h:795: }
	pop	af
	ret
;8BP_wrapper/8BP.h:797: void _8BP_umap_inv6(int x_fin,int x_ini, int y_fin, int y_ini, int map_fin, int map_ini)
;	---------------------------------
; Function _8BP_umap_inv6
; ---------------------------------
__8BP_umap_inv6::
;8BP_wrapper/8BP.h:804: __endasm;	
	ld	a,#6
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	UMAP
;8BP_wrapper/8BP.h:807: }
	ret
;8BP_wrapper/8BP.h:809: void _8BP_umap_6(int map_ini, int map_fin, int y_ini, int y_fin, int x_ini, int x_fin)
;	---------------------------------
; Function _8BP_umap_6
; ---------------------------------
__8BP_umap_6::
;8BP_wrapper/8BP.h:811: _8BP_umap_inv6(x_fin,x_ini,y_fin,y_ini, map_fin, map_ini);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_umap_inv6
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
;8BP_wrapper/8BP.h:813: }
	ret
;mini_BASIC/minibasic.h:55: unsigned int _basic_time()
;	---------------------------------
; Function _basic_time
; ---------------------------------
__basic_time::
;mini_BASIC/minibasic.h:60: __endasm;
	call	0xbd0d
	ret
;mini_BASIC/minibasic.h:62: return 0;
	ld	hl, #0x0000
;mini_BASIC/minibasic.h:64: }
	ret
;mini_BASIC/minibasic.h:67: unsigned int _basic_rnd(int max)
;	---------------------------------
; Function _basic_rnd
; ---------------------------------
__basic_rnd::
;mini_BASIC/minibasic.h:80: __endasm;
	call	0xbd0d
	ld	b,h
	ld	c, l
	ld	hl,#__basic_rnd_x; con el # es direccion, el _ es imprescindible en cualquier caso
	ld	(hl),c
	inc	hl
	ld	(hl),b
;mini_BASIC/minibasic.h:82: return _basic_rnd_x % max;	
	pop	de
	pop	bc
	push	bc
	push	de
	push	bc
	ld	hl, (__basic_rnd_x)
	push	hl
	call	__moduint
	pop	af
	pop	af
;mini_BASIC/minibasic.h:86: }
	ret
;mini_BASIC/minibasic.h:88: void _basic_border(char color) 
;	---------------------------------
; Function _basic_border
; ---------------------------------
__basic_border::
;mini_BASIC/minibasic.h:101: __endasm;	
;	recoge primer parametro
;------------------------
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a,(ix)
	ld	b, a
	ld	c, a
	call	0xbc38
;mini_BASIC/minibasic.h:102: }
	ret
;mini_BASIC/minibasic.h:106: void DisplayChar( char c )
;	---------------------------------
; Function DisplayChar
; ---------------------------------
_DisplayChar::
;mini_BASIC/minibasic.h:118: __endasm;
	ld	hl,#2; recoge primer parametro
	add	hl,sp
	ld	a,(hl)
	call	0xbb5a
;mini_BASIC/minibasic.h:119: }
	ret
;mini_BASIC/minibasic.h:122: void _basic_print(char *cad)
;	---------------------------------
; Function _basic_print
; ---------------------------------
__basic_print::
;mini_BASIC/minibasic.h:125: textPtr=cad;
	pop	de
	pop	bc
	push	bc
	push	de
;mini_BASIC/minibasic.h:127: while( *textPtr != 0 )
00101$:
	ld	a, (bc)
	or	a, a
	ret	Z
;mini_BASIC/minibasic.h:129: DisplayChar( *textPtr);
	push	bc
	push	af
	inc	sp
	call	_DisplayChar
	inc	sp
	pop	bc
;mini_BASIC/minibasic.h:130: textPtr++;
	inc	bc
;mini_BASIC/minibasic.h:132: } 
	jr	00101$
;mini_BASIC/minibasic.h:134: char _basic_inkey(char key) __naked 
;	---------------------------------
; Function _basic_inkey
; ---------------------------------
__basic_inkey::
;mini_BASIC/minibasic.h:153: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	CALL	0xBB1E
	jr	nz, pressed
	ld	l,#1
	ret
	  pressed:
	ld	l,#0
	ret
;mini_BASIC/minibasic.h:155: return 0;
	ld	l, #0x00
;mini_BASIC/minibasic.h:158: }
;mini_BASIC/minibasic.h:166: char* reverse(char *buffer, int i, int j)
;	---------------------------------
; Function reverse
; ---------------------------------
_reverse::
	push	af
	push	af
	dec	sp
;mini_BASIC/minibasic.h:168: while (i < j)
	ld	iy, #11
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	dec	iy
	dec	iy
	ld	a, 0 (iy)
	ld	iy, #3
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #9+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #3
	add	iy, sp
	ld	1 (iy), a
00101$:
	ld	iy, #3
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, c
	ld	a, 1 (iy)
	sbc	a, b
	jp	PO, 00118$
	xor	a, #0x80
00118$:
	jp	P, 00103$
;mini_BASIC/minibasic.h:169: swap(&buffer[i++], &buffer[j--]);
	ld	iy, #7
	add	iy, sp
	ld	a, 0 (iy)
	add	a, c
	ld	e, a
	ld	a, 1 (iy)
	adc	a, b
	ld	d, a
	dec	bc
	inc	sp
	inc	sp
	push	de
	ld	hl, #3
	add	hl, sp
	ld	a, 0 (iy)
	add	a, (hl)
	ld	e, a
	ld	a, 1 (iy)
	inc	hl
	adc	a, (hl)
	ld	d, a
	ld	iy, #3
	add	iy, sp
	inc	0 (iy)
	jr	NZ,00119$
	inc	1 (iy)
00119$:
;mini_BASIC/minibasic.h:162: char t = *x; *x = *y; *y = t;
	ld	a, (de)
	dec	iy
	ld	0 (iy), a
	pop	hl
	push	hl
	ld	a, (hl)
	ld	(de), a
	pop	hl
	push	hl
	ld	a, 0 (iy)
	ld	(hl), a
;mini_BASIC/minibasic.h:169: swap(&buffer[i++], &buffer[j--]);
	jr	00101$
00103$:
;mini_BASIC/minibasic.h:171: return buffer;
	ld	hl, #7
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
;mini_BASIC/minibasic.h:172: }
	pop	af
	pop	af
	inc	sp
	ret
;mini_BASIC/minibasic.h:174: char* _basic_str(int value) 
;	---------------------------------
; Function _basic_str
; ---------------------------------
__basic_str::
	push	af
	push	af
;mini_BASIC/minibasic.h:179: int n = abs(value);
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_abs
	pop	af
	ld	c, l
	ld	b, h
;mini_BASIC/minibasic.h:182: while (n)
	ld	de, #0x0000
00101$:
;mini_BASIC/minibasic.h:186: buffer[i++] = 48 + r ;
	ld	hl, #0x0001
	add	hl, de
	ex	(sp), hl
	ld	hl, #__basic_str_buffer_65536_273
	add	hl, de
;mini_BASIC/minibasic.h:182: while (n)
	ld	a, b
	or	a, c
	jr	Z,00114$
;mini_BASIC/minibasic.h:184: int r = n % 10;
	push	hl
	push	bc
	ld	de, #0x000a
	push	de
	push	bc
	call	__modsint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	pop	hl
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), e
	ld	1 (iy), d
;mini_BASIC/minibasic.h:186: buffer[i++] = 48 + r ;
	pop	de
	push	de
	ld	a, 0 (iy)
	add	a, #0x30
	ld	(hl), a
;mini_BASIC/minibasic.h:188: n = n / 10;
	push	de
	ld	hl, #0x000a
	push	hl
	push	bc
	call	__divsint
	pop	af
	pop	af
	pop	de
	ld	c, l
	ld	b, h
	jr	00101$
00114$:
	ld	c, e
;mini_BASIC/minibasic.h:192: if (i == 0)
	ld	a,d
	ld	b,a
	or	a, e
	jr	NZ,00105$
;mini_BASIC/minibasic.h:193: buffer[i++] = '0';
	pop	bc
	push	bc
	ld	(hl), #0x30
00105$:
;mini_BASIC/minibasic.h:197: if (value < 0 )
	ld	hl, #6+1
	add	hl, sp
	bit	7, (hl)
	jr	Z,00107$
;mini_BASIC/minibasic.h:198: buffer[i++] = '-';
	ld	e, c
	ld	d, b
	inc	bc
	ld	hl, #__basic_str_buffer_65536_273
	add	hl, de
	ld	(hl), #0x2d
00107$:
;mini_BASIC/minibasic.h:200: buffer[i] = 0; // null terminate string
	ld	hl, #__basic_str_buffer_65536_273
	add	hl, bc
	ld	(hl), #0x00
;mini_BASIC/minibasic.h:203: return reverse(buffer, 0, i - 1);
	dec	bc
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	hl, #__basic_str_buffer_65536_273
	push	hl
	call	_reverse
	pop	af
	pop	af
	pop	af
;mini_BASIC/minibasic.h:204: }
	pop	af
	pop	af
	ret
;mini_BASIC/minibasic.h:206: void _basic_call (unsigned int address) 
;	---------------------------------
; Function _basic_call
; ---------------------------------
__basic_call::
;mini_BASIC/minibasic.h:216: __endasm;	
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	l, (ix)
	ld	h, 1(ix)
	ld	(dir+1),hl
	  dir:
	CALL 0xbd19 ; la direccion 0xbd19 se machaca con la que venga
;mini_BASIC/minibasic.h:218: }
	ret
;mini_BASIC/minibasic.h:220: void _basic_locate (unsigned int x, unsigned int y) 
;	---------------------------------
; Function _basic_locate
; ---------------------------------
__basic_locate::
;mini_BASIC/minibasic.h:228: __endasm;	
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	l, 2(ix)
	ld	h, (ix)
	call	0xbb75
;mini_BASIC/minibasic.h:230: }
	ret
;mini_BASIC/minibasic.h:252: void _basic_sound(unsigned char nChannelStatus, int nTonePeriod, int nDuration, unsigned char nVolume, char nVolumeEnvelope, char nToneEnvelope, unsigned char nNoisePeriod) 
;	---------------------------------
; Function _basic_sound
; ---------------------------------
__basic_sound::
;mini_BASIC/minibasic.h:331: __endasm;
	ld	ix,#2;
	add	ix,sp;
	LD	HL, #0xd7de
	LD	A, (IX) ;nChannelStatus
	LD	(HL), A
	INC	HL
	LD	A,6 (IX) ;nVolumeEnvelope
	LD	(HL), A
	INC	HL
	LD	A, 7 (IX) ;nToneEnvelope
	LD	(HL), A
	INC	HL
	LD	A, 1 (IX) ;nTonePeriod
	LD	(HL), A
	INC	HL
	LD	A, 2 (IX) ;nTonePeriod
	LD	(HL), A
	INC	HL
	LD	A, 8 (IX) ;nNoisePeriod
	LD	(HL), A
	INC	HL
	LD	A, 5 (IX) ;nVolume
	LD	(HL), A
	INC	HL
	LD	A, 3 (IX) ;nDuration
	LD	(HL), A
	INC	HL
	LD	A, 4 (IX) ;nDuration
	LD	(HL), A
	INC	HL
	LD	HL, #0xd7de
	CALL	#0xBCAA ;SOUND QUEUE
;mini_BASIC/minibasic.h:334: }
	ret
;mini_BASIC/minibasic.h:336: void _basic_ink (char ink1, char ink2)
;	---------------------------------
; Function _basic_ink
; ---------------------------------
__basic_ink::
;mini_BASIC/minibasic.h:348: __endasm;	
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	ld	b, 2(ix)
	ld	c,b
	call	0xbc32
;mini_BASIC/minibasic.h:349: }
	ret
;mini_BASIC/minibasic.h:351: char _basic_peek(unsigned int address)
;	---------------------------------
; Function _basic_peek
; ---------------------------------
__basic_peek::
;mini_BASIC/minibasic.h:362: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	l, (ix)
	ld	h,1(ix)
	ld	a,(hl)
	ld	l,a
	ret
;mini_BASIC/minibasic.h:364: return 0;
	ld	l, #0x00
;mini_BASIC/minibasic.h:366: }
	ret
;mini_BASIC/minibasic.h:368: void _basic_poke(unsigned int address, unsigned char data)
;	---------------------------------
; Function _basic_poke
; ---------------------------------
__basic_poke::
;mini_BASIC/minibasic.h:382: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	l, (ix)
	ld	h,1(ix)
	ld	a,2(ix)
	ld	(hl),a
	ret
;mini_BASIC/minibasic.h:383: }
	ret
;mini_BASIC/minibasic.h:385: void _basic_pen_txt(char ink)
;	---------------------------------
; Function _basic_pen_txt
; ---------------------------------
__basic_pen_txt::
;mini_BASIC/minibasic.h:393: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	call	0xbb90
;mini_BASIC/minibasic.h:396: }
	ret
;mini_BASIC/minibasic.h:397: void _basic_pen_graph(char ink)
;	---------------------------------
; Function _basic_pen_graph
; ---------------------------------
__basic_pen_graph::
;mini_BASIC/minibasic.h:404: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	call	0xbbde
;mini_BASIC/minibasic.h:406: }
	ret
;mini_BASIC/minibasic.h:412: void _basic_paper(char ink)
;	---------------------------------
; Function _basic_paper
; ---------------------------------
__basic_paper::
;mini_BASIC/minibasic.h:419: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	call	0xbb96
;mini_BASIC/minibasic.h:421: }
	ret
;mini_BASIC/minibasic.h:423: void _basic_plot(int x, int y){
;	---------------------------------
; Function _basic_plot
; ---------------------------------
__basic_plot::
;mini_BASIC/minibasic.h:436: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	e,(ix)
	ld	d, 1(ix)
	ld	l, 2(ix)
	ld	h, 3(ix)
	call	0xBBEA ; GRA PLOT ABSOLUTE
	ret
;mini_BASIC/minibasic.h:437: }
	ret
;mini_BASIC/minibasic.h:439: void _basic_move(int x, int y){
;	---------------------------------
; Function _basic_move
; ---------------------------------
__basic_move::
;mini_BASIC/minibasic.h:452: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	e,(ix)
	ld	d, 1(ix)
	ld	l, 2(ix)
	ld	h, 3(ix)
	call	0xBBC0 ; GRA MOVE ABSOLUTE
	ret
;mini_BASIC/minibasic.h:453: }
	ret
;mini_BASIC/minibasic.h:455: void _basic_draw(int x, int y)
;	---------------------------------
; Function _basic_draw
; ---------------------------------
__basic_draw::
;mini_BASIC/minibasic.h:470: __endasm;	
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	e,(ix)
	ld	d, 1(ix)
	ld	l, 2(ix)
	ld	h, 3(ix)
	call	0xBBF6 ; GRA LlNE ABSOLUTE
	ret
;mini_BASIC/minibasic.h:472: }
	ret
;ciclo.c:30: int  main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
;ciclo.c:34: unsigned int last_tiempo=0;	
	xor	a, a
	ld	iy, #10
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), a
;ciclo.c:39: c=0;
	ld	hl, #0x0000
	ld	(_c), hl
;ciclo.c:40: last=0;
;ciclo.c:41: sp=0;
	ld	l,#0x00
	ld	(_last),hl
	ld	(_sp), hl
;ciclo.c:42: x=40;
	ld	l, #0x28
	ld	(_x), hl
;ciclo.c:43: y=100;	
	ld	l, #0x64
	ld	(_y), hl
;ciclo.c:44: e=11;
	ld	l, #0x0b
	ld	(_e), hl
;ciclo.c:45: ex=0;
	ld	l, #0x00
	ld	(_ex), hl
;ciclo.c:46: cor=32;
;ciclo.c:47: cod=32;
	ld	l,#0x20
	ld	(_cor),hl
	ld	(_cod), hl
;ciclo.c:48: rescol=0;
;ciclo.c:49: puntos=0;
	ld	l,#0x00
	ld	(_rescol),hl
	ld	(_puntos), hl
;ciclo.c:52: int tintas[5]={1,2,2,3,3};
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	l, e
	ld	h, d
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl), #0x02
	inc	hl
	ld	(hl), #0x00
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x02
	inc	hl
	ld	(hl), #0x00
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x03
	inc	hl
	ld	(hl), #0x00
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x03
	inc	hl
	ld	(hl), #0x00
;ciclo.c:56: _8BP_colspall_2(&cor,&cod);
	ld	hl, #_cod
	push	hl
	ld	hl, #_cor
	push	hl
	call	__8BP_colspall_2
	pop	af
;ciclo.c:59: _8BP_map2sp_1(1);
	ld	h,#0x01
	ex	(sp),hl
	inc	sp
	call	__8BP_map2sp_1
	inc	sp
;ciclo.c:61: _8BP_umap_6(41700,41760,0,1000,0,1000);
	ld	hl, #0x03e8
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x03e8
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xa320
	push	hl
	ld	hl, #0xa2e4
	push	hl
	call	__8BP_umap_6
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
;ciclo.c:62: CICLO:
00101$:
;ciclo.c:67: c=c+1;
	ld	hl, (_c)
	inc	hl
	ld	(_c), hl
;ciclo.c:69: if (_basic_inkey(27)>0) goto label_140;
	ld	a, #0x1b
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jr	NZ,00104$
;ciclo.c:70: x=x+1; goto label_160;
	ld	hl, (_x)
	inc	hl
	ld	(_x), hl
	jr	00107$
;ciclo.c:72: label_140:
00104$:
;ciclo.c:74: if (_basic_inkey(34)>0) goto label_160;
	ld	a, #0x22
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jr	NZ,00107$
;ciclo.c:75: x=x-1;
	ld	hl, (_x)
	dec	hl
	ld	(_x), hl
;ciclo.c:77: label_160:
00107$:
;ciclo.c:79: if (_basic_inkey(67)>0) goto label_180;
	ld	a, #0x43
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jr	NZ,00110$
;ciclo.c:80: y=y-2;goto label_200;
	ld	hl, (_y)
	dec	hl
	dec	hl
	ld	(_y), hl
	jr	00113$
;ciclo.c:82: label_180:
00110$:
;ciclo.c:84: if (_basic_inkey(69)>0) goto label_200;
	ld	a, #0x45
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jr	NZ,00113$
;ciclo.c:85: y=y+2;
	ld	hl, (_y)
	inc	hl
	inc	hl
	ld	(_y), hl
;ciclo.c:87: label_200:
00113$:
;ciclo.c:89: if (c-last<8) goto label_270;
	ld	hl, (_c)
	ld	bc, (_last)
	cp	a, a
	sbc	hl, bc
	ld	a, l
	sub	a, #0x08
	ld	a, h
	sbc	a, #0x00
	jp	C, 00118$
;ciclo.c:90: if (_basic_inkey(47)>0) goto label_270;
	ld	a, #0x2f
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jp	NZ, 00118$
;ciclo.c:92: sp=23+ sp % 8; last=c;
	ld	a,(#_sp + 0)
	and	a, #0x07
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0017
	add	hl, bc
	ld	(_sp), hl
	ld	hl, (_c)
	ld	(_last), hl
;ciclo.c:93: _8BP_setupsp_3(sp,9,48);//disparo
	ld	hl, #0x0030
	push	hl
	ld	l, #0x09
	push	hl
	ld	hl, (_sp)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:94: _8BP_setupsp_3(sp,0,1+8+32);
	ld	hl, #0x0029
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, (_sp)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:95: _8BP_locatesp_3(sp,y-4,x);
	ld	iy, #_y
	ld	a, 0 (iy)
	add	a, #0xfc
	ld	e, a
	ld	a, 1 (iy)
	adc	a, #0xff
	ld	d, a
	ld	hl,#_sp + 0
	ld	b, (hl)
	ld	hl, (_x)
	push	hl
	push	de
	push	bc
	inc	sp
	call	__8BP_locatesp_3
	pop	af
;ciclo.c:96: _8BP_setupsp_4(sp,5,-5,0);
	inc	sp
	ld	hl,#0x0000
	ex	(sp),hl
	ld	hl, #0xfffb
	push	hl
	ld	hl, #0x0005
	push	hl
	ld	hl, (_sp)
	push	hl
	call	__8BP_setupsp_4
	pop	af
	pop	af
	pop	af
	pop	af
;ciclo.c:97: _basic_sound(1,10,10,7,0,1,0);
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	xor	a, a
	ld	d,a
	ld	e,#0x07
	push	de
	ld	hl, #0x000a
	push	hl
	ld	l, #0x0a
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	call	__basic_sound
	ld	hl, #9
	add	hl, sp
	ld	sp, hl
;ciclo.c:99: label_270:
00118$:
;ciclo.c:101: _8BP_locatesp_3(31,y,x);
	ld	hl, (_x)
	push	hl
	ld	hl, (_y)
	push	hl
	ld	a, #0x1f
	push	af
	inc	sp
	call	__8BP_locatesp_3
	pop	af
;ciclo.c:102: _8BP_autoall_1(1);
	inc	sp
	ld	hl,#0x0001
	ex	(sp),hl
	call	__8BP_autoall_1
	pop	af
;ciclo.c:103: _8BP_map2sp_2((c <<1)%300,0);
	ld	hl, (_c)
	add	hl, hl
	ld	bc, #0x012c
	push	bc
	push	hl
	call	__moduint
	pop	af
	pop	af
	ld	bc, #0x0000
	push	bc
	push	hl
	call	__8BP_map2sp_2
	pop	af
	pop	af
;ciclo.c:104: _8BP_printspall();
	call	__8BP_printspall
;ciclo.c:105: _8BP_colspall();
	call	__8BP_colspall
;ciclo.c:110: if ((c & 63)>0) goto label_450;
	ld	a,(#_c + 0)
	and	a, #0x3f
	jp	NZ,00124$
;ciclo.c:113: tiempo=_basic_time();// & 32767;
	call	__basic_time
	ld	c, l
	ld	b, h
;ciclo.c:114: fps=64*300/(tiempo-last_tiempo);
	ld	hl, #10
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	e, a
	ld	a, b
	inc	hl
	sbc	a, (hl)
	ld	d, a
	push	bc
	push	de
	ld	hl, #0x4b00
	push	hl
	call	__divuint
	pop	af
	pop	af
	pop	bc
;ciclo.c:115: _basic_locate(10,25);//_basic_print(_basic_str(fps));
	push	hl
	push	bc
	ld	de, #0x0019
	push	de
	ld	de, #0x000a
	push	de
	call	__basic_locate
	pop	af
	pop	af
	pop	bc
	pop	hl
;ciclo.c:116: _8BP_printat_4(0,0,60,_basic_str(fps) );
	push	bc
	push	hl
	call	__basic_str
	ex	(sp),hl
	ld	hl, #0x003c
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	call	__8BP_printat_4
	pop	af
	pop	af
	pop	af
	pop	af
	pop	bc
;ciclo.c:117: last_tiempo=tiempo;
	ld	iy, #10
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
;ciclo.c:119: ruta=9+_basic_rnd(2) ; 
	ld	hl, #0x0002
	push	hl
	call	__basic_rnd
	pop	af
	ld	bc,#0x0009
	add	hl,bc
	ld	(_ruta), hl
;ciclo.c:120: ex=10+_basic_rnd(50) ;
	ld	hl, #0x0032
	push	hl
	call	__basic_rnd
	pop	af
	ld	bc,#0x000a
	add	hl,bc
	ld	(_ex), hl
;ciclo.c:122: for (int i=1;i<5;i++)
	ld	bc, #0x0001
00133$:
	ld	a, c
	sub	a, #0x05
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00124$
;ciclo.c:124: e=e+1;if (e==22) e=10;
	ld	hl, (_e)
	inc	hl
	ld	(_e), hl
	ld	iy, #_e
	ld	a, 0 (iy)
	sub	a, #0x16
	or	a, 1 (iy)
	jr	NZ,00122$
	ld	hl, #0x000a
	ld	(_e), hl
00122$:
;ciclo.c:125: _8BP_setupsp_3(e,9,49);//ovni
	push	bc
	ld	hl, #0x0031
	push	hl
	ld	l, #0x09
	push	hl
	ld	hl, (_e)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ld	hl, #0x008b
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, (_e)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ld	hl, (_ruta)
	push	hl
	ld	hl, #0x000f
	push	hl
	ld	hl, (_e)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	pop	bc
;ciclo.c:128: _8BP_locatesp_3(e,-80,ex);
	ld	hl,#_e + 0
	ld	d, (hl)
	push	bc
	ld	hl, (_ex)
	push	hl
	ld	hl, #0xffb0
	push	hl
	push	de
	inc	sp
	call	__8BP_locatesp_3
	pop	af
	pop	af
	inc	sp
	pop	bc
;ciclo.c:129: _8BP_routesp_2(e,i*6);
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	push	bc
	push	hl
	ld	hl, (_e)
	push	hl
	call	__8BP_routesp_2
	pop	af
	pop	af
	pop	bc
;ciclo.c:122: for (int i=1;i<5;i++)
	inc	bc
	jp	00133$
;ciclo.c:133: label_450:
00124$:
;ciclo.c:135: _8BP_stars_5(0,10,4,2,0);
	ld	hl, #0x0000
	push	hl
	ld	l, #0x02
	push	hl
	ld	l, #0x04
	push	hl
	ld	l, #0x0a
	push	hl
	ld	l, #0x00
	push	hl
	call	__8BP_stars_5
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;ciclo.c:136: if (cor <32) rescol=rutina_colision();
	ld	iy, #_cor
	ld	a, 0 (iy)
	sub	a, #0x20
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00126$
	call	_rutina_colision
	ld	(_rescol), hl
00126$:
;ciclo.c:137: if (rescol==1) goto END;
	ld	iy, #_rescol
	ld	a, 0 (iy)
	dec	a
	or	a, 1 (iy)
	jr	Z,00131$
;ciclo.c:140: if (c==3000) return 0;
	ld	iy, #_c
	ld	a, 0 (iy)
	sub	a, #0xb8
	jp	NZ,00101$
	ld	a, 1 (iy)
	sub	a, #0x0b
	jp	NZ,00101$
	ld	hl, #0x0000
	jr	00135$
;ciclo.c:143: END:	
00131$:
;ciclo.c:145: return 0;	
	ld	hl, #0x0000
00135$:
;ciclo.c:146: }
	ld	iy, #12
	add	iy, sp
	ld	sp, iy
	ret
_CHAR_CR:
	.db #0x0d	; 13
	.db #0x00	; 0
;ciclo.c:152: int  rutina_colision()
;	---------------------------------
; Function rutina_colision
; ---------------------------------
_rutina_colision::
;ciclo.c:154: if (cor==31) return 1;
	ld	iy, #_cor
	ld	a, 0 (iy)
	sub	a, #0x1f
	or	a, 1 (iy)
	jr	NZ,00102$
	ld	hl, #0x0001
	ret
00102$:
;ciclo.c:156: _8BP_setupsp_3(cor,7,15);
	ld	hl, #0x000f
	push	hl
	ld	l, #0x07
	push	hl
	ld	hl, (_cor)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:159: _8BP_setupsp_3(cor,0,5);
	ld	hl, #0x0005
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, (_cor)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:161: if (cod<22){
	ld	iy, #_cod
	ld	a, 0 (iy)
	sub	a, #0x16
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00104$
;ciclo.c:162: _basic_border(7);	
	ld	a, #0x07
	push	af
	inc	sp
	call	__basic_border
	inc	sp
;ciclo.c:163: _basic_sound(1,2000,10,7,0,0,15);
	ld	a, #0x0f
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x07
	push	de
	ld	hl, #0x000a
	push	hl
	ld	hl, #0x07d0
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	call	__basic_sound
	ld	hl, #9
	add	hl, sp
	ld	sp, hl
;ciclo.c:164: _8BP_setupsp_3(cod,7,15);//animacion 
	ld	hl, #0x000f
	push	hl
	ld	l, #0x07
	push	hl
	ld	hl, (_cod)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:165: _8BP_setupsp_3(cod,0,5);
	ld	hl, #0x0005
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, (_cod)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
;ciclo.c:166: _basic_call(0xbd19);
	ld	hl, #0xbd19
	ex	(sp),hl
	call	__basic_call
	pop	af
;ciclo.c:167: _basic_border(0);	
	xor	a, a
	push	af
	inc	sp
	call	__basic_border
	inc	sp
;ciclo.c:168: puntos+=10;
	ld	hl, #_puntos
	ld	a, (hl)
	add	a, #0x0a
	ld	(hl), a
	jr	NC,00119$
	inc	hl
	inc	(hl)
00119$:
;ciclo.c:169: puntos_str= _basic_str(puntos);
	ld	hl, (_puntos)
	push	hl
	call	__basic_str
	pop	af
;ciclo.c:170: _8BP_printat_4(0,0,40, puntos_str);
	ld	(_puntos_str), hl
	push	hl
	ld	hl, #0x0028
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	call	__8BP_printat_4
	pop	af
	pop	af
	pop	af
	pop	af
00104$:
;ciclo.c:173: return 0;
	ld	hl, #0x0000
;ciclo.c:175: }
	ret
	.area _CODE
___str_2:
	.ascii "   "
	.db 0x00
	.area _INITIALIZER
__xinit___basic_rnd_x:
	.dw #0x0000
__xinit__c:
	.dw #0x0000
__xinit__last:
	.dw #0x0000
__xinit__sp:
	.dw #0x0000
__xinit__x:
	.dw #0x0028
__xinit__y:
	.dw #0x0064
__xinit__e:
	.dw #0x0010
__xinit__ex:
	.dw #0x0000
__xinit__cor:
	.dw #0x0020
__xinit__cod:
	.dw #0x0020
__xinit__rescol:
	.dw #0x0000
__xinit__puntos:
	.dw #0x0000
__xinit__puntos_str:
	.dw ___str_2
__xinit__ruta:
	.dw #0x0000
	.area _CABS (ABS)
