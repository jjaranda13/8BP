# 8BP
8 bits de poder ( 8 bits of power)

8BP nos proporciona una potente librería que nos permitirá realizar juegos profesionales desde el Basic, mientras que las operaciones más intensivas en el uso de CPU son interpretadas y ejecutadas en código máquina. La libreria, al cargarla en el amstrad te "amplia" el BASIC con una serie de comandos especificos para hacer juegos. A este set de comandos nuevo se le llama "extensiones del basic" o comandos RSX. El amstrad en su dia ya nació pensado para que se pudiesen hacer comandos RSX. Los comandos RSX se caracterizan por tener un "|" delante, por ejemplo para imprimir un sprite con la libreria se usa "|PRINTSP", y como verás todos los comandos nuevos tienen ese palito delante.

descargate el ZIP y en él encontrarás:
- manual en pdf

- binaries: ficheros en ensamblador (.asm) que son los fuentes de la libreria y algunos otros ficheros auxiliares. En principio para probar la libreria desde basic no lo necesitas, aunque si quieres incluir músicas nuevas hechas por ti tendrás que re-ensamblarla (es muy facil y el proceso se indica en el manual). Para hacer un juego completo necesitas esto pero no te preocupes porque no tendras que aprender ensamblador, tan solo tendras que aprender el significado de la palabra "ensamblar".

- gameexamples: un completo juego hecho ("mutante montoya", en honor al clasico "mutant monty") desarrollado integramente en basic usando la libreria. Con este juego puedes aprender modificandolo. Tambien encontraras (en el .dsk de este juego) el editor de sprites (que funciona en BASIC en amstrad) para que hagas tus creaciones.

Dentro de algun tiempo haré una nueva version de la libreria pero será retrocompatible, añadirá alguna de las funcionalidades que se indican en el capitulo 14 de mejoras futuras . La libreria estará viva y distribuiré siempre gratis mejoras y documentacion y juegos. Siempre estará todo a disposición de todos. Ese es el espiritu. compartir le da sentido a las creaciones

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








