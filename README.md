# 8BP
8 bits de poder ( 8 bits of power)

8BP nos proporciona una potente librería que nos permitirá realizar juegos profesionales desde el Basic, mientras que las operaciones más intensivas en el uso de CPU son interpretadas y ejecutadas en código máquina. La libreria, al cargarla en el amstrad te "amplia" el BASIC con una serie de comandos especificos para hacer juegos. A este set de comandos nuevo se le llama "extensiones del basic" o comandos RSX. El amstrad en su dia ya nació pensado para que se pudiesen hacer comandos RSX. Los comandos RSX se caracterizan por tener un "|" delante, por ejemplo para imprimir un sprite con la libreria se usa "|PRINTSP", y como verás todos los comandos nuevos tienen ese palito delante.

descargate el ZIP y en él encontrarás:
- manual en pdf

- binaries: ficheros en ensamblador (.asm) que son los fuentes de la libreria y algunos otros ficheros auxiliares. En principio para probar la libreria desde basic no lo necesitas, aunque si quieres incluir músicas nuevas hechas por ti tendrás que re-ensamblarla (es muy facil y el proceso se indica en el manual). Para hacer un juego completo necesitas esto pero no te preocupes porque no tendras que aprender ensamblador, tan solo tendras que aprender el significado de la palabra "ensamblar".

- gameexamples: un completo juego hecho ("mutante montoya", en honor al clasico "mutant monty") desarrollado integramente en basic usando la libreria. Con este juego puedes aprender modificandolo. Tambien encontraras (en el .dsk de este juego) el editor de sprites (que funciona en BASIC en amstrad) para que hagas tus creaciones.

Dentro de algun tiempo haré una nueva version de la libreria pero será retrocompatible, añadirá alguna de las funcionalidades que se indican en el capitulo 14 de mejoras futuras . La libreria estará viva y distribuiré siempre gratis mejoras y documentacion y juegos. Siempre estará todo a disposición de todos. Ese es el espiritu. compartir le da sentido a las creaciones


08/03/2016 ACTUALIZACION v20 (retrocompatible) 
==============================================

He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria).

- libreria: 
  - ahora se incluye 8bitsdepoder_v20.asm con las siguientes mejoras 
  	- COLSP : ahora puedes definir la sensibilidad de la collision (grado de solape entre sprites)
  	- nuevo comando COLSPALL que permite acelerar la detecci�n de colisiones entre sprites y simplifica el BASIC necesario
  	- nuevo bit de "colisionador" en el byte de status
  
- documentacion: disponible el manual v20, que incluye:
	- COLSP : ahora puedes definir la sensibilidad de la collision (grado de solape entre sprites)
  	- nuevo comando COLSPALL que permite acelerar la detecci�n de colisiones entre sprites y simplifica el BASIC necesario
  	- nuevo bit de "colisionador" en el byte de status

con estas mejoras los juegos arcade ahora funcionan aun m�s rapido. Se incluye la demo de annunaki donde podeis comprobar el uso de estas mejoras
  
  

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

- libreria: ahora se incluye 8bitsdepoder_v18.asm con mejoras en COLSP y aumento de velocidad en STARS, mediante una optimización de cálculos

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

