# 8BP
8 bits de poder (8BP)

8BP nos proporciona una potente libreria que nos permitira realizar juegos profesionales desde el Basic, mientras que las operaciones mas intensivas en el uso de CPU son interpretadas y ejecutadas en codigo maquina. La libreria, al cargarla en el amstrad te "amplia" el BASIC con una serie de comandos especificos para hacer juegos. A este set de comandos nuevo se le llama "extensiones del basic" o comandos RSX. El amstrad en su dia ya naciÃ³ pensado para que se pudiesen hacer comandos RSX. Los comandos RSX se caracterizan por tener un "|" delante, por ejemplo para imprimir un sprite con la libreria se usa "|PRINTSP", y como veras todos los comandos nuevos tienen ese palito delante.

descargate el ZIP y en el encontraras:

- manual en pdf

- libreria, ya preparada en una estructura de directorios para hacer un juego, de hecho en el directorio de la libreria encontraras un juego simple que te permitira dar los primeros pasos, ademas del SPEDIT, el editor de sprites (que funciona en BASIC en amstrad) para que hagas tus creaciones. La libreria tiene ficheros en ensamblador (.asm) que son los fuentes de la libreria y algunos otros ficheros auxiliares. Para hacer un juego completo necesitas esto pero no te preocupes porque no tendras que aprender ensamblador, tan solo tendras que aprender el significado de la palabra "ensamblar".

- gameexamples: Aqui ire dejando juegos hechos con 8BP. De momento tienes dos juegos para aprender y disfrutar con ellos

 - "mutante montoya", en honor al clasico "mutant monty") desarrollado integramente en basic usando la libreria. Con este juego puedes aprender modificandolo. 
 - "Anunnaki": un juego de arcade hecho en BASIC que emplea la tecnica de programacion de logicas masivas
 
Las mejoras que vaya incorporando seran retrocompatibles por lo que tu juego siempre podras actualizarlo a la ultima version de la libreria. La libreria estarÃ¡ viva y distribuire siempre gratis mejoras y documentacion y juegos. Siempre estara todo a disposicion de todos. Ese es el espiritu. compartir le da sentido a las creaciones

26/05/2016 ACTUALIZACION V22.06 (retrocompatible) 
==============================================
He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria).

- libreria: 
	- ahora se incluye 8bitsdepoder_v2206.asm con las siguientes mejoras 
  	- impresion de sprites normales y transparentes más rapida (en un soldado de 12x24 ahora es 0.5 ms mas rápida)
  	
- manual v22 actualizado, 
	- corregida la relacion entre impresión transparente versus impresion normal, que ahora es de 1.5 
	
	
19/05/2016 ACTUALIZACION V22b (retrocompatible) 
==============================================
He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria).

- libreria: 
  - ahora se incluye 8bitsdepoder_v2204.asm con las siguientes mejoras 
  	- la impresion ordenada de sprites es mas rapida (0.4ms mas rapida)
  	- el parametro de ordenacion ahora permite ordenar la lista de sprites parcialmente, de modo que puedes imprimir un subconjunto de sprites ordenado y otro de forma secuencial.
 
- manual v22 actualizado, indicando los
	- impresion ordenada de sprites parcial, configurable con un parametro en PRINTSPALL
	- algunos tiempos de ejecucion, comparando impresion ordenada con secuencial e impresion con/sin sobreescritura 


16/05/2016 ACTUALIZACION V22 (retrocompatible) 
==============================================
He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria).

- libreria: 
  - ahora se incluye 8bitsdepoder_v22.asm con las siguientes mejoras 
   	- flag de sobreescritura en sprites, capacidad para imprimirse sobre un fondo reestableciendolo
   	- colisiones entre sprites ahora pueden tener la forma del sprite y no una forma rectangular
   	- los sprites se pueden imprimir ordenados por coordenada "Y", gracias a un nuevo parámetro en |PRINTSPALL. Ello permite solapes de sprites ordenados
  - herramienta SPEDIT v6: ahora puedes dibujar sprites con capacidad de sobreescritura
  
- documentacion: disponible el manual v22, que incluye:
	- seccion de sprites con sobreescritura
	- sección de ordenamiento de sprites
  	- comando |PRINTSPALL con nuevo parámetro
  	- mas información sobre la memoria de video y los barridos de pantalla
  	


23/03/2016 ACTUALIZACION V21 (retrocompatible) 
==============================================
He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria).

- libreria: 
  - ahora se incluye 8bitsdepoder_v21.asm con las siguientes mejoras 
   	- SETUPSP,5,Vy,Vx: con un solo comando ahora actualizamos la Vy y la Vx, ahorrando casi 3 milisegundos
   	- STARS: comando mejorado, ahora realiza mejor el calculo cuando una estrella se sale por un limite y debe entrar por el lado
  - herramienta SPEDIT v5: ahora puedes "espejar" tu sprites sobre un eje central imaginario, una ayuda para dibujar sprites simetricos
  
- documentacion: disponible el manual v21, que incluye:
	- SETUPSP,5,Vy,Vx: con un solo comando ahora actualizamos la Vy y la Vx, ahorrando casi 3 milisegundos
	- STARS: comando mejorado, ahora realiza mejor el calculo cuando una estrella se sale por un limite y debe entrar por el lado opuesto
  	- explicacion mas detallada de la tecnica de logicas masivas
  	- nuevos consejos  de programacion
  	- codigo del videojuego anunnaki
  	- nuevos consejos sobre como editar musica para no tener problemas
  	




08/03/2016 ACTUALIZACION v20 (retrocompatible) 
==============================================

He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria).

- libreria: 
  - ahora se incluye 8bitsdepoder_v20.asm con las siguientes mejoras 
  	- COLSP : ahora puedes definir la sensibilidad de la collision (grado de solape entre sprites)
  	- nuevo comando COLSPALL que permite acelerar la detección de colisiones entre sprites y simplifica el BASIC necesario
  	- nuevo bit de "colisionador" en el byte de status
  
- documentacion: disponible el manual v20, que incluye:
	- COLSP : ahora puedes definir la sensibilidad de la collision (grado de solape entre sprites)
  	- nuevo comando COLSPALL que permite acelerar la detección de colisiones entre sprites y simplifica el BASIC necesario
  	- nuevo bit de "colisionador" en el byte de status

con estas mejoras los juegos arcade ahora funcionan aun más rapido. Se incluye la demo de annunaki donde podeis comprobar el uso de estas mejoras
  
  

02/03/2016 ACTUALIZACION v19 (retrocompatible) 
==============================================

He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria).

- libreria: 
  - ahora se incluye 8bitsdepoder_v19.asm con mejoras en COLSP y soporte de "secuencias de muerte"
  - los directorios aparecen mejor organizados, de acuerdo a la recomendacion que se hace en el manual de 8BP 

- documentacion: disponible el manual v19, que incluye:
  - nuevo uso del comando COLSP, especificando el sprite 33 se puede acelerar reutilizando la variable de retorno
  - soporte de secuencias de animacion "de muerte". Se trata de una secuencia de animacion, que tras recorrerla, un sprite queda desactivado
  - recomendacion sobre directorios en los que almacenar los ficheros de tu proyecto
 

28/02/2016 ACTUALIZACION v18 (retrocompatible) 
==============================================

He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria).

- libreria: ahora se incluye 8bitsdepoder_v18.asm con mejoras en COLSP y aumento de velocidad en STARS, mediante una optimizaciÃ³n de cÃ¡lculos

- documentacion: disponible el manual v18, que incluye:
  - explicacion adicional de la diferencia entre 8BP y un motor de juegos
  - nuevo uso del comando COLSP, especificando el sprite 32 se puede acelerar
  - explicaciones adicionales sobre el uso del flag de colision en tu personaje y disparos
  - nuevos ejemplos en la tabla de velocidad de los comandos BASIC

 

22/02/2016 ACTUALIZACION v17 (retrocompatible) 
==============================================

He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria).

- libreria: ahora se incluye 8bitsdepoder_v17.asm con mejoras en dos comandos (STARS y PRINTSPALL)

- documentacion: disponible el manual v17, que incluye:

  - explicacion adicional del comando MUSIC, por clarificar mas su funcionamiento 
  - algun detalle mas en la explicacion de como hacer una cinta y un disco
  - nuevo comportamiento de PRINTSPALL, en la guia de referencia. compatible con el uso anterior
    ahora es capaz de imprimir en 0.7 ms menos de tiempo. no es una gran mejora pero todo suma.
  - nuevo comportamiento de STARS, con unificacion de los dos bancos de estrellas en uno solo, de modo que ahora puede haber 
    muchos planos de estrellas. compatible con el uso anterior, aunque ahora el significado del primer parametro ha cambiado

