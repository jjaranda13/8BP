10 SYMBOL AFTER 0
20 SYMBOL 37,255,255,255,255,255,255,255
21 SYMBOL 38,170,85,170,85,170,85,170
22 y=5:x=8
23 mode 1
30 locate x,y  :print " %%%%%&  %%%%%%%&  %%%%%%%&"
40 locate x,y+1:print "%%&  %%&  %%&  %%&  %%&  %%&"
50 locate x,y+2:print "%%&  %%&  %%&  %%&  %%&  %%&"
60 locate x,y+3:print " %%%%%&   %%%%%%&   %%%%%%&"
70 locate x,y+4:print "%%&  %%&  %%&  %%&  %%&"
80 locate x,y+5:print "%%&  %%&  %%&  %%&  %%&"
90 locate x,y+6:print " %%%%%&  %%%%%%%&  %%%%&"
100 SYMBOL AFTER 256:memory 23999
110 locate 18,15: print "PRESENTA"
120 locate 15,18: print "FROGGER ETERNO"
130 LOAD "!frogger.bin"
140 run "frogger.bas"
