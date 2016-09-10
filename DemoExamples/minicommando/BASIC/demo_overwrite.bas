10 MODE 0
20 DEFINT A-Z      
30 CALL &6B78
40 CALL &BC02:' default palete
50 GOSUB 470:' paleta sobreescritura de 9 colores
51 |MUSIC,1,5: ON BREAK GOSUB 5000
60 spsuelo=&84D0:sptierra=&8558
70 sptejado=&85E0:sptejado1=&85BE
80 sptronco=&84F2
90 spramade=&8514:spramaiz=&8536:sphojas=&857A
100 spladrillo=&859C
110 |SETUPSP,0,9,spsuelo
120 |SETUPSP,1,9,sptronco
130 |SETUPSP,2,9,spramade
140 |SETUPSP,3,9,spramaiz
150 |SETUPSP,4,9,sptierra
160 |SETUPSP,5,9,sphojas
170 |SETUPSP,6,9,spladrillo
180 |SETUPSP,7,9,sptejado1
190 |SETUPSP,8,9,sptejado
200 DIM c$(25):FOR i=0 TO 24:c$(i)=" ":NEXT:' array para layout
208 c$(1)= "  @@@@@@@"
209 c$(2)= " @@@@@@@@@"
210 c$(3)= "@@@@@@@@@@   BCCCCCC"
220 c$(4)= "@@@@@@@@@@  BCCCCCCC"
230 c$(5)= "@@@@ @<>@  BCCCCCCCC"  
240 c$(6)= "@@<@  <   BCCCCCCCCC"
250 c$(7)= "@=<  =<   AAAAAAAAAA"
260 c$(8)= "  <>  <>  AAAAAAAAAA"
270 c$(9)= " =<   <   AAAAAAAAAA"
280 c$(10)="  <  =<>  AAAAAAAAAA"
290 c$(11)="  <>  <   AAAAA  AAA"
300 c$(12)="  <   <   AAAAA  AAA"
310 c$(13)=";;<;;;<;;;AAAAA  AAA"
320 c$(14)="????????????????????"
330 c$(15)="????????????????????"
340 c$(16)="????????????????????"
350 c$(17)="????????????????????"
360 c$(18)="????????????????????"
370 c$(19)="????????????????????"
380 c$(20)="????????????????????"
390 c$(21)="????????????????????"
400 c$(22)="????????????????????"
410 c$(23)="????????????????????"
420 c$(24)="@@@@@@@@@@@@@@@@@@@@"
430  GOSUB 460
431 PEN 12:LOCATE 1,1:PRINT "TRANSPARENT SPRITES"
432 GOTO 1000
450 ' rutina print layout
451 ' -------------------
460 FOR i=0 TO 24:|LAYOUT,i,0,@c$(i):NEXT:RETURN
470 REM ---------- PALETA sprites transparentes MODE 0------------------
480 INK 0,11: REM azul claro
490 INK 1,15: REM naranja
500 INK 2,0 : REM negro
510 INK 3,0: 
520 INK 4,26: REM blanco
530 INK 5,26: 
540 INK 6,6: REM rojo
550 INK 7,6: 
560 INK 8,18: REM verde
570 INK 9,18: 
580 INK 10,24: REM amarillo
590 INK 11,24 :
600 INK 12,4: REM magenta
610 INK 13,4 : 
620 INK 14,16 : REM naranja
630 INK 15, 16: 
640 AMARILLO=10
650 RETURN
1000 REM llegamos aqui con el DECORADO TERMINADO. 
1010 FOR i=0 TO 31:|SETUPSP,i,0,0:|LOCATESP,i,0,0:NEXT: 'reset sprites    
1020 |PRINTSPALL,3,1,0       
1021 personaje=0
1030 |SETUPSP,personaje,7,1:'secuencia soldado derecha
1040 |SETUPSP,personaje,0,&X1001001
1041 ' enemigos
1042 v1=-1:v2=1:seq1=2:seq2=1
1043 |SETUPSP,1,7,seq1:|SETUPSP,1,0,&X1011101:|LOCATESP,1,160,70:|SETUPSP,1,5,0,v1   
1044 |SETUPSP,2,7,seq2:|SETUPSP,2,0,&X1011101:|LOCATESP,2,120,10:|SETUPSP,2,5,0,v2  
1045 caldero=&896E
1046 |SETUPSP,3,9,caldero:|SETUPSP,3,0,&X1000001:|LOCATESP,3,150,40   
1050 X=20:Y=100: dir=0: ciclo=0
1060 |LOCATESP,personaje,y,x
1070 |PRINTSPALL: |AUTOALL
1080 IF INKEY(27)=0 THEN X=X+1:|ANIMA,personaje: IF dir<>0 THEN dir=0:|SETUPSP,personaje,7,1:x=x-1
1090 IF INKEY(34)=0 THEN  X=X-1:|ANIMA,personaje: IF dir<>1 THEN dir=1:|SETUPSP,personaje,7,2:x=x+1
1100 IF INKEY(67)=0 THEN  Y=Y-1: 
1110 IF INKEY(69)=0 THEN  Y=Y+1: 
1120 ciclo=ciclo MOD 40 +1 :IF ciclo=40 THEN seq1=seq1 MOD 2 +1:v1=-v1:|SETUPSP,1,7,seq1:|SETUPSP,1,5,0,v1:seq2=seq2 MOD 2 +1:v2=-v2:|SETUPSP,2,7,seq2:|SETUPSP,2,5,0,v2           
1130 GOTO 1060
3000 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:'reset     
3001 |PRINTSPALL,4,0,0    
3100 a!= TIME
3200 FOR i=1 TO 1000
3300 |PRINTSPALL
3400 NEXT
3500 b!=TIME
3600 PRINT (b!-a!)
3700 c!=1000/((b!-a!)*1/300)
3800 PRINT c, "fps"
3900 d!=c!/60
4000 PRINT "puedes ejecutar ",d!, "comandos por barrido (1/50 seg)"
4100 PRINT "el comando tarda ";((b!-a!)/300 -0.47);"milisegundos"    
5000 REM on break
5010 |MUSICOFF
5020 CALL &BC02:PEN 1:' default palete    
5030 END