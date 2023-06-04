10 MODE 0
20 MEMORY 24800: load "8bp1.bin"
21 call &6b78
30 INK  0 , 12 :INK  1 , 15 :INK  2 , 3 :INK  3 , 0 :INK  4 , 26:INK  5 , 26 
40 INK  6 , 26 :INK  7 , 26 :INK  8 , 20 :INK  9 , 20 :INK  10 , 20 :INK  11 , 20 
50 INK  12 , 14 :INK  13 , 14 :INK  14 , 14 :INK  15 , 14 

70 |PRINTSP,32,2
80 |SETUPSP,0,9,55
90 |SETUPSP,31,9,54
100 |SETUPSP,0,0,65
110 |SETUPSP,31,0,65
120 |PRINTSP,32,2
130 |LOCATESP,0,100,40
'131 plot 338,0,3:draw 338,400
140 x=40:y=80:|LOCATESP,31,y,x
150 |UMAP,24000,&5DF6,0,5000,0,5000
150 |UMAP,41900,&a3e2,0,5000,0,5000
'151 c$="BACKGROUND IMAGES"
'152 |printat,0,40,0,@c$
151 scroll=1:bg=0:|SETLIMITS,0,80,16,200
'152 locate 1,1:print "SPACE: BG ON/OFF"
'153 locate 1,1:print "S: SCROLL ON/OFF"
154 pen 4:paper 0:locate 1,2: print "  BG ZONE   NON BG "
155 plot 338,0,3:draw 338,400
156 pen 4:paper 2:locate 3,1:print "S: SCROLL ON/OFF"
'154 locate 1,8:pen 4:print "BG"
'160 |MAP2SP,1:LOCATE 1,9:print "OFF"
170 FOR ym=0 TO 201 step 2: IF ym=200 THEN ym=0
180 if scroll then |MAP2SP,ym,0 else ym=ym-2
181 if inkey(27)=0 then x=x+1 else if inkey(34)=0 then x=x-1
182 if inkey(69)=0 then y=y+2 else if inkey(67)=0 then y=y-2
183|LOCATESP,31,y,x
'184 if inkey(47)=0 then if bg=1 then bg=0:|MAP2SP,1:LOCATE 1,9:paper 0:print "OFF" else bg=1:|MAP2SP,65: LOCATE 1,9:paper 2:print "ON "
185 if inkey(60)=0 then if scroll=0 then scroll=1 else scroll=0
190 if scroll then |PRINTSPALL else |PRINTSP,31
200 NEXT