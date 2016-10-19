
; ---------- datos de secuencias e imagenes -------------------
; aqui se almacenan tanto las secuencias como las imagenes
; las secuencias se pueden hacer en basic con SETUPSQ o bien
; mediante POKE
; es interesante meter todo en el mismo fichero para poder
; usar las etiquetas de las imagenes en las secuencias



org 33500
read "sequences_annunaki.asm"

;org 34000+420; ATENCION! si no vas a usar el layout pon 34000
; tabla de rutas. Espacio de longitud variable
read "routes_pruebaV25.asm"

;org 34000
read "images_annunaki.asm"
;---------------------TABLA DE SPRITES-------------------------
; esta parte es opcional. puedes manipular la tabla desde basic 
; usando SETUPSP y LOCATESP o bien directamente con POKE
; aunque con POKE no puedes insertar coordenadas negativas

org 26000; 
;----------------- MAPA DEL MUNDO (400bytes) ------------------------
read "map_table_annunaki.asm"

org 27000
read "sprites_table_annunaki.asm"
