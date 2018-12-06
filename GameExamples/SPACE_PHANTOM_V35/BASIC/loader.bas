10 MEMORY 23999
15 mode 0
16 gosub 100
20 load "sp.scr",&c000
30 LOAD "!sp.bin"
40 RUN "!sp.bas"

100 rem paleta
110 ink 0,0
120 ink 1,4
130 ink 2,7
140 ink 3,26
150 ink 4,6
160 ink 5,3
170 ink 6,1
180 ink 7,15
190 ink 8,23
200 ink 9,21
210 ink 10, 10
220 ink 11,24
230 ink 12, 13
240 ink 13, 2
250 ink 14,9
260 ink 15,0
270 return