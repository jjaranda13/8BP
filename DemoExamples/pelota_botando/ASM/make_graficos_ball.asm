
; ---------- datos de secuencias e imagenes -------------------
; aqui se almacenan tanto las secuencias como las imagenes
; las secuencias se pueden hacer en basic con SETUPSQ o bien
; mediante POKE
; es interesante meter todo en el mismo fichero para poder
; usar las etiquetas de las imagenes en las secuencias



org 33500
read "sequences_ball.asm"

;org 34000+420; ATENCION! si no vas a usar el layout pon 34000

org 34000
read "images_ball.asm"
;---------------------TABLA DE SPRITES-------------------------
; esta parte es opcional. puedes manipular la tabla desde basic 
; usando SETUPSP y LOCATESP o bien directamente con POKE
; aunque con POKE no puedes insertar coordenadas negativas

org 27000
read "sprites_table_ball.asm"
