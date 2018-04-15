
org _CIRCUITO_INTRO_END; ensamblo al final del circuito anterior
_CIRCUITO1
;==============================================
;izq equ 320;
ancho equ 80
let y =0
let dx=0
let x=320

dw y,x,SEGMENT_EDGE_LR0;a
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50;50


dw y,x,SEGMENT_EDGE_LW0;a
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y =y+50;100

dw y,x,SEGMENT_EDGE_LR0;a
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50

dw y,x,SEGMENT_EDGE_LW0;a
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y =y+50

dw y,x,SEGMENT_EDGE_LR0;a
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50

dw y,x,SEGMENT_EDGE_LW0;a
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y =y+50

;============= cartel =====================
dw y+25,x-30,CARTEL_ZOOM
dw y+25+11,x-30+1,CAMPO_ZOOM; borrado
;==========================================


dw y,x,SEGMENT_EDGE_LR0;a
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50

dw y,x,SEGMENT_EDGE_LW0;a
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y =y+50

dw y,x,SEGMENT_EDGE_LR0;a
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50

dw y,x,SEGMENT_EDGE_LW0;a
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y =y+50

dw y,x,SEGMENT_EDGE_LR0;a
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50

; comienza la curva dcha. Y=550
;---------------------------------------
let x=x+20; 340
dw y,x,SEGMENT_EDGE_LWD20;a
dw y,x+ancho,SEGMENT_EDGE_RWD20;b
let y =y+50; y=600


;============== arbol ====================
dw y+25,x+20,ARBOL_ZOOM;
dw y+25+20,x+18,CAMPO_ZOOM;
;==========================================

let x=x+40; 380
dw y,x,SEGMENT_EDGE_LRD40;a
dw y,x+ancho,SEGMENT_EDGE_RRD40;b
let y =y+50

let x=x+20; 400
dw y,x,SEGMENT_EDGE_LWD20;a
dw y,x+ancho,SEGMENT_EDGE_RWD20;b
let y =y+50; 700

; ahora recta
;---------------------------------
dw y,x,SEGMENT_EDGE_LR0;a
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50; y=750


dw y,x,SEGMENT_EDGE_LW0;a
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y =y+50


dw y,x,SEGMENT_EDGE_LR0;a
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50


dw y,x,SEGMENT_EDGE_LW0;a
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y =y+50 ;y=900

;============= cartel =====================
dw y+25,x-30,CARTEL_ZOOM
dw y+36,x-30-2,CAMPO_ZOOM;
;==========================================

dw y,x,SEGMENT_EDGE_LR0;a
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50; 950



; ahora curva izq
;-----------------------------------
let x=x-20; 380
dw y,x,SEGMENT_EDGE_LWI20;a
dw y,x+ancho,SEGMENT_EDGE_RWI20;b
let y =y+50;1000

let x=x-40;340
dw y,x,SEGMENT_EDGE_LRI40;a
dw y,x+ancho,SEGMENT_EDGE_RRI40;b
let y =y+50

let x=x-20;320
dw y,x,SEGMENT_EDGE_LWI20;a
dw y,x+ancho,SEGMENT_EDGE_RWI20;b
let y =y+50; 1100




; ahora recta
;-----------------------------
dw y,x,SEGMENT_EDGE_LR0;a
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50


dw y,x,SEGMENT_EDGE_LW0;a
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y =y+50

dw y,x,SEGMENT_EDGE_LR0;a
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50

dw y,x,SEGMENT_EDGE_LW0;a
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y =y+50

dw y,x,SEGMENT_EDGE_LR0;a
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50

dw y,x,SEGMENT_EDGE_LW0;a
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y =y+50; 1400


;========== charco ========================
dw y-5,x+40,CHARCO;
dw y+15,x+36,ROAD_ZOOM;
;==========================================


dw y,x, SEGMENT_EDGE_LR0;
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50

dw y,x, SEGMENT_EDGE_LW0;
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y =y+50

;y=1500
dw y,x, SEGMENT_EDGE_LR0;
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50

dw y,x, SEGMENT_EDGE_LW0;
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y =y+50; 1600



;========== charco ========================
dw y-5,x+50,CHARCO;
dw y+15,x+46,ROAD_ZOOM;
;==========================================

dw y,x, SEGMENT_EDGE_LR0;
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50;1650

;========== arbol =========================
dw y,x-20,ARBOL_ZOOM;
dw y+20,x-22,CAMPO_ZOOM;
;==========================================


dw y,x, SEGMENT_EDGE_LW0;
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y =y+50; 1700


;========== arbol =========================
dw y-5,x+ancho+40,ARBOL_ZOOM;
dw y+15,x+ancho+34,CAMPO_ZOOM;
;==========================================

dw y,x, SEGMENT_EDGE_LR0;
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50; 1750


; ahora curva izq
;--------------------
let x=x-20;300
dw y,x,SEGMENT_EDGE_LWI20;a
dw y,x+ancho,SEGMENT_EDGE_RWI20;b
let y =y+50; 1800


let x=x-40;260
dw y,x,SEGMENT_EDGE_LRI40;a
dw y,x+ancho,SEGMENT_EDGE_RRI40;b
let y =y+50; 1850

let x=x-20;240
dw y,x,SEGMENT_EDGE_LWI20;a
dw y,x+ancho,SEGMENT_EDGE_RWI20;b
let y=y+50; 1900


; ahora recta 
;--------------------
dw y,x, SEGMENT_EDGE_LR0;
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y =y+50; 1950

;========== arbol =========================
dw y-5,x-14,ARBOL_ZOOM;
dw y+15,x-16,CAMPO_ZOOM;b
;===========================================


dw y,x, SEGMENT_EDGE_LW0
dw y,x+ancho,SEGMENT_EDGE_RW0;
let y=y+50; 2000


dw y,x, SEGMENT_EDGE_LR0;
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y=y+50; 2050

; ahora curva derecha
;--------------------------------------------
let x=x+20;260
dw y,x,SEGMENT_EDGE_LWD20;a
dw y,x+ancho,SEGMENT_EDGE_RWD20;b
let y=y+50; 2100

let x=x+30;290
dw y,x,SEGMENT_EDGE_LRD30;a
dw y,x+ancho,SEGMENT_EDGE_RRD30;b
let y=y+50; 2150

let x=x+30;320
dw y,x,SEGMENT_EDGE_LWD30;a
dw y,x+ancho,SEGMENT_EDGE_RWD30;b
let y=y+50; 2200

;========== arbol =========================
dw y-5,x-24,ARBOL_ZOOM;
;dw y+15,x-26,CAMPO_ZOOM;
dw y+15,x-21,CAMPO_ZOOM;
;==========================================


let x=x+30;350
dw y,x,SEGMENT_EDGE_LRD30;a
dw y,x+ancho,SEGMENT_EDGE_RRD30;b
let y=y+50; 2250

let x=x+30;380
dw y,x,SEGMENT_EDGE_LWD30;a
dw y,x+ancho,SEGMENT_EDGE_RWD30;b
let y=y+50; 2300

;========== arbol =========================
dw y-5,x-24,ARBOL_ZOOM;
;dw y+15,x-26,CAMPO_ZOOM;b
dw y+15,x-21,CAMPO_ZOOM;b
;==========================================

let x=x+30;410
dw y,x,SEGMENT_EDGE_LRD30;a
dw y,x+ancho,SEGMENT_EDGE_RRD30;b
let y=y+50; 2350

let x=x+30;440
dw y,x,SEGMENT_EDGE_LWD30;a
dw y,x+ancho,SEGMENT_EDGE_RWD30;b
let y=y+50; 2400

; ahora recta
;--------------------------

dw y,x, SEGMENT_EDGE_LR0;
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y=y+50; 2450

dw y,x, SEGMENT_EDGE_LW0;
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y=y+50; 2500

dw y,x, SEGMENT_EDGE_LR0;
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y=y+50; 2550


dw y,x, SEGMENT_EDGE_LW0;
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y=y+50; 2600

dw y,x, SEGMENT_EDGE_LR0;
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y=y+50; 2650

dw y,x, SEGMENT_EDGE_LW0;
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y=y+50; 2700

; ahora izquierda
;-------------------------------------------
let x=x-30;410
dw y,x,SEGMENT_EDGE_LRI30;a
dw y,x+ancho,SEGMENT_EDGE_RRI30;b
let y=y+50; 2750

let x=x-30;380
dw y,x,SEGMENT_EDGE_LWI30;a
dw y,x+ancho,SEGMENT_EDGE_RWI30;b
let y=y+50; 2800

let x=x-30;350
dw y,x,SEGMENT_EDGE_LRI30;a
dw y,x+ancho,SEGMENT_EDGE_RRI30;b
let y=y+50; 2850

let x=x-30;320
dw y,x,SEGMENT_EDGE_LWI30;a
dw y,x+ancho,SEGMENT_EDGE_RWI30;b
let y=y+50; 2900

; ahora recta
;------------------------------------
dw y,x, SEGMENT_EDGE_LR0
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y=y+50; 2950

dw y,x, SEGMENT_EDGE_LW0
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y=y+50;3000

dw y,x,  SEGMENT_EDGE_LR0
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y=y+50;3050


dw y,x, SEGMENT_EDGE_LW0
dw y,x+ancho,SEGMENT_EDGE_RW0;b
let y=y+50;3100


dw y,x,  SEGMENT_EDGE_LR0
dw y,x+ancho,SEGMENT_EDGE_RR0;b
let y=y+50;3150

dw y,x, SEGMENT_EDGE_LW0
dw y,x+ancho,SEGMENT_EDGE_RW0;b


_CIRCUITO1_END