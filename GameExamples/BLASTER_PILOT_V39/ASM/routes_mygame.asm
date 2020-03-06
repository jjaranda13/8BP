
; LISTA DE RUTAS
;================
;pon aqui los nombres de todas las rutas que hagas
ROUTE_LIST
	; rutas de disparos
	dw ROUTE0
	dw ROUTE1
	dw ROUTE2
	dw ROUTE3
	dw ROUTE4
	dw ROUTE5
	dw ROUTE6
	dw ROUTE7
	dw ROUTE8
	dw ROUTE9
	dw ROUTE10
	dw ROUTE11
	; rutas de enemigos
	;------------------------
	; tipo 0 meteorito
	dw ROUTE12
	dw ROUTE13
	dw ROUTE14
	dw ROUTE15
	dw ROUTE16
	dw ROUTE17
	dw ROUTE18
	dw ROUTE19
	dw ROUTE20
	dw ROUTE21
	dw ROUTE22
	dw ROUTE23
	dw ROUTE24

	; tipo 1 aro
	dw ROUTE25
	dw ROUTE26
	dw ROUTE27
	dw ROUTE28
	dw ROUTE29
	dw ROUTE30
	dw ROUTE31
	dw ROUTE32
	dw ROUTE33
	dw ROUTE34
	dw ROUTE35
	dw ROUTE36

	; tipo 2 cosa
	dw ROUTE37
	dw ROUTE38
	dw ROUTE39
	dw ROUTE40
	dw ROUTE41
	dw ROUTE42
	dw ROUTE43
	dw ROUTE44
	dw ROUTE45
	dw ROUTE46
	dw ROUTE47
	dw ROUTE48

	; tipo 3 bird
	dw ROUTE49
	dw ROUTE50
	dw ROUTE51
	dw ROUTE52
	dw ROUTE53
	dw ROUTE54
	dw ROUTE55
	dw ROUTE56
	dw ROUTE57
	dw ROUTE58
	dw ROUTE59
	dw ROUTE60


	; tipo 4 medusa?
	dw ROUTE61
	dw ROUTE62
	dw ROUTE63
	dw ROUTE64
	dw ROUTE65
	dw ROUTE66
	dw ROUTE67
	dw ROUTE68
	dw ROUTE69
	dw ROUTE70
	dw ROUTE71
	dw ROUTE72

	;boss
	dw ROUTE73

; DEFINICION DE CADA RUTA
;==========================

;------------------------- DISPAROS ---------------------
ROUTE0;disparo up 

	db 17,-8,0
	db 255,0,0; desactivacion
	db 0

ROUTE1;

	db 17,-8,2
	db 255,0,0
	db 0

ROUTE2;
	db 17,-2,2
	db 255,0,0
	db 0

ROUTE3;
	db 17,0,2
	db 255,0,0
	db 0

ROUTE4;
	db 17,2,2
	db 255,0,0
	db 0

ROUTE5;
	db 17,6,2
	db 255,0,0
	db 0

ROUTE6;
	db 17,8,0
	db 255,0,0
	db 0

ROUTE7;
	db 17,8,-2
	db 255,0,0
	db 0

ROUTE8;
	db 17,2,-2
	db 255,0,0
	db 0


ROUTE9;
	db 17,0,-2
	db 255,0,0
	db 0

ROUTE10;
	db 17,-2,-2
	db 255,0,0
	db 0

ROUTE11;
	db 17,-6,-2
	db 255,0,0
	db 0

;------- astronautas
ROUTE12; astronauta (sube y baja)
	db 4,1,0
	db 4,-1,0
	db 0

;------------RUTAS DE ENEMIGOS


; TIPO 0 -------------------------------- METEORITO
ROUTE13 
	db 60,2,0
	db 0

ROUTE14
	db 60,2,-1
	db 0

ROUTE15
	db 60,1,-1
	db 0

ROUTE16
	db 60,0,-1
	db 0

ROUTE17
	db 60,-1,-1
	db 0

ROUTE18
	db 60,-2,-1
	db 0

ROUTE19
	db 60,-2,0
	db 0

ROUTE20
	db 60,-2,1
	db 0

ROUTE21
	db 60,-1,1
	db 0

ROUTE22
	db 60,0,1
	db 0

ROUTE23
	db 60,1,1
	db 0

ROUTE24
	db 60,2,1
	db 0


;TIPO 1---------------------------------------- ARO

ROUTE25 
	db 20,1,-1
	db 100,0,1
	db 0

ROUTE26
	db 20,0,-1
	db 100,0,1
	db 0

ROUTE27
	db 20,-1,-1
	db 100,1,1
	db 0

ROUTE28
	db 20,-1,-1
	db 100,2,0
	db 0

ROUTE29
	db 20,1,-1
	db 100,-1,1
	db 0

ROUTE30
	db 20,0,-1
	db 100,0,1
	db 0

ROUTE31
	db 20,-1,1
	db 100,0,-1
	db 0

ROUTE32
	db 20,0,1
	db 100,0,-1
	db 0

ROUTE33
	db 20,1,1
	db 100,-1,-1
	db 0


ROUTE34
	db 20,1,1
	db 100,-2,0
	db 0


ROUTE35
	db 20,-1,1
	db 100,1,-1
	db 0

ROUTE36
	db 20,0,1
	db 100,0,1
	db 0



; TIPO 2 -------------------------------- COSA
ROUTE37 
	db 40,2,0
	db 20,-2,1
	db 40,0,-1
	db 20,-2,1
	db 0

ROUTE38

ROUTE39

ROUTE40
	db 40,0,-1
	db 20,-2,1
	db 40,2,0
	db 20,-2,1
	db 0


ROUTE41

ROUTE42

ROUTE43

	db 40,-2,0
	db 20,2,1
	db 40,0,-1
	db 20,2,1
	db 0



ROUTE44

ROUTE45

ROUTE46
	db 40,0,1
	db 20,-2,-1
	db 40,2,0
	db 20,-2,-1
	db 0


ROUTE47

ROUTE48

	db 40,0,1
	db 20,-2,-1
	db 40,2,0
	db 20,-2,-1
	db 0




; TIPO 3 -------------------------------- pajaro
ROUTE49 
	db 40,1,1
	db 40,1,-1
	db 0

ROUTE50

ROUTE51

ROUTE52
	db 40,-1,-1
	db 40,1,-1
	db 0


ROUTE53

ROUTE54

ROUTE55

	db 40,-1,1
	db 40,-1,-1
	db 0


ROUTE56

ROUTE57

ROUTE58

	db 40,-1,1
	db 40,1,1
	db 0


ROUTE59

ROUTE60

	db 40,1,1
	db 40,1,-1
	db 0


; TIPO 4 -------------------------------- medusa?
ROUTE61
ROUTE62
ROUTE63
ROUTE64
ROUTE65
ROUTE66
ROUTE67
ROUTE68
ROUTE69
ROUTE70
ROUTE71
ROUTE72

	db 20,1,1
	db 30,2,0
	db 20,1,-1
	db 18,0,-1
	db 20,-1,-1
	db 30,-2,0
	db 20,-1,1
	db 18,0,1
	DB 0


;boss
ROUTE73
	db 20,0,1
	db 10,1,1
	db 5,2,1
	db 35,3,0
	db 5,2,-1
	db 10,1,-1
	db 20,0,-1
	db 10,-1,-1
	db 5,-2,-1
	db 35,-3,0
	db 5,-2,1
	db 10,-1,1

	
	db 0
