cls
color 1E
echo off
echo.
echo    8888   BBBBBB   PPPPPP
echo   88  88   BB  BB   PP  PP
echo   88  88   BB  BB   PP  PP
echo    8888    BBBBB    PPPPP     
echo   88  88   BB  BB   PP                        
echo   88  88   BB  BB   PP
echo    8888   BBBBBB   PPPP
echo 8 bits de poder . Un tributo al AMSTRAD CPC                  
echo Jose Javier Garcia Aranda 2016-2020
echo.
echo  *********************************************
echo  *        compilacion con SDCC               *
echo  *********************************************
echo  borramos los ficheros de compilacion anterior
echo  *********************************************
del output\ciclo.*

if exist "output\ciclo.dsk" (
color 4e
  echo   "+--------------------------------------+"
  echo   "|   desconecta el ciclo.dsk del winape |"
  echo   "|si esta conectado no se puede recrear |"
  echo   "+--------------------------------------+"
  goto end
  
) else (
 rem ok
)

echo.
echo.
echo  main.c : compilamos y linkamos, generando un main.ihx
echo  ********************************************
echo sdcc -mz80 --verbose --code-loc 20000 --data-loc 0 --no-std-crt0 --fomit-frame-pointer --opt-code-size -I8BP_wrapper -Imini_BASIC ciclo.c 
sdcc -mz80 --verbose --code-loc 20000 --data-loc 0 --no-std-crt0 --fomit-frame-pointer --opt-code-size -I8BP_wrapper -Imini_BASIC -o output/ ciclo.c 

echo .

if not exist "output/ciclo.map" (
  color 4e
  echo   "+-------------------------------+"
  echo   "|   HAY ERRORES DE COMPILACION! |"
  echo   "+-------------------------------+"
  goto end
  
) else (
  color 2e
)

echo   FICHERO ciclo.map generado correctamente
echo.
echo.
echo  Debes consultar el fichero ciclo.map para averiguar la direccion de cualquier funcion
echo  y sobre todo la funcion  _main, la direccion mas baja la he fijado en 20000 ( 0x4e20)
echo  ojo: Comprueba que la direccion mayor no exceda de 23999 (0x5DBF).Si excede estaras
echo       destruyendo la libreria 8BP. Si es mayor, entonces intenta ensamblar desde una 
echo       direccion mas baja,por ejemplo 19000. Y en el programa basic pon MEMORY 18999
echo  =====================================================================================
echo.
echo  transformamos el .ihx en un .bin
echo  ********************************************
echo  hex2bin output\ciclo.ihx
hex2bin output\ciclo.ihx

echo.
echo.
echo  metemos el .bin en un disco de amstrad cpc
echo  ********************************************
echo  managedsk -C -S"output\ciclo.dsk"
managedsk -C -S"output\ciclo.dsk"
echo  managedsk -L"output\ciclo.dsk" -I"output\ciclo.bin"/CICLO.BIN/BIN/20000 -S"output\ciclo.dsk"
managedsk -L"output\ciclo.dsk" -I"output\ciclo.bin"/CICLO.BIN/BIN/20000 -S"output\ciclo.dsk"

echo.
echo.
echo  "***********************************************************" 
echo  "*                   FIN DEL PROCESO                       *"
echo  "*  ASEGURATE DE QUE NO EXCEDES LA DIRECCION 24000         *"
echo  "* es la (highest address) de la transformacion ihx en bin *"
echo  "*                                                         *"
echo  "* se ha generado ciclo.dsk y dentro esta ciclo.bin        *"
echo  "*                                                         *"
echo  "* Pasos para cargarlo en el amstrad                       *"
echo  "* 1) carga o ensambla 8BP, con tus graficos, musica etc   *"
echo  "* 2) carga tu juego BASIC                                 *"
echo  "* 3) ejecuta LOAD "ciclo.bin", 20000                      *"
echo  "* para invocar a tu programa o rutina simplemente:        *"
echo  "* call <direccion de main en fichero ciclo.map>           *"
echo  "*                                                         *"
echo  "*  Para mover ciclo.bin de ciclo.dsk a otro disco debes   *"
echo  "*  conocer su longitud:                                   *"
echo  "*   longitud=Highest address - Lowest address             *"
echo  "*   lo cargas desde ciclo.dsk                             *"
echo  "*     LOAD "ciclo.bin", 20000                             *"
echo  "*   Y salvas en el disco donde esta tu juego              *"
echo  "*     SAVE "ciclo.bin",b,20000,longitud                   *"
echo  "***********************************************************"

:end 