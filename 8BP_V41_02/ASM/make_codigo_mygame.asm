;---------------------RUTINAS 8 bits de poder------------------
;read "8bitsDePoder_v041_000.asm";
;read "8bitsDePoder_v041_001.asm";
read "8bitsDePoder_v041_002.asm";
;---------------------PLAYER DE MUSICA-------------------------
; lo cargo justo despues de las rutinas. 
; rutinas + player no llega a ocupar 5KB.
; lo salvaremos todo junto con save "8bp.lib",b,27000,5000
; lo que incluyo es el player loader que es un codigo que carga e 
; inicializa el codigo del player, el cual esta en otro fichero pero
; se carga todo desde el loader.
:_PLAYER_WYZ
;read "player_loader_cpc_v41.asm"
read "player_loader_cpc_v42.asm"

; DESDE LA 42039 HASTA 42539 SE ENCUENTRA EL LAYOUT y el mapa del mundo (solapados)
; Y MAS ALLA LOS DOS BANCOS DE ESTRELLAS HASTA 42619
ORG 42040; 
;===========================================
;    LAYOUT DE PANTALLA. 
;===========================================
LAYOUT:
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"
db "AAAAAAAAAAAAAAAAAAAA"

ENDLAYOUT:
;===================================================================================
; DOS BANCOS DE 20 ESTRELLAS PARA SCROLLSTARS
; comenzando en 42539 y 42579 respectivamente
; 2 bytes para cada estrella pares (y,x)
; y en lineas [0..199], x en bytes [0..79]
;===================================================================================
STARS0
; listado de estrellas. desde basic con POKE se pueden poner aleatorias
	db 100,40; estrella 1	
	db 10,60
	db 20,10
	db 30,20
	db 40,30
	db 50,50
	db 60,20
	db 70,45
	db 80,55
	db 90,20
	db 100,25
	db 110,15
	db 120,65
	db 130,5
	db 140,15
	db 150,65
	db 160,70
	db 170,40
	db 180,2
	db 190,35; estrella 20

	db 1,20	
	db 10,10
	db 20,60
	db 30,40
	db 40,50
	db 50,78
	db 60,65
	db 70,25
	db 80,15
	db 90,60
	db 100,5
	db 110,45
	db 120,25
	db 130,45
	db 140,55
	db 150,35
	db 160,75
	db 140,35
	db 150,15
	db 180,35; estrella 40
ENDSTARS

