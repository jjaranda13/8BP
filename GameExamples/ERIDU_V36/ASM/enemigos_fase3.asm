org 23100;&5cf8
; cada elemento es un enemigo que nace en la posicion map/8, aunque se puede colocar donde queramos
; ruta,y,x,pasos
; si ruta=0 entonces no hay enemigo en esa posicion
; he puesto 50 elementos de modo que como mucho map puede medir 50x8 = 400 de ancho
; formula para ubicar mas o menos un enemigo (calcular la x aqui) es x=(map-80)/8 , tras probar corrijo un poco la x,y y ya esta
; lo hago asi (con coordenadas x divididas entre 8) por dos motivos 
; 1) porque cada enemigo nuevo aparecera cada varios bytes, no cada byte. No merece la pena tener resolucion de byte para ubicar un enemigo.
; 2) porque usando bytes (en lugar de words) para las coordenadas ahorro memoria

db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 2,45,78,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0


db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 2,90,78,0
db 0,0,0,0
db 1,0,83,0;fuel
db 0,0,0,0


db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 3,180,80,90
db 2,100,80,0
db 1,28,80,0
db 0,0,0,0
db 0,0,0,0

db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
db 2,184,88,0
db 2,164,80,0
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0


db 0,0,0,0
db 0,0,0,0
db 3,180,80,60
db 3,180,80,40
db 1,180,80,0
db 0,0,0,0
db 3,180,80,80
db 0,0,0,0
db 0,0,0,0
db 0,0,0,0
