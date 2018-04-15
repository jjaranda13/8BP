; ensamblo esto tras la tabla de scores
org _HALL_OF_FAME_END;23000

; lista de circuitos
;--------------------------
_CIRCUIT_LIST
dw _CIRCUITO_INTRO
dw _CIRCUITO1
dw _CIRCUITO2
dw _CIRCUITO2_END
;-----------------primer circuito ---------------------
read "circuito_intro.asm"
read "circuito1.asm"
read "circuito2.asm"

