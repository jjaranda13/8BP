; esta es una rutina que se usa en SPEDIT. no forma parte de la libreria
org &8000
GET_PEN
ld a,(ix+2)
call &bc35; get ink
ld a,b
ld l, (IX+0)
ld h,(IX+1)
ld (hl),a
ret