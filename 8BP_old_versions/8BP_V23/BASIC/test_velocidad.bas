1 call &6b78
10 MEMORY 26999
11 DEFINT a-z
12 c%=0: a=2
30 FOR i=0 TO 31:|SETUPSP,i,0,0:NEXT:'reset
40 a!= TIME
50 FOR i=1 TO 1000
60 a=a mod 3 +1
70 NEXT
80 b!=TIME
90 PRINT (b!-a!)
100 c!=1000/((b!-a!)*1/300)
110 PRINT c, "fps"
120 d!=c!/60
130 PRINT "puedes ejecutar ",d!, "comandos por barrido (1/50 seg)"
140 PRINT "el comando tarda ";((b!-a!)/300 -0.47);"milisegundos"    