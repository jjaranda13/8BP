org _CIRCUITO1_END;
_CIRCUITO2

; reservo un espacio para 30x2 segmentos
; cada segmento son 3 words (= 6 bytes). y  hay que meter borde derecho e izquierdo de la carretera ( 6bytes * 2 lados)
; ademas cada tramo es un segmento blanco y uno rojo (2 segmentos)
ds 40*2*6*2; con esto caben 40 tramos = 4000metros
; 30*2*50= 30*100=3000


_CIRCUITO2_PRE_END
ds 6*2*6*2; 300 metros adicionales para el solape
_CIRCUITO2_END