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
	.globl _tr
	.globl _ener
	.globl _enesq
	.globl _eney
	.globl _enex
	.globl _eneim
	.globl _keyb
	.globl _tinta
	.globl _rb
	.globl _evtipo
	.globl _evdir
	.globl _rk
	.globl _offr
	.globl _xene
	.globl _yene
	.globl _direk
	.globl _enek
	.globl _inmune
	.globl _vidas
	.globl _level
	.globl _Nbanda
	.globl _tabu
	.globl _pot
	.globl _p2
	.globl _p1
	.globl _pfin2
	.globl _pfin1
	.globl _pini
	.globl _dif
	.globl _dir
	.globl _bomb
	.globl _pres
	.globl _modo
	.globl _fr
	.globl _der
	.globl _iz
	.globl _dw
	.globl _up
	.globl _scroll
	.globl _banda
	.globl _muertos
	.globl _j
	.globl _i
	.globl _t
	.globl _f2
	.globl _f1
	.globl _fps
	.globl _tb
	.globl _ta
	.globl _k
	.globl _enesp
	.globl _nextm
	.globl _m
	.globl _enecount
	.globl _dirsp
	.globl _seq
	.globl _po
	.globl _puntos
	.globl _cor
	.globl _col
	.globl _y
	.globl _x
	.globl _c
	.globl _model
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
	.globl _creaDispEne_1990
	.globl _procesaEvento_1500
	.globl _procesaEventoBanda_1880
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
_model::
	.ds 2
_c::
	.ds 2
_x::
	.ds 2
_y::
	.ds 2
_col::
	.ds 2
_cor::
	.ds 2
_puntos::
	.ds 2
_po::
	.ds 18
_seq::
	.ds 32
_dirsp::
	.ds 64
_enecount::
	.ds 16
_m::
	.ds 2
_nextm::
	.ds 2
_enesp::
	.ds 2
_k::
	.ds 2
_ta::
	.ds 2
_tb::
	.ds 2
_fps::
	.ds 2
_f1::
	.ds 2
_f2::
	.ds 2
_t::
	.ds 2
_i::
	.ds 2
_j::
	.ds 2
_muertos::
	.ds 2
_banda::
	.ds 2
_scroll::
	.ds 1
_up::
	.ds 1
_dw::
	.ds 1
_iz::
	.ds 1
_der::
	.ds 1
_fr::
	.ds 1
_modo::
	.ds 1
_pres::
	.ds 1
_bomb::
	.ds 1
_dir::
	.ds 2
_dif::
	.ds 2
_pini::
	.ds 2
_pfin1::
	.ds 2
_pfin2::
	.ds 2
_p1::
	.ds 2
_p2::
	.ds 2
_pot::
	.ds 2
_tabu::
	.ds 2
_Nbanda::
	.ds 2
_level::
	.ds 1
_vidas::
	.ds 1
_inmune::
	.ds 2
_enek::
	.ds 2
_direk::
	.ds 2
_yene::
	.ds 2
_xene::
	.ds 2
_offr::
	.ds 2
_rk::
	.ds 2
_evdir::
	.ds 2
_evtipo::
	.ds 2
_rb::
	.ds 2
_tinta::
	.ds 2
_keyb::
	.ds 1
_eneim::
	.ds 2
_enex::
	.ds 2
_eney::
	.ds 2
_enesq::
	.ds 2
_ener::
	.ds 2
_tr::
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
	_3D	== 0x645D;
	ANIMA	== 0x6fcc;
	ANIMALL	== 0x7716;
	AUTO	== 0x7184;
	AUTOALL	== 0x71d2;
	COLAY	== 0x7201;
	COLSP	== 0x73ac;
	COLSPALL	== 0x75b1;
	LAYOUT	== 0x7062;
	LOCATESP	== 0x6C71;
	MAP2SP	== 0x6499;
	MOVER	== 0x753e;
	MOVERALL	== 0x76f0;
	MUSIC	== 0x6F58;
	PEEK	== 0x6931;
	POKE	== 0x6944;
	PRINTAT	== 0x6064;
	PRINTSP	== 0x6C94;
	PRINTSPALL	== 0x62a1;
	RINK	== 0x7630;
	ROUTESP	== 0x65f7;
	ROUTEALL	== 0x65d6;
	SETLIMITS	== 0x6870;
	SETUPSP	== 0x7101;
	STARS	== 0x743c;
	UMAP	== 0x5f2f;
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
;8BP_wrapper/8BP.h:736: _8BP_moverall_inv2(dx,dy);
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
;mini_BASIC/minibasic.h:253: void _basic_sound(unsigned char nChannelStatus, int nTonePeriod, int nDuration, unsigned char nVolume, char nVolumeEnvelope, char nToneEnvelope, unsigned char nNoisePeriod) 
;	---------------------------------
; Function _basic_sound
; ---------------------------------
__basic_sound::
;mini_BASIC/minibasic.h:331: __endasm;
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
	ld	b, 1(ix)
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
;ciclo.c:79: int  main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	af
;ciclo.c:82: c=3;
	ld	hl, #0x0003
	ld	(_c), hl
;ciclo.c:83: k=0;
	ld	l, #0x00
	ld	(_k), hl
;ciclo.c:84: enesp=15;
	ld	l, #0x0f
	ld	(_enesp), hl
;ciclo.c:86: muertos=0;
;ciclo.c:87: banda=0;
	ld	l,#0x00
	ld	(_muertos),hl
	ld	(_banda), hl
;ciclo.c:88: scroll=0;
	ld	iy, #_scroll
	ld	0 (iy), #0x00
;ciclo.c:89: modo=0;
	ld	iy, #_modo
	ld	0 (iy), #0x00
;ciclo.c:90: evtipo=0;
	ld	l, #0x00
	ld	(_evtipo), hl
;ciclo.c:92: x=40;// joe x
	ld	l, #0x28
	ld	(_x), hl
;ciclo.c:93: y=16*8;//joe y
	ld	l, #0x80
	ld	(_y), hl
;ciclo.c:94: col=32;
;ciclo.c:95: cor=32;
	ld	l,#0x20
	ld	(_col),hl
	ld	(_cor), hl
;ciclo.c:98: fps=0;
;ciclo.c:99: t=0;
	ld	l,#0x00
	ld	(_fps),hl
	ld	(_t), hl
;ciclo.c:106: bomb=0;
	ld	iy, #_bomb
	ld	0 (iy), #0x00
;ciclo.c:107: pres=0;
	ld	iy, #_pres
	ld	0 (iy), #0x00
;ciclo.c:108: dir=0;
;ciclo.c:109: dif=0;
	ld	l,#0x00
	ld	(_dir),hl
	ld	(_dif), hl
;ciclo.c:112: po[1]=0;po[4]=2;po[3]=4;po[5]=6;po[2]=8;po[8]=10;po[6]=12;po[7]=14;
	ld	l, #0x00
	ld	((_po + 0x0002)), hl
	ld	l, #0x02
	ld	((_po + 0x0008)), hl
	ld	l, #0x04
	ld	((_po + 0x0006)), hl
	ld	l, #0x06
	ld	((_po + 0x000a)), hl
	ld	l, #0x08
	ld	((_po + 0x0004)), hl
	ld	l, #0x0a
	ld	((_po + 0x0010)), hl
	ld	l, #0x0c
	ld	((_po + 0x000c)), hl
	ld	l, #0x0e
	ld	((_po + 0x000e)), hl
;ciclo.c:113: seq[0]=1;seq[1]=2;seq[2]=2;seq[3]=2;seq[4]=3;seq[5]=4;seq[6]=4;seq[7]=4;seq[8]=5;
	ld	l, #0x01
	ld	(_seq), hl
	ld	l,#0x02
	ld	((_seq + 0x0002)),hl
	ld	((_seq + 0x0004)), hl
	ld	l, #0x02
	ld	((_seq + 0x0006)), hl
	ld	l, #0x03
	ld	((_seq + 0x0008)), hl
	ld	l,#0x04
	ld	((_seq + 0x000a)),hl
	ld	((_seq + 0x000c)), hl
	ld	l, #0x04
	ld	((_seq + 0x000e)), hl
	ld	l, #0x05
	ld	((_seq + 0x0010)), hl
;ciclo.c:114: seq[9]=6;seq[10]=6;seq[11]=6;seq[12]=7;seq[13]=8;seq[14]=8;seq[15]=8;
	ld	l,#0x06
	ld	((_seq + 0x0012)),hl
	ld	((_seq + 0x0014)), hl
	ld	l, #0x06
	ld	((_seq + 0x0016)), hl
	ld	l, #0x07
	ld	((_seq + 0x0018)), hl
	ld	l,#0x08
	ld	((_seq + 0x001a)),hl
	ld	((_seq + 0x001c)), hl
	ld	l, #0x08
	ld	((_seq + 0x001e)), hl
;ciclo.c:115: for (i=0;i<32;i++){
	ld	l, #0x00
	ld	(_i), hl
00280$:
;ciclo.c:116: dirsp[i]=27000+i*16;
	ld	hl, (_i)
	add	hl, hl
	ld	a, l
	add	a, #<(_dirsp)
	ld	c, a
	ld	a, h
	adc	a, #>(_dirsp)
	ld	b, a
	ld	hl, (_i)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	de, #0x6978
	add	hl, de
	ex	de,hl
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;ciclo.c:115: for (i=0;i<32;i++){
	ld	hl, (_i)
	inc	hl
	ld	(_i), hl
	ld	iy, #_i
	ld	a, 0 (iy)
	sub	a, #0x20
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00280$
;ciclo.c:118: pot=10;//potencia de 10 para medir score
	ld	hl, #0x000a
	ld	(_pot), hl
;ciclo.c:119: tabu=0;//tabulador score
	ld	l, #0x00
	ld	(_tabu), hl
;ciclo.c:120: level=0;
	ld	hl,#_level + 0
	ld	(hl), #0x00
;ciclo.c:127: inmune=_basic_peek(42547);
	ld	hl, #0xa633
	push	hl
	call	__basic_peek
	pop	af
	ld	a, l
	ld	(_inmune+0), a
	xor	a, a
	ld	(_inmune+1), a
;ciclo.c:130: pfin1=0;
	ld	hl, #0x0000
	ld	(_pfin1), hl
;ciclo.c:131: p1=0;p2=0;
	ld	l,#0x00
	ld	(_p1),hl
	ld	(_p2), hl
;ciclo.c:132: tinta=0;
	ld	l, #0x00
	ld	(_tinta), hl
;ciclo.c:136: _8BP_peek_2(42540,&puntos);
	ld	hl, #_puntos
	push	hl
	ld	hl, #0xa62c
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
;ciclo.c:137: while (pot<puntos){
00102$:
	ld	hl, #_puntos
	ld	iy, #_pot
	ld	a, 0 (iy)
	sub	a, (hl)
	ld	a, 1 (iy)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00650$
	xor	a, #0x80
00650$:
	jp	P, 00104$
;ciclo.c:138: tabu=tabu+2;pot=pot*10;
	ld	hl, (_tabu)
	inc	hl
	inc	hl
	ld	(_tabu), hl
	ld	bc, (_pot)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	(_pot), hl
	jr	00102$
00104$:
;ciclo.c:140: for (i=0;i<8;i++) enecount[i]=0;
	ld	hl, #0x0000
	ld	(_i), hl
00282$:
	ld	hl, (_i)
	add	hl, hl
	ld	de, #_enecount
	add	hl, de
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	hl, (_i)
	inc	hl
	ld	(_i), hl
	ld	iy, #_i
	ld	a, 0 (iy)
	sub	a, #0x08
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00282$
;ciclo.c:142: _8BP_printat_4(0,8,6-tabu,_basic_str(puntos));
	ld	hl, (_puntos)
	push	hl
	call	__basic_str
	pop	af
	ex	de,hl
	ld	hl, #_tabu
	ld	a, #0x06
	sub	a, (hl)
	ld	c, a
	ld	a, #0x00
	inc	hl
	sbc	a, (hl)
	ld	b, a
	push	de
	push	bc
	ld	hl, #0x0008
	push	hl
	ld	l, #0x00
	push	hl
	call	__8BP_printat_4
	pop	af
	pop	af
	pop	af
;ciclo.c:144: level=_basic_peek(42544);
	ld	hl, #0xa630
	ex	(sp),hl
	call	__basic_peek
	pop	af
	ld	a, l
	ld	(_level+0), a
;ciclo.c:145: vidas=_basic_peek(42545);
	ld	hl, #0xa631
	push	hl
	call	__basic_peek
	pop	af
	ld	a, l
	ld	(_vidas+0), a
;ciclo.c:146: keyb=_basic_peek(42546);
	ld	hl, #0xa632
	push	hl
	call	__basic_peek
	pop	af
	ld	a, l
	ld	(_keyb+0), a
;ciclo.c:148: Nbanda= level*8+16;//numero de nazis en final fase
	ld	hl,#_level + 0
	ld	e, (hl)
	ld	d, #0x00
	ld	c, e
	ld	b, d
	sla	c
	rl	b
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl, #0x0010
	add	hl, bc
	ld	(_Nbanda), hl
;ciclo.c:151: if (keyb==0) {up=67;dw=69;fr=47;iz=34;der=27;}
	ld	a,(#_keyb + 0)
	or	a, a
	jr	NZ,00107$
	ld	hl,#_up + 0
	ld	(hl), #0x43
	ld	hl,#_dw + 0
	ld	(hl), #0x45
	ld	hl,#_fr + 0
	ld	(hl), #0x2f
	ld	hl,#_iz + 0
	ld	(hl), #0x22
	ld	hl,#_der + 0
	ld	(hl), #0x1b
	jr	00108$
00107$:
;ciclo.c:152: else {up=72;dw=73;fr=76;iz=74;der=75;}
	ld	hl,#_up + 0
	ld	(hl), #0x48
	ld	hl,#_dw + 0
	ld	(hl), #0x49
	ld	hl,#_fr + 0
	ld	(hl), #0x4c
	ld	hl,#_iz + 0
	ld	(hl), #0x4a
	ld	hl,#_der + 0
	ld	(hl), #0x4b
00108$:
;ciclo.c:154: _8BP_peek_2(42550+level*6,&evdir);
	ld	bc, #_evdir
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #0xa636
	add	hl, de
	push	bc
	push	hl
	call	__8BP_peek_2
	pop	af
;ciclo.c:157: if (_basic_peek(42548)==1){
	ld	hl, #0xa634
	ex	(sp),hl
	call	__basic_peek
	pop	af
	dec	l
	jr	NZ,00110$
;ciclo.c:158: _8BP_peek_2(42574+level*4+2,&m);//cambia el m inicial
	ld	bc, #_m+0
	ld	iy, #_level
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #0xa650
	add	hl, de
	push	bc
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
;ciclo.c:159: _8BP_peek_2(42574+level*4,&evdir);//cambia la direccion inicial de eventos
	ld	bc, #_evdir
	ld	iy, #_level
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #0xa64e
	add	hl, de
	push	bc
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
	jr	00111$
00110$:
;ciclo.c:164: m=0; 
	ld	hl, #0x0000
	ld	(_m), hl
00111$:
;ciclo.c:168: _8BP_peek_2(evdir,&nextm); //obtiene el siguiente m 
	ld	hl, #_nextm
	push	hl
	ld	hl, (_evdir)
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
;ciclo.c:171: evtipo=0;
	ld	hl, #0x0000
	ld	(_evtipo), hl
;ciclo.c:173: yene=0;xene=0;
	ld	l,#0x00
	ld	(_yene),hl
	ld	(_xene), hl
;ciclo.c:174: rk=0;
	ld	l, #0x00
	ld	(_rk), hl
;ciclo.c:176: i=28;//disparo
	ld	l, #0x1c
	ld	(_i), hl
;ciclo.c:177: j=29;//bomba
	ld	l, #0x1d
	ld	(_j), hl
;ciclo.c:179: ta=_basic_time();
	call	__basic_time
	ld	(_ta), hl
;ciclo.c:182: _8BP_printspall_4(0,0,1,0);
	ld	hl, #0x0000
	push	hl
	ld	l, #0x01
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x00
	push	hl
	call	__8BP_printspall_4
	pop	af
	pop	af
	pop	af
;ciclo.c:183: _8BP_colspall_2(&cor,&col);
	ld	hl, #_col
	ex	(sp),hl
	ld	hl, #_cor
	push	hl
	call	__8BP_colspall_2
	pop	af
	pop	af
;ciclo.c:184: _8BP_colsp_3(32,0,22);
	ld	hl, #0x0016
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x20
	push	hl
	call	__8BP_colsp_3
	pop	af
	pop	af
;ciclo.c:185: _8BP_autoall_1(1);
	ld	hl, #0x0001
	ex	(sp),hl
	call	__8BP_autoall_1
	pop	af
;ciclo.c:190: label_CICLO:
00112$:
;ciclo.c:191: c=c+1;
	ld	hl, (_c)
	inc	hl
	ld	(_c), hl
;ciclo.c:194: if (c & 7) goto label_710;
	ld	a,(#_c + 0)
	and	a, #0x07
	jr	NZ,00120$
;ciclo.c:213: creaDispEne_1990();
	call	_creaDispEne_1990
;ciclo.c:216: if (banda) {
	ld	iy, #_banda
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	Z,00120$
;ciclo.c:217: if (c & 15) goto label_740;
	ld	a,(#_c + 0)
	and	a, #0x0f
	jr	NZ,00123$
;ciclo.c:218: else procesaEventoBanda_1880();
	call	_procesaEventoBanda_1880
;ciclo.c:219: goto label_740;
	jr	00123$
;ciclo.c:225: label_710:
00120$:
;ciclo.c:227: if (m==nextm) procesaEvento_1500();
	ld	a,(#_m + 0)
	ld	iy, #_nextm
	sub	a, 0 (iy)
	jr	NZ,00123$
	ld	a,(#_m + 1)
	ld	iy, #_nextm
	sub	a, 1 (iy)
	jr	NZ,00123$
	call	_procesaEvento_1500
;ciclo.c:229: label_740:  
00123$:
;ciclo.c:232: if (_basic_inkey(up)>0) goto label_840;
	ld	a, (_up)
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jp	NZ, 00154$
;ciclo.c:233: else if (y>0) goto label_750;
	xor	a, a
	ld	iy, #_y
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00661$
	xor	a, #0x80
00661$:
	jp	P, 00173$
;ciclo.c:237: t=1; if (y>120) goto label_820;
	ld	hl, #0x0001
	ld	(_t), hl
;ciclo.c:244: if (x>31){
	ld	a, #0x1f
	ld	iy, #_x
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00662$
	xor	a, #0x80
00662$:
	rlca
	and	a,#0x01
	ld	b, a
;ciclo.c:245: if (x<42){
	ld	iy, #_x
	ld	a, 0 (iy)
	sub	a, #0x2a
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	ld	a, #0x00
	rla
	ld	c, a
;ciclo.c:237: t=1; if (y>120) goto label_820;
	ld	a, #0x78
	ld	iy, #_y
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00663$
	xor	a, #0x80
00663$:
	jp	M, 00144$
;ciclo.c:240: if (scroll>0) goto label_820;
	ld	a,(#_scroll + 0)
	or	a, a
	jp	NZ, 00144$
;ciclo.c:243: if (modo>0) {
	ld	a,(#_modo + 0)
	or	a, a
	jr	Z,00140$
;ciclo.c:244: if (x>31){
	ld	a, b
	or	a, a
	jr	Z,00140$
;ciclo.c:245: if (x<42){
	ld	a, c
	or	a, a
	jr	Z,00140$
;ciclo.c:246: m=m+3;_8BP_map2sp_2(m,0);_8BP_moverall_2(3,0); goto label_880;
	ld	hl, #_m
	ld	a, (hl)
	add	a, #0x03
	ld	(hl), a
	jr	NC,00664$
	inc	hl
	inc	(hl)
00664$:
	ld	hl, #0x0000
	push	hl
	ld	hl, (_m)
	push	hl
	call	__8BP_map2sp_2
	pop	af
	pop	af
	ld	hl, #0x0000
	push	hl
	ld	l, #0x03
	push	hl
	call	__8BP_moverall_2
	pop	af
	pop	af
	jp	00173$
00140$:
;ciclo.c:251: _8BP_mover_3(31,-3,0);_8BP_colsp_1(31);
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xfffd
	push	hl
	ld	hl, #0x001f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	ld	hl, #0x001f
	ex	(sp),hl
	call	__8BP_colsp_1
	pop	af
;ciclo.c:253: if (col>22) {
	ld	a, #0x16
	ld	iy, #_col
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00665$
	xor	a, #0x80
00665$:
	jp	P, 00142$
;ciclo.c:254: m=m+3;
	ld	hl, #_m
	ld	a, (hl)
	add	a, #0x03
	ld	(hl), a
	jr	NC,00666$
	inc	hl
	inc	(hl)
00666$:
;ciclo.c:255: _8BP_map2sp_2(m,0);
	ld	hl, #0x0000
	push	hl
	ld	hl, (_m)
	push	hl
	call	__8BP_map2sp_2
	pop	af
	pop	af
;ciclo.c:256: _8BP_moverall_2(3,0);  
	ld	hl, #0x0000
	push	hl
	ld	l, #0x03
	push	hl
	call	__8BP_moverall_2
	pop	af
	pop	af
;ciclo.c:257: goto label_880;
	jp	00173$
00142$:
;ciclo.c:260: _8BP_mover_3(31,3,0);goto label_880;
	ld	hl, #0x0000
	push	hl
	ld	l, #0x03
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
	jp	00173$
;ciclo.c:264: label_820:
00144$:
;ciclo.c:265: if (modo>0){
	ld	a,(#_modo + 0)
	or	a, a
	jr	Z,00150$
;ciclo.c:266: if (x>31){
	ld	a, b
	or	a, a
	jr	Z,00150$
;ciclo.c:267: if (x<42){
	ld	a, c
	or	a, a
	jr	Z,00150$
;ciclo.c:268: y=y-2;goto label_880;
	ld	hl, (_y)
	dec	hl
	dec	hl
	ld	(_y), hl
	jp	00173$
00150$:
;ciclo.c:272: _8BP_mover_3(31,-2,0);_8BP_colsp_1(31);
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xfffe
	push	hl
	ld	hl, #0x001f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	ld	hl, #0x001f
	ex	(sp),hl
	call	__8BP_colsp_1
	pop	af
;ciclo.c:274: if (col>22){
	ld	a, #0x16
	ld	iy, #_col
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00667$
	xor	a, #0x80
00667$:
	jp	P, 00152$
;ciclo.c:275: y=y-2;
	ld	hl, (_y)
	dec	hl
	dec	hl
	ld	(_y), hl
;ciclo.c:276: goto label_880;
	jp	00173$
00152$:
;ciclo.c:279: _8BP_mover_3(31,2,0);
	ld	hl, #0x0000
	push	hl
	ld	l, #0x02
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
;ciclo.c:280: goto label_880;
	jp	00173$
;ciclo.c:283: label_840:
00154$:
;ciclo.c:284: if (_basic_inkey(dw)>0) goto label_880;
	ld	a, (_dw)
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jp	NZ, 00173$
;ciclo.c:285: t=2; if (modo>0){
	ld	hl, #0x0002
	ld	(_t), hl
;ciclo.c:286: if (y<180){
	ld	iy, #_y
	ld	a, 0 (iy)
	sub	a, #0xb4
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	ld	a, #0x00
	rla
	ld	c, a
;ciclo.c:285: t=2; if (modo>0){
	ld	a,(#_modo + 0)
	or	a, a
	jp	Z, 00167$
;ciclo.c:286: if (y<180){
	ld	a, c
	or	a, a
	jp	Z, 00167$
;ciclo.c:287: if (x>31 && x<42){
	ld	a, #0x1f
	ld	iy, #_x
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00668$
	xor	a, #0x80
00668$:
	jp	P, 00161$
	ld	iy, #_x
	ld	a, 0 (iy)
	sub	a, #0x2a
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00161$
;ciclo.c:288: y=y+2;
	ld	hl, (_y)
	inc	hl
	inc	hl
	ld	(_y), hl
;ciclo.c:289: goto label_880;
	jp	00173$
00161$:
;ciclo.c:292: _8BP_mover_3(31,2,0);_8BP_colsp_1(31);
	ld	hl, #0x0000
	push	hl
	ld	l, #0x02
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	ld	hl, #0x001f
	ex	(sp),hl
	call	__8BP_colsp_1
	pop	af
;ciclo.c:294: if (col>22) {
	ld	a, #0x16
	ld	iy, #_col
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00669$
	xor	a, #0x80
00669$:
	jp	P, 00158$
;ciclo.c:295: y=y+2;
	ld	hl, (_y)
	inc	hl
	inc	hl
	ld	(_y), hl
;ciclo.c:296: goto label_880;
	jr	00173$
00158$:
;ciclo.c:299: _8BP_mover_3(31,-2,0);
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xfffe
	push	hl
	ld	hl, #0x001f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
;ciclo.c:300: goto label_880;
	jr	00173$
00167$:
;ciclo.c:306: if (y<180){
	ld	a, c
	or	a, a
	jr	Z,00173$
;ciclo.c:307: _8BP_mover_3(31,2,0);
	ld	hl, #0x0000
	push	hl
	ld	l, #0x02
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
;ciclo.c:308: _8BP_colsp_1(31);
	ld	hl, #0x001f
	ex	(sp),hl
	call	__8BP_colsp_1
	pop	af
;ciclo.c:310: if (col>22){
	ld	a, #0x16
	ld	iy, #_col
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00670$
	xor	a, #0x80
00670$:
	jp	P, 00169$
;ciclo.c:311: y=y+2;
	ld	hl, (_y)
	inc	hl
	inc	hl
	ld	(_y), hl
	jr	00173$
00169$:
;ciclo.c:314: _8BP_mover_3(31,-2,0);
	ld	hl, #0x0000
	push	hl
	ld	hl, #0xfffe
	push	hl
	ld	hl, #0x001f
	push	hl
	call	__8BP_mover_3
	pop	af
	pop	af
	pop	af
;ciclo.c:318: label_880:
00173$:
;ciclo.c:319: if (_basic_inkey(der)>0) goto label_910;
	ld	a, (_der)
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jp	NZ, 00189$
;ciclo.c:321: t=t+3;
	ld	hl, #_t
	ld	a, (hl)
	add	a, #0x03
	ld	(hl), a
	jr	NC,00671$
	inc	hl
	inc	(hl)
00671$:
;ciclo.c:322: if (x<65) goto label_890;
	ld	iy, #_x
	ld	a, 0 (iy)
	sub	a, #0x41
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00208$
;ciclo.c:326: if (modo>0) {
	ld	a,(#_modo + 0)
	or	a, a
	jr	Z,00185$
;ciclo.c:327: if (x>31 && x<41){
	ld	a, #0x1f
	ld	iy, #_x
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00672$
	xor	a, #0x80
00672$:
	jp	P, 00185$
	ld	iy, #_x
	ld	a, 0 (iy)
	sub	a, #0x29
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00185$
;ciclo.c:328: x=x+1;
	ld	hl, (_x)
	inc	hl
	ld	(_x), hl
;ciclo.c:329: goto label_960;
	jp	00208$
00185$:
;ciclo.c:334: _8BP_mover_3(31,0,1);_8BP_colsp_1(31);
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
	call	__8BP_colsp_1
	pop	af
;ciclo.c:336: if (col>22){
	ld	a, #0x16
	ld	iy, #_col
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00673$
	xor	a, #0x80
00673$:
	jp	P, 00208$
;ciclo.c:337: x=x+1;goto label_960;
	ld	hl, (_x)
	inc	hl
	ld	(_x), hl
	jp	00208$
;ciclo.c:340: label_910:
00189$:
;ciclo.c:341: if (_basic_inkey(iz)>0) goto label_950;
	ld	a, (_iz)
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jp	NZ, 00204$
;ciclo.c:343: t=t+6; if (x>8) goto label_920;
	ld	hl, #_t
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
	jr	NC,00674$
	inc	hl
	inc	(hl)
00674$:
	ld	a, #0x08
	ld	iy, #_x
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00675$
	xor	a, #0x80
00675$:
	jp	P, 00204$
;ciclo.c:348: if (modo>0) {
	ld	a,(#_modo + 0)
	or	a, a
	jr	Z,00201$
;ciclo.c:349: if(x>33 && x<42){
	ld	a, #0x21
	ld	iy, #_x
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00676$
	xor	a, #0x80
00676$:
	jp	P, 00201$
	ld	iy, #_x
	ld	a, 0 (iy)
	sub	a, #0x2a
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00201$
;ciclo.c:350: x=x-1;goto label_960;
	ld	hl, (_x)
	dec	hl
	ld	(_x), hl
	jr	00208$
00201$:
;ciclo.c:354: _8BP_mover_3(31,0,-1);_8BP_colsp_1(31); if (col>22) x=x-1;
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
	call	__8BP_colsp_1
	pop	af
	ld	a, #0x16
	ld	iy, #_col
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00677$
	xor	a, #0x80
00677$:
	jp	P, 00204$
	ld	hl, (_x)
	dec	hl
	ld	(_x), hl
;ciclo.c:357: label_950:
00204$:
;ciclo.c:358: if (t!=0) goto label_960;else goto label_1070;
	ld	iy, #_t
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jp	Z, 00223$
;ciclo.c:360: label_960:
00208$:
;ciclo.c:362: dif=dir-po[t];t=0;
	ld	hl, (_t)
	add	hl, hl
	ld	de, #_po
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #_dif
	ld	iy, #_dir
	ld	a, 0 (iy)
	sub	a, c
	ld	(hl), a
	ld	a, 1 (iy)
	sbc	a, b
	inc	hl
	ld	(hl), a
	ld	hl, #0x0000
	ld	(_t), hl
;ciclo.c:363: if (dif!=0) goto label_980;else goto label_1040;
	ld	iy, #_dif
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jp	Z, 00222$
;ciclo.c:368: dir=dir-1; goto label_1010;
	ld	bc, (_dir)
	dec	bc
;ciclo.c:371: dir=dir+1;goto label_1020;
	ld	hl, (_dir)
	inc	hl
	ex	(sp), hl
;ciclo.c:366: if (dif<0){
	bit	7,1 (iy)
	jr	Z,00217$
;ciclo.c:367: if (dif<-8){
	ld	a, 0 (iy)
	sub	a, #0xf8
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x7f
	jr	NC,00214$
;ciclo.c:368: dir=dir-1; goto label_1010;
	ld	(_dir), bc
	jr	00220$
00214$:
;ciclo.c:371: dir=dir+1;goto label_1020;
	ld	de, #_dir
	ld	hl, #0
	add	hl, sp
	ldi
	ldi
	jr	00221$
00217$:
;ciclo.c:374: if (dif>8) {
	ld	a, #0x08
	ld	iy, #_dif
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00678$
	xor	a, #0x80
00678$:
	jp	P, 00219$
;ciclo.c:375: dir=(1+dir) & 15; goto label_1020; // a lo mejor puedo quitar los parentesis
	ld	hl, #0+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x0f
	ld	(_dir+0), a
	ld	hl,#_dir + 1
	ld	(hl), #0x00
	jr	00221$
00219$:
;ciclo.c:377: dir=dir-1;
	ld	(_dir), bc
;ciclo.c:379: label_1010:
00220$:
;ciclo.c:380: dir=dir & 15;
	ld	iy, #_dir
	ld	a, 0 (iy)
	and	a, #0x0f
	ld	(_dir+0), a
	ld	1 (iy), #0x00
;ciclo.c:382: label_1020:
00221$:
;ciclo.c:383: _8BP_setupsp_3(31,7,seq[dir]);
	ld	hl, (_dir)
	add	hl, hl
	ld	de, #_seq
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #0x0007
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:386: label_1040:
00222$:
;ciclo.c:387: _8BP_anima_1(31);
	ld	hl, #0x001f
	push	hl
	call	__8BP_anima_1
	pop	af
;ciclo.c:388: _8BP_locatesp_3(31,y,x);
	ld	hl, (_x)
	push	hl
	ld	hl, (_y)
	push	hl
	ld	a, #0x1f
	push	af
	inc	sp
	call	__8BP_locatesp_3
	pop	af
	pop	af
	inc	sp
;ciclo.c:391: label_1070:
00223$:
;ciclo.c:392: if (_basic_inkey(fr)>0){
	ld	a, (_fr)
	push	af
	inc	sp
	call	__basic_inkey
	inc	sp
	ld	a, l
	or	a, a
	jr	Z,00228$
;ciclo.c:393: if (pres>0){
	ld	iy, #_pres
	ld	a, 0 (iy)
	or	a, a
	jp	Z, 00235$
;ciclo.c:394: pres=0;bomb=0;goto label_1160;
	ld	0 (iy), #0x00
	ld	hl,#_bomb + 0
	ld	(hl), #0x00
	jr	00235$
;ciclo.c:396: else goto label_1160;
00228$:
;ciclo.c:398: if (pres>0){
	ld	a,(#_pres + 0)
	or	a, a
	jr	Z,00233$
;ciclo.c:399: bomb=bomb+1;
	ld	iy, #_bomb
	ld	a, 0 (iy)
	inc	a
	ld	(_bomb+0), a
;ciclo.c:400: if (bomb<8) goto label_1160;
	ld	a, 0 (iy)
	sub	a, #0x08
	jp	NC, 00276$
	jr	00235$
;ciclo.c:401: else goto label_1430;
00233$:
;ciclo.c:403: i=23+ (i % 6);
	ld	hl, #0x0006
	push	hl
	ld	hl, (_i)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	bc,#0x0017
	add	hl,bc
	ld	(_i), hl
;ciclo.c:406: _8BP_setupsp_3(i,15,dir);
	ld	hl, (_dir)
	push	hl
	ld	hl, #0x000f
	push	hl
	ld	hl, (_i)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:407: _8BP_locatesp_3(i,y+4,x+2);
	ld	de, (_x)
	inc	de
	inc	de
	ld	iy, #_y
	ld	a, 0 (iy)
	add	a, #0x04
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	ld	a,(#_i + 0)
	push	de
	push	bc
	push	af
	inc	sp
	call	__8BP_locatesp_3
	pop	af
	pop	af
	inc	sp
;ciclo.c:408: _8BP_setupsp_3(i,0,233);
	ld	hl, #0x00e9
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, (_i)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:409: pres=1;
	ld	hl,#_pres + 0
	ld	(hl), #0x01
;ciclo.c:412: label_1160:
00235$:
;ciclo.c:413: _8BP_autoall();
	call	__8BP_autoall
;ciclo.c:414: if (modo>0) goto label_1200;
	ld	a,(#_modo + 0)
	or	a, a
	jr	NZ,00238$
;ciclo.c:417: _8BP_printspall();goto label_1230;
	call	__8BP_printspall
	jp	00242$
;ciclo.c:421: label_1200:
00238$:
;ciclo.c:422: if (m>pfin1) {
	ld	hl, #_pfin1
	ld	a, (hl)
	ld	iy, #_m
	sub	a, 0 (iy)
	inc	hl
	ld	a, (hl)
	sbc	a, 1 (iy)
	jp	PO, 00679$
	xor	a, #0x80
00679$:
	jp	P, 00240$
;ciclo.c:423: _8BP_setlimits_4(8,72,0,m+p2);
	ld	hl, #_p2
	ld	iy, #_m
	ld	a, 0 (iy)
	add	a, (hl)
	ld	c, a
	ld	a, 1 (iy)
	inc	hl
	adc	a, (hl)
	ld	b, a
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, #0x48
	push	hl
	ld	l, #0x08
	push	hl
	call	__8BP_setlimits_4
	pop	af
	pop	af
	pop	af
	pop	af
	jr	00241$
00240$:
;ciclo.c:425: _8BP_setlimits_4(8,72,m+p1,200);
	ld	hl, #_p1
	push	de
	ld	iy, #2
	add	iy, sp
	push	iy
	pop	de
	ld	iy, #_m
	ld	a, 0 (iy)
	add	a, (hl)
	ld	(de), a
	ld	a, 1 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de), a
	pop	de
	ld	hl, #0x00c8
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	hl, #0x0048
	push	hl
	ld	l, #0x08
	push	hl
	call	__8BP_setlimits_4
	pop	af
	pop	af
	pop	af
	pop	af
00241$:
;ciclo.c:427: _8BP_printsp_1(31);_8BP_setlimits_4(8,72,0,200);_8BP_printspall();
	ld	hl, #0x001f
	push	hl
	call	__8BP_printsp_1
	pop	af
	ld	hl, #0x00c8
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x48
	push	hl
	ld	l, #0x08
	push	hl
	call	__8BP_setlimits_4
	pop	af
	pop	af
	pop	af
	pop	af
	call	__8BP_printspall
;ciclo.c:430: label_1230:
00242$:
;ciclo.c:431: if (c & 1) {
	ld	hl,#_c+0
	bit	0, (hl)
	jr	Z,00246$
;ciclo.c:433: _8BP_colspall();
	call	__8BP_colspall
;ciclo.c:434: if (cor==32) goto label_CICLO;
	ld	iy, #_cor
	ld	a, 0 (iy)
	sub	a, #0x20
	or	a, 1 (iy)
	jp	Z,00112$
	jr	00247$
	jp	00112$
00246$:
;ciclo.c:436: cor=32;goto label_CICLO;
	ld	hl, #0x0020
	ld	(_cor), hl
	jp	00112$
00247$:
;ciclo.c:438: if (cor==31) goto label_1360;
	ld	iy, #_cor
	ld	a, 0 (iy)
	sub	a, #0x1f
	or	a, 1 (iy)
	jp	Z,00268$
;ciclo.c:440: if (cor<29){
	ld	a, 0 (iy)
	sub	a, #0x1d
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00252$
;ciclo.c:441: _8BP_setupsp_3(cor,0,69);_8BP_setupsp_3(cor,7,9);//fire
	ld	hl, #0x0045
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, (_cor)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ld	hl, #0x0009
	push	hl
	ld	l, #0x07
	push	hl
	ld	hl, (_cor)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
00252$:
;ciclo.c:444: if (col<15) goto label_CICLO;//disparo a decorado <11 o disp <15
	ld	iy, #_col
	ld	a, 0 (iy)
	sub	a, #0x0f
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00112$
;ciclo.c:445: puntos=puntos+5;if (puntos==pot) {
	ld	hl, #_puntos
	ld	a, (hl)
	add	a, #0x05
	ld	(hl), a
	jr	NC,00684$
	inc	hl
	inc	(hl)
00684$:
	ld	a,(#_puntos + 0)
	ld	iy, #_pot
	sub	a, 0 (iy)
	jr	NZ,00256$
	ld	a,(#_puntos + 1)
	ld	iy, #_pot
	sub	a, 1 (iy)
	jr	NZ,00256$
;ciclo.c:446: tabu=tabu+2;pot=pot*10;
	ld	hl, (_tabu)
	inc	hl
	inc	hl
	ld	(_tabu), hl
	ld	bc, (_pot)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	(_pot), hl
00256$:
;ciclo.c:448: _8BP_printat_4(0,8,6-tabu,_basic_str(puntos));
	ld	hl, (_puntos)
	push	hl
	call	__basic_str
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #_tabu
	ld	a, #0x06
	sub	a, (hl)
	ld	e, a
	ld	a, #0x00
	inc	hl
	sbc	a, (hl)
	ld	d, a
	push	bc
	push	de
	ld	hl, #0x0008
	push	hl
	ld	l, #0x00
	push	hl
	call	__8BP_printat_4
	pop	af
	pop	af
	pop	af
	pop	af
;ciclo.c:449: if (_basic_peek(dirsp[col])<128) goto label_1320;
	ld	hl, (_col)
	add	hl, hl
	ld	de, #_dirsp
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__basic_peek
	pop	af
	ld	a, l
	sub	a, #0x80
	jr	C,00263$
;ciclo.c:453: _8BP_setupsp_3(col,7,15);_8BP_setupsp_3(col,0,85);
	ld	hl, #0x000f
	push	hl
	ld	l, #0x07
	push	hl
	ld	hl, (_col)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ld	hl, #0x0055
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, (_col)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:454: if (banda>0) {
	xor	a, a
	ld	iy, #_banda
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00687$
	xor	a, #0x80
00687$:
	jp	P, 00112$
;ciclo.c:455: muertos=muertos+1;
	ld	hl, (_muertos)
	inc	hl
	ld	(_muertos), hl
;ciclo.c:456: if (muertos==Nbanda){
	ld	a,(#_muertos + 0)
	ld	iy, #_Nbanda
	sub	a, 0 (iy)
	jp	NZ,00112$
	ld	a,(#_muertos + 1)
	ld	iy, #_Nbanda
	sub	a, 1 (iy)
	jp	NZ,00112$
;ciclo.c:457: level=level+1; 
	ld	a,(#_level + 0)
	inc	a
	ld	(_level+0), a
;ciclo.c:458: _basic_poke(42548,0);//para resetear el comienzo a mitad
	xor	a, a
	push	af
	inc	sp
	ld	hl, #0xa634
	push	hl
	call	__basic_poke
	pop	af
	inc	sp
;ciclo.c:459: goto label_FIN;
	jp	00279$
;ciclo.c:465: label_1320:
00263$:
;ciclo.c:466: if (cor<29) {
	ld	iy, #_cor
	ld	a, 0 (iy)
	sub	a, #0x1d
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00267$
;ciclo.c:467: enecount[col-15]=enecount[col-15]-1;if (enecount[col-15]>0) goto label_CICLO;
	ld	iy, #_col
	ld	a, 0 (iy)
	add	a, #0xf1
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	bc,#_enecount
	add	hl,bc
	ex	de, hl
	ld	l, e
	ld	h, d
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	ld	a, c
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	ld	a, 0 (iy)
	add	a, #0xf1
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_enecount
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00690$
	xor	a, #0x80
00690$:
	jp	M, 00112$
00267$:
;ciclo.c:469: _8BP_setupsp_3(col,7,10);
	ld	hl, #0x000a
	push	hl
	ld	l, #0x07
	push	hl
	ld	hl, (_col)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:470: _8BP_setupsp_3(col,0,85);
	ld	hl, #0x0055
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, (_col)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:471: goto label_CICLO;  
	jp	00112$
;ciclo.c:474: label_1360:
00268$:
;ciclo.c:475: if (col<11) goto label_CICLO;
	ld	iy, #_col
	ld	a, 0 (iy)
	sub	a, #0x0b
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00112$
;ciclo.c:477: if (inmune==1) goto label_CICLO;
	ld	iy, #_inmune
	ld	a, 0 (iy)
	dec	a
	or	a, 1 (iy)
	jp	Z,00112$
;ciclo.c:478: _8BP_setupsp_3(col,0,65);
	ld	hl, #0x0041
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, (_col)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:479: vidas=vidas-1;_8BP_music();
	ld	a,(#_vidas + 0)
	ld	hl, #_vidas
	add	a, #0xff
	ld	(hl), a
	call	__8BP_music
;ciclo.c:480: _8BP_setupsp_3(31,0,64);
	ld	hl, #0x0040
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:482: for (int i=y;i<=y+25;i++){
	ld	bc, (_y)
00285$:
	ld	iy, #_y
	ld	a, 0 (iy)
	add	a, #0x19
	ld	e, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	d, a
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00692$
	xor	a, #0x80
00692$:
	jp	M, 00273$
;ciclo.c:484: _8BP_autoall();_8BP_printspall();
	push	bc
	call	__8BP_autoall
	call	__8BP_printspall
	pop	bc
;ciclo.c:486: _8BP_setlimits_4(8,72,y,y+25);
	ld	iy, #_y
	ld	a, 0 (iy)
	add	a, #0x19
	ld	e, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	d, a
	push	bc
	push	de
	ld	hl, (_y)
	push	hl
	ld	hl, #0x0048
	push	hl
	ld	l, #0x08
	push	hl
	call	__8BP_setlimits_4
	pop	af
	pop	af
	pop	af
	pop	af
	pop	bc
;ciclo.c:487: _8BP_printsp_3(31,i,x);
	push	bc
	ld	hl, (_x)
	push	hl
	push	bc
	ld	hl, #0x001f
	push	hl
	call	__8BP_printsp_3
	pop	af
	pop	af
	pop	af
	pop	bc
;ciclo.c:488: _basic_sound(1,i*5,5,14,0,0,0);
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	push	bc
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	ld	d,a
	ld	e,#0x0e
	push	de
	ld	de, #0x0005
	push	de
	push	hl
	ld	a, #0x01
	push	af
	inc	sp
	call	__basic_sound
	ld	hl, #9
	add	hl, sp
	ld	sp, hl
	ld	hl, #0x00c8
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x48
	push	hl
	ld	l, #0x08
	push	hl
	call	__8BP_setlimits_4
	pop	af
	pop	af
	pop	af
	pop	af
	pop	bc
;ciclo.c:482: for (int i=y;i<=y+25;i++){
	inc	bc
	jp	00285$
00273$:
;ciclo.c:492: if (m>800) _basic_poke(42548,1);//para empezar mas tarde
	ld	a, #0x20
	ld	iy, #_m
	cp	a, 0 (iy)
	ld	a, #0x03
	sbc	a, 1 (iy)
	jp	PO, 00693$
	xor	a, #0x80
00693$:
	jp	P, 00279$
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #0xa634
	push	hl
	call	__basic_poke
	pop	af
	inc	sp
;ciclo.c:493: goto label_FIN;
	jr	00279$
;ciclo.c:497: label_1430:
00276$:
;ciclo.c:498: j=29+ (j % 2) ; if (_basic_peek(dirsp[j])>0) goto label_1160;
	ld	hl, #0x0002
	push	hl
	ld	hl, (_j)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	bc,#0x001d
	add	hl,bc
	ld	(_j), hl
	add	hl, hl
	ld	de, #_dirsp
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__basic_peek
	pop	af
	ld	a, l
	or	a, a
	jp	NZ, 00235$
;ciclo.c:499: _8BP_setupsp_3(j,15,16);
	ld	hl, #0x0010
	push	hl
	ld	l, #0x0f
	push	hl
	ld	hl, (_j)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:500: _8BP_locatesp_3(j,y,x+1);
	ld	bc, (_x)
	inc	bc
	ld	hl,#_j + 0
	ld	d, (hl)
	push	bc
	ld	hl, (_y)
	push	hl
	push	de
	inc	sp
	call	__8BP_locatesp_3
	pop	af
	pop	af
	inc	sp
;ciclo.c:501: _8BP_setupsp_3(j,0,128+64+8+1+16);//no colisionador
	ld	hl, #0x00d9
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, (_j)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:502: bomb=0;
	ld	hl,#_bomb + 0
	ld	(hl), #0x00
;ciclo.c:503: goto label_1160;
	jp	00235$
;ciclo.c:510: label_FIN:
00279$:
;ciclo.c:512: _8BP_poke_2(42540,puntos);
	ld	hl, (_puntos)
	push	hl
	ld	hl, #0xa62c
	push	hl
	call	__8BP_poke_2
	pop	af
	pop	af
;ciclo.c:513: _basic_poke(42544,level);
	ld	a, (_level)
	push	af
	inc	sp
	ld	hl, #0xa630
	push	hl
	call	__basic_poke
	pop	af
	inc	sp
;ciclo.c:514: _basic_poke(42545,vidas);
	ld	a, (_vidas)
	push	af
	inc	sp
	ld	hl, #0xa631
	push	hl
	call	__basic_poke
	pop	af
	inc	sp
;ciclo.c:519: return 0;
	ld	hl, #0x0000
;ciclo.c:520: }
	pop	af
	ret
;ciclo.c:522: void creaDispEne_1990() {
;	---------------------------------
; Function creaDispEne_1990
; ---------------------------------
_creaDispEne_1990::
;ciclo.c:523: k=11 + k % 4;
	ld	hl, #0x0004
	push	hl
	ld	hl, (_k)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	bc,#0x000b
	add	hl,bc
;ciclo.c:524: if (_basic_peek(dirsp[k])>0) return;
	ld	(_k), hl
	add	hl, hl
	ld	de, #_dirsp
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__basic_peek
	pop	af
	ld	a, l
	or	a, a
	ret	NZ
;ciclo.c:525: enek=15+enek %8;direk=dirsp[enek];
	ld	hl, #0x0008
	push	hl
	ld	hl, (_enek)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	bc,#0x000f
	add	hl,bc
	ld	(_enek), hl
	add	hl, hl
	ld	de, #_dirsp
	add	hl, de
	ld	a, (hl)
	ld	(_direk+0), a
	inc	hl
	ld	a, (hl)
	ld	(_direk+1), a
;ciclo.c:526: if (_basic_peek(direk)>0) goto label_2030;
	ld	hl, (_direk)
	push	hl
	call	__basic_peek
	pop	af
	ld	a, l
	or	a, a
;ciclo.c:527: else return;
;ciclo.c:529: label_2030:
	ret	Z
;ciclo.c:530: yene=0;_8BP_peek_2(direk+1,&yene);xene=_basic_peek(direk+3);
	ld	hl, #0x0000
	ld	(_yene), hl
	ld	bc, #_yene+0
	ld	hl, (_direk)
	inc	hl
	push	bc
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
	ld	hl, (_direk)
	inc	hl
	inc	hl
	inc	hl
	push	hl
	call	__basic_peek
	pop	af
	ld	a, l
	ld	(_xene+0), a
	xor	a, a
	ld	(_xene+1), a
;ciclo.c:531: _8BP_setupsp_3(k,0,128+64+8+2+1);
	ld	hl, #0x00cb
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, (_k)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:532: _8BP_locatesp_3(k,yene,xene);offr=31;
	ld	hl,#_k + 0
	ld	b, (hl)
	ld	hl, (_xene)
	push	hl
	ld	hl, (_yene)
	push	hl
	push	bc
	inc	sp
	call	__8BP_locatesp_3
	pop	af
	pop	af
	inc	sp
	ld	hl, #0x001f
	ld	(_offr), hl
;ciclo.c:533: if (x<xene){
	ld	hl, #_xene
	ld	iy, #_x
	ld	a, 0 (iy)
	sub	a, (hl)
	ld	a, 1 (iy)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00141$
	xor	a, #0x80
00141$:
	jp	P, 00112$
;ciclo.c:534: offr=offr+8;
	ld	hl, #0x0027
	ld	(_offr), hl
;ciclo.c:535: if (y<yene) offr=offr+4;
	ld	hl, #_yene
	ld	iy, #_y
	ld	a, 0 (iy)
	sub	a, (hl)
	ld	a, 1 (iy)
	inc	hl
	sbc	a, (hl)
	jp	PO, 00142$
	xor	a, #0x80
00142$:
	jp	P, 00113$
	ld	hl, #0x002b
	ld	(_offr), hl
	jr	00113$
00112$:
;ciclo.c:537: if (y>yene) offr=offr+4;
	ld	hl, #_yene
	ld	a, (hl)
	ld	iy, #_y
	sub	a, 0 (iy)
	inc	hl
	ld	a, (hl)
	sbc	a, 1 (iy)
	jp	PO, 00143$
	xor	a, #0x80
00143$:
	jp	P, 00113$
	ld	hl, #0x0023
	ld	(_offr), hl
00113$:
;ciclo.c:539: rk=1+rk %4;
	ld	hl, #0x0004
	push	hl
	ld	hl, (_rk)
	push	hl
	call	__modsint
	pop	af
	pop	af
	inc	hl
	ld	c,l
	ld	b,h
	ld	(_rk), bc
;ciclo.c:540: _8BP_setupsp_3(k,15,offr+rk);
	ld	hl, #_rk
	ld	iy, #_offr
	ld	a, 0 (iy)
	add	a, (hl)
	ld	c, a
	ld	a, 1 (iy)
	inc	hl
	adc	a, (hl)
	ld	b, a
	push	bc
	ld	hl, #0x000f
	push	hl
	ld	hl, (_k)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:541: }
	ret
;ciclo.c:544: void procesaEvento_1500(){
;	---------------------------------
; Function procesaEvento_1500
; ---------------------------------
_procesaEvento_1500::
	push	af
;ciclo.c:545: _8BP_peek_2(evdir+2,&evtipo);
	ld	bc, #_evtipo+0
	ld	hl, (_evdir)
	inc	hl
	inc	hl
	push	bc
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
;ciclo.c:547: switch (evtipo)  {
	ld	iy, #_evtipo
	ld	a, 0 (iy)
	sub	a, #0x01
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	C, 00110$
	ld	a, #0x07
	cp	a, 0 (iy)
	ld	a, #0x00
	sbc	a, 1 (iy)
	jp	PO, 00128$
	xor	a, #0x80
00128$:
	jp	M, 00110$
	ld	a,(#_evtipo + 0)
	add	a, #0xff
	ld	c, a
;ciclo.c:552: _8BP_peek_2(evdir+4,&pini);pfin1=pini+44;pfin2=pfin1+80;p2=-pfin1+112;p1=-pini+120;
	ld	hl, #0
	add	hl, sp
	ld	iy, #_evdir
	ld	a, 0 (iy)
	add	a, #0x04
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
;ciclo.c:547: switch (evtipo)  {
	ld	b, #0x00
	ld	hl, #00129$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00129$:
	jp	00101$
	jp	00102$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
	jp	00109$
;ciclo.c:549: case 1: //evento puente
00101$:
;ciclo.c:550: modo=1;_8BP_setupsp_3(31,0,64);
	ld	hl,#_modo + 0
	ld	(hl), #0x01
	ld	hl, #0x0040
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:551: pini=0;
	ld	hl, #0x0000
	ld	(_pini), hl
;ciclo.c:552: _8BP_peek_2(evdir+4,&pini);pfin1=pini+44;pfin2=pfin1+80;p2=-pfin1+112;p1=-pini+120;
	ld	de, #_pini+0
	ld	iy, #_evdir
	ld	a, 0 (iy)
	add	a, #0x04
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	push	de
	push	bc
	call	__8BP_peek_2
	pop	af
	pop	af
	ld	hl, #_pfin1
	ld	iy, #_pini
	ld	a, 0 (iy)
	add	a, #0x2c
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	hl, #_pfin2
	ld	iy, #_pfin1
	ld	a, 0 (iy)
	add	a, #0x50
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	hl, #_pfin1
	xor	a, a
	sub	a, (hl)
	ld	c, a
	ld	a, #0x00
	inc	hl
	sbc	a, (hl)
	ld	b, a
	ld	hl, #0x0070
	add	hl, bc
	ld	(_p2), hl
	ld	hl, #_pini
	xor	a, a
	sub	a, (hl)
	ld	c, a
	ld	a, #0x00
	inc	hl
	sbc	a, (hl)
	ld	b, a
	ld	hl, #0x0078
	add	hl, bc
	ld	(_p1), hl
;ciclo.c:553: evdir=evdir +6;
	ld	hl, #_evdir
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
	jp	NC,00110$
	inc	hl
	inc	(hl)
;ciclo.c:554: break;
	jp	00110$
;ciclo.c:556: case 2: //fin puente
00102$:
;ciclo.c:557: if (y==120) {
	ld	iy, #_y
	ld	a, 0 (iy)
	sub	a, #0x78
	or	a, 1 (iy)
	jr	NZ,00104$
;ciclo.c:558: _8BP_setlimits_4(8,72,0,200);_8BP_setupsp_3(31,0,64+32+1);modo=0;
	ld	hl, #0x00c8
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x48
	push	hl
	ld	l, #0x08
	push	hl
	call	__8BP_setlimits_4
	pop	af
	pop	af
	pop	af
	pop	af
	ld	hl, #0x0061
	push	hl
	ld	l, #0x00
	push	hl
	ld	l, #0x1f
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	ld	hl,#_modo + 0
	ld	(hl), #0x00
00104$:
;ciclo.c:560: evdir=evdir +4;
	ld	hl, #_evdir
	ld	a, (hl)
	add	a, #0x04
	ld	(hl), a
	jp	NC,00110$
	inc	hl
	inc	(hl)
;ciclo.c:561: break;
	jp	00110$
;ciclo.c:563: case 3://ink
00105$:
;ciclo.c:565: _8BP_peek_2(evdir+4,&tinta);
	ld	hl, #_tinta
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	push	bc
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
;ciclo.c:566: _basic_ink(1,tinta);
	ld	a,(#_tinta + 0)
	ld	d,a
	ld	e,#0x01
	push	de
	call	__basic_ink
	pop	af
;ciclo.c:567: evdir=evdir +6;
	ld	hl, #_evdir
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
	jp	NC,00110$
	inc	hl
	inc	(hl)
;ciclo.c:568: break;
	jp	00110$
;ciclo.c:570: case 4://finscroll
00106$:
;ciclo.c:571: scroll=1;_8BP_map2sp_1(2);_8BP_map2sp_2(m,0);
	ld	hl,#_scroll + 0
	ld	(hl), #0x01
	ld	a, #0x02
	push	af
	inc	sp
	call	__8BP_map2sp_1
	inc	sp
	ld	hl, #0x0000
	push	hl
	ld	hl, (_m)
	push	hl
	call	__8BP_map2sp_2
	pop	af
	pop	af
;ciclo.c:572: evdir=evdir +4;
	ld	hl, #_evdir
	ld	a, (hl)
	add	a, #0x04
	ld	(hl), a
	jp	NC,00110$
	inc	hl
	inc	(hl)
;ciclo.c:573: break;
	jp	00110$
;ciclo.c:575: case 5: //banda
00107$:
;ciclo.c:576: procesaEventoBanda_1880();
	call	_procesaEventoBanda_1880
;ciclo.c:577: break;
	jp	00110$
;ciclo.c:579: case 6://enemigo fijo
00108$:
;ciclo.c:581: eneim=0;_8BP_peek_2(evdir+4,&eneim);
	ld	hl, #0x0000
	ld	(_eneim), hl
	ld	hl, #_eneim
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	push	bc
	push	hl
	call	__8BP_peek_2
	pop	af
;ciclo.c:582: enesp=15 + enesp % 8; // 8 enemigos del 15 al 22
	ld	hl, #0x0008
	ex	(sp),hl
	ld	hl, (_enesp)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	bc,#0x000f
	add	hl,bc
	ld	(_enesp), hl
;ciclo.c:583: _8BP_peek_2(evdir+6,&enecount[enesp-15]);//disparos para morir
	ld	bc, #_enecount+0
	ld	a,(#_enesp + 0)
	add	a, #0xf1
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	iy, #_evdir
	ld	a, 0 (iy)
	add	a, #0x06
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	push	de
	push	bc
	call	__8BP_peek_2
	pop	af
	pop	af
;ciclo.c:584: _8BP_peek_2(evdir+8,&eney);_8BP_peek_2(evdir+10,&enex);
	ld	de, #_eney+0
	ld	iy, #_evdir
	ld	a, 0 (iy)
	add	a, #0x08
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	push	de
	push	bc
	call	__8BP_peek_2
	pop	af
	pop	af
	ld	de, #_enex+0
	ld	iy, #_evdir
	ld	a, 0 (iy)
	add	a, #0x0a
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	push	de
	push	bc
	call	__8BP_peek_2
	pop	af
	pop	af
;ciclo.c:585: _8BP_setupsp_3(enesp,9,eneim);
	ld	hl, (_eneim)
	push	hl
	ld	hl, #0x0009
	push	hl
	ld	hl, (_enesp)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:586: _8BP_locatesp_3(enesp,eney,enex);
	ld	hl,#_enesp + 0
	ld	b, (hl)
	ld	hl, (_enex)
	push	hl
	ld	hl, (_eney)
	push	hl
	push	bc
	inc	sp
	call	__8BP_locatesp_3
	pop	af
	pop	af
	inc	sp
;ciclo.c:587: _8BP_setupsp_3(enesp,0,1+16+64+2);
	ld	hl, #0x0053
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, (_enesp)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:589: evdir=evdir+12;
	ld	hl, #_evdir
	ld	a, (hl)
	add	a, #0x0c
	ld	(hl), a
	jp	NC,00110$
	inc	hl
	inc	(hl)
;ciclo.c:590: break;
	jp	00110$
;ciclo.c:592: case 7://enemigo movil
00109$:
;ciclo.c:593: _8BP_peek_2(evdir+4,&enesq);//macroseq
	ld	hl, #_enesq
	ld	c, l
	ld	b, h
	pop	hl
	push	hl
	push	bc
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
;ciclo.c:594: _8BP_peek_2(evdir+6,&eney);_8BP_peek_2(evdir+8,&enex);
	ld	de, #_eney+0
	ld	iy, #_evdir
	ld	a, 0 (iy)
	add	a, #0x06
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	push	de
	push	bc
	call	__8BP_peek_2
	pop	af
	pop	af
	ld	de, #_enex+0
	ld	iy, #_evdir
	ld	a, 0 (iy)
	add	a, #0x08
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	push	de
	push	bc
	call	__8BP_peek_2
	pop	af
	pop	af
;ciclo.c:595: _8BP_peek_2(evdir+10,&ener);//ruta
	ld	de, #_ener+0
	ld	iy, #_evdir
	ld	a, 0 (iy)
	add	a, #0x0a
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	push	de
	push	bc
	call	__8BP_peek_2
	pop	af
	pop	af
;ciclo.c:596: _8BP_peek_2(evdir+12,&tr);//transparencia
	ld	de, #_tr+0
	ld	iy, #_evdir
	ld	a, 0 (iy)
	add	a, #0x0c
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	push	de
	push	bc
	call	__8BP_peek_2
	pop	af
;ciclo.c:597: enesp=15 + enesp % 8;//del 15 al 22
	ld	hl, #0x0008
	ex	(sp),hl
	ld	hl, (_enesp)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	bc,#0x000f
	add	hl,bc
	ld	(_enesp), hl
;ciclo.c:598: _8BP_setupsp_3(enesp,5,1);
	ld	hl, #0x0001
	push	hl
	ld	l, #0x05
	push	hl
	ld	hl, (_enesp)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:599: _8BP_setupsp_3(enesp,7,enesq);
	ld	hl, (_enesq)
	push	hl
	ld	hl, #0x0007
	push	hl
	ld	hl, (_enesp)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:600: _8BP_locatesp_3(enesp,eney,enex);
	ld	hl,#_enesp + 0
	ld	b, (hl)
	ld	hl, (_enex)
	push	hl
	ld	hl, (_eney)
	push	hl
	push	bc
	inc	sp
	call	__8BP_locatesp_3
	pop	af
	pop	af
	inc	sp
;ciclo.c:601: _8BP_setupsp_3(enesp,0,159+tr);
	ld	iy, #_tr
	ld	a, 0 (iy)
	add	a, #0x9f
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	hl, (_enesp)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:602: _8BP_setupsp_3(enesp,15,ener);
	ld	hl, (_ener)
	push	hl
	ld	hl, #0x000f
	push	hl
	ld	hl, (_enesp)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:603: evdir=evdir+14;
	ld	hl, #_evdir
	ld	a, (hl)
	add	a, #0x0e
	ld	(hl), a
	jr	NC,00137$
	inc	hl
	inc	(hl)
00137$:
;ciclo.c:607: }
00110$:
;ciclo.c:608: _8BP_peek_2(evdir,&nextm);
	ld	hl, #_nextm
	push	hl
	ld	hl, (_evdir)
	push	hl
	call	__8BP_peek_2
	pop	af
	pop	af
;ciclo.c:610: }
	pop	af
	ret
;ciclo.c:612: void procesaEventoBanda_1880(){
;	---------------------------------
; Function procesaEventoBanda_1880
; ---------------------------------
_procesaEventoBanda_1880::
;ciclo.c:613: if (banda==0){
	ld	iy, #_banda
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	NZ,00103$
;ciclo.c:614: for (int i=15 ;i<=22;i++){
	ld	bc, #0x000f
00113$:
	ld	a, #0x16
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00153$
	xor	a, #0x80
00153$:
	jp	M, 00101$
;ciclo.c:615: _8BP_setupsp_3(i,0,0);
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, #0x00
	push	hl
	push	bc
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
	pop	bc
;ciclo.c:614: for (int i=15 ;i<=22;i++){
	inc	bc
	jr	00113$
00101$:
;ciclo.c:617: rb=26;
	ld	hl, #0x001a
	ld	(_rb), hl
;ciclo.c:618: muertos=0;
	ld	l, #0x00
	ld	(_muertos), hl
;ciclo.c:619: m=m+1;
	ld	hl, (_m)
	inc	hl
	ld	(_m), hl
00103$:
;ciclo.c:621: if (banda>Nbanda-1) return;
	ld	bc, (_Nbanda)
	dec	bc
	ld	a, c
	ld	iy, #_banda
	sub	a, 0 (iy)
	ld	a, b
	sbc	a, 1 (iy)
	jp	PO, 00154$
	xor	a, #0x80
00154$:
	jp	P, 00105$
	ret
00105$:
;ciclo.c:622: if (banda-muertos==8) return;
	ld	hl, (_banda)
	ld	bc, (_muertos)
	cp	a, a
	sbc	hl, bc
	ld	a, l
	sub	a, #0x08
	or	a, h
	ret	Z
	jr	00107$
00107$:
;ciclo.c:623: enesp=15 +enesp % 8;
	ld	hl, #0x0008
	push	hl
	ld	hl, (_enesp)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	bc,#0x000f
	add	hl,bc
;ciclo.c:625: if (_basic_peek(dirsp[enesp])>0) return;
	ld	(_enesp), hl
	add	hl, hl
	ld	de, #_dirsp
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__basic_peek
	pop	af
	ld	a, l
	or	a, a
	ret	NZ
;ciclo.c:626: banda=banda+1;
	ld	hl, (_banda)
	inc	hl
	ld	(_banda), hl
;ciclo.c:627: _8BP_setupsp_3(enesp,5,1);
	ld	hl, #0x0001
	push	hl
	ld	l, #0x05
	push	hl
	ld	hl, (_enesp)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:628: _8BP_setupsp_3(enesp,7,32);
	ld	hl, #0x0020
	push	hl
	ld	l, #0x07
	push	hl
	ld	hl, (_enesp)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:629: _8BP_locatesp_3(enesp,0,40);
	ld	hl,#_enesp + 0
	ld	b, (hl)
	ld	hl, #0x0028
	push	hl
	ld	l, #0x00
	push	hl
	push	bc
	inc	sp
	call	__8BP_locatesp_3
	pop	af
	pop	af
	inc	sp
;ciclo.c:630: _8BP_setupsp_3(enesp,0,223);
	ld	hl, #0x00df
	push	hl
	ld	l, #0x00
	push	hl
	ld	hl, (_enesp)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:631: rb=rb+1;if (rb==31) rb=26;
	ld	hl, (_rb)
	inc	hl
	ld	(_rb), hl
	ld	iy, #_rb
	ld	a, 0 (iy)
	sub	a, #0x1f
	or	a, 1 (iy)
	jr	NZ,00111$
	ld	hl, #0x001a
	ld	(_rb), hl
00111$:
;ciclo.c:632: _8BP_setupsp_3(enesp,15,rb);
	ld	hl, (_rb)
	push	hl
	ld	hl, #0x000f
	push	hl
	ld	hl, (_enesp)
	push	hl
	call	__8BP_setupsp_3
	pop	af
	pop	af
	pop	af
;ciclo.c:633: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit___basic_rnd_x:
	.dw #0x0000
	.area _CABS (ABS)
