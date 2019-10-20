org 21200;&5cf8
; cada elemento es un enemigo que nace en la posicion Xmap=LINEA*8+xini, aunque se puede colocar donde queramos
; cada elemento se define con 4 parametros (ruta,y,x,pasos)
; si ruta=0 entonces no hay enemigo en esa posicion
; he puesto 50 elementos de modo que como mucho map puede medir 50x8 = 400 de ancho
; formula para ubicar mas o menos un enemigo es 
; LINEA = (Xmap-80)/8 , el 80 es el xini. Tras probar corrijo un poco la xini, o la linea o la Y
; lo hago asi (con coordenadas x divididas entre 8) por dos motivos 
; 1) porque cada enemigo nuevo aparecera cada varios bytes, no cada byte. No merece la pena tener resolucion de byte para ubicar un enemigo.
; 2) porque usando bytes (en lugar de words) para las coordenadas ahorro memoria

db 5,130,80,0
db 5,60,80,0
db 5,60,80,0
db 5,100,80,0
db 12,100,80,0
db 5,25,84,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 3,38,82,80


db 11,140,80,80
db 3,38,80,80
db 11,140,80,80
db 3,38,80,80
db 5,100,80,0
db 0,0,0,0
db 12,30,80,0
db 12,160,80,0
db 1,67,84,0
db 0,0,0,0


db 0,0,0,0
db 0,0,0,0
db 5,100,80,0
db 5,100,80,0
db 5,100,80,0
db 3,200,90,80
db 11,10,84,80
db 3,200,80,100
db 0,0,0,0
db 0,0,0,0



db 1,68,78,0
db 12,15,80,0
db 12,170,80,0
db 0,0,0,0
db 0,0,0,0
db 13,140,80,60
db 13,120,80,0
db 0,140,80,0
db 13,220,100,0
db 0,100,80,0
db 12,96,80,0
db 13,40,80,0


db 5,40,80,0
db 5,180,80,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 5,120,80,0
db 5,100,80,0
db 5,40,80,0


_END_ENEMIGOS_FASE5