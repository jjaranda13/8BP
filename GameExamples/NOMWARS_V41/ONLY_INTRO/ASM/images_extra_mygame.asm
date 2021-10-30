;GRAFICOS EXTRA y MAPAS
org 18500

;EVENTOS
;--------------------------------------
;valores de eventos m1,m2,m3,m4 etc todos multiplos de 24
;luego esta el tipo de evento y luego los parametros del evento
; tipo 1 es puente
; tipo 2 es fin puente
; tipo 5 es enemigo m,5,seq,y,x,ruta
; NIVEL-1

_LEVEL_0_BEGIN_EVENTS
dw 24,7,32,100,72,17,0 ; soldado
dw 48,7,32,100,4,21,0 ; soldado
dw 72,7, 32,-10,16,19,0; soldado
dw 96,7,32,-10,50,22,0;soldado

dw 120,6,NAZIMETRALLETA,3,0,60; soldado fijo
dw 240,7, 32,46,72,17,64; soldado en puente1
dw 264,1,271; puente
dw 288,7, 32,90,2,18,64; soldado en puente2
dw 312,6,NAZIMETRALLETA,3,-10,64;
dw 336,7,32,-80,20,22,0; soldado
dw 360,7,32,-10,60,23,0;soldado
dw 384,2; fin puente. siempre es el evento puente +120
dw 408,7,32,0,72,17,0;soldado
dw 432,7,32,8,-6,24,0;soldado
dw 576,7,32,-20,50,23,0; soldado
_LEVEL_0_MID_EVENTS; m=200*3=600
dw 600,7,32,-40,72,20,0; soldado
dw 720,7,32, -100,40,23,0; soldado
dw 744,7,32, -100,50,23,0; soldado
dw 792,7,32,-10, 0,21,0; soldado

dw 816,7,32,-100, 72,20,0; soldado
dw 888,7,32,-40,72,25,0; soldado
dw 912,7,32,-100,0,24,0; soldado
dw 1080,7,32 ,-20,0,21,0; soldado
dw 1104,7,32 ,-20,72,20,0; soldado
dw 1128,7,32 ,-100,0,21,0; soldado
dw 1152,7,32 ,-60,72,25,0; soldado
dw 1248,7,32 ,-30,72,20,0; soldado

dw 1536,3,24; tinta
dw 1608,4 ; finscroll

dw 1608,5; banda

dw 5000,9;fin
_LEVEL_0_END_EVENTS
_LEVEL_0_BEGIN_MAP
;screen1
dw 170,20, ARBOL
dw 80,60, ARBOL

;screen2
dw 1*200+207,8,MUROSIMPLE
dw 1*200+207,24,MUROSIMPLE
dw 1*200+207,40,MUROSIMPLE
dw 1*200+207,56,MUROSIMPLE

dw 1*200+168,8,MURO
;dw 1*200+168,21,MURO
dw 1*200+168,46,MURO2
dw 1*200+168,34,PUENTE2
dw 1*200+168,59,MURO2
dw 1*200+168,21,MURO
;dw 1*200+168,46,MURO2


;screen3
;dw 2*200+100,62,CESPED
dw 2*200+100,60,TRINCHERA
;dw 2*200+68,62,TERRA
dw 2*200+60,16,ARBOL
dw 2*200+180,40,ARBOL

;screen4
dw 3*200+100,8,CESPED
dw 3*200+68,8,TERRA
dw 3*200+92,18,CESPED
dw 3*200+60,18,TERRA

dw 3*200+151,62,CESPED
dw 3*200+119,62,TERRA

dw 3*200+181,30,ARBOL

;screen5
dw 4*200+132,18,CESPED
dw 4*200+100,18,TERRA

dw 4*200+132,56,CESPED
dw 4*200+100,56,TERRA

;screen6
dw 5*200+51,32,ARBOL
dw 5*200+151,16,ARBOL
dw 5*200+100,60,ARBOL
dw 5*200+190,50,ARBOL

;screen7
dw 6*200+52,8,TANK2
dw 6*200+152,8,TANK2
dw 6*200+100,72-13,TANK

;screen8
dw 7*200+51,72-13,TANK
dw 7*200+152,72-13,TANK
dw 7*200+101,8,TANK2

;screen9
dw 8*200+208,8,MUROFAKE
dw 8*200+208,12,MUROFAKE
dw 8*200+208,16,MUROFAKE
dw 8*200+208,20,MUROFAKE
dw 8*200+208,24,MUROFAKE
dw 8*200+208,28,MUROFAKE
dw 8*200+208,32,MUROFAKE

dw 8*200+208,36,MUROTOP

dw 8*200+208,48,MUROFAKE2
dw 8*200+208,52,MUROFAKE2
dw 8*200+208,56,MUROFAKE2
dw 8*200+208,60,MUROFAKE2
dw 8*200+208,64,MUROFAKE2
dw 8*200+208,68,MUROFAKE2


_LEVEL_0_END_MAP
;=======================================================================================================================
_LEVEL_1_BEGIN_EVENTS
dw 0,6,TORRETA,10,10,14
dw 24,3,1
dw 48,6,TORRETA,10,-50,62
dw 72,7, 32,60,72,17,0 ; soldado
dw 96,7 ,32,0, -4,19,0;soldado

dw 120,7 ,32,-80,40,22,0;soldado

dw 168,7 ,32,-150,2,18,64;soldado puente

dw 264,3,13
dw 384,1,391; puente


dw 408,7,32,0,2,24,0;soldado
dw 432,7,32,-90,50,22,0;soldado

dw 384+120,2; fin puente. siempre es el evento puente +120 ( en este caso es 504)

dw 528,7,32,-100,72,20,0;soldado
dw 552,7,32,-100,46,23,0;soldado    
_LEVEL_1_MID_EVENTS; m=200*3=600
;dw 600,7,32,-100,44,23,0;soldado
dw 648,7,32,-150,46,23,0;soldado
dw 672,6,TORRETA,10,-130,64;
dw 720,7,32,-100,72,25,0;soldado
dw 744,7,32,-100,46,23,0;soldado
dw 768,7,32,-100,4,24,0;soldado
dw 792,7,32,-120,40,22,0;soldado
dw 816,6,NAZIMETRALLETA,3,-110,64;

dw 864,7,32,-110,4,18,0;soldado
dw 1008,7,32,-110,72,20,0;soldado
dw 1032,7,32,-60,4,24,0;soldado
dw 1200,7,32,-130,40,28,0;soldado
dw 1224,6,TORRETA,10,-130,66;
dw 1320,7,32,-100,4,24,0;soldado
dw 1536,3,3; tinta
dw 1608,4 ; finscroll

dw 1608,5; banda

dw 5000,9;fin



_LEVEL_1_BEGIN_MAP
;screen0
dw 100,20,ARBOL
;screen1
dw 1*200+20,0,RIO 
dw 1*200+20,16,RIO
dw 1*200+20,32,RIO
dw 1*200+60,0,RIOFIN
dw 1*200+60,16,RIOFIN
dw 1*200+60,32,RIOFIN
dw 1*200+20,60,RIO 
dw 1*200+60,60,RIOFIN
dw 1*200+56,48,LADO
dw 1*200+56,58,LADO

;screen2
let p1=88; evento en 400+100 -104= 384
let p2=p1+39
dw 2*200+p2,8,MUROSIMPLE
dw 2*200+p2,24,MUROSIMPLE
dw 2*200+p2,40,MUROSIMPLE
dw 2*200+p2,56,MUROSIMPLE
dw 2*200+p1,8,MURO
dw 2*200+p1,46,MURO
dw 2*200+p1,34,PUENTE2
dw 2*200+p1,59,MURO
dw 2*200+p1,21,MURO

;screen3
dw 3*200+101,8, TERRA
dw 3*200+133,8, CESPED
dw 3*200+140,62, TERRA
dw 3*200+172,62, CESPED
;screen4
dw 4*200+32,8, TERRA
dw 4*200+63,8, CESPED
dw 4*200+64,18, TERRA
dw 4*200+96,18, CESPED
dw 4*200+96,28, TERRA
dw 4*200+128,28, CESPED

dw 4*200+96,52, TERRA
dw 4*200+128,52, CESPED
dw 4*200+64,62, TERRA
dw 4*200+96,62, CESPED

;screen5
dw 5*200+100,60, TRINCHERA
dw 5*200+150,20, ARBOL
dw 5*200+150,30, ARBOL
dw 5*200+150,40, ARBOL

;screen6
dw 6*200+25,30, CASA
dw 6*200+35,60, CASA
dw 6*200+151,20, CASA
dw 6*200+160,40, CASA

;screen7
dw 7*200+50,8,CASA
dw 7*200+24,18,VALLA
dw 7*200+101,40,ARBOL
dw 7*200+150,50,VALLA
dw 7*200+150,58,VALLA

;screen8
dw 8*200+208,8,MUROFAKE
dw 8*200+208,12,MUROFAKE
dw 8*200+208,16,MUROFAKE
dw 8*200+208,20,MUROFAKE
dw 8*200+208,24,MUROFAKE
dw 8*200+208,28,MUROFAKE
dw 8*200+208,32,MUROFAKE
dw 8*200+208,36,MUROTOP
dw 8*200+208,48,MUROFAKE2
dw 8*200+208,52,MUROFAKE2
dw 8*200+208,56,MUROFAKE2
dw 8*200+208,60,MUROFAKE2
dw 8*200+208,64,MUROFAKE2
dw 8*200+208,68,MUROFAKE2
_LEVEL_1_END_MAP
;=====================================================================
_LEVEL_2_BEGIN_EVENTS
dw 0,7, 32,40,40,28,0 ; soldado
dw 24,3,1
dw 48,6,TORRETA,10,-50,64;
dw 72,7, 32,-140,4,24,0 ; soldado
dw 96,7, 32,-40,72,20,0 ; soldado
dw 120,6,TORRETA,10,-170,10;
dw 288 ,7, 32,-100,50,22,0 ; soldado
dw 312 ,7, 32,-120,30,22,0 ; soldado
dw 336 ,7, 32,-100,72,25,0 ; soldado
dw 456 ,7, 32,-150,4,24,0 ; soldado
dw 480 ,7, 32,-150,60,23,0 ; soldado
_LEVEL_2_MID_EVENTS; 696
dw 696 ,7, 32,-150,60,23,0 ; soldado
dw 720 ,7, 32,-10,4,21,0 ; soldado
dw 744 ,7, 32,-100,4,19,0 ; soldado
dw 864 ,7, 32,-70,40,22,0 ; soldado
dw 912 ,7, 32,-100,20,23,0 ; soldado
dw 1008,7, 32,-150,50,23,0 ; soldado
dw 1032,7, 32,-10,4,21,0 ; soldado
dw 1056,7, 32,-125,72,20,0 ; soldado
dw 1080,7, 32,-170,40,28,0 ; soldado
dw 1104,6, NAZIMETRALLETA, 3 ,-130,40;
dw 1128,6, NAZIMETRALLETA, 3 ,-116,20;
dw 1200,7, 32,-150,72,20,0 ; soldado
;dw 1224,7, 32,-150,20,23,0 ; soldado
;dw 1296,7, 32,-150,30,23,0 ; soldado
dw 1320,7, 32,-150,50,23,0 ; soldado
dw 1344,7, 32,-200,25,23,0 ; soldado
dw 1368,7, 32,-250,40,23,0 ; soldado
dw 1392,7, 32,-250,50,23,0 ; soldado
dw 1416,7, 32,-200,20,23,0 ; soldado
;dw 264,3,13

dw 1536,3,3; tinta
;dw 1608,4 ; finscroll
;dw 1608,5; banda

dw 1704,4 ; finscroll
dw 1704,5 ; banda

dw 5000,9;fin



_LEVEL_2_BEGIN_MAP
;screen0
dw 0*200+181,20,TANK
dw 0*200+181,48,TANK
dw 0*200+121,34,TANK
dw 0*200+33,9,TANK
dw 0*200+33,58,TANK

;screen1
dw 1*200+20,0,RIO 
dw 1*200+20,16,RIO
dw 1*200+20,32,RIO
dw 1*200+60,0,RIOFIN
dw 1*200+60,16,RIOFIN
dw 1*200+60,32,RIOFIN
dw 1*200+20,60,RIO 
dw 1*200+60,60,RIOFIN
dw 1*200+56,48,LADO
dw 1*200+56,58,LADO

;screen2
dw 2*200+19,0,RIO 
dw 2*200+60,0,RIOFIN
dw 2*200+19,60,RIO 
dw 2*200+60,60,RIOFIN

dw 2*200+19,44,RIO 
dw 2*200+60,44,RIOFIN
dw 2*200+19,28,RIO 
dw 2*200+60,28,RIOFIN


dw 2*200+57,16,LADO
dw 2*200+57,26,LADO


;screen3
dw 3*200+100,10,CESPED
dw 3*200+68,10,TERRA
dw 3*200+121,62,CESPED
dw 3*200+88,62,TERRA
dw 3*200+120,40,ARBOL

;screen4
dw 4*200+101,10,CESPED
dw 4*200+68,10,TERRA

dw 4*200+89,25,CESPED
dw 4*200+57,25,TERRA

dw 4*200+81,40,CESPED
dw 4*200+48,40,TERRA

dw 4*200+201,20+10,CESPED
dw 4*200+168,20+10,TERRA

dw 4*200+191,20+25,CESPED
dw 4*200+158,20+25,TERRA

dw 4*200+179,20+40,CESPED
dw 4*200+147,20+40,TERRA


;screen5
dw 5*200+150,10, ARBOL
dw 5*200+100,35, ARBOL
dw 5*200+150,60, ARBOL

;screen6
dw 6*200+100,8, CASA
dw 6*200+74,18, VALLA
dw 6*200+74,26, VALLA
dw 6*200+100,34, CASA


;screen7
dw 7*200+102,36, CASA
dw 7*200+74,46, VALLA
dw 7*200+74,54, VALLA
dw 7*200+102,62, CASA

;screen8
dw 8*200+304,8,MUROFAKE
dw 8*200+304,12,MUROFAKE
dw 8*200+304,16,MUROFAKE
dw 8*200+304,20,MUROFAKE
dw 8*200+304,24,MUROFAKE
dw 8*200+304,28,MUROFAKE
dw 8*200+304,32,MUROFAKE

dw 8*200+304,36,MUROTOP

dw 8*200+304,48,MUROFAKE2
dw 8*200+304,52,MUROFAKE2
dw 8*200+304,56,MUROFAKE2
dw 8*200+304,60,MUROFAKE2
dw 8*200+304,64,MUROFAKE2
dw 8*200+304,68,MUROFAKE2


_LEVEL_2_END_MAP



_LEVEL_3_BEGIN_EVENTS
dw 48,6,TORRETA,10,-50,64;
dw 3*24,6,TORRETA,10,-30,20;
dw 4*24,6,TORRETA,10,-50,14;

dw 6*24,6,TORRETA,10,-50,30;
dw 8*24,6,TORRETA,10,-40,50;
dw 10*24,6,TORRETA,10,-40,10;
dw 12*24,6,TORRETA,10,-40,25;
dw 14*24,6,TORRETA,10,-40,45;
dw 16*24,6,TORRETA,10,-40,15;
dw 18*24,6,TORRETA,10,-40,30;

dw 20*24,6,TORRETA,10,-40,40;
dw 22*24,6,TORRETA,10,-40,60;
_LEVEL_3_MID_EVENTS;
dw 24*24,6,TORRETA,10,-40,20;
dw 26*24,6,TORRETA,10,-40,40;
dw 28*24,6,TORRETA,10,-40,50;

dw 30*24 ,7, 32,-40,4,19,0 ; soldado
dw 32*24 ,7, 32,-40,4,19,0 ; soldado
dw 34*24 ,7, 32,-40,4,19,0 ; soldado
;dw 36*24 ,7, 32,-40,4,18,0 ; soldado
dw 38*24 ,7, 32,-40,4,19,0 ; soldado
dw 40*24 ,7, 32,-40,4,19,0 ; soldado
;dw 42*24 ,7, 32,-40,4,19,0 ; soldado
dw 44*24 ,7, 32,-40,72,20,0 ; soldado
dw 46*24 ,7, 32,-40,4,21,0 ; soldado
dw 49*24 ,7, 32,-40,45,22,0 ; soldado
dw 50*24,3,0; tinta
dw 1608,4 ; finscroll
dw 1608,5; banda
dw 5000,9;fin


_LEVEL_3_BEGIN_MAP

;screen0
dw 0*200+100,20,ARBOL

;screen1
dw 1*200+100,50,ARBOL

;screen2
dw 2*200+100,60,ARBOL

;screen3
dw 3*200+100,10,ARBOL

;screen4
dw 4*200+100,30,ARBOL

;screen5
dw 5*200+100,40,ARBOL

;screen6
dw 6*200+100,10,TANK2

;screen7
dw 7*200+101,50,TANK
dw 7*200+101,20,TANK2
;screen8
dw 8*200+208,8,MUROFAKE
dw 8*200+208,12,MUROFAKE
dw 8*200+208,16,MUROFAKE
dw 8*200+208,20,MUROFAKE
dw 8*200+208,24,MUROFAKE
dw 8*200+208,28,MUROFAKE
dw 8*200+208,32,MUROFAKE

dw 8*200+208,36,MUROTOP

dw 8*200+208,48,MUROFAKE2
dw 8*200+208,52,MUROFAKE2
dw 8*200+208,56,MUROFAKE2
dw 8*200+208,60,MUROFAKE2
dw 8*200+208,64,MUROFAKE2
dw 8*200+208,68,MUROFAKE2

_LEVEL_3_END_MAP
;------ BEGIN IMAGE --------
NAZI_R1
db 6 ; ancho
db 27 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 15 , 0 , 0 , 0 
db 0 , 5 , 30 , 10 , 0 , 0 
db 0 , 5 , 45 , 10 , 0 , 0 
db 0 , 5 , 15 , 8 , 0 , 0 
db 0 , 5 , 14 , 0 , 0 , 0 
db 0 , 17 , 51 , 0 , 0 , 0 
db 0 , 21 , 47 , 10 , 0 , 0 
db 0 , 5 , 23 , 15 , 0 , 0 
db 0 , 11 , 31 , 15 , 0 , 0 
db 0 , 19 , 51 , 51 , 51 , 0 
db 0 , 11 , 51 , 51 , 51 , 0 
db 0 , 5 , 23 , 42 , 0 , 0 
db 0 , 21 , 63 , 15 , 0 , 0 
db 0 , 1 , 15 , 10 , 0 , 0 
db 0 , 0 , 7 , 2 , 0 , 0 
db 0 , 0 , 15 , 2 , 0 , 0 
db 0 , 0 , 51 , 0 , 0 , 0 
db 0 , 0 , 51 , 0 , 0 , 0 
db 0 , 0 , 51 , 34 , 0 , 0 
db 0 , 0 , 51 , 34 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0  
db 0 , 0 , 0 , 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
NAZI_R2
db 6 ; ancho
db 27 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 5 , 10 , 0 , 0 
db 0 , 0 , 11 , 45 , 0 , 0 
db 0 , 0 , 30 , 7 , 0 , 0 
db 0 , 0 , 15 , 14 , 0 , 0 
db 0 , 0 , 15 , 8 , 0 , 0 
db 0 , 0 , 51 , 34 , 0 , 0 
db 0 , 5 , 47 , 10 , 0 , 0 
db 0 , 1 , 63 , 15 , 0 , 0 
db 0 , 7 , 23 , 15 , 0 , 0 
db 0 , 11 , 51 , 51 , 51 , 0 
db 0 , 7 , 51 , 51 , 51 , 0 
db 0 , 1 , 15 , 42 , 0 , 0 
db 0 , 21 , 63 , 15 , 0 , 0 
db 0 , 0 , 7 , 15 , 10 , 0 
db 0 , 0 , 3 , 15 , 10 , 0 
db 0 , 17 , 35 , 17 , 34 , 0 
db 0 , 17 , 34 , 17 , 34 , 0 
db 0 , 51 , 0 , 17 , 51 , 0 
db 0 , 51 , 34 , 17 , 51 , 0 
db 0 , 17 , 34 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0   
db 0 , 0 , 0 , 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
NAZI_UP1
db 6 ; ancho
db 27 ; alto
;db 0 , 0 , 0 , 17 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 15 , 17 , 0 , 0 
db 0 , 5 , 30 , 27 , 0 , 0 
db 0 , 5 , 45 , 27 , 0 , 0 
db 0 , 5 , 15 , 27 , 0 , 0 
db 0 , 5 , 15 , 27 , 0 , 0 
db 0 , 17 , 15 , 51 , 0 , 0 
db 0 , 7 , 51 , 27 , 0 , 0 
db 0 , 11 , 15 , 47 , 0 , 0 
db 0 , 7 , 23 , 47 , 0 , 0 
db 0 , 1 , 31 , 15 , 0 , 0 
db 0 , 5 , 47 , 47 , 0 , 0 
db 0 , 21 , 63 , 10 , 0 , 0 
db 0 , 5 , 47 , 2 , 0 , 0 
db 0 , 1 , 11 , 2 , 0 , 0 
db 0 , 5 , 27 , 34 , 0 , 0 
db 0 , 17 , 34 , 0 , 0 , 0 
db 0 , 17 , 34 , 0 , 0 , 0 
db 0 , 17 , 34 , 0 , 0 , 0 
db 0 , 17 , 34 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0   
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
NAZI_UP2
db 6 ; ancho
db 27 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 15 , 0 , 0 , 0 
db 0 , 5 , 30 , 27 , 0 , 0 
db 0 , 5 , 45 , 27 , 0 , 0 
db 0 , 5 , 15 , 27 , 0 , 0 
db 0 , 5 , 15 , 27 , 0 , 0 
db 0 , 17 , 15 , 51 , 0 , 0 
db 0 , 7 , 51 , 27 , 0 , 0 
db 0 , 11 , 15 , 47 , 0 , 0 
db 0 , 7 , 23 , 47 , 0 , 0 
db 0 , 1 , 31 , 15 , 0 , 0 
db 0 , 5 , 47 , 47 , 0 , 0 
db 0 , 21 , 63 , 10 , 0 , 0 
db 0 , 5 , 47 , 10 , 0 , 0 
db 0 , 1 , 15 , 10 , 0 , 0 
db 0 , 1 , 7 , 10 , 0 , 0 
db 0 , 17 , 51 , 34 , 0 , 0 
db 0 , 0 , 17 , 34 , 0 , 0 
db 0 , 0 , 17 , 34 , 0 , 0 
db 0 , 0 , 17 , 34 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
NAZI_DW1
db 6 ; ancho
db 27 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 15 , 0 , 0 , 0 
db 0 , 5 , 30 , 10 , 0 , 0 
db 0 , 5 , 45 , 10 , 0 , 0 
db 0 , 5 , 15 , 10 , 0 , 0 
db 0 , 5 , 12 , 10 , 0 , 0 
db 0 , 27 , 51 , 39 , 0 , 0 
db 0 , 23 , 11 , 15 , 0 , 0 
db 0 , 11 , 47 , 15 , 0 , 0 
db 0 , 23 , 63 , 15 , 0 , 0 
db 0 , 11 , 39 , 42 , 0 , 0 
db 0 , 21 , 55 , 10 , 0 , 0 
db 0 , 5 , 39 , 10 , 0 , 0 
db 0 , 1 , 39 , 2 , 0 , 0 
db 0 , 5 , 35 , 2 , 0 , 0 
db 0 , 1 , 11 , 2 , 0 , 0 
db 0 , 5 , 7 , 2 , 0 , 0 
db 0 , 17 , 51 , 34 , 0 , 0 
db 0 , 17 , 34 , 0 , 0 , 0 
db 0 , 17 , 34 , 0 , 0 , 0 
db 0 , 17 , 34 , 0 , 0 , 0
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
NAZI_DW2
db 6 ; ancho
db 27 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 15 , 0 , 0 , 0 
db 0 , 5 , 30 , 10 , 0 , 0 
db 0 , 5 , 45 , 10 , 0 , 0 
db 0 , 5 , 15 , 10 , 0 , 0 
db 0 , 5 , 12 , 10 , 0 , 0 
db 0 , 27 , 51 , 39 , 0 , 0 
db 0 , 23 , 11 , 15 , 0 , 0 
db 0 , 11 , 47 , 15 , 0 , 0 
db 0 , 23 , 63 , 15 , 0 , 0 
db 0 , 11 , 39 , 42 , 0 , 0 
db 0 , 21 , 55 , 10 , 0 , 0 
db 0 , 5 , 39 , 10 , 0 , 0 
db 0 , 1 , 39 , 2 , 0 , 0 
db 0 , 5 , 35 , 2 , 0 , 0 
db 0 , 1 , 11 , 2 , 0 , 0 
db 0 , 5 , 7 , 2 , 0 , 0 
db 0 , 17 , 51 , 34 , 0 , 0 
db 0 , 0 , 17 , 34 , 0 , 0 
db 0 , 0 , 17 , 34 , 0 , 0 
db 0 , 0 , 17 , 34 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 

;------ END IMAGE --------
;------ BEGIN IMAGE --------
NAZIMU
db 6 ; ancho
db 27 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 4 , 0 
db 0 , 8 , 5 , 10 , 4 , 8 
db 4 , 8 , 15 , 45 , 0 , 10 
db 5 , 0 , 30 , 15 , 0 , 10 
db 1 , 2 , 15 , 15 , 0 , 10 
db 1 , 10 , 14 , 13 , 5 , 2 
db 0 , 7 , 51 , 51 , 11 , 0 
db 0 , 11 , 14 , 15 , 7 , 0 
db 0 , 47 , 26 , 15 , 42 , 0 
db 0 , 16 , 14 , 26 , 0 , 0 
db 0 , 0 , 24 , 13 , 0 , 0 
db 21 , 36 , 36 , 36 , 53 , 0 
db 0 , 0 , 24 , 13 , 0 , 0 
db 0 , 16 , 14 , 26 , 0 , 0 
db 0 , 42 , 26 , 15 , 42 , 0 
db 0 , 5 , 14 , 15 , 0 , 0 
db 0 , 5 , 15 , 15 , 10 , 0 
db 0 , 51 , 10 , 17 , 34 , 0 
db 0 , 51 , 0 , 17 , 34 , 0 
db 17 , 51 , 0 , 17 , 51 , 0 
db 17 , 51 , 0 , 17 , 51 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 
NAZIMU2
db 6 ; ancho
db 27 ; alto
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0

db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0
db 0,0,0,0,0,0

;------ END IMAGE --------
;------ BEGIN IMAGE --------
DISPARONAZI_UP
db 3 ; ancho
db 6 ; alto
db 192 , 192 , 192 
db 192 , 192 , 192 
db 192 , 98 , 192 
db 192 , 98 , 192 
db 192 , 0 , 192 
db 192 , 0 , 192 

DISPARONAZI_UPR
db 3 ; ancho
db 6 ; alto
db 192 , 192 , 192 
db 192 , 192 , 192 
db 192 , 98 , 192 
db 0 , 98 , 192 
db 0,192  , 192 
db 0,192  , 192 

DISPARONAZI_UPL
db 3 ; ancho
db 6 ; alto
db 192 , 192 , 192 
db 192 , 192 , 192 
db 192 , 98 , 192 
db 192 , 98 , 0 
db 192  , 192,0 
db 192  , 192,0 


DISPARONAZI_R
db 3 ; ancho
db 6 ; alto
db 192 , 192 , 192 
db 192 , 192 , 192 
db 0 , 98 , 192 
db 0 , 98 , 192 
db 192  , 192,192 
db 192  , 192,192 

DISPARONAZI_L
db 3 ; ancho
db 6 ; alto
db 192 , 192 , 192 
db 192 , 192 , 192 
db 192 , 98 , 0 
db 192 , 98 , 0 
db 192  , 192,192 
db 192  , 192,192 


DISPARONAZI_DW
db 3 ; ancho
db 6 ; alto
db 192 , 0 , 192 
db 192 , 0 , 192 
db 192 , 98 , 192
db 192 , 98 , 192 
db 192  , 192,192 
db 192  , 192,192 

DISPARONAZI_DWL
db 3 ; ancho
db 6 ; alto
db 192 ,  192,0 
db 192 ,  192 ,0
db 192 , 98 , 0
db 192 , 98 , 192 
db 192  , 192,192 
db 192  , 192,192 




;------ END IMAGE --------
;------ BEGIN IMAGE --------
NAZIMETRALLETA
db 5 ; ancho
db 22 ; alto
db 0,0,0,0,0
db 0,0,0,0,0
db 0,0,0,0,0
db 0 , 0 , 5 , 10 , 0 
db 0 , 0 , 5 , 15 , 0 
db 0 , 0 , 15 , 15 , 0 
db 0 , 0 , 15 , 15 , 0 
db 0 , 0 , 14 , 13 , 0 
db 0 , 0 , 51 , 51 , 0 
db 0 , 21 , 47 , 31 , 42 
db 0 , 5 , 23 , 43 , 10 
db 0 , 1 , 31 , 47 , 7 
db 51 , 51 , 51 , 51 , 35 
db 51 , 51 , 51 , 51 , 51 
db 0 , 0 , 51 , 51 , 51 
db 0 , 0 , 35 , 39 , 59 
db 0 , 17 , 11 , 35 , 27 
db 0 , 17 , 15 , 39 , 0 
db 0 , 34 , 39 , 35 , 0 
db 0 , 34 , 5 , 34 , 0 
db 17 , 0 , 15 , 34 , 0 
db 17 , 0 , 15 , 34 , 0 
;------ END IMAGE --------
;_ENDEXTRA
;------ END IMAGE --------

;------ BEGIN IMAGE --------
CASA
db 10 ; ancho
db 48 ; alto
db 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
db 12 , 12 , 12 , 12 , 12 , 12 , 12 , 12 , 12 , 12 
db 29 , 63 , 63 , 29 , 63 , 63 , 29 , 63 , 63 , 29 
db 29 , 63 , 63 , 29 , 63 , 63 , 29 , 63 , 63 , 29 
db 29 , 63 , 63 , 29 , 63 , 63 , 29 , 63 , 63 , 29 
db 46 , 63 , 46 , 46 , 63 , 46 , 46 , 63 , 46 , 46 
db 63 , 12 , 29 , 63 , 12 , 29 , 63 , 12 , 29 , 63 
db 63 , 46 , 63 , 63 , 46 , 63 , 63 , 46 , 63 , 63 
db 63 , 46 , 63 , 63 , 46 , 63 , 63 , 46 , 63 , 63 
db 63 , 29 , 29 , 63 , 29 , 29 , 63 , 29 , 29 , 63 
db 12 , 63 , 46 , 12 , 63 , 46 , 12 , 63 , 46 , 12 
db 29 , 63 , 63 , 29 , 63 , 63 , 29 , 63 , 63 , 29 
db 29 , 63 , 63 , 29 , 63 , 63 , 29 , 63 , 63 , 29 
db 46 , 63 , 46 , 46 , 63 , 46 , 46 , 63 , 46 , 63 
db 55 , 12 , 29 , 55 , 12 , 29 , 55 , 12 , 25 , 59 
db 51 , 51 , 51 , 51 , 51 , 51 , 25 , 51 , 51 , 51 
db 132 , 132 , 132 , 132 , 132 , 132 , 132 , 132 , 132 , 132 
db 96 , 72 , 72 , 72 , 72 , 72 , 72 , 72 , 72 , 24 
db 36 , 132 , 132 , 132 , 132 , 132 , 132 , 132 , 132 , 144 
db 48 , 24 , 24 , 24 , 24 , 24 , 24 , 24 , 24 , 24 
db 36 , 36 , 36 , 36 , 36 , 36 , 36 , 36 , 36 , 48 
db 48 , 24 , 24 , 24 , 24 , 25 , 51 , 51 , 51 , 24 
db 36 , 36 , 36 , 36 , 36 , 49 , 2 , 3 , 19 , 48 
db 48 , 25 , 51 , 51 , 50 , 25 , 2 , 3 , 19 , 24 
db 36 , 49 , 8 , 0 , 38 , 49 , 2 , 2 , 19 , 48 
db 48 , 25 , 8 , 0 , 50 , 25 , 2 , 2 , 19 , 24 
db 36 , 49 , 8 , 0 , 38 , 49 , 2 , 2 , 19 , 48 
db 48 , 25 , 8 , 0 , 50 , 25 , 3 , 2 , 19 , 24 
db 36 , 49 , 12 , 12 , 38 , 49 , 3 , 2 , 19 , 48 
db 48 , 25 , 51 , 51 , 50 , 25 , 3 , 3 , 19 , 24 
db 36 , 36 , 132 , 132 , 132 , 49 , 2 , 3 , 19 , 48 
db 48 , 72 , 72 , 72 , 24 , 25 , 2 , 3 , 19 , 24 
db 36 , 36 , 36 , 36 , 36 , 49 , 2 , 3 , 51 , 48 
db 48 , 24 , 24 , 24 , 24 , 25 , 2 , 3 , 51 , 24 
db 36 , 36 , 36 , 36 , 36 , 49 , 2 , 3 , 19 , 48 
db 48 , 24 , 24 , 24 , 24 , 25 , 2 , 2 , 19 , 24 
db 36 , 36 , 36 , 36 , 36 , 49 , 3 , 2 , 19 , 48 
db 48 , 24 , 24 , 24 , 24 , 25 , 3 , 3 , 19 , 24 
db 36 , 36 , 36 , 36 , 36 , 49 , 3 , 2 , 19 , 48 
db 48 , 24 , 24 , 24 , 24 , 25 , 3 , 2 , 19 , 24 
db 36 , 36 , 36 , 36 , 36 , 49 , 3 , 2 , 19 , 48 
db 48 , 24 , 24 , 24 , 24 , 25 , 2 , 2 , 19 , 24 
db 36 , 36 , 36 , 36 , 36 , 49 , 2 , 2 , 19 , 48 
db 48 , 24 , 24 , 24 , 24 , 25 , 2 , 3 , 19 , 24 
db 36 , 36 , 36 , 36 , 36 , 49 , 2 , 3 , 19 , 48 
db 48 , 48 , 48 , 48 , 48 , 49 , 2 , 3 , 19 , 24 

LOGO_8BP
;------ BEGIN IMAGE --------
db 12 ; ancho
db 14+6; alto
db 0,0,0,0,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,0,0,0,0
db 85 , 255 , 175 , 85 , 255 , 255 , 175 , 85 , 255 , 255 , 175 ,0
db 85 , 255 , 175 , 85 , 255 , 255 , 175 , 85 , 255 , 255 , 175 ,0
db 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
db 255 , 10 , 255 , 10 , 255 , 10 , 255 , 10 , 255 , 10 , 255 , 10 
db 255 , 10 , 255 , 10 , 255 , 10 , 255 , 10 , 255 , 10 , 255 , 10 
db 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
db 85 , 255 , 175 , 0 , 255 , 255 , 170 , 0 , 255 , 255 , 175 , 0 
db 85 , 255 , 175 , 0 , 255 , 255 , 170 , 0 , 255 , 255 , 175 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
db 255 , 10 , 255 , 10 , 255 , 10 , 255 , 10 , 255 , 10 , 0 , 0 
db 255 , 10 , 255 , 10 , 255 , 10 , 255 , 10 , 255 , 10 , 0 , 0 
db 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 
db 85 , 255 , 175 , 85 , 255 , 255 , 175 , 85 , 255 , 175 , 0 , 0 
db 85 , 255 , 175 , 85 , 255 , 255 , 175 , 85 , 255 , 175 , 0 , 0 
db 0,0,0,0,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,0,0,0,0
db 0,0,0,0,0,0,0,0,0,0,0,0


;------ BEGIN IMAGE --------
QR
db 7 ; ancho
db 25 ; alto
db 240 , 224 , 192 , 32 , 48 , 240 , 128 
db 128 , 32 , 0 , 96 , 32 , 0 , 128 
db 176 , 160 , 144 , 240 , 32 , 224 , 128 
db 176 , 160 , 208 , 48 , 160 , 224 , 128 
db 176 , 160 , 240 , 80 , 160 , 224 , 128 
db 128 , 32 , 64 , 128 , 32 , 0 , 128 
db 240 , 224 , 160 , 160 , 176 , 240 , 128 
db 0 , 0 , 80 , 48 , 0 , 0 , 0 
db 240 , 32 , 128 , 0 , 64 , 224 , 128 
db 48 , 80 , 64 , 32 , 16 , 16 , 0 
db 48 , 96 , 0 , 96 , 224 , 0 , 0 
db 144 , 128 , 144 , 208 , 80 , 96 , 0 
db 192 , 240 , 80 , 64 , 96 , 176 , 128 
db 96 , 0 , 176 , 80 , 48 , 128 , 128 
db 64 , 240 , 128 , 192 , 64 , 176 , 0 
db 160 , 144 , 0 , 176 , 48 , 128 , 128 
db 48 , 96 , 176 , 16 , 240 , 240 , 128 
db 0 , 0 , 160 , 144 , 128 , 160 , 128 
db 240 , 224 , 48 , 224 , 160 , 176 , 128 
db 128 , 32 , 0 , 176 , 128 , 144 , 128 
db 176 , 160 , 48 , 192 , 240 , 208 , 0 
db 176 , 160 , 128 , 208 , 32 , 240 , 128 
db 176 , 160 , 240 , 208 , 224 , 176 , 0 
db 128 , 32 , 160 , 0 , 96 , 160 , 0 
db 240 , 224 , 160 , 160 , 16 , 240 , 128 
;------ END IMAGE --------



_END_EXTRA

org 42540
; variables de comunicacion C <---> BASIC
DW 0 ;PUNTOS 42540
DW 0 ;HISCORE 42542
db 0 ;LEVEL  42544
db 0 ;VIDAS  42545

db 0 ;keyb/joy 42546
db 0; inmune 42547

db 0; mid 42548
db 0; uso futuro

org 42550
dw _level_0_begin_events
dw _level_0_begin_map
dw _level_0_end_map

dw _level_1_begin_events
dw _level_1_begin_map
dw _level_1_end_map

dw _level_2_begin_events
dw _level_2_begin_map
dw _level_2_end_map

dw _level_3_begin_events
dw _level_3_begin_map
dw _level_3_end_map

; datos para inicio intermedio
_MID_DATA
dw _level_0_mid_events
dw 600
dw _level_1_mid_events
dw 600
dw _level_2_mid_events
dw 696
dw _level_3_mid_events
dw 576