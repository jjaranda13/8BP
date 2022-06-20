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
	.globl _comandos_8BP_V41
	.globl _strlen
	.globl _abs
	.globl __basic_rnd_x
	.globl _res
	.globl _co
	.globl _precomp
	.globl _op
	.globl _newr
	.globl _yf
	.globl _xf
	.globl _id
	.globl _dfy
	.globl _dfx
	.globl _rf
	.globl _cad
	.globl _dato
	.globl _cfps
	.globl _fps
	.globl _d
	.globl _t2
	.globl _t1
	.globl _music_dir
	.globl _music
	.globl _flaghi_dir
	.globl _flaghi
	.globl _hi_dir
	.globl _hi
	.globl _target_dir
	.globl _target
	.globl _scr_dir
	.globl _scr
	.globl _col
	.globl _cor
	.globl _cod
	.globl _dir
	.globl _y2
	.globl _y
	.globl _x
	.globl _n
	.globl _c
	.globl __8BP_rink_N_inverse_list
	.globl __8BP_rink_N_color1
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
	.globl _logica_fantasma
	.globl _logica_fantasma_precomputed
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
_c::
	.ds 2
_n::
	.ds 2
_x::
	.ds 2
_y::
	.ds 2
_y2::
	.ds 2
_dir::
	.ds 2
_cod::
	.ds 2
_cor::
	.ds 2
_col::
	.ds 2
_scr::
	.ds 2
_scr_dir::
	.ds 2
_target::
	.ds 2
_target_dir::
	.ds 2
_hi::
	.ds 2
_hi_dir::
	.ds 2
_flaghi::
	.ds 2
_flaghi_dir::
	.ds 2
_music::
	.ds 2
_music_dir::
	.ds 2
_t1::
	.ds 2
_t2::
	.ds 2
_d::
	.ds 2
_fps::
	.ds 2
_cfps::
	.ds 2
_dato::
	.ds 1
_cad::
	.ds 2
_rf::
	.ds 4
_dfx::
	.ds 8
_dfy::
	.ds 8
_id::
	.ds 2
_xf::
	.ds 1
_yf::
	.ds 1
_newr::
	.ds 1
_op::
	.ds 1
_precomp::
	.ds 2
_co::
	.ds 2
_res::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
__basic_rnd_x::
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
;8BP_wrapper/8BP.h:103: void comandos_8BP_V41(){
;	---------------------------------
; Function comandos_8BP_V41
; ---------------------------------
_comandos_8BP_V41::
;8BP_wrapper/8BP.h:133: __endasm;
	_3D	== 0x6462;
	ANIMA	== 0x6fc8;
	ANIMALL	== 0x7714;
	AUTO	== 0x7180;
	AUTOALL	== 0x71ce;
	COLAY	== 0x71fd;
	COLSP	== 0x73a8;
	COLSPALL	== 0x75af;
	LAYOUT	== 0x705e;
	LOCATESP	== 0x6C6b;
	MAP2SP	== 0x649e;
	MOVER	== 0x753c;
	MOVERALL	== 0x76ee;
	MUSIC	== 0x6F54;
	PEEK	== 0x692d;
	POKE	== 0x6940;
	PRINTAT	== 0x6069;
	PRINTSP	== 0x6C8e;
	PRINTSPALL	== 0x62a6;
	RINK	== 0x762e;
	ROUTESP	== 0x65fc;
	ROUTEALL	== 0x65db;
	SETLIMITS	== 0x6875;
	SETUPSP	== 0x70fd;
	STARS	== 0x743a;
	UMAP	== 0x5f34;
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
;8BP_wrapper/8BP.h:251: *colision=0;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	l, c
	ld	h, b
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;8BP_wrapper/8BP.h:252: _8BP_colay_inv2(sp, colision);
	push	bc
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_inv2
	pop	af
	pop	af
;8BP_wrapper/8BP.h:253: }
	ret
;8BP_wrapper/8BP.h:256: void _8BP_colay_1(int sp)
;	---------------------------------
; Function _8BP_colay_1
; ---------------------------------
__8BP_colay_1::
;8BP_wrapper/8BP.h:263: __endasm;		
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLAY
;8BP_wrapper/8BP.h:265: }
	ret
;8BP_wrapper/8BP.h:268: void _8BP_colay_3(int umbral, int* colision, int sp)
;	---------------------------------
; Function _8BP_colay_3
; ---------------------------------
__8BP_colay_3::
;8BP_wrapper/8BP.h:270: *colision=0;
	ld	iy, #4
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	l, c
	ld	h, b
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;8BP_wrapper/8BP.h:271: _8BP_colay_inv3( sp,colision,umbral);
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	push	bc
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__8BP_colay_inv3
	pop	af
	pop	af
	pop	af
;8BP_wrapper/8BP.h:272: }
	ret
;8BP_wrapper/8BP.h:276: void _8BP_colsp_inv3( int b, int a,int operation)
;	---------------------------------
; Function _8BP_colsp_inv3
; ---------------------------------
__8BP_colsp_inv3::
;8BP_wrapper/8BP.h:285: __endasm;		
	ld	a, #3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSP
;8BP_wrapper/8BP.h:287: }
	ret
;8BP_wrapper/8BP.h:289: void _8BP_colsp_inv2(int* colision,int sp)
;	---------------------------------
; Function _8BP_colsp_inv2
; ---------------------------------
__8BP_colsp_inv2::
;8BP_wrapper/8BP.h:297: __endasm;		
	ld	a, #2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSP
;8BP_wrapper/8BP.h:299: }
	ret
;8BP_wrapper/8BP.h:301: void _8BP_colsp_3(int operation, int a, int b)  
;	---------------------------------
; Function _8BP_colsp_3
; ---------------------------------
__8BP_colsp_3::
;8BP_wrapper/8BP.h:303: _8BP_colsp_inv3(b,a,operation);
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
;8BP_wrapper/8BP.h:304: }
	ret
;8BP_wrapper/8BP.h:306: void _8BP_colsp_2(int sp, int* colision)  
;	---------------------------------
; Function _8BP_colsp_2
; ---------------------------------
__8BP_colsp_2::
;8BP_wrapper/8BP.h:308: *colision=32;
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	(hl), #0x20
	inc	hl
	ld	(hl), #0x00
;8BP_wrapper/8BP.h:309: _8BP_colsp_inv2(colision, sp);
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	push	bc
	call	__8BP_colsp_inv2
	pop	af
	pop	af
;8BP_wrapper/8BP.h:310: }
	ret
;8BP_wrapper/8BP.h:312: void _8BP_colsp_1(int sp)  
;	---------------------------------
; Function _8BP_colsp_1
; ---------------------------------
__8BP_colsp_1::
;8BP_wrapper/8BP.h:321: __endasm;		
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSP
;8BP_wrapper/8BP.h:322: }
	ret
;8BP_wrapper/8BP.h:324: void _8BP_colspall_inv2(int* collided,int* collider) 
;	---------------------------------
; Function _8BP_colspall_inv2
; ---------------------------------
__8BP_colspall_inv2::
;8BP_wrapper/8BP.h:332: __endasm;
	ld	a, #2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSPALL
;8BP_wrapper/8BP.h:333: }
	ret
;8BP_wrapper/8BP.h:335: void _8BP_colspall() 
;	---------------------------------
; Function _8BP_colspall
; ---------------------------------
__8BP_colspall::
;8BP_wrapper/8BP.h:340: __endasm;	
	ld	a, #0
	CALL	COLSPALL
;8BP_wrapper/8BP.h:341: }
	ret
;8BP_wrapper/8BP.h:343: void _8BP_colspall_1(int collider_ini) __critical
;	---------------------------------
; Function _8BP_colspall_1
; ---------------------------------
__8BP_colspall_1::
	ld	a,i
	di
	push	af
;8BP_wrapper/8BP.h:351: __endasm;	
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	COLSPALL
;8BP_wrapper/8BP.h:352: }
	pop	af
	ret	PO
	ei
	ret
;8BP_wrapper/8BP.h:354: void _8BP_colspall_2(int* collider, int* collided) 
;	---------------------------------
; Function _8BP_colspall_2
; ---------------------------------
__8BP_colspall_2::
;8BP_wrapper/8BP.h:356: *collider=32;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	l, c
	ld	h, b
	ld	(hl), #0x20
	inc	hl
	ld	(hl), #0x00
;8BP_wrapper/8BP.h:357: *collided=32;
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x20
	inc	hl
	ld	(hl), #0x00
	dec	hl
;8BP_wrapper/8BP.h:358: _8BP_colspall_inv2(collided,collider);
	push	bc
	push	hl
	call	__8BP_colspall_inv2
	pop	af
	pop	af
;8BP_wrapper/8BP.h:359: }
	ret
;8BP_wrapper/8BP.h:361: void _8BP_locatesp_inv3(int x, int y, char sp)
;	---------------------------------
; Function _8BP_locatesp_inv3
; ---------------------------------
__8BP_locatesp_inv3::
;8BP_wrapper/8BP.h:370: __endasm;	
	ld	a, #3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	LOCATESP
;8BP_wrapper/8BP.h:372: }
	ret
;8BP_wrapper/8BP.h:374: void _8BP_locatesp_3(char sp, int y, int x) 
;	---------------------------------
; Function _8BP_locatesp_3
; ---------------------------------
__8BP_locatesp_3::
;8BP_wrapper/8BP.h:376: _8BP_locatesp_inv3( x, y, sp);
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
;8BP_wrapper/8BP.h:377: }
	ret
;8BP_wrapper/8BP.h:380: void _8BP_music_inv4(int speed, int song, int flag_repetition, int flag_c) 
;	---------------------------------
; Function _8BP_music_inv4
; ---------------------------------
__8BP_music_inv4::
;8BP_wrapper/8BP.h:391: __endasm;		
	ld	a, #4
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MUSIC
;8BP_wrapper/8BP.h:392: }
	ret
;8BP_wrapper/8BP.h:394: void _8BP_music_4(int flag_c, int flag_repetition,int song, int speed)  
;	---------------------------------
; Function _8BP_music_4
; ---------------------------------
__8BP_music_4::
;8BP_wrapper/8BP.h:396: _8BP_music_inv4(speed, song, flag_repetition, flag_c);
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
;8BP_wrapper/8BP.h:398: }
	ret
;8BP_wrapper/8BP.h:400: void _8BP_music()
;	---------------------------------
; Function _8BP_music
; ---------------------------------
__8BP_music::
;8BP_wrapper/8BP.h:405: __endasm;		
	ld	a, #0
	CALL	MUSIC
;8BP_wrapper/8BP.h:406: }
	ret
;8BP_wrapper/8BP.h:408: void getDescriptor(char* desc,char *cad)
;	---------------------------------
; Function getDescriptor
; ---------------------------------
_getDescriptor::
;8BP_wrapper/8BP.h:412: char len=strlen(cad);
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_strlen
	pop	af
	ld	c, l
;8BP_wrapper/8BP.h:413: desc[0]=len;
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), c
;8BP_wrapper/8BP.h:415: p=desc+1;
	inc	hl
;8BP_wrapper/8BP.h:416: *p=cad;
	ld	iy, #4
	add	iy, sp
	ld	c, 0 (iy)
	ld	a, 1 (iy)
	ld	(hl), c
	inc	hl
	ld	(hl), a
;8BP_wrapper/8BP.h:419: }
	ret
;8BP_wrapper/8BP.h:421: void _8BP_printat_inv(char *descriptor , int x, int y,int flag) 
;	---------------------------------
; Function _8BP_printat_inv
; ---------------------------------
__8BP_printat_inv::
;8BP_wrapper/8BP.h:431: __endasm;			
	ld	a, #4
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTAT
;8BP_wrapper/8BP.h:433: }
	ret
;8BP_wrapper/8BP.h:435: void _8BP_printat_4(int flag,int y,int x, char* cad)  
;	---------------------------------
; Function _8BP_printat_4
; ---------------------------------
__8BP_printat_4::
	push	af
	dec	sp
;8BP_wrapper/8BP.h:438: char descriptor[3]={0,0,0};
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
;8BP_wrapper/8BP.h:439: char len=strlen(cad);
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
;8BP_wrapper/8BP.h:440: descriptor[0]=len;
	ld	(de), a
;8BP_wrapper/8BP.h:442: p=descriptor+1;
	ld	l, c
	ld	h, b
;8BP_wrapper/8BP.h:443: *p=cad;  
	ld	iy, #11
	add	iy, sp
	ld	c, 0 (iy)
	ld	a, 1 (iy)
	ld	(hl), c
	inc	hl
	ld	(hl), a
;8BP_wrapper/8BP.h:446: _8BP_printat_inv(descriptor, x, y, flag);   
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
;8BP_wrapper/8BP.h:448: } 
	pop	af
	inc	sp
	ret
;8BP_wrapper/8BP.h:450: void _8BP_printsp_inv3(int x,int y, int sp)  
;	---------------------------------
; Function _8BP_printsp_inv3
; ---------------------------------
__8BP_printsp_inv3::
;8BP_wrapper/8BP.h:460: __endasm;	
	ld	a, #3 ; se envian 3 parametros
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTSP
;8BP_wrapper/8BP.h:461: }
	ret
;8BP_wrapper/8BP.h:463: void _8BP_printsp_inv2(int bits, int sp) 
;	---------------------------------
; Function _8BP_printsp_inv2
; ---------------------------------
__8BP_printsp_inv2::
;8BP_wrapper/8BP.h:472: __endasm;	
	ld	a, #2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	call	PRINTSP ;
;8BP_wrapper/8BP.h:474: }
	ret
;8BP_wrapper/8BP.h:476: void _8BP_printsp_3(int sp, int y, int x)  
;	---------------------------------
; Function _8BP_printsp_3
; ---------------------------------
__8BP_printsp_3::
;8BP_wrapper/8BP.h:478: _8BP_printsp_inv3( x, y,  sp);
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
;8BP_wrapper/8BP.h:479: }
	ret
;8BP_wrapper/8BP.h:481: void _8BP_printsp_2(int sp,int bits_background)  
;	---------------------------------
; Function _8BP_printsp_2
; ---------------------------------
__8BP_printsp_2::
;8BP_wrapper/8BP.h:483: _8BP_printsp_inv2( bits_background,  sp);
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
;8BP_wrapper/8BP.h:484: }
	ret
;8BP_wrapper/8BP.h:486: void _8BP_printsp_1(int sp)  
;	---------------------------------
; Function _8BP_printsp_1
; ---------------------------------
__8BP_printsp_1::
;8BP_wrapper/8BP.h:494: __endasm;	
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTSP
;8BP_wrapper/8BP.h:497: }
	ret
;8BP_wrapper/8BP.h:499: void _8BP_printspall_inv4(int flag_sync,int flag_anima, int fin, int ini)
;	---------------------------------
; Function _8BP_printspall_inv4
; ---------------------------------
__8BP_printspall_inv4::
;8BP_wrapper/8BP.h:509: __endasm;	
	ld	a, #4
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTSPALL
;8BP_wrapper/8BP.h:510: }
	ret
;8BP_wrapper/8BP.h:512: void _8BP_printspall_4(int ini, int fin, int flag_anima, int flag_sync)  
;	---------------------------------
; Function _8BP_printspall_4
; ---------------------------------
__8BP_printspall_4::
;8BP_wrapper/8BP.h:514: _8BP_printspall_inv4(flag_sync, flag_anima, fin, ini);
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
;8BP_wrapper/8BP.h:515: }
	ret
;8BP_wrapper/8BP.h:517: void _8BP_printspall_1(int order_type)  
;	---------------------------------
; Function _8BP_printspall_1
; ---------------------------------
__8BP_printspall_1::
;8BP_wrapper/8BP.h:524: __endasm;	
	ld	a, #1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	PRINTSPALL
;8BP_wrapper/8BP.h:525: }
	ret
;8BP_wrapper/8BP.h:527: void _8BP_printspall() 
;	---------------------------------
; Function _8BP_printspall
; ---------------------------------
__8BP_printspall::
;8BP_wrapper/8BP.h:532: __endasm;	
	ld	a, #0
	CALL	PRINTSPALL
;8BP_wrapper/8BP.h:533: }
	ret
;8BP_wrapper/8BP.h:535: void _8BP_routeall()
;	---------------------------------
; Function _8BP_routeall
; ---------------------------------
__8BP_routeall::
;8BP_wrapper/8BP.h:540: __endasm;	
	ld	a, #0;
	CALL	ROUTEALL
;8BP_wrapper/8BP.h:542: }
	ret
;8BP_wrapper/8BP.h:545: void _8BP_routesp_inv2(int pasos, int sp) 
;	---------------------------------
; Function _8BP_routesp_inv2
; ---------------------------------
__8BP_routesp_inv2::
;8BP_wrapper/8BP.h:553: __endasm;	
	ld	a, #2 ;
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	ROUTESP
;8BP_wrapper/8BP.h:554: }
	ret
;8BP_wrapper/8BP.h:556: void _8BP_routesp_2(int sp, int pasos)  
;	---------------------------------
; Function _8BP_routesp_2
; ---------------------------------
__8BP_routesp_2::
;8BP_wrapper/8BP.h:558: _8BP_routesp_inv2(pasos,sp) ;
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
;8BP_wrapper/8BP.h:559: }
	ret
;8BP_wrapper/8BP.h:561: void _8BP_routesp_1(int sp)  
;	---------------------------------
; Function _8BP_routesp_1
; ---------------------------------
__8BP_routesp_1::
;8BP_wrapper/8BP.h:568: __endasm;	
	ld	a, #1 ;
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	ROUTESP
;8BP_wrapper/8BP.h:570: }
	ret
;8BP_wrapper/8BP.h:572: void _8BP_setlimits_inv4(int ymax, int ymin, int xmax,int xmin)
;	---------------------------------
; Function _8BP_setlimits_inv4
; ---------------------------------
__8BP_setlimits_inv4::
;8BP_wrapper/8BP.h:579: __endasm;	
	ld	a, #4 ;
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	SETLIMITS
;8BP_wrapper/8BP.h:582: }
	ret
;8BP_wrapper/8BP.h:584: void _8BP_setlimits_4(int xmin,int xmax, int ymin, int ymax)
;	---------------------------------
; Function _8BP_setlimits_4
; ---------------------------------
__8BP_setlimits_4::
;8BP_wrapper/8BP.h:586: _8BP_setlimits_inv4( ymax,  ymin,  xmax, xmin);
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
;8BP_wrapper/8BP.h:587: }
	ret
;8BP_wrapper/8BP.h:589: void _8BP_setupsp_inv3(int value,int param, int sp) 
;	---------------------------------
; Function _8BP_setupsp_inv3
; ---------------------------------
__8BP_setupsp_inv3::
;8BP_wrapper/8BP.h:598: __endasm;	
	ld	a, #3 ; se envian 3 parametros
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	SETUPSP
;8BP_wrapper/8BP.h:599: }
	ret
;8BP_wrapper/8BP.h:601: void _8BP_setupsp_inv4(int value2,int value1,int param, int sp) 
;	---------------------------------
; Function _8BP_setupsp_inv4
; ---------------------------------
__8BP_setupsp_inv4::
;8BP_wrapper/8BP.h:611: __endasm;	
	ld	a, #4 ;
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	SETUPSP
;8BP_wrapper/8BP.h:612: }
	ret
;8BP_wrapper/8BP.h:614: void _8BP_setupsp_3(int sp,int param, int value)  
;	---------------------------------
; Function _8BP_setupsp_3
; ---------------------------------
__8BP_setupsp_3::
;8BP_wrapper/8BP.h:616: _8BP_setupsp_inv3(value,param, sp);
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
;8BP_wrapper/8BP.h:617: }
	ret
;8BP_wrapper/8BP.h:619: void _8BP_setupsp_4(int sp,int param, int value1,int value2) 
;	---------------------------------
; Function _8BP_setupsp_4
; ---------------------------------
__8BP_setupsp_4::
;8BP_wrapper/8BP.h:621: _8BP_setupsp_inv4(value2,value1,param, sp);
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
;8BP_wrapper/8BP.h:622: }
	ret
;8BP_wrapper/8BP.h:625: void _8BP_stars_inv5(int dx, int dy, int color, int num_stars,int star_ini)
;	---------------------------------
; Function _8BP_stars_inv5
; ---------------------------------
__8BP_stars_inv5::
;8BP_wrapper/8BP.h:636: __endasm;	
	ld	a, #5
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	STARS
;8BP_wrapper/8BP.h:637: }
	ret
;8BP_wrapper/8BP.h:639: void _8BP_stars_5(int star_ini, int num_stars,int color, int dy, int dx)  
;	---------------------------------
; Function _8BP_stars_5
; ---------------------------------
__8BP_stars_5::
;8BP_wrapper/8BP.h:641: _8BP_stars_inv5(dx, dy, color, num_stars,star_ini);
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
;8BP_wrapper/8BP.h:642: }	
	ret
;8BP_wrapper/8BP.h:644: void _8BP_stars() 
;	---------------------------------
; Function _8BP_stars
; ---------------------------------
__8BP_stars::
;8BP_wrapper/8BP.h:649: __endasm;	
	ld	a, #0
	CALL	STARS
;8BP_wrapper/8BP.h:651: }
	ret
;8BP_wrapper/8BP.h:653: void _8BP_layout_inv3(char* descriptor, int x,int y)
;	---------------------------------
; Function _8BP_layout_inv3
; ---------------------------------
__8BP_layout_inv3::
;8BP_wrapper/8BP.h:660: __endasm;
	ld	a,#3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	LAYOUT
;8BP_wrapper/8BP.h:662: }
	ret
;8BP_wrapper/8BP.h:664: void _8BP_layout_3(int y, int x, char* cad)
;	---------------------------------
; Function _8BP_layout_3
; ---------------------------------
__8BP_layout_3::
	push	af
	dec	sp
;8BP_wrapper/8BP.h:667: char descriptor[3]={0,0,0};
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
;8BP_wrapper/8BP.h:668: char len=strlen(cad);
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
;8BP_wrapper/8BP.h:669: descriptor[0]=len;
	ld	(de), a
;8BP_wrapper/8BP.h:671: p=descriptor+1;
	ld	l, c
	ld	h, b
;8BP_wrapper/8BP.h:672: *p=cad;  
	ld	iy, #9
	add	iy, sp
	ld	c, 0 (iy)
	ld	a, 1 (iy)
	ld	(hl), c
	inc	hl
	ld	(hl), a
;8BP_wrapper/8BP.h:674: _8BP_layout_inv3(descriptor, x,  y );
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
;8BP_wrapper/8BP.h:676: }
	pop	af
	inc	sp
	ret
;8BP_wrapper/8BP.h:678: void _8BP_map2sp_inv2(int x, int y)
;	---------------------------------
; Function _8BP_map2sp_inv2
; ---------------------------------
__8BP_map2sp_inv2::
;8BP_wrapper/8BP.h:685: __endasm;	
	ld	a,#2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MAP2SP
;8BP_wrapper/8BP.h:686: }
	ret
;8BP_wrapper/8BP.h:687: void _8BP_map2sp_2(int y, int x)
;	---------------------------------
; Function _8BP_map2sp_2
; ---------------------------------
__8BP_map2sp_2::
;8BP_wrapper/8BP.h:690: _8BP_map2sp_inv2(x,y);
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
;8BP_wrapper/8BP.h:691: }
	ret
;8BP_wrapper/8BP.h:693: void _8BP_map2sp_1(unsigned char status)
;	---------------------------------
; Function _8BP_map2sp_1
; ---------------------------------
__8BP_map2sp_1::
;8BP_wrapper/8BP.h:700: __endasm;	
	ld	a,#1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MAP2SP
;8BP_wrapper/8BP.h:702: }
	ret
;8BP_wrapper/8BP.h:704: void _8BP_mover_inv3(int dx,int dy,int sp)
;	---------------------------------
; Function _8BP_mover_inv3
; ---------------------------------
__8BP_mover_inv3::
;8BP_wrapper/8BP.h:711: __endasm;	
	ld	a,#3
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MOVER
;8BP_wrapper/8BP.h:713: }
	ret
;8BP_wrapper/8BP.h:714: void _8BP_mover_3(int sp, int dy,int dx)
;	---------------------------------
; Function _8BP_mover_3
; ---------------------------------
__8BP_mover_3::
;8BP_wrapper/8BP.h:716: _8BP_mover_inv3(dx,dy,sp);
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
;8BP_wrapper/8BP.h:717: }
	ret
;8BP_wrapper/8BP.h:718: void _8BP_mover_1(int sp)
;	---------------------------------
; Function _8BP_mover_1
; ---------------------------------
__8BP_mover_1::
;8BP_wrapper/8BP.h:725: __endasm;	
	ld	a,#1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MOVER
;8BP_wrapper/8BP.h:728: }
	ret
;8BP_wrapper/8BP.h:729: void _8BP_moverall_inv2(int dx, int dy)
;	---------------------------------
; Function _8BP_moverall_inv2
; ---------------------------------
__8BP_moverall_inv2::
;8BP_wrapper/8BP.h:736: __endasm;	
	ld	a,#2
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	MOVERALL
;8BP_wrapper/8BP.h:738: }
	ret
;8BP_wrapper/8BP.h:739: void _8BP_moverall_2(int dy, int dx)
;	---------------------------------
; Function _8BP_moverall_2
; ---------------------------------
__8BP_moverall_2::
;8BP_wrapper/8BP.h:741: _8BP_moverall_inv2(dx,dy);
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
	call	__8BP_moverall_inv2
	pop	af
	pop	af
;8BP_wrapper/8BP.h:742: }
	ret
;8BP_wrapper/8BP.h:744: void _8BP_moverall()
;	---------------------------------
; Function _8BP_moverall
; ---------------------------------
__8BP_moverall::
;8BP_wrapper/8BP.h:749: __endasm;	
	ld	a,#0
	CALL	MOVERALL
;8BP_wrapper/8BP.h:751: }
	ret
;8BP_wrapper/8BP.h:753: void _8BP_peek_2(int address, int* dato)
;	---------------------------------
; Function _8BP_peek_2
; ---------------------------------
__8BP_peek_2::
;8BP_wrapper/8BP.h:756: p=(int *)address;	
	pop	bc
	pop	hl
	push	hl
	push	bc
;8BP_wrapper/8BP.h:757: *dato=*p; //mas facil imposible
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
;8BP_wrapper/8BP.h:758: }
	ret
;8BP_wrapper/8BP.h:760: void _8BP_poke_2(int address,int dato)
;	---------------------------------
; Function _8BP_poke_2
; ---------------------------------
__8BP_poke_2::
;8BP_wrapper/8BP.h:763: p=(int *)address;
	pop	de
	pop	bc
	push	bc
	push	de
;8BP_wrapper/8BP.h:764: *p=dato; //mas facil imposible
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	(bc), a
	inc	bc
	ld	a, 1 (iy)
	ld	(bc), a
;8BP_wrapper/8BP.h:765: }
	ret
;8BP_wrapper/8BP.h:768: void _8BP_rink_1(int step)
;	---------------------------------
; Function _8BP_rink_1
; ---------------------------------
__8BP_rink_1::
;8BP_wrapper/8BP.h:775: __endasm;	
	ld	a,#1
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	RINK
;8BP_wrapper/8BP.h:776: }
	ret
;8BP_wrapper/8BP.h:780: void _8BP_rink_N(int num_params,int* ink_list)
;	---------------------------------
; Function _8BP_rink_N
; ---------------------------------
__8BP_rink_N::
	push	af
;8BP_wrapper/8BP.h:786: _8BP_rink_N_color1=num_params;
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	(__8BP_rink_N_color1+0), a
;8BP_wrapper/8BP.h:789: for (i=0;i<num_params;i++)
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
;8BP_wrapper/8BP.h:790: _8BP_rink_N_inverse_list[i]=ink_list[num_params-i-1];
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
;8BP_wrapper/8BP.h:789: for (i=0;i<num_params;i++)
	inc	bc
	jr	00103$
00101$:
;8BP_wrapper/8BP.h:799: __endasm;	
	ld	hl, #__8BP_rink_N_color1;
	ld	a,(hl)
	ld	ix, #__8BP_rink_N_inverse_list;
	CALL	RINK
;8BP_wrapper/8BP.h:800: }
	pop	af
	ret
;8BP_wrapper/8BP.h:802: void _8BP_umap_inv6(int x_fin,int x_ini, int y_fin, int y_ini, int map_fin, int map_ini)
;	---------------------------------
; Function _8BP_umap_inv6
; ---------------------------------
__8BP_umap_inv6::
;8BP_wrapper/8BP.h:809: __endasm;	
	ld	a,#6
	ld	ix,#2 ;posicion primer parametro 
	add ix,sp;
	CALL	UMAP
;8BP_wrapper/8BP.h:812: }
	ret
;8BP_wrapper/8BP.h:814: void _8BP_umap_6(int map_ini, int map_fin, int y_ini, int y_fin, int x_ini, int x_fin)
;	---------------------------------
; Function _8BP_umap_6
; ---------------------------------
__8BP_umap_6::
;8BP_wrapper/8BP.h:816: _8BP_umap_inv6(x_fin,x_ini,y_fin,y_ini, map_fin, map_ini);
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
;8BP_wrapper/8BP.h:818: }
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
;mini_BASIC/minibasic.h:251: void _basic_sound(unsigned char nChannelStatus, int nTonePeriod, int nDuration, unsigned char nVolume, char nVolumeEnvelope, char nToneEnvelope, unsigned char nNoisePeriod) 
;	---------------------------------
; Function _basic_sound
; ---------------------------------
__basic_sound::
;mini_BASIC/minibasic.h:330: __endasm;
	ld	ix,#2;
	add	ix,sp;
	LD	HL, #0xf7f1
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
	LD	HL, #0xf7f1
	CALL	#0xBCAA ;SOUND QUEUE
;mini_BASIC/minibasic.h:333: }
	ret
;mini_BASIC/minibasic.h:335: void _basic_ink (char ink1, char ink2)
;	---------------------------------
; Function _basic_ink
; ---------------------------------
__basic_ink::
;mini_BASIC/minibasic.h:347: __endasm;	
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	ld	b, 1(ix)
	ld	c,b
	call	0xbc32
;mini_BASIC/minibasic.h:348: }
	ret
;mini_BASIC/minibasic.h:350: char _basic_peek(unsigned int address)
;	---------------------------------
; Function _basic_peek
; ---------------------------------
__basic_peek::
;mini_BASIC/minibasic.h:361: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	l, (ix)
	ld	h,1(ix)
	ld	a,(hl)
	ld	l,a
	ret
;mini_BASIC/minibasic.h:363: return 0;
	ld	l, #0x00
;mini_BASIC/minibasic.h:365: }
	ret
;mini_BASIC/minibasic.h:367: void _basic_poke(unsigned int address, unsigned char data)
;	---------------------------------
; Function _basic_poke
; ---------------------------------
__basic_poke::
;mini_BASIC/minibasic.h:381: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	l, (ix)
	ld	h,1(ix)
	ld	a,2(ix)
	ld	(hl),a
	ret
;mini_BASIC/minibasic.h:382: }
	ret
;mini_BASIC/minibasic.h:384: void _basic_pen_txt(char ink)
;	---------------------------------
; Function _basic_pen_txt
; ---------------------------------
__basic_pen_txt::
;mini_BASIC/minibasic.h:392: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	call	0xbb90
;mini_BASIC/minibasic.h:395: }
	ret
;mini_BASIC/minibasic.h:396: void _basic_pen_graph(char ink)
;	---------------------------------
; Function _basic_pen_graph
; ---------------------------------
__basic_pen_graph::
;mini_BASIC/minibasic.h:403: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	call	0xbbde
;mini_BASIC/minibasic.h:405: }
	ret
;mini_BASIC/minibasic.h:411: void _basic_paper(char ink)
;	---------------------------------
; Function _basic_paper
; ---------------------------------
__basic_paper::
;mini_BASIC/minibasic.h:418: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	a, (ix)
	call	0xbb96
;mini_BASIC/minibasic.h:420: }
	ret
;mini_BASIC/minibasic.h:422: void _basic_plot(int x, int y){
;	---------------------------------
; Function _basic_plot
; ---------------------------------
__basic_plot::
;mini_BASIC/minibasic.h:435: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	e,(ix)
	ld	d, 1(ix)
	ld	l, 2(ix)
	ld	h, 3(ix)
	call	0xBBEA ; GRA PLOT ABSOLUTE
	ret
;mini_BASIC/minibasic.h:436: }
	ret
;mini_BASIC/minibasic.h:438: void _basic_move(int x, int y){
;	---------------------------------
; Function _basic_move
; ---------------------------------
__basic_move::
;mini_BASIC/minibasic.h:451: __endasm;
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	e,(ix)
	ld	d, 1(ix)
	ld	l, 2(ix)
	ld	h, 3(ix)
	call	0xBBC0 ; GRA MOVE ABSOLUTE
	ret
;mini_BASIC/minibasic.h:452: }
	ret
;mini_BASIC/minibasic.h:454: void _basic_draw(int x, int y)
;	---------------------------------
; Function _basic_draw
; ---------------------------------
__basic_draw::
;mini_BASIC/minibasic.h:469: __endasm;	
	ld	ix,#2; posicion primer parametro 
	add ix,sp;
	ld	e,(ix)
	ld	d, 1(ix)
	ld	l, 2(ix)
	ld	h, 3(ix)
	call	0xBBF6 ; GRA LlNE ABSOLUTE
	ret
;mini_BASIC/minibasic.h:471: }
	ret
;ciclo.c:59: int  main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	af
;ciclo.c:62: c=0;
	ld	hl, #0x0000
	ld	(_c), hl
;ciclo.c:64: fps=0;
;ciclo.c:65: t1=0;//_basic_time();
	ld	l,#0x00
	ld	(_fps),hl
	ld	(_t1), hl
;ciclo.c:66: dir=5; //quieto
	ld	l, #0x05
	ld	(_dir), hl
;ciclo.c:67: newr=0; //nueva ruta fant
	ld	iy, #_newr
	ld	0 (iy), #0x00
;ciclo.c:68: op=0; // inicializacion operacion logica precomputada
	ld	iy, #_op
	ld	0 (iy), #0x00
;ciclo.c:69: precomp=0;
;ciclo.c:70: co=0;
	ld	l,#0x00
	ld	(_precomp),hl
	ld	(_co), hl
;ciclo.c:72: rf[0]=5;//derecha
	ld	hl, #_rf
	ld	(hl), #0x05
;ciclo.c:73: rf[1]=6;//izq
	ld	hl, #(_rf + 0x0001)
	ld	(hl), #0x06
;ciclo.c:74: rf[2]=6;//izq
	ld	hl, #(_rf + 0x0002)
	ld	(hl), #0x06
;ciclo.c:75: rf[3]=5;//derecha
	ld	hl, #(_rf + 0x0003)
	ld	(hl), #0x05
;ciclo.c:76: for (n=0;n<4;n++){
	ld	hl, #0x0000
	ld	(_n), hl
00201$:
;ciclo.c:77: dfx[n]=27003+(27+n)*16;
	ld	hl, (_n)
	add	hl, hl
	ld	a, l
	add	a, #<(_dfx)
	ld	c, a
	ld	a, h
	adc	a, #>(_dfx)
	ld	b, a
	ld	iy, #_n
	ld	a, 0 (iy)
	add	a, #0x1b
	ld	l, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	hl, #0x697b
	add	hl, de
	ex	de, hl
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;ciclo.c:78: dfy[n]=27001+(27+n)*16;
	ld	hl, (_n)
	add	hl, hl
	ld	a, #<(_dfy)
	add	a, l
	ld	c, a
	ld	a, #>(_dfy)
	adc	a, h
	ld	b, a
	ld	a, 0 (iy)
	add	a, #0x1b
	ld	l, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	h, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	hl, #0x6979
	add	hl, de
	ex	de, hl
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;ciclo.c:76: for (n=0;n<4;n++){
	ld	hl, (_n)
	inc	hl
	ld	(_n), hl
	ld	a, 0 (iy)
	sub	a, #0x04
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00201$
;ciclo.c:83: _8BP_printspall_4(0,0,0,0);
	ld	hl, #0x0000
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	call	__8BP_printspall_4
	pop	af
	pop	af
	pop	af
;ciclo.c:85: _8BP_colsp_2(33,&cod);
	ld	hl, #_cod
	ex	(sp),hl
	ld	hl, #0x0021
	push	hl
	call	__8BP_colsp_2
	pop	af
;ciclo.c:86: _8BP_colay_3(62, &col,31); 
	ld	hl, #0x001f
	ex	(sp),hl
	ld	hl, #_col
	push	hl
	ld	hl, #0x003e
	push	hl
	call	__8BP_colay_3
	pop	af
	pop	af
;ciclo.c:87: _8BP_colay_1(31);
	ld	hl, #0x001f
	ex	(sp),hl
	call	__8BP_colay_1
;ciclo.c:92: _8BP_peek_2(17900,&scr_dir); scr=(int*)scr_dir;
	ld	hl, #_scr_dir
	ex	(sp),hl
	ld	hl, #0x45ec
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
	ld	hl, (_scr_dir)
	ld	(_scr), hl
;ciclo.c:93: _8BP_peek_2(17902,&target_dir);target=(int*)target_dir;
	ld	hl, #_target_dir
	push	hl
	ld	hl, #0x45ee
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
	ld	hl, (_target_dir)
	ld	(_target), hl
;ciclo.c:94: _8BP_peek_2(17904,&music_dir);music=(int*)music_dir;
	ld	hl, #_music_dir
	push	hl
	ld	hl, #0x45f0
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
	ld	hl, (_music_dir)
	ld	(_music), hl
;ciclo.c:95: _8BP_peek_2(17906,&hi_dir); hi=(int*)hi_dir;
	ld	hl, #_hi_dir
	push	hl
	ld	hl, #0x45f2
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
	ld	hl, (_hi_dir)
	ld	(_hi), hl
;ciclo.c:96: _8BP_peek_2(17908,&flaghi_dir);flaghi=(int*)flaghi_dir;
	ld	hl, #_flaghi_dir
	push	hl
	ld	hl, #0x45f4
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
	ld	hl, (_flaghi_dir)
	ld	(_flaghi), hl
;ciclo.c:97: _8BP_peek_2(17914,&precomp);// precomputed logic
	ld	hl, #_precomp
	push	hl
	ld	hl, #0x45fa
	push	hl
	call	__8BP_peek_2
	pop	af
;ciclo.c:100: _8BP_peek_2(27499,&x);
	ld	hl, #_x
	ex	(sp),hl
	ld	hl, #0x6b6b
	push	hl
	call	__8BP_peek_2
	pop	af
;ciclo.c:101: _8BP_peek_2(27497,&y);
	ld	hl, #_y
	ex	(sp),hl
	ld	hl, #0x6b69
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
;ciclo.c:103: t1=_basic_time();
	call	__basic_time
	ld	(_t1), hl
;ciclo.c:116: label_CICLO:
00102$:
;ciclo.c:118: c=c+1;//if (c==2000) {_8BP_poke_2(17910,0);_8BP_poke_2(17912,c);return 0;}
	ld	hl, (_c)
	inc	hl
	ld	(_c), hl
;ciclo.c:119: n=c & 3;
	ld	a,(#_c + 0)
	and	a, #0x03
	ld	(_n+0), a
	ld	hl,#_n + 1
	ld	(hl), #0x00
;ciclo.c:121: _8BP_autoall();
	call	__8BP_autoall
;ciclo.c:122: if ((n & 1) >0 ) goto label_1340;//colision fantasmas(=1) y puntos (n=3)
	ld	a,(#_n + 0)
	and	a, #0x01
	ld	c, a
	ld	b, #0x00
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00412$
	xor	a, #0x80
00412$:
	jp	M, 00152$
;ciclo.c:123: if (n>0) goto label_1190; //colay (n=2)
	xor	a, a
	ld	iy, #_n
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00413$
	xor	a, #0x80
00413$:
	jp	P, 00120$
;ciclo.c:130: _8BP_colay_1(31);
	ld	hl, #0x001f
	push	hl
	call	__8BP_colay_1
	pop	af
;ciclo.c:131: if (col==0) goto label_1490;
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jp	Z, 00188$
;ciclo.c:132: _8BP_setupsp_3(31,15,4); //ruta 4 es parado 
	ld	hl, #0x0004
	push	hl
	ld	l, #0x0f
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:133: if (dir==1) _8BP_mover_3(31,0,1);
	ld	iy, #_dir
	ld	a, 0 (iy)
	dec	a
	or	a, 1 (iy)
	jr	NZ,00118$
	ld	hl, #0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	jp	00188$
00118$:
;ciclo.c:134: else if (dir==2) _8BP_mover_3(31,4,0);
	ld	iy, #_dir
	ld	a, 0 (iy)
	sub	a, #0x02
	or	a, 1 (iy)
	jr	NZ,00115$
	ld	hl, #0x0000
	push	hl
	ld	l, #0x04
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	jp	00188$
00115$:
;ciclo.c:135: else if (dir==3) _8BP_mover_3(31,-4,0);
	ld	iy, #_dir
	ld	a, 0 (iy)
	sub	a, #0x03
	or	a, 1 (iy)
	jr	NZ,00112$
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xfffc
	push	hl
	ld	hl, #0x001f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	jp	00188$
00112$:
;ciclo.c:136: else _8BP_mover_3(31,0,-1); //dir=0
	ld	hl, #0xffff
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
;ciclo.c:138: goto label_1490;
	jp	00188$
;ciclo.c:142: label_1260:
00120$:
;ciclo.c:143: if (c & 63) goto label_1270;
	ld	a,(#_c + 0)
	and	a, #0x3f
	jr	NZ,00123$
;ciclo.c:144: t2=_basic_time();
	call	__basic_time
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	de, #_t2
	ld	hl, #0
	add	hl, sp
	ldi
	ldi
;ciclo.c:145: fps=64*300/(t2-t1);
	ld	hl, #_t1
	push	de
	ld	iy, #2
	add	iy, sp
	push	iy
	pop	de
	ld	iy, #_t2
	ld	a, 0 (iy)
	sub	a, (hl)
	ld	(de), a
	ld	a, 1 (iy)
	inc	hl
	sbc	a, (hl)
	inc	de
	ld	(de), a
	pop	de
	pop	hl
	push	hl
	push	hl
	ld	hl, #0x4b00
	push	hl
	call	__divsint
	pop	af
	pop	af
;ciclo.c:146: cfps=_basic_str(fps);
	ld	(_fps), hl
	push	hl
	call	__basic_str
	pop	af
;ciclo.c:147: _8BP_printat_4(0,190,74,cfps);
	ld	(_cfps), hl
	push	hl
	ld	hl, #0x004a
	push	hl
	ld	l, #0xbe
	push	hl
	ld	l, #0x00
	push	hl
	call	__8BP_printat_4
	pop	af
	pop	af
	pop	af
	pop	af
;ciclo.c:148: t1=t2;
	ld	hl, (_t2)
	ld	(_t1), hl
;ciclo.c:152: label_1270:
00123$:
;ciclo.c:153: if (dir>0) {
	xor	a, a
	ld	iy, #_dir
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00422$
	xor	a, #0x80
00422$:
	jp	P, 00130$
;ciclo.c:154: if (_basic_inkey(27)==0){ 
	ld	a, #0x1b
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jr	NZ,00130$
;ciclo.c:155: _8BP_mover_3(31,0,1);_8BP_colay_1(31);_8BP_mover_3(31,0,-1);
	ld	hl, #0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	ld	hl, #0x001f
	ex	(sp),hl
	call	__8BP_colay_1
	ld	hl, #0xffff
	ex	(sp),hl
	ld	hl, #0x0000
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
;ciclo.c:156: if (col==0){
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jp	NZ, 00188$
;ciclo.c:157: _8BP_setupsp_3(31,15,0); dir=0;
	ld	hl, #0x0000
	push	hl
	ld	l, #0x0f
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ld	hl, #0x0000
	ld	(_dir), hl
;ciclo.c:158: goto label_1490;
	jp	00188$
;ciclo.c:160: else goto label_1490;// hay colision layout
00130$:
;ciclo.c:163: if (dir!=1){
	ld	iy, #_dir
	ld	a, 0 (iy)
	dec	a
	or	a, 1 (iy)
	jr	Z,00137$
;ciclo.c:164: if (_basic_inkey(34)==0) {
	ld	a, #0x22
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jr	NZ,00137$
;ciclo.c:165: _8BP_mover_3(31,0,-1);_8BP_colay_1(31);_8BP_mover_3(31,0,1);
	ld	hl, #0xffff
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	ld	hl, #0x001f
	ex	(sp),hl
	call	__8BP_colay_1
	pop	af
	ld	hl, #0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
;ciclo.c:166: if (col==0){
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jp	NZ, 00188$
;ciclo.c:167: _8BP_setupsp_3(31,15,1); dir=1;
	ld	hl, #0x0001
	push	hl
	ld	l, #0x0f
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ld	hl, #0x0001
	ld	(_dir), hl
;ciclo.c:168: goto label_1490;
	jp	00188$
;ciclo.c:170: else goto label_1490;// hay colision layout
00137$:
;ciclo.c:173: if (dir!=2){
	ld	iy, #_dir
	ld	a, 0 (iy)
	sub	a, #0x02
	or	a, 1 (iy)
	jr	Z,00144$
;ciclo.c:174: if (_basic_inkey(67)==0) {
	ld	a, #0x43
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jr	NZ,00144$
;ciclo.c:175: _8BP_mover_3(31,-1,0);_8BP_colay_1(31);_8BP_mover_3(31,1,0);
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xffff
	push	hl
	ld	hl, #0x001f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	ld	hl, #0x001f
	ex	(sp),hl
	call	__8BP_colay_1
	pop	af
	ld	hl, #0x0000
	push	hl
	ld	l, #0x01
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
;ciclo.c:176: if (col==0){
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jp	NZ, 00188$
;ciclo.c:177: _8BP_setupsp_3(31,15,2); dir=2;
	ld	hl, #0x0002
	push	hl
	ld	l, #0x0f
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ld	hl, #0x0002
	ld	(_dir), hl
;ciclo.c:178: goto label_1490;
	jp	00188$
;ciclo.c:180: else goto label_1490;// hay colision layout
00144$:
;ciclo.c:183: if (dir<3){
	ld	iy, #_dir
	ld	a, 0 (iy)
	sub	a, #0x03
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00188$
;ciclo.c:184: if (_basic_inkey(69)==0) {
	ld	a, #0x45
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jp	NZ, 00188$
;ciclo.c:185: _8BP_mover_3(31,1,0);_8BP_colay_1(31);_8BP_mover_3(31,-1,0);
	ld	hl, #0x0000
	push	hl
	ld	l, #0x01
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	ld	hl, #0x001f
	ex	(sp),hl
	call	__8BP_colay_1
	ld	hl, #0x0000
	ex	(sp),hl
	ld	hl, #0xffff
	push	hl
	ld	hl, #0x001f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
;ciclo.c:186: if (col==0){
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jp	NZ, 00188$
;ciclo.c:187: _8BP_setupsp_3(31,15,3); dir=3;
	ld	hl, #0x0003
	push	hl
	ld	l, #0x0f
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ld	hl, #0x0003
	ld	(_dir), hl
;ciclo.c:188: goto label_1490;
	jp	00188$
;ciclo.c:195: label_1340: 
00152$:
;ciclo.c:199: if (n==1) {
	ld	iy, #_n
	ld	a, 0 (iy)
	dec	a
	or	a, 1 (iy)
	jr	NZ,00157$
;ciclo.c:200: _8BP_colsp_1(31);
	ld	hl, #0x001f
	push	hl
	call	__8BP_colsp_1
	pop	af
;ciclo.c:201: if (cod<32) goto label_1810;
	ld	iy, #_cod
	ld	a, 0 (iy)
	sub	a, #0x20
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00188$
	jp	00194$
;ciclo.c:202: else goto label_1490;  
00157$:
;ciclo.c:207: _8BP_peek_2(27499,&x);
	ld	hl, #_x
	push	hl
	ld	hl, #0x6b6b
	push	hl
	call	__8BP_peek_2
	pop	af
;ciclo.c:208: y=(int)_basic_peek(27497);
	ld	hl, #0x6b69
	ex	(sp),hl
	call	__basic_peek
	pop	af
	ld	a, l
	ld	(_y+0), a
	xor	a, a
	ld	(_y+1), a
;ciclo.c:209: if (dir==0) {y2=y+8;x2=x+2;}
	ld	iy, #_y
	ld	a, 0 (iy)
	add	a, #0x08
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	ld	iy, #_dir
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	NZ,00168$
	ld	(_y2), bc
	ld	de, (_x)
	inc	de
	inc	de
	jr	00170$
00168$:
;ciclo.c:210: else if (dir==1) {y2=y+8;x2=x;}
	ld	a,(#_x + 0)
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	ld	a,(#_x + 1)
	ld	iy, #0
	add	iy, sp
	ld	1 (iy), a
	ld	iy, #_dir
	ld	a, 0 (iy)
	dec	a
	or	a, 1 (iy)
	jr	NZ,00165$
	ld	(_y2), bc
	pop	de
	push	de
	jr	00170$
00165$:
;ciclo.c:211: else if (dir==2)  {y2=y;;x2=x;}
	ld	iy, #_dir
	ld	a, 0 (iy)
	sub	a, #0x02
	or	a, 1 (iy)
	jr	NZ,00162$
	ld	hl, (_y)
	ld	(_y2), hl
	pop	de
	push	de
	jr	00170$
00162$:
;ciclo.c:212: else if (dir==3)  {y2=y+12;x2=x;}
	ld	iy, #_dir
	ld	a, 0 (iy)
	sub	a, #0x03
	or	a, 1 (iy)
	jr	NZ,00159$
	ld	hl, #_y2
	ld	iy, #_y
	ld	a, 0 (iy)
	add	a, #0x0c
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	pop	de
	push	de
	jr	00170$
00159$:
;ciclo.c:213: else {y2=y+8;x2=x;}//dir 4?
	ld	(_y2), bc
	pop	de
	push	de
;ciclo.c:214: label_1400:
00170$:
;ciclo.c:217: d= 0xA438 + ((y2+3)/8)*20 + (x2+1)/4;//los ajustes son para simular division / basic que es float con CINT 
	ld	bc, (_y2)
	inc	bc
	inc	bc
	inc	bc
	ld	l, c
	ld	h, b
	bit	7, b
	jr	Z,00205$
	ld	hl, #0x0007
	add	hl, bc
00205$:
	ld	b, #0x03
00433$:
	sra	h
	rr	l
	djnz	00433$
	ld	c, l
	ld	b, h
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc, #0xa438
	add	hl,bc
	ld	c, l
	ld	b, h
	ex	de,hl
	inc	hl
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z,00206$
	ex	de,hl
	inc	de
	inc	de
	inc	de
00206$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a, c
	ld	hl, #_d
	add	a, e
	ld	(hl), a
	ld	a, b
	adc	a, d
	inc	hl
	ld	(hl), a
;ciclo.c:218: dato=_basic_peek(d);
	ld	hl, (_d)
	push	hl
	call	__basic_peek
	pop	af
	ld	a, l
	ld	(_dato+0), a
;ciclo.c:235: if (_basic_inkey(38)==0){
	ld	a, #0x26
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jr	NZ,00175$
;ciclo.c:236: if (*music==1) {*music=0;_8BP_music();}
	ld	hl, (_music)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	ld	a, c
	dec	a
	or	a, b
	jr	NZ,00172$
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	call	__8BP_music
	jr	00175$
00172$:
;ciclo.c:237: else {*music=1;_8BP_music_4(0,0,0,6);}
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	ld	hl, #0x0006
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	call	__8BP_music_4
	pop	af
	pop	af
	pop	af
	pop	af
00175$:
;ciclo.c:239: if (dato<60) {if (dato>32) goto label_1440; else goto label_1490;}
	ld	iy, #_dato
	ld	a, 0 (iy)
	sub	a, #0x3c
	jr	NC,00181$
	ld	a, #0x20
	sub	a, 0 (iy)
	jp	NC, 00188$
;ciclo.c:242: label_1440:
00181$:
;ciclo.c:243: _basic_poke(d,32); 
	ld	a, #0x20
	push	af
	inc	sp
	ld	hl, (_d)
	push	hl
	call	__basic_poke
	pop	af
	inc	sp
;ciclo.c:245: *scr=(*scr)+1;
	ld	bc, (_scr)
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;ciclo.c:246: cad=_basic_str(*scr);
	ld	hl, (_scr)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__basic_str
	pop	af
;ciclo.c:247: _8BP_printat_4(0,0,62,cad);
	ld	(_cad), hl
	push	hl
	ld	hl, #0x003e
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
;ciclo.c:248: if (*music==0) _basic_sound(4,400,10,15,0,1,0);
	ld	hl, (_music)
	ld	a, (hl)
	inc	hl
	ld	c, (hl)
	or	a, c
	jr	NZ,00183$
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	xor	a, a
	ld	d,a
	ld	e,#0x0f
	push	de
	ld	hl, #0x000a
	push	hl
	ld	hl, #0x0190
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	__basic_sound
	ld	hl, #9
	add	hl, sp
	ld	sp, hl
00183$:
;ciclo.c:245: *scr=(*scr)+1;
	ld	hl, (_scr)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;ciclo.c:250: if ((*scr)==(*target)) {goto label_2060;}
	ld	hl, (_target)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ex	de,hl
	cp	a, a
	sbc	hl, bc
	jp	Z,00200$
;ciclo.c:251: if ((*hi)>(*scr)) goto label_1490;
	ld	hl, (_hi)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00437$
	xor	a, #0x80
00437$:
	jp	M, 00188$
;ciclo.c:252: _basic_pen_txt(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	__basic_pen_txt
	inc	sp
;ciclo.c:253: _basic_locate(18,14);_basic_print("NEW");
	ld	hl, #0x000e
	push	hl
	ld	l, #0x12
	push	hl
	call	__basic_locate
	pop	af
	ld	hl, #___str_1
	ex	(sp),hl
	call	__basic_print
	pop	af
;ciclo.c:254: _basic_locate(16,15);_basic_print("HI-SCORE");
	ld	hl, #0x000f
	push	hl
	ld	l, #0x10
	push	hl
	call	__basic_locate
	pop	af
	ld	hl, #___str_2
	ex	(sp),hl
	call	__basic_print
	pop	af
;ciclo.c:255: *hi=30000;
	ld	hl, (_hi)
	ld	(hl), #0x30
	inc	hl
	ld	(hl), #0x75
;ciclo.c:256: *flaghi=1;
	ld	hl, (_flaghi)
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
;ciclo.c:260: label_1490:
00188$:
;ciclo.c:261: id=27+n;
	ld	hl, #_id
	ld	iy, #_n
	ld	a, 0 (iy)
	add	a, #0x1b
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
;ciclo.c:262: if (precomp==0) logica_fantasma(id);
	ld	iy, #_precomp
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	NZ,00192$
	ld	hl, (_id)
	push	hl
	call	_logica_fantasma
	pop	af
	jr	00193$
00192$:
;ciclo.c:264: res =logica_fantasma_precomputed(id);
	ld	hl, (_id)
	push	hl
	call	_logica_fantasma_precomputed
	pop	af
	ld	(_res), hl
;ciclo.c:265: if (res==-1) {
	ld	iy, #_res
	ld	a, 0 (iy)
	inc	a
	jr	NZ,00193$
	ld	a, 1 (iy)
	inc	a
	jr	NZ,00193$
;ciclo.c:266: _8BP_poke_2(17910,0);//muerte como si fantasma
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x45f6
	push	hl
	call	__8BP_poke_2
	pop	af
	pop	af
;ciclo.c:267: _8BP_poke_2(17912,c);
	ld	hl, (_c)
	push	hl
	ld	hl, #0x45f8
	push	hl
	call	__8BP_poke_2
	pop	af
	pop	af
;ciclo.c:268: return 0;
	ld	hl, #0x0000
	jp	00203$
00193$:
;ciclo.c:273: _8BP_printspall();
	call	__8BP_printspall
;ciclo.c:274: goto label_CICLO;
	jp	00102$
;ciclo.c:279: label_1810:
00194$:
;ciclo.c:281: if (cod<27){
	ld	iy, #_cod
	ld	a, 0 (iy)
	sub	a, #0x1b
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00199$
;ciclo.c:282: if (cod==26) {_8BP_mover_3(31,0,-80);goto label_1490;}
	ld	a, 0 (iy)
	sub	a, #0x1a
	or	a, 1 (iy)
	jr	NZ,00196$
	ld	hl, #0xffb0
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	jp	00188$
00196$:
;ciclo.c:283: else {_8BP_mover_3(31,0,80);goto label_1490;}
	ld	hl, #0x0050
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	jp	00188$
00199$:
;ciclo.c:286: _8BP_poke_2(17910,0);//muerte
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x45f6
	push	hl
	call	__8BP_poke_2
	pop	af
	pop	af
;ciclo.c:287: _8BP_poke_2(17912,c);
	ld	hl, (_c)
	push	hl
	ld	hl, #0x45f8
	push	hl
	call	__8BP_poke_2
	pop	af
	pop	af
;ciclo.c:288: return 0;
	ld	hl, #0x0000
	jr	00203$
;ciclo.c:291: label_2060:
00200$:
;ciclo.c:292: _8BP_poke_2(17910,1);//next level
	ld	hl, #0x0001
	push	hl
	ld	hl, #0x45f6
	push	hl
	call	__8BP_poke_2
	pop	af
	pop	af
;ciclo.c:293: _8BP_poke_2(17912,c);
	ld	hl, (_c)
	push	hl
	ld	hl, #0x45f8
	push	hl
	call	__8BP_poke_2
	pop	af
	pop	af
;ciclo.c:294: return 0;	
	ld	hl, #0x0000
00203$:
;ciclo.c:295: }
	pop	af
	ret
___str_1:
	.ascii "NEW"
	.db 0x00
___str_2:
	.ascii "HI-SCORE"
	.db 0x00
;ciclo.c:298: void logica_fantasma(int id){
;	---------------------------------
; Function logica_fantasma
; ---------------------------------
_logica_fantasma::
;ciclo.c:300: if (rf[n]<7){
	ld	bc, #_rf+0
	ld	hl, (_n)
	add	hl, bc
	ld	l, (hl)
;ciclo.c:301: xf =_basic_peek(dfx[n]);
	ld	de, (_n)
	sla	e
	rl	d
;ciclo.c:300: if (rf[n]<7){
	ld	a, l
	sub	a, #0x07
	jp	NC, 00140$
;ciclo.c:301: xf =_basic_peek(dfx[n]);
	ld	hl, #_dfx+0
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	push	de
	call	__basic_peek
	pop	af
	ld	a, l
	pop	bc
	ld	(_xf+0), a
;ciclo.c:302: if ((xf & 3)!=0) return;  
	ld	a,(#_xf + 0)
	and	a, #0x03
;ciclo.c:304: else goto label_1650;//ruta vertical
	ret	NZ
;ciclo.c:305: if (rf[n]>5) goto label_1590; //izq
	ld	hl, (_n)
	add	hl, bc
	ld	d, (hl)
;ciclo.c:308: newr=(1+newr) & 3;
	ld	iy, #_newr
	ld	a, 0 (iy)
	inc	a
	and	a, #0x03
	ld	e, a
;ciclo.c:305: if (rf[n]>5) goto label_1590; //izq
	ld	a, #0x05
	sub	a, d
	jp	C, 00123$
;ciclo.c:308: newr=(1+newr) & 3;
	ld	0 (iy), e
;ciclo.c:309: if (newr==1) goto label_1550;
	ld	a, 0 (iy)
	dec	a
	jr	Z,00115$
;ciclo.c:310: if (newr==2) goto label_1560;
	ld	a, 0 (iy)
	sub	a, #0x02
	jp	Z,00118$
;ciclo.c:312: label_1540:
00112$:
;ciclo.c:313: _8BP_mover_3(id,0,1);_8BP_colay_1(id);_8BP_mover_3(id,0,-1); if (col==0) return;//sigue
	push	bc
	ld	hl, #0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_1
	ld	hl, #0xffff
	ex	(sp),hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
;ciclo.c:314: label_1550:
	ret	Z
00115$:
;ciclo.c:315: _8BP_mover_3(id,-1,0);_8BP_colay_1(id);_8BP_mover_3(id,1,0); if (col==0) {rf[n]=7;_8BP_setupsp_3(id,15,7);return;}
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xffff
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_1
	pop	af
	ld	hl, #0x0000
	push	hl
	ld	l, #0x01
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	NZ,00118$
	ld	hl, (_n)
	add	hl, bc
	ld	(hl), #0x07
	ld	hl, #0x0007
	push	hl
	ld	l, #0x0f
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ret
;ciclo.c:316: label_1560:
00118$:
;ciclo.c:317: _8BP_mover_3(id,1,0);_8BP_colay_1(id);_8BP_mover_3(id,-1,0); if (col==0) {rf[n]=8;_8BP_setupsp_3(id,15,8);return;}
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, #0x01
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_1
	ld	hl, #0x0000
	ex	(sp),hl
	ld	hl, #0xffff
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	NZ,00120$
	ld	hl, (_n)
	add	hl, bc
	ld	(hl), #0x08
	ld	hl, #0x0008
	push	hl
	ld	l, #0x0f
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ret
00120$:
;ciclo.c:318: if (xf>75) {_8BP_mover_3(id,0,-80); return;}
	ld	a, #0x4b
	ld	iy, #_xf
	sub	a, 0 (iy)
	jp	NC, 00112$
	ld	hl, #0xffb0
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ret
;ciclo.c:322: label_1590: 
00123$:
;ciclo.c:323: if (xf<200) newr=(1+newr) & 3; else {_8BP_mover_3(id,0,80);return;} 
	ld	a,(#_xf + 0)
	sub	a, #0xc8
	jr	NC,00125$
	ld	hl,#_newr + 0
	ld	(hl), e
	jr	00126$
00125$:
	ld	hl, #0x0050
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ret
00126$:
;ciclo.c:324: if (newr==1) goto label_1620;
	ld	iy, #_newr
	ld	a, 0 (iy)
	dec	a
	jr	Z,00134$
;ciclo.c:325: if (newr==2) goto label_1630;
	ld	a, 0 (iy)
	sub	a, #0x02
	jp	Z,00137$
;ciclo.c:327: label_1610:
00131$:
;ciclo.c:328: _8BP_mover_3(id,0,-1);_8BP_colay_1(id);_8BP_mover_3(id,0,1); if (col==0) return;//sigue
	push	bc
	ld	hl, #0xffff
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_1
	pop	af
	ld	hl, #0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
;ciclo.c:329: label_1620:
	ret	Z
00134$:
;ciclo.c:330: _8BP_mover_3(id,-1,0);_8BP_colay_1(id);_8BP_mover_3(id,1,0); if (col==0) {rf[n]=7;_8BP_setupsp_3(id,15,7);return;}
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xffff
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_1
	pop	af
	ld	hl, #0x0000
	push	hl
	ld	l, #0x01
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	NZ,00137$
	ld	hl, (_n)
	add	hl, bc
	ld	(hl), #0x07
	ld	hl, #0x0007
	push	hl
	ld	l, #0x0f
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ret
;ciclo.c:331: label_1630:
00137$:
;ciclo.c:332: _8BP_mover_3(id,1,0);_8BP_colay_1(id);_8BP_mover_3(id,-1,0); if (col==0) {rf[n]=8;_8BP_setupsp_3(id,15,8);return;}
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, #0x01
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_1
	ld	hl, #0x0000
	ex	(sp),hl
	ld	hl, #0xffff
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jp	NZ, 00131$
	ld	hl, (_n)
	add	hl, bc
	ld	(hl), #0x08
	ld	hl, #0x0008
	push	hl
	ld	l, #0x0f
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ret
;ciclo.c:336: label_1650: 
00140$:
;ciclo.c:337: yf=_basic_peek(dfy[n]);
	ld	hl, #_dfy
	add	hl, de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	push	de
	call	__basic_peek
	pop	af
	ld	a, l
	pop	bc
	ld	(_yf+0), a
;ciclo.c:338: if (yf & 7) return; 
	ld	a,(#_yf + 0)
	and	a, #0x07
	ret	NZ
;ciclo.c:339: if (rf[n]==8) goto label_1720;
	ld	hl, (_n)
	add	hl, bc
	ld	e, (hl)
;ciclo.c:308: newr=(1+newr) & 3;
	ld	iy, #_newr
	ld	a, 0 (iy)
	inc	a
	and	a, #0x03
	ld	d, a
;ciclo.c:339: if (rf[n]==8) goto label_1720;
	ld	a, e
	sub	a, #0x08
	jp	Z,00158$
;ciclo.c:340: newr=(1+newr) & 3;
	ld	0 (iy), d
;ciclo.c:341: if (newr==1) goto label_1690;
	ld	a, 0 (iy)
	dec	a
	jr	Z,00152$
;ciclo.c:342: if (newr==2) goto label_1700;
	ld	a, 0 (iy)
	sub	a, #0x02
	jp	Z,00155$
;ciclo.c:344: label_1680:
00149$:
;ciclo.c:345: _8BP_mover_3(id,-1,0);_8BP_colay_1(id);_8BP_mover_3(id,1,0); if (col==0) return;//sigue
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xffff
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_1
	pop	af
	ld	hl, #0x0000
	push	hl
	ld	l, #0x01
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
;ciclo.c:346: label_1690:
	ret	Z
00152$:
;ciclo.c:347: _8BP_mover_3(id,0,1);_8BP_colay_1(id);_8BP_mover_3(id,0,-1); if (col==0) {rf[n]=5;_8BP_setupsp_3(id,15,5);return;}
	push	bc
	ld	hl, #0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_1
	ld	hl, #0xffff
	ex	(sp),hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	NZ,00155$
	ld	hl, (_n)
	add	hl, bc
	ld	(hl), #0x05
	ld	hl, #0x0005
	push	hl
	ld	l, #0x0f
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ret
;ciclo.c:348: label_1700:
00155$:
;ciclo.c:349: _8BP_mover_3(id,0,-1);_8BP_colay_1(id);_8BP_mover_3(id,0,1); if (col==0) {rf[n]=6;_8BP_setupsp_3(id,15,6);return;}
	push	bc
	ld	hl, #0xffff
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_1
	pop	af
	ld	hl, #0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jp	NZ, 00149$
	ld	hl, (_n)
	add	hl, bc
	ld	(hl), #0x06
	ld	hl, #0x0006
	push	hl
	ld	l, #0x0f
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ret
;ciclo.c:353: label_1720:
00158$:
;ciclo.c:354: newr=(1+newr) & 3;
	ld	iy, #_newr
	ld	0 (iy), d
;ciclo.c:355: if (newr==1) goto label_1750;
	ld	a, 0 (iy)
	dec	a
	jr	Z,00166$
;ciclo.c:356: if (newr==2) goto label_1760;  
	ld	a, 0 (iy)
	sub	a, #0x02
	jp	Z,00169$
;ciclo.c:358: label_1740:
00163$:
;ciclo.c:359: _8BP_mover_3(id,1,0);_8BP_colay_1(id);_8BP_mover_3(id,-1,0); if (col==0) return;//sigue
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, #0x01
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_1
	ld	hl, #0x0000
	ex	(sp),hl
	ld	hl, #0xffff
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
;ciclo.c:360: label_1750:
	ret	Z
00166$:
;ciclo.c:361: _8BP_mover_3(id,0,1);_8BP_colay_1(id);_8BP_mover_3(id,0,-1); if (col==0) {rf[n]=5;_8BP_setupsp_3(id,15,5);return;}
	push	bc
	ld	hl, #0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_1
	ld	hl, #0xffff
	ex	(sp),hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	NZ,00169$
	ld	hl, (_n)
	add	hl, bc
	ld	(hl), #0x05
	ld	hl, #0x0005
	push	hl
	ld	l, #0x0f
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ret
;ciclo.c:362: label_1760:
00169$:
;ciclo.c:363: _8BP_mover_3(id,0,-1);_8BP_colay_1(id);_8BP_mover_3(id,0,1); if (col==0) {rf[n]=6;_8BP_setupsp_3(id,15,6);return;}
	push	bc
	ld	hl, #0xffff
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_colay_1
	pop	af
	ld	hl, #0x0001
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	iy, #_col
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jp	NZ, 00163$
	ld	hl, (_n)
	add	hl, bc
	ld	(hl), #0x06
	ld	hl, #0x0006
	push	hl
	ld	l, #0x0f
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:364: goto label_1740;
;ciclo.c:368: }
	ret
;ciclo.c:369: int logica_fantasma_precomputed(int id){
;	---------------------------------
; Function logica_fantasma_precomputed
; ---------------------------------
_logica_fantasma_precomputed::
;ciclo.c:371: if (op<8) {op=_basic_peek(40000+co);}
	ld	a,(#_op + 0)
	sub	a, #0x08
	jr	NC,00102$
	ld	hl, (_co)
	ld	bc, #0x9c40
	add	hl, bc
	push	hl
	call	__basic_peek
	pop	af
	ld	a, l
	ld	(_op+0), a
	jr	00103$
00102$:
;ciclo.c:372: else {op=op-1; return 0;}
	ld	a,(#_op + 0)
	ld	hl, #_op
	add	a, #0xff
	ld	(hl), a
	ld	hl, #0x0000
	ret
00103$:
;ciclo.c:373: co=co+1;if (co==2000) return -1;
	ld	hl, (_co)
	inc	hl
	ld	(_co), hl
	ld	iy, #_co
	ld	a, 0 (iy)
	sub	a, #0xd0
	jr	NZ,00105$
	ld	a, 1 (iy)
	sub	a, #0x07
	jr	NZ,00105$
	ld	hl, #0xffff
	ret
00105$:
;ciclo.c:374: if (op>=7) return 0;
	ld	a,(#_op + 0)
	sub	a, #0x07
	jr	C,00107$
	ld	hl, #0x0000
	ret
00107$:
;ciclo.c:375: if (op>3)  {
	ld	a, #0x03
	ld	iy, #_op
	sub	a, 0 (iy)
	jr	NC,00115$
;ciclo.c:376: if (op==4) {_8BP_mover_3(id,0,80);return 0;}
	ld	a, 0 (iy)
	sub	a, #0x04
	jr	NZ,00109$
	ld	hl, #0x0050
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #0x0000
	ret
00109$:
;ciclo.c:377: if (op==5) {_8BP_setupsp_3(id,15,5);return 0;}
	ld	a,(#_op + 0)
	sub	a, #0x05
	jr	NZ,00111$
	ld	hl, #0x0005
	push	hl
	ld	l, #0x0f
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ld	hl, #0x0000
	ret
00111$:
;ciclo.c:378: if (op==6) {_8BP_setupsp_3(id,15,6);return 0;}
	ld	a,(#_op + 0)
	sub	a, #0x06
	jr	NZ,00115$
	ld	hl, #0x0006
	push	hl
	ld	l, #0x0f
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ld	hl, #0x0000
	ret
00115$:
;ciclo.c:380: if (op==1) {_8BP_setupsp_3(id,15,7);return 0;}
	ld	a,(#_op + 0)
	dec	a
	jr	NZ,00117$
	ld	hl, #0x0007
	push	hl
	ld	l, #0x0f
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ld	hl, #0x0000
	ret
00117$:
;ciclo.c:381: if (op==2) {_8BP_setupsp_3(id,15,8);return 0;}
	ld	a,(#_op + 0)
	sub	a, #0x02
	jr	NZ,00119$
	ld	hl, #0x0008
	push	hl
	ld	l, #0x0f
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ld	hl, #0x0000
	ret
00119$:
;ciclo.c:382: if (op==3) {_8BP_mover_3(id,0,-80);return 0;}
	ld	a,(#_op + 0)
	sub	a, #0x03
	jr	NZ,00121$
	ld	hl, #0xffb0
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	ld	hl, #0x0000
	ret
00121$:
;ciclo.c:383: return 0; //nunca llega aqui
	ld	hl, #0x0000
;ciclo.c:384: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit___basic_rnd_x:
	.dw #0x0000
	.area _CABS (ABS)
