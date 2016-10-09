# 8BP
8 bits de poder (8BP). For english version read below

8BP nos proporciona una potente libreria que nos permitira realizar juegos profesionales desde el Basic, mientras que las operaciones mas intensivas en el uso de CPU son interpretadas y ejecutadas en codigo maquina. La libreria, al cargarla en el amstrad te "amplia" el BASIC con una serie de comandos especificos para hacer juegos. A este set de comandos nuevo se le llama "extensiones del basic" o comandos RSX. El amstrad en su dia ya nacio pensado para que se pudiesen hacer comandos RSX. Los comandos RSX se caracterizan por tener un "|" delante, por ejemplo para imprimir un sprite con la libreria se usa "|PRINTSP", y como veras todos los comandos nuevos tienen ese palito delante.

descargate el ZIP y en el encontraras:

- manual en .pdf y en .docx, tanto en espanol como en ingles (la version ingles es borrador)

- libreria, ya preparada en una estructura de directorios para hacer un juego, de hecho en el directorio de la libreria encontraras un juego simple que te permitira dar los primeros pasos, ademas del SPEDIT, el editor de sprites (que funciona en BASIC en amstrad) para que hagas tus creaciones. La libreria tiene ficheros en ensamblador (.asm) que son los fuentes de la libreria y algunos otros ficheros auxiliares. Para hacer un juego completo necesitas esto pero no te preocupes porque no tendras que aprender ensamblador, tan solo tendras que aprender el significado de la palabra "ensamblar".

- GameExamples: Aqui ire dejando juegos hechos con 8BP. De momento tienes dos juegos para aprender y disfrutar con ellos

 - "mutante montoya", en honor al clasico "mutant monty") desarrollado integramente en basic usando la libreria. Con este juego puedes aprender modificandolo. 
 - "Anunnaki": un juego de arcade hecho en BASIC que emplea la tecnica de programacion de logicas masivas

- DemoExamples: Aqui ire dejando pequeñas demos con ejemplos didácticos hechas con  8BP
 
Las mejoras que vaya incorporando seran retrocompatibles por lo que tu juego siempre podras actualizarlo a la ultima version de la libreria. La libreria estara viva y distribuire siempre gratis mejoras y documentacion y juegos. Siempre estara todo a disposicion de todos. Ese es el espiritu. compartir le da sentido a las creaciones


==============================================
8BP provides a powerful library that will allow us to make professional games from Basic, while the most intensive operations CPU usage are interpreted and executed in machine code. The library, once is loaded on the Amstrad, extends BASIC with a series of specific commands to games. This new command set is called "extensions of the basic" or RSX commands. Amstrad in his day already thought to be born could do RSX commands. The RSX commands are characterized by a "|" at the initial character, for example to print a sprite with the library is used "|PRINTSP" and as you will see all new commands have that in front stick.

Download the ZIP and you will find:

- Manual .pdf and .docx, both in Spanish and English (the English version is draft)

- Library, and prepared in a directory structure to make a game, in fact in the library directory you will find a simple game that allow you to take the first steps. In addition you will find the SPEDIT, the sprite editor (works in BASIC in amstrad ) for you to make your creations. The library has files in assembler (.asm) which are the sources of the library and some other auxiliary files. To make full game you need this but do not worry because you do not have to learn assembler, you just have to learn only the meaning of the word "assemble".

- GameExamples: Here i will upload games made with 8BP. At the moment you have two games to learn and enjoy with them

 - "Mutant montoya" in honor of the classic "mutant monty") developed entirely in basic using the library. With this game you can learn modifying it.
 - "Anunnaki": an arcade game made in BASIC . it uses "massive logic" technique programmed in BASIC

- DemoExamples: Here i will upload small demos with didactic examples made 8BP
 
The improvements that are incorporated will be backwards compatible so your game you can always upgrade to the latest version of the library. The library will be alive and always will distribute free upgrades and documentation and games. Everything will always be available to all. That's the spirit. To share creations makes them meaningful 

25/09/2016 ACTUALIZACION V25 (retrocompatible) 
==============================================
He actualizado el repositorio con un pequeno cambio (coherentes entre la documentacion y la libreria).  Al ser un cambio pequeño no he modificado el nombre de version de la libreria ni de la documentación, aunque lo he incorporado en ambos. En la documentacion ademas he añadido un par de apendices utiles nuevos (de una pagina cada uno)

- libreria: ahora se incluye 8bitsdepoder_v25.asm con la siguiente mejora
  	- nuevo parámetro opcional en |AUTOALL, de modo que AUTOALL,1 invoca internamente a ROUTEALL antes de mover el sprite, ahorrándote una invocación desde BASIC que siempre va a suponer un precioso milisegundo.


23/09/2016 ACTUALIZACION V25 (retrocompatible) 
==============================================
He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria). 

- libreria: ahora se incluye 8bitsdepoder_v26.asm con las siguientes mejoras 
  	- 8BP ahora es compatible con WYZtracker 2.0.1.0: esta version del secuenciador de musica (creado por Augusto Ruiz, un excelente programador) es perfecta y no tiene ningun bug, aunque ocupa algo mas de memoria, por lo que he hecho algunos ajustes en el mapa de memoria de 8BP
  	- El mapa de memoria de 8BP te sigue dejando libres 26KB para BASIC pero ahora la zona de memoria donde se almacena el mapa del mundo y la zona donde se almacena el layout es el mismo area. Ello implica que no se pueden usar ambas cosas a la vez (lo cual tiene mucho sentido porque un juego con scroll usa mapa del mundo y no layout y viceversa)
	- Puesto que en la V25 el area de memoria de las imagenes comenzaba con las secuencias y las rutas, cada vez que creabas una secuencia o una ruta, las imagenes se ensamblaban en otras direcciones y era un rollo consultar las direcciones cuando quieres usar las imagenes en los comandos |SETUPSP,#,9,image_address o bien |SETUPSQ. Por ello he creado una lista llamada IMAGE_LIST que se incluye en el fichero images_tujuego.asm y donde puedes apuntar imagenes que quieras usar desde esos comandos usando numeros constantes desde 16 hasta 255 y que no cambian aunque las imagenes se reesamblen en direcciones diferentes. Esto facilita la vida al programador de BASIC 

- demos:
	- he recompilado juegosimple con la libreria V26

- TOOLS: he incluido la version del WYZtracker (la 2.0.1.0) que es compatible con 8BP en el directorio raiz. La web de augusto ruiz es https://github.com/AugustoRuiz/WYZTracker


23/09/2016 ACTUALIZACION V25 (retrocompatible) 
==============================================
He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria). 

- libreria: ahora se incluye 8bitsdepoder_v25.asm con las siguientes mejoras 
  	- macrosecuencias de animacion: permiten que un sprite cambie de secuencia de animacion de un modo automatico en funcion de su direccion
  	- nuevo comando ROUTEALL capaz de enrutar a los sprites por trayectorias definidas por usuario

- demos:
	- se incluyen una serie de demos en el dsk de la V25, asi como una demo de scroll horizontal en el directorio de demos

22/09/2016 ACTUALIZACION de SPEDIT V08
==============================================
He actualizado el repositorio con una version de spedit que corrige un pequeno bug, solo detectable si ejecutabas dos veces seguidas un flip vertical. 

13/09/2016 ACTUALIZACION V24 (retrocompatible) 
==============================================
He actualizado el repositorio con el siguiente cambio:

- libreria: corregido un pequeno bug que he detectado en el comando |STARS y ahora no solo funciona correctamente sino que ademas es mas rapido. No he cambiado de nombre el fichero .asm , simplemente lo he corregido. Por coherencia he reensamblado y regenerado los .dsk de ejemplo de la V24 y de la demo de minicomando

10/09/2016 ACTUALIZACION V24 (retrocompatible) 
==============================================
He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria). 

- libreria: ahora se incluye 8bitsdepoder_v24.asm con las siguientes mejoras 
  	- scroll multidireccional basado en el nuevo comando |MAP2SP capaz de trasladar un mapa del mundo a sprites activos.
  	- fichero map_table.asm donde se describe la lista de elementos graficos que componen el mundo, ubicados en coordenadas que van desde 0 hasta 32000 tanto en x como en y
  	- la libreria ahora ocupa desde la direccion 26000, dejando 26 KB al programador BASIC, frente a los 27KB anteriores

- demos:
	- se incluye un minijuego tipo commando para demostrar el mecanismo de scroll


14/07/2016 ACTUALIZACION V23b (retrocompatible) 
==============================================
He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria). 

- libreria: ahora se incluye 8bitsdepoder_v23b.asm con las siguientes mejoras 
  	- comando |COLAY permite definir un umbral ASCII de colision, de modo que podemos usar elementos que tengan asociada una letra en el layout que sea considerada como el espacio en blanco de cara a considerar colision. muy util en sobreescritura
  	
- nuevo directorio de demos:
	- he añadido un directorio con demos hechas con 8BP, como un repositorio de ejemplos sencillos y didácticos que ire ampliando



07/06/2016 ACTUALIZACION V23 (retrocompatible) 
==============================================
He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria). La documentacion no ha sido actualizada porque los cambios no afectan a la documentacion.

- libreria: ahora se incluye 8bitsdepoder_v23.asm con las siguientes mejoras 
  	- gestion de interrupciones mejorada: ahora la musica funciona mejor, mas fluida, siempre a la misma velocidad
- juegos:
	- he añadido una version del anunnaki en la que uso la version v23. El programa BASIC es el mismo, pero con esta version de la libreria, el juego funciona mejor. los sprites se imprimen algo mas deprisa y la musica suena con fluidez y sin que pueda relentizarse en ningun momento




26/05/2016 ACTUALIZACION V22.06 (retrocompatible) 
==============================================
He actualizado el repositorio con los siguientes cambios (coherentes entre la documentacion y la libreria).

- libreria: ahora se incluye 8bitsdepoder_v2206.asm con las siguientes mejoras 
  	- impresion de sprites normales y transparentes más rapida (en un soldado de 12x24 ahora es 0.5 ms mas rápida)
  	
	
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

