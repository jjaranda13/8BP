10 MEMORY 25999
11 ' esto lo hago antes del defint pues si no dir solo alcanza 32000
12 FOR dir=42580 TO 42618 STEP 2: POKE dir,RND*200:POKE dir+1,RND*80:NEXT 
13 call &BC02:ink 0,0:border 0: 'reestablece la paleta por defecto
14 on break gosub 10000
20 MODE 0: DEFINT A-Z: CALL &6B78:' install RSX

22 DIM c$(25):for i=0 to 24:c$(i)=" ":next:' array para layout
23 dim ex(9):dim ey(9): ' arrays para enemigos en pantalla 3 y 4
24 dim exmin(9):dim eymin(9): ' arrays para enemigos en pantalla 3 y 4
25 dim exmax(9):dim eymax(9): ' arrays para enemigos en pantalla 3 y 4
26 llave =16
50 GOSUB 1000:' presentacion
60 GOSUB 2000:' pantalla 1   
70 GOSUB 3000:' pantalla 2
80 gosub 4000:' pantalla 3
90 gosub 5000:' pantalla 4
100 gosub 6000:' pantalla 5
110 GOTO 50:'vuelta a empezar

500 'rutina reseteo de enemigos-----------------------------------
510 FOR i=1 TO 31:|SETUPSP,i,0,&X0:NEXT
520 RETURN
550 'rutina print layout-----------------------------------------
551 PEN 4:PAPER 7:LOCATE 3,1: PRINT "Mutante Montoya":pen 1:paper 0
560 FOR i=0 TO 23:|LAYOUT,i,0,@c$(i):NEXT
570 RETURN

600 'pantalla de vidas--------------------------------------
610  vidas= vidas-1
611 |MUSICOFF:LOCATE 7,9:PEN 1:PRINT " NIVEL"; nivel
620 LOCATE 7,11:PEN 15:PRINT " VIDAS"; vidas: PEN 1
630 FOR i=1 TO 50: BORDER 7:CALL &BD19:BORDER 0:CALL &BD19:NEXT :CLS
631 vivo=1: IF vidas=0 THEN RUN
640 RETURN

1000 CLS: ' presentacion -----------------------------------
1020 PEN 1:PAPER 0:LOCATE 1,23: PRINT "pulsa S para empezar"    
1021 PEN 2:PAPER 0:LOCATE 11,25: PRINT "JJGA 2016"    
1030 |MUSICOFF:|MUSIC,1,5
1040 INK 0,0:
1050 |SETUPSP,0,0,&X1:|SETUPSP,0,7,1:|SETUPSP,0,8,2:'status sprite
1051 vidas=5:vivo=1:cs%=0:cl%=0:'variables globales
1070 |SETLIMITS,0,80,0,200:for i=0 to 24:c$(i)=" ":next
1090 c$(0)="                    "
1091 c$(1)=" "
1092 c$(2)="   QQQ"
1100 c$(3)="          QQ"
1110 c$(4)="    V        V"
1120 c$(5)="    X        X QQ"
1130 c$(6)="   QZQQ      Z"
1140 c$(7)="    S        SV"
1150 c$(8)="   XZ        ZX"
1160 c$(9)="   ZZ  X X X ZZ"
1170 c$(10)="   ZZZ Z Z Z ZZ"
1180 c$(11)="   ZZZZZZZZZZZZ"
1190 c$(12)="   ZZZZU TZZZZZ"
1200 c$(13)="   ZSZZ   ZZSSZ"
1210 c$(14)=" W ZZZZ   ZZZZZ    W"
1220 c$(15)=" W ZZZZ   ZWZZZ  WYW"
1230 c$(16)="PYYYYYYYYYYYWYYYYYYW"
1240 c$(17)="PPRRRRRRRRRRRRRRRRRP"
1250 c$(18)="PPYYYWYYYYYYYYWYYYPP"
1260 c$(19)="PPPYWWYYYYWYYYYYYYPP"
1270 GOSUB 550:'print layout
1280 |SETLIMITS,0,80,24,150
1290 |STARS,1,20,2,3,-1    
1300 |PRINTSP,0,104,32
1310 IF INKEY(60)=0  THEN RETURN
1320 GOTO 1290

1500 ' rutina movimiento personaje -------------
1510 IF INKEY(27)<0 GOTO 1520
1511 IF INKEY(67)=0 THEN IF dir<>2 THEN |SETUPSP,0,7,2:dir=2:GOTO 1533 ELSE |ANIMA,0:xn=xa+1:yn=ya-2:GOTO 1533
1512 IF INKEY(69)=0 THEN IF dir<>8 THEN |SETUPSP,0,7,8:dir=8:GOTO 1533 ELSE |ANIMA,0:xn=xa+1:yn=ya+2:GOTO 1533 
1513 IF dir<>1 THEN |SETUPSP,0,7,1:dir=1:GOTO 1533 ELSE |ANIMA,0:xn=xa+1:GOTO 1533 
1520 IF INKEY(34)<0 GOTO 1530
1521 IF INKEY(67)=0 THEN IF dir<>4 THEN |SETUPSP,0,7,4:dir=4:GOTO 1533 ELSE |ANIMA,0:xn=xa-1:yn=ya-2:GOTO 1533 
1522 IF INKEY(69)=0 THEN IF dir<>6 THEN |SETUPSP,0,7,6:dir=6:GOTO 1533 ELSE |ANIMA,0:xn=xa-1:yn=ya+2:GOTO 1533 
1523 IF dir<>5 THEN |SETUPSP,0,7,5:dir=5:GOTO 1533 ELSE |ANIMA,0:xn=xa-1:GOTO 1533 
1530 IF INKEY(67)=0 THEN IF dir<>3 THEN |SETUPSP,0,7,3:dir=3:GOTO 1533 ELSE |ANIMA,0:yn=ya-4:GOTO 1533 
1531 IF INKEY(69)=0 THEN IF dir<>7 THEN |SETUPSP,0,7,7:dir=7:GOTO 1533 ELSE |ANIMA,0:yn=ya+4:GOTO 1533 
1532 RETURN
1533 |LOCATESP,0,yn,xn:ynn=yn:|COLAY,0,@cl%:IF cl%=0 THEN 1536 
1534 yn=ya:|POKE, 27001,yn:|COLAY,0,@cl%:IF cl%=0 THEN 1536  
1535 xn=xa: yn=ynn:|POKE, 27001,yn:|POKE, 27003,xn:|COLAY,0,@cl%:IF cl%=1 THEN yn=ya:|POKE,27001,yn 
1536 ya=yn:xa=xn
1537 RETURN

1900 ' rutina on break---------------------------------------
1901 |MUSICOFF
1910 END 

2000 'pantalla 1--------------------------------------------
2001 nivel=1:CLS:GOSUB 611
2020 PEN 1:PAPER 0:LOCATE 1,25:PRINT "Navalcarnero cavern"    
2030 |MUSICOFF:|MUSIC,0,5
2070 |SETLIMITS,0,80,0,200
2090 c$(1)= "PPPPPPPPPPPPPPPPP  P"
2100 c$(2)= "PU                 P"
2110 c$(3)= "P                  P"
2120 c$(4)= "P                  P"
2130 c$(5)= "P  TPPPPU  TPPPPPPPP"
2140 c$(6)= "P                 TP"
2150 c$(7)= "P                  P"
2160 c$(8)= "P                  P"
2170 c$(9)= "P    YYYYYYYYYY    P"
2190 c$(10)="P    TPPPPPPPPU    P"
2195 c$(11)="P                  P"
2200 c$(12)="P                  P"
2210 c$(13)="P                  P"
2220 c$(14)="YYYYYYYYYP   PYYYYYY"
2230 c$(15)="RRRRRRRRRR   RRRRRRR"
2240 c$(16)="PPPPPPPPPP   PPPPPPP"
2250 c$(17)="PU      TP   PU   TP"
2260 c$(18)="P        T   U     P"
2270 c$(19)="P                  P"
2271 c$(20)="P                  P"
2272 c$(21)="P              W   P"
2273 c$(22)="PP             W  PP"
2274 c$(23)="PPPPPPPPPPPPPPPPPPPP"
2275 GOSUB 500:'reset enemigos
2280 GOSUB 550:'print layout
2291 e1x=4:e1y=88:e1d=0:|SETUPSP,1,0,&X111:|SETUPSP,1,7,9:|SETUPSP,1,8,0:'soldado derecha
2292 e2x=66:e2y=48:e2d=0:|SETUPSP,2,0,&X111:|SETUPSP,2,7,10:'soldado izq
2293 e3x=30:e3y=16:e3d=1:|SETUPSP,3,0,&X111:|SETUPSP,3,7,10:'soldado izquierda
2294 |LOCATESP,3,e3y,e3x:|LOCATESP,2,e2y,e2x:|LOCATESP,1,e1y,e1x
2389 xa=8:ya=138:yn=ya:xn=xa:|LOCATESP,0,ya,xa:'"xa" es "x anterior", "xn" es "x nueva"
2390 GOSUB 1500:'montoya
2392 IF e1d=0 THEN e1x=e1x+1:IF e1x>=70 THEN e1d=1:|SETUPSP,1,7,10 ELSE 2395
2393 e1x=e1x-1:IF e1x<=4 THEN e1d=0:|SETUPSP,1,7,9  
2395 IF e2d=0 THEN e2x=e2x+1:IF e2x>=60 THEN e2d=1:|SETUPSP,2,7,10 ELSE 2398
2396 e2x=e2x-1:IF e2x<=20 THEN e2d=0:|SETUPSP,2,7,9 
2398 IF e3d=0 THEN e3x=e3x+1:IF e3x>=70 THEN e3d=1:|SETUPSP,3,7,10 ELSE 2400
2399 e3x=e3x-1:IF e3x<=16 THEN e3d=0:|SETUPSP,3,7,9    
2400 POKE 27019,e1x: POKE 27035,e2x:POKE 27051,e3x
2410 |PRINTSPALL,1,0
2411 |COLSP,0,@cs%:IF cs%<32 THEN GOSUB 600:GOTO 2020
2413 IF yn<0 THEN RETURN
2420 GOTO 2390

3000 'pantalla 2--------------------------------------------
3001 nivel=2:CLS:GOSUB 611
3020 PEN 1:PAPER 0:LOCATE 1,25: PRINT " Polvoranca Forrest"    
3030 |MUSICOFF:|MUSIC,0,5
3070 |SETLIMITS,0,80,0,200
3090 c$(1)= "OOOOOOOOOOOOOOOOOOOO"
3100 c$(2)= "  W  O             O"
3110 c$(3)= "  W  O             O"
3120 c$(4)= "  W  O             O"
3130 c$(5)= "  W  O     WOOO   OO"
3140 c$(6)= "     O     WOOU    O"
3150 c$(7)= "     O     WOU     O"
3160 c$(8)= "     OOOO  WU      O"
3170 c$(9)= "  W  ORRO  W       O"
3190 c$(10)="  W  ORRO  W       O"
3195 c$(11)="  W  ORRO  W       O"
3200 c$(12)="  W  ORRO  W       O"
3210 c$(13)="  W  ORRO  YYYYYY  O"
3220 c$(14)="  W  YYYY     OOO  O"
3230 c$(15)="  W     O       O  O"
3240 c$(16)="  W     O       O  O"
3250 c$(17)="  W     O OO    O  O"
3260 c$(18)="  W  W  OO  OO  O  O"
3270 c$(19)="  W  O          W   "
3271 c$(20)="  W  O          W   "
3272 c$(21)="  W  O          W   "
3273 c$(22)="YYYYYYRRRRRRRRRRYYYY"
3274 c$(23)="PPPPPPPPPPPPPPPPPPPP"
3275 GOSUB 500:'reset enemigos
3280 GOSUB 550:'print layout
3291 e1x=24:e1y=40:e1d=0:|SETUPSP,1,0,&X111:|SETUPSP,1,7,9:|SETUPSP,1,8,0:'soldado derecha
3292 e2x=36:e2y=16:e2d=0:|SETUPSP,2,0,&X111:|SETUPSP,2,7,9:'soldado izq
3293 e3x=0:e3y=16:e3d=0:|SETUPSP,3,0,&X111:|SETUPSP,3,7,11:'fantasma
3294 e4x=24:e4y=166:e4d=0:|SETUPSP,4,0,&X111:|SETUPSP,4,7,12:'pato
3295 e5x=12:e5y=90:e5d=1:|SETUPSP,5,0,&X111:|SETUPSP,5,7,11:'fantasma
3296 e6x=48:e6y=80:e6d=0:|SETUPSP,6,0,&X111:|SETUPSP,6,7,9:'soldado d
3297 |LOCATESP,6,e6y,e6x:|LOCATESP,5,e5y,e5x:|LOCATESP,4,e4y,e4x:|LOCATESP,3,e3y,e3x:|LOCATESP,2,e2y,e2x:|LOCATESP,1,e1y,e1x
3389 xa=0:ya=152:yn=ya:xn=xa:vivo=1:|LOCATESP,0,ya,xa:'"xa" es "x anterior", "xn" es "x nueva"
3390 GOSUB 1500
3391 ' logica enemigos
3392 IF e1d=0 THEN e1x=e1x+1:IF e1x>=39 THEN e1d=1:|SETUPSP,1,7,10 ELSE 3395
3393 e1x=e1x-1:IF e1x<=24 THEN e1d=0:|SETUPSP,1,7,9
3395 IF e2d=0 THEN e2x=e2x+1:IF e2x>=70 THEN e2d=1:|SETUPSP,2,7,10 ELSE 3398
3396 e2x=e2x-1:IF e2x<=24 THEN e2d=0:|SETUPSP,2,7,9   
3398 IF e3d=0 THEN e3y=e3y+3:IF e3y>=130 THEN e3d=1 ELSE 3410
3399  e3y=e3y-3:IF e3y<=16 THEN e3d=0    
3410 IF e4d=0 THEN e4x=e4x+1:IF e4x>=60 THEN e4d=1:|SETUPSP,4,7,13 ELSE 3413
3411 e4x=e4x-1:IF e4x<=24 THEN e4d=0:|SETUPSP,4,7,12 
3413 IF e5d=0 THEN e5y=e5y+3:IF e5y>=130 THEN e5d=1 : GOTO 3416 ELSE 3416
3414 e5y=e5y-3:IF e5y<=16 THEN e5d=0      
3416 IF e6d=0 THEN e6x=e6x+1:IF e6x>=70 THEN e6d=1:|SETUPSP,6,7,10 ELSE 3418
3417 e6x=e6x-1:IF e6x<=48 THEN e6d=0:|SETUPSP,6,7,9  
3418 POKE 27019,e1x: POKE 27035,e2x:POKE 27049,e3y:POKE 27067,e4x:POKE 27081,e5y:POKE 27099,e6x:
3610 |PRINTSPALL,1,0
3611 |COLSP,0,@cs%:IF cs%<32 THEN GOSUB 600:GOTO 3020
3612 IF xn>80 THEN RETURN
3620 GOTO 3390

4000 'pantalla 3--------------------------------------------
4001 nivel=3:CLS:GOSUB 611
4020 PEN 1:PAPER 0:LOCATE 1,25: PRINT "  Valderas castle"    
4030 |MUSICOFF:|MUSIC,0,5
4070 |SETLIMITS,0,80,0,200
4090 c$(1)= "ZZZZZZZZZZZZZZZZZZZZ"
4100 c$(2)= "ZSZZSZZZUNTZZSZZZSZZ"
4110 c$(3)= "ZZZZZWZZNNNZZZZZZZZZ"
4120 c$(4)= "ZZZZZWZZNNNZZZZWZZZZ"
4130 c$(5)= "YYYYYYYYNNNYYYYYYYYY"
4131 c$(6)= "W                  W"
4132 for i=7 to 23 : c$(i)=c$(6):next
4275 GOSUB 500:'reset enemigos
4280 GOSUB 550:'print layout

4390 for i=1 to 4
4391 ex(i)=i*5:ex(i+4)=80-i*5-6
4392 ey(i)=18+i*30:ey(i+4)=18+i*30
4393 |setupsp,i,0,&x11111:|setupsp,i+4,0,&x11111
4394 |setupsp,i,7,9:|setupsp,i+4,7,10
4395 |locatesp,i,ey(i),ex(i):|Locatesp,i+4,ey(i+4),ex(i+4)
4396 |setupsp,i,5,0:|setupsp,i,6,1:|setupsp,i+4,5,0:|setupsp,i+4,6,-1
4399 next
4400 xa=16:ya=200-24-8:yn=ya:xn=xa:vivo=1:|LOCATESP,0,ya,xa
4401 c1=10:c2=20:c=0:cc=0
4402 |SETUPSP,17,9,llave:|SETUPSP,17,0,&x10:|LOCATESP,17,128,72:|printsp,17,128,72
4409 '----- bucle de logica principal ---------
4410 GOSUB 1500: ' control del personaje
4421 cc=cc+1: if cc=4 then cc=0: gosub 4700
4609 |AUTOALL : ' movimiento automatico de 8 sprites
4610 |PRINTSPALL,1,0 'impresion masiva de sprites (9= 8+personaje)
4611 |COLSP,0,@cs%:IF cs%<32 then if cs%=17 then gosub 4950 else GOSUB 600:GOTO 4020
4612 IF yn<26 THEN RETURN
4620 GOTO 4410
4699 '----- rutinas de control del escuadron ----
4700 c=c+1:if c>c1 and c<=c1+4 then gosub 4800
4701 if c>c2 and c<=c2+4 then gosub 4900
4702 if c=30 then c=10
4710 return
4799 '----- a darse la vuelta de 2 en 2 --------
4800 |setupsp,c1+5-c,7,10:|setupsp,c1+5-c,6,-1
4801 |setupsp,c1+5-c+4,7,9:|setupsp,c1+5-c+4,6,1
4810 return
4899 '----- a darse la vuelta otra vez --------
4900 |setupsp,c2+5-c,7,9:|setupsp,c2+5-c,6,1
4901 |setupsp,c2+5-c+4,7,10:|setupsp,c2+5-c+4,6,-1
4910 return
4949 '------- apertura del castillo -----------
4950 c$(2)= "UM"
4952 c$(3)= "MMM"
4953 c$(4)= "MMM"
4954 c$(5)= "MMM"
4955 for i=2 to 5:|LAYOUT,i,8,@c$(i):NEXT
4956 |SETUPSP,17,0,&x00
4957 c$(2)= "U "
4958 c$(3)= "   "
4959 c$(4)= "   "
4960 c$(5)= "   "
4961 for i=2 to 5:|LAYOUT,i,8,@c$(i):NEXT
4962 return


4999 'pantalla 4--------------------------------------------
5000 nivel=4:CLS:GOSUB 611
5020 PEN 2:PAPER 0:LOCATE 1,25: PRINT "   Falken's maze"    
5030 |MUSICOFF:|MUSIC,0,5
5040 |SETLIMITS,0,80,0,200
5041 ' inicializacion de laberinto y enemigos
5042 GOSUB 500:'reset enemigos
5043 t=0:' contador de sprites y tiempo
5050 c$(1)=  "ZZNNZZNNZZNNZZNNZZZZ"
5051 c$(2)=  "Z                  Z"
5052 c$(3)=  "Z                  Z"
5053 c$(4)=  "Z                  S"
5054 c$(5)=  "S               X  Z"
5055 c$(6)=  "Z               Z  Z"
5056 c$(7)=  "Z               S  Z"
5057 c$(8)=  "Z               Z  S"
5058 c$(9)=  "Z               Z  Z"
5059 c$(10)= "Z               Z  Z"
5060 c$(11)= "Z  X  ZZZZZZZZZZU  Z"
5061 c$(12)= "Z  Z  N            Z"
5062 c$(13)= "Z  S  N            Z"
5063 c$(14)= "Z  Z  N            Z"
5064 c$(15)= "Z  T  ZZZZU  TZZZZZZ"
5065 c$(16)= "Z                  Z"
5066 c$(17)= "Z                  S"
5067 c$(18)= "Z                  Z"
5068 c$(19)= "Z  TZZZZZUXTZZZZZ  Z"
5069 c$(20)= "Z         S        Z"
5070 c$(21)= "Z         Z        Z"
5071 c$(22)= "Z         Z        Z"
5072 c$(23)= "TZZNNZZZ  Z  ZZNNZZU"
5073 GOSUB 550: 'layout
5080 for i=1 to 6:|setupsp,i,0,&x0:|setupsp,i,7,11:next:'fantasmas
5081 xa=32:ya=168:yn=ya:xn=xa:|LOCATESP,0,yn,xn: ' personaje
5082 'enemigo 1---------
5084 |setupsp,1,0,&x01111:ey(1)=30:ex(1)=10
5085 |setupsp,1,5,-2:|setupsp,1,6,1:incy(1)=2
5086 |locatesp,1,ey(1),ex(1):exmax(1)=50:exmin(1)=8:eymax(1)=56:eymin(1)=22
5090 'enemigo 2---------
5091 |setupsp,2,0,&x01111:ey(2)=42:ex(2)=30
5092 |setupsp,2,5,-2:|setupsp,2,6,1: incy(2)=2
5093 |locatesp,2,ey(2),ex(2):exmax(2)=50:exmin(2)=8:eymax(2)=56:eymin(2)=22
5100 'enemigo 3---------
5101 |setupsp,3,0,&x01111:ey(3)=27:ex(3)=4
5102 |setupsp,3,5,3:|setupsp,3,6,0: incy(3)=3
5103 |locatesp,3,ey(3),ex(3):exmax(3)=80:exmin(3)=0:eymax(3)=150:eymin(3)=22
5110 'enemigo 4---------
5111 |setupsp,4,0,&x01111:ey(4)=12*8+1:ex(4)=34
5112 |setupsp,4,5,0:|setupsp,4,6,1: incy(4)=0
5113 |locatesp,4,ey(4),ex(4):exmax(4)=61:exmin(4)=34:eymax(4)=200:eymin(4)=0
5120 'enemigo 5---------
5121 |setupsp,5,0,&x01111:ey(5)=16*8+1:ex(5)=60
5122 |setupsp,5,5,0:|setupsp,5,6,-1: incy(5)=0
5123 |locatesp,5,ey(5),ex(5):exmax(5)=63:exmin(5)=25:eymax(5)=200:eymin(5)=0

5500 GOSUB 1500: ' control del personaje
5510 t=t+1: gosub 5700
5511 if t=5 then t=0
5520 |AUTOALL : ' movimiento automatico de 8 sprites
5530 |PRINTSPALL,1,0 'impresion masiva de sprites (9= 8+personaje)
5540 |COLSP,0,@cs%:IF cs%<32 then GOSUB 600:GOTO 5020
5550 if xn>40 and yn>=168 then return
5560 GOTO 5500

5699'logica generica. solo se ejecuta la del sprite "t"
5700 '
5701 ex(t)=peek (27003+16*t)
5710 if ex(t)>exmax(t) then |setupsp,t,6,-1:   else if  ex(t)<exmin(t) then |setupsp,t,6,1 
5720 if incy(t)=0 then return
5721 ey(t)=peek (27001+16*t)
5730 if ey(t)>eymax(t) then |setupsp,t,5,-incy(t):   else if  ey(t)<eymin(t) then |setupsp,t,5,incy(t) 
5790 return


5999' 'pantalla 5 --------------------------------------------
6000 nivel=5:CLS:GOSUB 611
6020 PEN 2:PAPER 0:LOCATE 1,25: PRINT " Rescue princess"    
6030 |MUSICOFF:|MUSIC,2,6
6040 |SETLIMITS,0,80,0,200
6041 ' inicializacion de laberinto y enemigos
6042 GOSUB 500:'reset enemigos
6043 t=0:' contador de sprites y tiempo
6050 c$(1)=  "                    "
6051 c$(2)=  "QQQ  V        V     "
6052 c$(3)=  "     X        X QQQQ"
6053 c$(4)=  "    XZ        Z  QQQ"
6054 c$(5)=  "    ZZ   Z Z ZZV    "
6055 c$(6)=  "    SZNNZZZZZZZX    "
6056 c$(7)=  "    ZZ        ZS  QQ"
6057 c$(8)=  "    TZ        ZZ    "
6058 c$(9)=  "QQ   Z        ZU V  "
6059 c$(10)= "   QQZZZZ  ZZZZ  X  "
6060 c$(11)= "     Z           S  "
6061 c$(12)= "  V  Z           Z  "
6062 c$(13)= "  X  Z           Z  "
6063 c$(14)= " QS  ZZZZ  ZZZZZZU  "
6064 c$(15)= "  Z        Z  ZU    "
6065 c$(16)= "  Z        Z  Z X QQ"
6066 c$(17)= "  Z        Z  Z Z   "
6067 c$(18)= "  TZZZZZZ  ZNNZ Z   "
6068 c$(19)= "    TZU T     Z Z   "
6069 c$(20)= "     Z        ZZZ   "
6070 c$(21)= "  QQQZ        ZU  W "
6071 c$(22)= "     Z        Z   W "
6072 c$(23)= "YYYYYZ        ZYYYYY"
6073 GOSUB 550: 'layout
6074 |SETUPSP,17,9,llave:|SETUPSP,17,0,&x10:|LOCATESP,17,15*8,13*4:|printsp,17,15*8,13*4:'llave1
6075 |SETUPSP,16,9,llave:|SETUPSP,16,0,&x10:|LOCATESP,16,9*8,6*4:|printsp,16,9*8,6*4:'llave2
6076 |SETUPSP,15,7,15:|SETUPSP,15,0,&x111:|LOCATESP,15,3*8,12*4:' princess


6291 e1x=28:e1y=7*8:e1d=0:|SETUPSP,1,0,&X111:|SETUPSP,1,7,9:'soldado derecha
6292 e2x=51:e2y=11*8:e2d=1:|SETUPSP,2,0,&X111:|SETUPSP,2,7,10:'soldado izq
6293 e3x=30:e3y=15*8:e3d=1:|SETUPSP,3,0,&X111:|SETUPSP,3,7,10:'soldado izquierda 
6294 |LOCATESP,3,e3y,e3x:|LOCATESP,2,e2y,e2x:|LOCATESP,1,e1y,e1x

6389 princes=0:xa=28:ya=21*8:yn=ya:xn=xa:vivo=1:|LOCATESP,0,ya,xa:'"xa" es "x anterior", "xn" es "x nueva"
6390 GOSUB 1500
6392 IF e1d=0 THEN e1x=e1x+1:IF e1x>=51 THEN e1d=1:|SETUPSP,1,7,10 ELSE 6395
6393 e1x=e1x-1:IF e1x<=28 THEN e1d=0:|SETUPSP,1,7,9  
6395 IF e2d=0 THEN e2x=e2x+1:IF e2x>=61 THEN e2d=1:|SETUPSP,2,7,10 ELSE 6398:'51
6396 e2x=e2x-1:IF e2x<=24 THEN e2d=0:|SETUPSP,2,7,9 
6398 IF e3d=0 THEN e3x=e3x+1:IF e3x>=38 THEN e3d=1:|SETUPSP,3,7,10 ELSE 6400
6399 e3x=e3x-1:IF e3x<=12 THEN e3d=0:|SETUPSP,3,7,9 
6400 POKE 27019,e1x: POKE 27035,e2x:POKE 27051,e3x
6410 |PRINTSPALL,1,0
6411 |COLSP,0,@cs%:IF cs%<32 THEN IF cs%>=15 then gosub 6500 else GOSUB 600:GOTO 6020
6413 IF princes=1 THEN 6600
6420 GOTO 6390

6499' llave1, llave 2 y princesa
6500 borra$="MM":spaces$="  "
6501 if cs%=16 then |LAYOUT,18,12,@borra$:|LAYOUT,18,12,@spaces$:|SETUPSP,16,0,&x0:return
6510 if cs%=17 then |LAYOUT,6,6,@borra$:|LAYOUT,6,6,@spaces$:|SETUPSP,17,0,&x0:return
6520 if cs%=15 then princes=1
6530 return

6600' MISION CUMPLIDA
6610 |MUSICOFF:|MUSIC,2,8


6630 ink 14,0 :paper 14:pen 15
6640 locate 1,22: print "   Felicidades!     ":pen 1
6650 locate 1,23: print " Has logrado raptar "
6655 locate 1,24: print "    a la princesa!  "
6660 locate 1,25: print "Pide un buen rescate";
6670 paper 0:
6680 border 7:FOR i=1 TO 30000:NEXT 
6681 gosub 7000
6690 return




7000' 'pantalla end of game  --------------------------------------------
7020 cls:border 0:PEN 2:PAPER 0:LOCATE 1,25: PRINT "  8 bits de poder! "    
7040 |SETLIMITS,0,80,0,200
7042 GOSUB 500:'reset enemigos
7050 c$(1)=  "ZZZ              ZZZ"
7051 for i=2 to 21: c$(i)=c$(1):next
7071 c$(22)= "YYYYYYYYYYYYYYYYYYYY"
7072 c$(23)= "OOOOOOOOOOOOOOOOOOOO"
7073 GOSUB 550: 'layout
7076 |SETUPSP,15,7,15:|SETUPSP,15,0,&x111:|LOCATESP,15,19*8,11*4:'princesa
7077 |SETUPSP,2,7,10:|SETUPSP,2,0,&x111:|LOCATESP,2,19*8,13*4:'soldado izq
7078 |SETUPSP,3,7,11:|SETUPSP,3,0,&x111:|LOCATESP,3,19*8,7*4:' monstruo
7079 |SETUPSP,4,7,12:|SETUPSP,4,0,&x111:|LOCATESP,4,21*8,4*4:' pato
7080 |SETUPSP,0,7,7:|SETUPSP,0,0,&x111:|LOCATESP,0,19*8,9*4:' montoya down
7081 |SETUPSP,5,7,9:|SETUPSP,5,0,&x111:|LOCATESP,5,19*8,5*4:'soldado izq
7082 |SETUPSP,6,7,13:|SETUPSP,6,0,&x111:|LOCATESP,6,21*8,15*4:' pato
7089 telon=17
7090 |setupsp,1,9,telon
7100 for y=8 to 168 step 4
7110 for x=12 to 64 step 4
7111 |PRINTSP,1,y,x
7112 next
7113 next
7114 for y=168 to 100 step -2
7115 for x=12 to 64 step 4
7116 |PRINTSP,1,y,x
7117 next
7118 next:LOCATE 5,16:pen 3: PRINT "S para salir"   
7119 IF INKEY(60)=0  THEN RETURN
7190 |PRINTSPALL,1,1:for j=1 to 100:next:goto 7119
10000 |MUSICOFF:mode 2:ink 1,24: end