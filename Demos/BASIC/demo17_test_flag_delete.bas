1 mode 0
2 defint a-z
10 memory 25299
11 MODE 0: call &bc02
12 load "8bp0.bin"
13 ink 0,0:ink 1,24:for i =2 to 14 step 2
14 ink i,i:ink i+1,i
15 next
20 call &6b78
21 id=0
30 for x=0 to 7
40 for y=0 to 3
50 |SETUPSP,id,9,31
60 |SETUPSP,id,0,1+64
70 |locatesp,id,y*40,x*10
71 locate 1,1:print id
80 id=id+1:next:next
90 pen 1:for i=1 to 160:print "M";:next

100|printspall,0,0,0,0
110 locate 1,21:print "  ":locate 1,20:input "flag borrado (0/1)?", flag
120 |PRINTSP,33,flag
130 goto 100




