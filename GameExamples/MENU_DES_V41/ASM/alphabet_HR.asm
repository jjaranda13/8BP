
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
ALPHA_ancho db 3; ancho alfabeto. todas las letras se supone miden lo mismo
ALPHA_alto  db 10; alto alfabeto.todas las letras se supone miden lo mismo
ALPHA_tamano db 3*10
; para identificar la direccion de memoria de cada letra hace falta una lista (ALPHA_LIST) que indique 
; que caracteres se han creado. Para ello se define en una cadena de texto los caracteres creados, es decir 
; su correspondencia en ascii. Puesto que  cada letra ocupa lo mismo, para averiguar la direccion de memoria
; de una letra concreta, a la funcion le basta multiplicar su posicion por el espacio que ocupa
; en total he definido 40 caracteres que ocupan 2*5=10 bytes cada una, 10x40=400 bytes en total
; la lista ocupa 40 bytes. en total este alfabeto ocupa 2+40+400 =442 bytes
; si quieres cambiar el alfabeto puedes definir mas caracteres o menos 
; y tambien puedes cambiar su tamano (todos los caracteres deben tener el mismo)

ALPHA_LIST
db "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ :."; caracteres creados
db 0; byte obligatorio de fin de cadena de caracteres

ALPHA_LETTERS
; cada letra es como un sprite pero sin ancho ni alto. las he creado con la herramienta SPEDIT
; RECOMENDACION los caracteres los he creado usando las tintas 2 y 4. esto permite usar 
; sobreescritura si asi lo deseamos en el comando PRINTAT, ya que los colores de fondo (0 y 1) no se usan

;------ BEGIN IMAGE --------
db 64 , 192 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 128 , 128 
db 128 , 128 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 0 , 128 , 0 
db 64 , 128 , 0 
db 64 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 0 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 64 , 192 , 0 
db 0 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 0 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 128 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 192 , 192 , 0 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 192 , 192 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 192 , 192 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 128 
db 0 , 0 , 128 
db 0 , 64 , 0 
db 0 , 64 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 64 , 0 , 0 
db 64 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 64 , 192 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 64 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 0 , 64 , 128 
db 0 , 128 , 128 
db 64 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 128 , 0 
db 128 , 64 , 0 
db 128 , 64 , 0 
db 192 , 192 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 64 , 192 , 128 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 0 , 0 
db 128 , 128 , 0 
db 128 , 64 , 0 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 64 , 192 , 128 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 192 , 192 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 64 , 192 , 128 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 192 , 192 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 64 , 192 , 128 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 64 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 128 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 0 , 0 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 64 , 0 
db 128 , 64 , 0 
db 192 , 192 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 128 
db 128 , 128 , 128 
db 128 , 128 , 128 
db 128 , 128 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 0 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 64 , 192 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 0 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 128 , 0 
db 128 , 192 , 0 
db 128 , 64 , 128 
db 192 , 128 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 0 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 0 
db 128 , 64 , 0 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 128 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 192 , 192 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 128 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 64 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 64 , 0 , 128 
db 64 , 0 , 128 
db 0 , 128 , 128 
db 0 , 64 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 128 , 128 
db 128 , 128 , 128 
db 128 , 128 , 128 
db 128 , 128 , 128 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 64 , 128 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 192 , 64 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 128 , 0 , 128 
db 128 , 0 , 128 
db 128 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 0 , 0 , 128 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 192 , 192 , 128 
db 0 , 0 , 128 
db 0 , 64 , 0 
db 0 , 128 , 0 
db 64 , 0 , 0 
db 128 , 0 , 0 
db 128 , 0 , 0 
db 192 , 192 , 128 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------

;------ BEGIN IMAGE --------
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------
;------ BEGIN IMAGE --------
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
db 0 , 128 , 0 
db 0 , 128 , 0 
db 0 , 0 , 0 
db 0 , 0 , 0 
;------ END IMAGE --------