10 memory 23999: 
20 load "!8bp.bin"
25 mode 1:call &bc02: pen 1
26 locate 10,1:print "   *  ***  ***"
27 locate 10,2:print "  * *  * *  * *"
28 locate 10,3:print "  * *  * *  * *" 
29 locate 10,4:print "   *   **   **"
30 locate 10,5:print "  * *  * *  *"
31 locate 10,6:print "  * *  * *  *"
32 locate 10,7:print "   *  ***  ***   v40"
33 pen 2:print ""
39 print "elige una demo"
40 print "--------------------------": pen 3:ink 3,15
50 print "1) juego sencillo con musica"
60 print "2) juego sencillo con salto y disparo"
65 print "3) test colision sprites"
70 print "4) test layout con sobreescritura"
75 print "5) test animacion tintas"
80 print "6) test sobreescritura mode 1"
90 print "7) test ordenamiento sprites"
91 print "8) test mini alfabeto"
92 print "9) test rutas de sprites"
93 print "10) test scroll multidireccional"
94 print "11) test pseudo-3D"
95 print "12) test stars"
96 print "13) test music y fx a la vez"
97 print "14) test 8BP en C":pen 1
100 input demo
110 run "demo"+mid$(str$(demo),2,10)+".bas"



