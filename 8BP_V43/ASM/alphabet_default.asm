
ALPHABET
;==========================================================================================
; este fichero contiene la informacion de alfabeto, 
; tanto en dimensiones de las letras (todas son iguales) como las letras, numeros y cualquier 
; otro caracter que se quiera usar
; para ello hay que definir una "ALPHA_LIST", que contiene la lista de caracteres a representar
; y a continuacion cada dibujo de cada caracter (sus bytes)
; IMPORTANTE si un caracter no esta en la ALPHA_LIST y tratas de imprimirlo, se imprime el ultimo definido
;==========================================================================================
; a diferencia de un sprite, que puede tener cualquier tamano, una letra debe tener el mismo
; tamano que cualquier otra letra. 
; vamos a permitir cualquier tamano para las letras. y dicho tamano sera compartido por todas
; de ese modo ahorramos 2 bytes (ancho,alto) en la definicion de cada letra respecto lo que ocuparia un sprite
; por defecto hay definido un alfabeto de 2x5 (2 bytes ancho x 5 lineas alto) pero puedes cambiarlo
ALPHA_ancho db 2; ancho alfabeto. todas las letras se supone miden lo mismo
ALPHA_alto  db 5; alto alfabeto.todas las letras se supone miden lo mismo
ALPHA_tamano db 2*5
; para identificar la direccion de memoria de cada letra hace falta una lista (ALPHA_LIST) que indique 
; que caracteres se han creado. Para ello se define en una cadena de texto los caracteres creados, es decir 
; su correspondencia en ascii. Puesto que  cada letra ocupa lo mismo, para averiguar la direccion de memoria
; de una letra concreta, a la funcion le basta multiplicar su posicion por el espacio que ocupa
; en total he definido 40 caracteres que ocupan 2*5=10 bytes cada una, 10x40=400 bytes en total
; la lista ocupa 40 bytes. en total este alfabeto ocupa 2+40+400 =442 bytes
; si quieres cambiar el alfabeto puedes definir mas caracteres o menos 
; y tambien puedes cambiar su tamano (todos los caracteres deben tener el mismo)

ALPHA_LIST
db "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ:! ,."; caracteres creados
db 0; byte obligatorio de fin de cadena de caracteres

ALPHA_LETTERS
; cada letra es como un sprite pero sin ancho ni alto. las he creado con la herramienta SPEDIT
; RECOMENDACION los caracteres los he creado usando las tintas 2 y 4. esto permite usar 
; sobreescritura si asi lo deseamos en el comando PRINTAT, ya que los colores de fondo (0 y 1) no se usan

;------ BEGIN SPRITE --------
;0
db 12 , 8 
db 8 , 8 
db 8 , 8 
db 32 , 32 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;1
db 4 , 0 
db 12 , 0 
db 16 , 0 
db 16 , 0 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;2
db 12 , 8 
db 0 , 8 
db 12 , 8 
db 32 , 0 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;3
db 12 , 8 
db 0 , 8 
db 4 , 8 
db 0 , 32 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;4
db 8 , 8 
db 8 , 8 
db 12 , 8 
db 0 , 32 
db 0 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;5
db 12 , 8 
db 8 , 0 
db 12 , 8 
db 0 , 32 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;6
db 12 , 8 
db 8 , 0 
db 12 , 8 
db 32 , 32 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;7
db 12 , 8 
db 0 , 8 
db 0 , 8 
db 16 , 0 
db 16 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;8
db 12 , 8 
db 8 , 8 
db 12 , 8 
db 32 , 32 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;9
db 12 , 8 
db 8 , 8 
db 12 , 8 
db 0 , 32 
db 0 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;A
db 4 , 0 
db 8 , 8 
db 12 , 8 
db 32 , 32 
db 32 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;B
db 12 , 0 
db 8 , 8 
db 12 , 8 
db 32 , 32 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;C
db 12 , 8 
db 8 , 0 
db 8 , 0 
db 32 , 0 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;D
db 12 , 0 
db 8 , 8 
db 8 , 32 
db 32 , 32 
db 48 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;E
db 12 , 8 
db 8 , 0 
db 24 , 0 
db 32 , 0 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;F
db 12 , 8 
db 8 , 0 
db 24 , 0 
db 32 , 0 
db 32 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;G
db 12 , 8 
db 8 , 0 
db 8 , 8 
db 32 , 32 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;H
db 8 , 8 
db 8 , 8 
db 12 , 8 
db 32 , 32 
db 32 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;I
;db 12 , 8 
db 4 , 0 
db 4 , 0 
db 4 , 0 
db 16 , 0 
db 16 , 0 
;db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;J
db 12 , 8 
db 0 , 8 
db 0 , 32 
db 0 , 32 
db 48 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;K
db 8 , 8 
db 12 , 0 
db 24 , 0 
db 8 , 32 
db 32 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;L
db 8 , 0 
db 8 , 0 
db 8 , 0 
db 8 , 0 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;M
db 8 , 8 
db 12 , 8 
db 36 , 32 
db 32 , 32 
db 32 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;N
db 12 , 8 
db 8 , 8 
db 32 , 8 
db 32 , 32 
db 32 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;O
db 12 , 8 
db 8 , 8 
db 32 , 8 
db 32 , 32 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;P
db 12 , 8 
db 8 , 8 
db 36 , 8 
db 32 , 0 
db 32 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;Q
db 12 , 8 
db 8 , 8 
db 32 , 8 
db 48 , 32 
db 0 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;R
db 4 , 8 
db 8 , 0 
db 32 , 0 
db 32 , 0 
db 32 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;S
db 12 , 8 
db 8 , 0 
db 12 , 8 
db 0 , 32 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;T
db 12 , 8 
db 4 , 0 
db 4 , 0 
db 16 , 0 
db 16 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;U
db 8 , 8 
db 8 , 8 
db 8 , 32 
db 32 , 32 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;V
db 8 , 8 
db 8 , 8 
db 8 , 32 
db 32 , 32 
db 16 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;W
db 8 , 8 
db 8 , 8 
db 12 , 32 
db 48 , 32 
db 32 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;X
db 8 , 8 
db 8 , 8 
db 4 , 0 
db 32 , 32 
db 32 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;Y
db 8 , 8 
db 8 , 8 
db 4 , 0 
db 16 , 0 
db 16 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;Z
db 12 , 8 
db 0 , 8 
db 4 , 0 
db 8 , 0 
db 48 , 32 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
; dos puntos
db 0 , 0 
db 4 , 0 
db 0 , 0 
db 16 , 0 
db 0 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
; !
db 4 , 0 
db 4 , 0 
db 16 , 0 
db 0 , 0 
db 16 , 0 
;------ END SPRITE --------
;------ BEGIN SPRITE --------
;espacio
db 0 , 0 
db 0 , 0 
db 0 , 0 
db 0 , 0 
db 0 , 0 
;------ END SPRITE -------
;------ BEGIN SPRITE --------
; coma ,
db 0 , 0 
db 0 , 0 
db 4 , 0 
db 16 , 0 
db 32 , 0 
;------ END IMAGE --------
;------ BEGIN SPRITE --------
;.
db 0 , 0 
db 0 , 0 
db 0 , 0 
db 0 , 0 
db 16 , 0 
;------ END SPRITE --------
