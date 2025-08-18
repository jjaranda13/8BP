1 mode 0
10 memory 25299
11 MODE 0
12 load "8bp4.bin"
20 call &6b78
21 ink 15,20: ' color para el byte 255=FF (que es F para los 2 pixeles)
22 id=30
30 |SETUPSP,id,9,57
40 |SETUPSP,id,0,1
50 |locatesp,id,40,100
55 xmin=20:xmax=40
60 |SETLIMITS,xmin,xmax,0,200
70 plot (xmin)*8-4,0:draw (xmin)*8-4,400
80 plot xmax*8,0:draw xmax*8,400
85 pen 7:print "demo doble clipping"
90 for x=0 to 60 step 1
100 |locatesp,id,40,x
110 |printsp,id
120 for i=1 to 10:next
130 next
140 for x=60 to 0 step -1
150 |locatesp,id,40,x
160 |printsp,id
170 for i=1 to 10:next
180 next
190 goto 90

