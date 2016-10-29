
;==================================================================================
; COMANDO _ALL(tareas)   ALL
;==================================================================================
; acepta un byte como entrada donde puedes especificar los comandos que 
; deseas invocar

;variables locales
;-------------------------------------
ALL_tasks	db 0


;function body
;-------------------------------------
_ALL
		and a
		JR Z,ALL_noparam
		ld a,(ix+0)
		ld (ALL_tasks),a

ALL_noparam

ALL_1		


ALL_4		ld a, (ALL_tasks)
		and %10000
		JR Z, ALL_5
		ld a,0
		CALL _MOVER_ALL

		
ALL_5		ld a, (ALL_tasks)
		and %1000
		JR Z, ALL_6
		ld a,0
		CALL _AUTO_ALL

ALL_6		ld a, (ALL_tasks)
		and %100
		JR Z, ALL_7
		ld a,0
		CALL _PRINT_SPRITES
ALL_7
		ld a, (ALL_tasks)
		and %10
		JR Z, ALL_8
		ld a,0
		CALL _COLSPALL

ALL_8
		ld a, (ALL_tasks)
		and %1
		JR Z, ALL_fin
		ld a,0
		CALL _SCROLL_STARS
		
ALL_fin
		ret