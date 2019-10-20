org 22400;&5cf8
; cada elemento es un enemigo que nace en la posicion map/8, aunque se puede colocar donde queramos
; ruta,y,x,pasos
; si ruta=0 entonces no hay enemigo en esa posicion
; he puesto 50 elementos de modo que como mucho map puede medir 50x8 = 400 de ancho
; formula para ubicar mas o menos un enemigo (calcular la x aqui) es x=(map-80)/8 , tras probar corrijo un poco la x,y y ya esta
; lo hago asi (con coordenadas x divididas entre 8) por dos motivos 
; 1) porque cada enemigo nuevo aparecera cada varios bytes, no cada byte. No merece la pena tener resolucion de byte para ubicar un enemigo.
; 2) porque usando bytes (en lugar de words) para las coordenadas ahorro memoria
db 11,0,80,80
;db 3,156,78,80
db 3,136,78,60
db 3,116,80,80
db 3,96,82,90
db 0,0,0,0
db 1,66,86,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0

db 0,0,0,0
db 11,40,78,60
db 12,64,80,0
db 1,168,76,0
db 0,0,0,0
db 5,160,80,0
db 0,0,0,0
db 5,150,80,0
db 0,0,0,0
db 5,130,80,0

db 0,0,0,0
db 0,0,0,0
db 5,80,80,0
db 0,0,0,0
db 0,0,0,0
db 1,65,80,0
db 3,78,80,80
db 0,0,0,0
db 3,118,82,70
db 0,0,0,0

db 0,0,0,0
db 3,158,80,80
db 12,120,80,0
db 12,80,80,0
db 13,144,84,0
db 0,0,0,0
db 0,0,0,0
db 11,0,80,100
db 13,64,80,60
db 1,148,78,0

db 0,0,0,0
db 3,180,80,120
db 0,0,0,0
db 5,140,80,0
db 0,0,0,0
db 5,60,80,0
db 12,100,80,0
db 11,0,80,100
db 3,180,80,80
db 0,0,0,0


