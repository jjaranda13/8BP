


org 27000
;------- sprite 0 MONTOYA------------------
sprite0		db 1; status, es un byte de flags
		; bit 0 flag de impresion. Si esta a 1 (activo) se imprime en PRINT_SPRITES()
		; bit 1 flag de colision. una fruta o moneda por ejemplo pueden no tener flag de 
		;	impresion pero tener el de colision
   		; bit 2 flag de animacion automatica. se tiene en cuenta en ANIMA_ALL(). 
		;       En el caso del personaje , recomiendo desactivarlo, ya que si me quedo quieto no
		;	hay que cambiar el fotograma.
		; un sprite activo con deteccion de colision y animacion debe tener 
		;  status = 1(bit 0)+ 2 (bit1) + 4 (bit 2) =7
		; bit 3 flag de movimiento automatico. Se mueve solo al invocar MOVE_ALL()
		;	teniendo en cuenta su velocidad. util en meteoritos y guardias.
		; 	
		dw 100; coordy puede tomar valores negativos. area visible es[0..199]
		dw 40; coordx . puede tomar valores negativos. area visible es[0..79]. 
		db 0; velocidadY para movimiento automatico
		db 0; velocidadX para movimiento automatico
		db 1; identificador de secuencia de animacion asignada [0..NUM_SEQUENCES]
	 	   ; un 0 significa que no hay secuencia de animacion
		db 0; identificador de frame en la secuencia de animacion[0..n]
	    	; si sa secuencia de animacion es cero , este campo se ignora
		dw 0
		;dw IMAGE0; como ejemplo he puesto la direccion de la imagen 0
		; si hay una secuencia  de animacion asignada, entonces este dato es 
		; redundante con el id_frame. Aun asi es necesario.
		; Ademas si no hay secuencia es la unica forma de indicar cual es la imagen,
		; ejemplo hierba, ladrillos, etc objetos sin secuencias de animacion

		;cada sprite ocupa 16 bytes para que sea muy rapido calcular su direccion
		; 16 en binario es 1000, mientras que 11 en binario es 1011
		; la velocidad en multiplicar depende del numero de unos.
		db 0 ; posible uso futuro
		db 0 ; posible uso futuro
		db 0 ; posible uso futuro
		db 0 ; posible uso futuro
		db 0 ; posible uso futuro
;--------------------------------------------------------------------------
