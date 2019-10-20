org 23800;&5cf8
; cada elemento es un enemigo que nace en la posicion map/8, aunque se puede colocar donde queramos
; ruta,y,x,pasos
; si ruta=0 entonces no hay enemigo en esa posicion
; he puesto 50 elementos de modo que como mucho map puede medir 50x8 = 400 de ancho
; formula para ubicar mas o menos un enemigo (calcular la x aqui) es x=(map-80)/8 , tras probar corrijo un poco la x,y y ya esta
; lo hago asi (con coordenadas x divididas entre 8) por dos motivos 
; 1) porque cada enemigo nuevo aparecera cada varios bytes, no cada byte. No merece la pena tener resolucion de byte para ubicar un enemigo.
; 2) porque usando bytes (en lugar de words) para las coordenadas ahorro memoria
db 3,170,80,100;cohete
db 3,170,80,80
db 3,170,80,70
db 3,170,80,100
db 3,170,80,100
db 3,170,80,80
db 1,178,80,0;fuel
db 0,0,0,0
db 0,0,0,0
;db 2,136,79,0;gema
db 2,136,80,0;gema

db 0,0,0,0
;db 3,114,90,60
;db 3,114,78,80
db 3,114,92,60
db 3,114,80,80
db 0,0,0,0
db 0,0,0,0
db 3,92,84,80
db 2,99,80,0
db 0,0,0,0
db 3,70,81,70
db 3,70,80,90

db 0,0,0,0
db 2,90,80,0
db 0,0,0,0
db 3,112,80,80
db 1,120,76,0
db 3,114,84,100
db 2,114,80,0
db 2,100,80,0
db 0,0,0,0
db 0,0,0,0

db 3,93,80,70
db 3,93,76,90
db 3,114,84,100
db 3,114,80,110
db 0,0,0,0
db 3,150,80,100
db 0,0,0,0
db 3,170,84,100
db 3,170,80,80
db 2,178,76,0

db 5,150,80,0; ovni
db 0,0,0,0
db 5,100,80,0
db 0,0,0,0
db 5,40,80,0
db 0,0,0,0
db 0,0,0,0
db 5,50,80,0
db 0,0,0,0
db 0,0,0,0


