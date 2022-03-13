// 42540 map layout de caracteres (25x20 =500 bytes) 
// acodarse de inicializar todos a 0
// como sacar fuera de pantalla en horizontal para que entre poco a poco
// la variable global nmalos no funciona. no utiliza el valor de fuera. tengo que inicializarla dentro


#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "8bp.h"
#include "minibasic.h"

void fito_mode0();
void tecla();
void borraSprites();
void generaMalos();
void mueveMalo(int traeCual);
void borde(int traeBorde);
int *tocoEscalera(int traeY, int traeX);
int hayCompanero(int yMalo, int xMalo, int traeYoMismo);
void getPiso(char traeAltura, char *pisoActual);
unsigned int traeYMalo(int traeCual);
unsigned int traeXMalo(int traeCual);
int quedanMalos();
unsigned int traeSecuenciaBueno();
void sonidoError();
void sonidoLaser();
void pintaDatos();
void tecladoH();
void tecladoV();
void finNivel();
void pintaEnergia(int);
void follao();
char traeTecla(char *traeCadena, char *traeCadenaBorrado);

int cuantos=20; // aqui no hace caso. definir en main
int dirBueno=4;
int buenoX=36;
int buenoY=160;

//dirs[20][3]   
// dimension 0 es dirección
// dimensión 1 es cuando está cayendo y va sumando plantas que ha caido.
// dimension 2 es cuando está resucitando (elevandose tras no rematarlo)
int dirs[20][3]; 
int H=0, V=0;
signed char god = -1; // -1 es normal, 1 el puto amo

int tempX, tempY;

#define tiempoSufriendo 75
const int datosSprites[3][7] = {
  {26, 4, 5, 6, 7, 1, 100},    // datos: no se usa, secuencia right, secuencia left, secuencia sufriendo, secuencia arriba/abajo, altura, puntos
  {26, 10,11,12,13, 2, 200},
  {26, 14, 15, 16, 17, 3, 500}
};
const int datosNivel[6][7]= {
    {0, 0, 0, -1, -1, -1, -1},  // enemigos del nivel. 0=rojo 1=verde 2=azul, -1=ninguno
    {0, 0, 0, 0, 0, -1, -1},
    {0, 0, 0, 0, 0, 0, 0},
    {1, 0, 0, -1, -1, -1, -1},
    {1, 0, 0, 0, 0, -1, -1},
    {2, 1, 0, 0, 0, 0, 0}
};

char salir=0, menu=1, juego=1, nivel=0, Vidas=3;
char tecla1;
char tecla2;
char tecla3;
char tecla4;
char tecla5=71;
char tecla6=63;
int puntos, Energia;
unsigned int general=0;

#define energiaCacho 10 // velocidad a la que baja la energia, tiempo barra pasa
#define nNiveles 6
char* const c[nNiveles*24] = {
      "                    ",     // NIVEL0
      "                    ",     // solo escaleras en los pares (compruebo %4)
      " ;     ;          ; ",     // cada nivel tiene 24 filas y 20 columnas(el primero desde 0 hasta el 23)
      "<;<<<<<;<<<<<<<<<<;<",     // LA ESCALERA cuando acaba por arriba tiene que sobresalir en planta
      " ;     ;          ; ",
      " ;     ;          ; ",
      " ;  ;  ;     ;    ; ",
      "<<<<;<<<<<<<<;<<<<;<",
      "    ;        ;    ; ",
      "    ;        ;    ; ",
      "    ;     ;  ;  ; ; ",
      "<<<<;<<<<<;<<<<<;<<<",
      "    ;     ;     ;   ",
      "    ;     ;     ;   ",
      "    ;  ;  ;     ;   ",
      "<<<<<<<;<<;<<<<<;<<<",
      "       ;  ;     ;   ",
      "       ;  ;     ;   ",
      " ;     ;  ;  ;  ; ; ",
      "<;<<<<<<<<<<<;<<<<;<",
      " ;           ;    ; ",
      " ;           ;    ; ",
      " ;           ;    ; ",
      "<<<<<<<<<<<<<<<<<<<<",
                            
                            
      "                    ",     // NIVEL1
      "                    ",     // solo escaleras en los pares (compruebo %4)
      " ;        ;       ; ",     // cada nivel tiene 24 filas y 20 columnas(el primero desde 0 hasta el 23)
      "<;<<<<<<<<;<<<<<<<;<",
      " ;        ;       ; ",
      " ;        ;       ; ",
      " ;        ;    ;  ; ",
      "<;<<<<<<<<;<<<<;<<<<",
      " ;        ;    ;    ",
      " ;        ;    ;    ",
      " ;     ;  ;    ;   ;",
      "<<<<<<<;<<<<<<<;<<<;",
      "       ;       ;   ;",
      "       ;       ;   ;",
      "    ;  ;    ;  ;   ;",
      "<<<<;<<<<<<<;<<<<<<;",
      "    ;       ;      ;",
      "    ;       ;      ;",
      " ;  ;       ;      ;",
      "<;<<<<<<<<<<;<<<<<<;",
      " ;          ;      ;",
      " ;          ;      ;",
      " ;          ;      ;",
      "<<<<<<<<<<<<<<<<<<<<",      
                             
                            
      "                    ",      // NIVEL2     
      "                    ",
      " ;      ;        ;  ",     // cada nivel tiene 24 filas y 20 columnas
      "<;<<<<<<;<<<<<<<<;<<",
      " ;      ;        ;  ",
      " ;      ;        ;  ",
      " ;  ;   ;  ;     ;  ",
      "<<<<;<<<<<<;<<<<<;<<",
      "    ;      ;     ;  ",
      "    ;      ;     ;  ",
      "    ;      ;  ;  ;  ",
      "<<<<;<<<<<<;<<;<<<<<",
      "    ;      ;  ;     ",
      "    ;      ;  ;     ",
      " ;  ;   ;  ;  ;     ",
      "<;<<<<<<;<<<<<;<<<<<",
      " ;      ;     ;     ",
      " ;      ;     ;     ",
      " ;      ;     ;  ;  ",
      "<;<<<<<<;<<<<<<<<;<<",
      " ;      ;        ;  ",
      " ;      ;        ;  ",
      " ;      ;        ;  ",
      "<<<<<<<<<<<<<<<<<<<<",
      
      
      "                    ",     // NIVEL3
      "                    ",
      "  ;   ;      ;   ;  ",     // cada nivel tiene 24 filas y 20 columnas
      "<<;<<<;<<<<<<;<<<;<<",
      "  ;   ;      ;   ;  ",
      "  ;   ;      ;   ;  ",
      "  ;   ;   ;  ;   ;  ",
      "<<;<<<<<<<;<<<<<<;<<",
      "  ;       ;      ;  ",
      "  ;       ;      ;  ",
      "  ;       ;      ;  ",
      "<<;<<<<<<<;<<<<<<;<<",
      "  ;       ;      ;  ",
      "  ;       ;      ;  ",
      "  ;       ;  ;   ;  ",
      "<<;<<<<<<<<<<;<<<;<<",
      "  ;          ;   ;  ",
      "  ;          ;   ;  ",
      "  ;    ;     ;   ;  ",
      "<<;<<<<;<<<<<;<<<;<<",
      "  ;    ;     ;   ;  ",
      "  ;    ;     ;   ;  ",
      "  ;    ;     ;   ;  ",
      "<<<<<<<<<<<<<<<<<<<<",
      
      "                    ",     // NIVEL4   
      "                    ",
      " ;      ;        ;  ",     // cada nivel tiene 24 filas y 20 columnas
      "<;<<<<<<;<<<<<<<<;<<",
      " ;      ;        ;  ",
      " ;      ;        ;  ",
      " ;  ;   ;  ;     ;  ",
      "<<<<;<<<<<<;<<<<<;<<",
      "    ;      ;     ;  ",
      "    ;      ;     ;  ",
      "    ;      ;  ;  ;  ",
      "<<<<;<<<<<<;<<;<<<<<",
      "    ;      ;  ;     ",
      "    ;      ;  ;     ",
      " ;  ;   ;  ;  ;     ",
      "<;<<<<<<;<<<<<;<<<<<",
      " ;      ;     ;     ",
      " ;      ;     ;     ",
      " ;      ;     ;  ;  ",
      "<;<<<<<<;<<<<<<<<;<<",
      " ;      ;        ;  ",
      " ;      ;        ;  ",
      " ;      ;        ;  ",
      "<<<<<<<<<<<<<<<<<<<<",
      
      "                    ",     // NIVEL5
      "                    ",
      " ;      ;      ;    ",     // cada nivel tiene 24 filas y 20 columnas
      "<;<<<<<<;<<<<<<;<<<<",
      " ;      ;      ;    ",
      " ;      ;      ;    ",
      " ;  ;   ;      ;    ",
      "<<<<;<<<;<<<<<<;<<<<",
      "    ;   ;      ;    ",
      "    ;   ;      ;    ",
      "    ;   ;      ;  ; ",
      "<<<<;<<<;<<<<<<<<<;<",
      "    ;   ;         ; ",
      "    ;   ;         ; ",
      " ;  ;   ;  ;      ; ",
      "<;<<<<<<<<<;<<<<<<;<",
      " ;         ;      ; ",
      " ;         ;      ; ",
      " ;         ;   ;  ; ",
      "<;<<<<<<<<<;<<<;<<<<",
      " ;         ;   ;    ",
      " ;         ;   ;    ",
      " ;         ;   ;    ",
      "<<<<<<<<<<<<<<<<<<<<"
 };
 
#define nFrases 8                                       // tienen que ser pares
char* const frase[nFrases] = { 
"                        CPC SPACE PANIC!",
"  ORIGINAL FROM UNIVERSAL, 1980",
"        CODE BY FITO, MUSIC BY XENOMORPH",
"  TEST. PACOVESPA, SIYEI",
"                 TEST. AZIMOV, XENOMORPH",
"  LOAD SCREEN BY BRUNDIJ",
"                     LOADER BY TROCOLOCO",
"  KEEPING THE CPC ALIVE"
};

int main()
{
  tecla1=0; 
  tecla2=2; 
  tecla3=8; 
  tecla4=1; 
  tecla5=71; 
  tecla6=63;
  
  _8BP_setupsp_3(31,9,20); _8BP_setupsp_3(31,0,1+32+64); _8BP_locatesp_3(31,buenoY,buenoX); //bueno  
  
  _8BP_setupsp_3(29,9,21); _8BP_setupsp_3(29,0,1); _8BP_locatesp_3(29,240,10); //suelo
  _8BP_setupsp_3(26,9,30); _8BP_setupsp_3(26,0,1); _8BP_locatesp_3(26,240,10); //suelo2
  _8BP_setupsp_3(25,9,18); _8BP_setupsp_3(25,0,1); _8BP_locatesp_3(25,240,10); //suelo3
  _8BP_setupsp_3(27,9,31); _8BP_setupsp_3(27,0,1); _8BP_locatesp_3(27,240,10); // suelo vacio  
  
  _8BP_setupsp_3(28,9,16); _8BP_setupsp_3(28,0,1);_8BP_locatesp_3(28,240,10); //muro
  _8BP_setupsp_3(0,9,17); _8BP_setupsp_3(0,0,1); _8BP_locatesp_3(0,240,10); //escalera peque
  _8BP_setupsp_3(1,9,21); _8BP_setupsp_3(1,0,1+2); _8BP_locatesp_3(1,240,10);// suelo    
  

  unsigned char pisoActual[21]={"                    "};
  unsigned char vacio[21]=     {"VVVVVVVVVVVVVVVVVVVV"};    
  
  dirBueno=4;
  _8BP_setupsp_3(31,7,1);
  int posX=0, posY=0;
  int ultimaTecla=0, cayendo=0;
  int tocado=0; int tocador=0;
  int temp, cualFrase;
  
  unsigned int inventaX=0, inventaY=32;  
  
  _8BP_colsp_3(34,6,2);
  
  cuantos=1;
  salir=0, menu=1, juego=1;
      
    while (salir==0)
  {
    fito_mode0();  
    _basic_call(0xbc14); // borra pantalla    
    
    if (menu==1) {
      _basic_pen_txt(1);
      _basic_paper(0);
      
      _basic_ink(1,15); //naranja, transparente 
      _basic_ink(2,26); _basic_ink(3,26); // 26 blanco
      _basic_ink(4,6); _basic_ink(5,6); // 6 rojo
      _basic_ink(6,18); _basic_ink(7,18); // 18 verde
      _basic_ink(8,18); _basic_ink(9,18);
      _basic_ink(14,16); _basic_ink(15,16);          
      _basic_pen_txt(3);
      _basic_locate(4,2); _basic_print("CPC Space Panic");      
      _basic_pen_txt(6);      
      _basic_locate(4,5); _basic_print("1 PLAY GAME");
      _basic_locate(4,7); _basic_print("2 REDEFINE KEYS");
      
      _8BP_printat_4(1,100,4,"USE KEYS TO MOVEMENT, DIG AND BURY!!!");
      temp=64;

      tocado=120; // aprovecho esta variable local
      for (temp=0;temp<80;temp+=4) {
          if (tocado<200-24) {
              _8BP_printsp_3(0,tocado,0);
              tocado+=8;
          }
          _8BP_printsp_3(29,200-56,temp);
          _8BP_printsp_3(29,200-24,temp);
      }
      
      _8BP_printat_4(0,200-8,54,"2022 FITOSOFT");
      _8BP_printat_4(0,200-8,0,"MADE WITH 8BP LIBRARY");
     
    }
    

    {
      _8BP_music();
      _8BP_music_4(0,0,0,6);
    }
      
    temp=0; cualFrase=0;
    
        // personajes menu animado
        borraSprites();      
        _8BP_setupsp_3(5,7,4); _8BP_locatesp_3(5,152,0); _8BP_setupsp_3(5,0,1+2+4+8+16+64); _8BP_setupsp_4(5,5,0,1); // rojo
        _8BP_setupsp_3(6,7,10); _8BP_locatesp_3(6,152,-4); _8BP_setupsp_3(6,0,1+2+4+8+16+64); _8BP_setupsp_4(6,5,0,1); // verde
        _8BP_setupsp_3(7,7,14); _8BP_locatesp_3(7,152,-8); _8BP_setupsp_3(7,0,1+2+4+8+16+64); _8BP_setupsp_4(7,5,0,1); // blanco
        _8BP_setupsp_3(31,7,1); _8BP_locatesp_3(31,152,8); _8BP_setupsp_3(31,0,1+2+4+8+16+64); _8BP_setupsp_4(31,5,0,1); // bueno    
    
    while (menu==1)
    {
      //_basic_call(0xBD19);
      // tecla 2,redefinir
      if (_basic_inkey(65)==0) {        
        char *espacios="                       ";
        for (int pausa=0;pausa<5000;pausa++);        
        tecla1=traeTecla("PRESS KEY FOR UP   ", espacios);
        tecla2=traeTecla("PRESS KEY FOR DOWN ", espacios);
        tecla3=traeTecla("PRESS KEY FOR LEFT ", espacios);
        tecla4=traeTecla("PRESS KEY FOR RIGHT", espacios);
        tecla5=traeTecla("PRESS KEY FOR DIG  ", espacios);
        tecla6=traeTecla("PRESS KEY FOR BURY ", espacios);
      }
      if (_basic_inkey(64)==0) {
          nivel=0;
          puntos=0;
          menu=0;
          juego=1;
          general=0; // contador que se usa para saber cuantos ciclos han pasado.
          ultimaTecla=0;
          Energia=0;
          Vidas=3;
      }
     
      // animación
      _8BP_autoall();
      _8BP_animall();
      _8BP_printspall(); 
      for (int pausa=0;pausa<1250;pausa++);

      if (traeXMalo(2)==82 && temp==4) {
        temp=3;
        _8BP_setupsp_3(5,7,5);  _8BP_setupsp_4(5,5,0,-1); // rojo
        _8BP_setupsp_3(6,7,11); _8BP_setupsp_4(6,5,0,-1); // verde
        _8BP_setupsp_3(7,7,15); _8BP_setupsp_4(7,5,0,-1); // masterchef blanco
        _8BP_setupsp_3(31,7,2); _8BP_setupsp_4(31,5,0,-1); // bueno       
        _8BP_printat_4(1,168,0,frase[cualFrase]); cualFrase++; if (cualFrase>nFrases-1) cualFrase=0;
        goto sigue33;
      }
      if ((traeXMalo(31-5)==65532 && temp==3) || temp==0) {
        temp=4;
        _8BP_setupsp_3(5,7,4);   _8BP_setupsp_4(5,5,0,1); // rojo
        _8BP_setupsp_3(6,7,10); _8BP_setupsp_4(6,5,0,1); // verde
        _8BP_setupsp_3(7,7,14); _8BP_setupsp_4(7,5,0,1); // masterchef blanco
        _8BP_setupsp_3(31,7,1); _8BP_setupsp_4(31,5,0,1); // bueno
        _8BP_printat_4(1,168,0,frase[cualFrase]); cualFrase++; if (cualFrase>nFrases-1) cualFrase=0;
      }      
      sigue33:
    }
    
    if (_basic_peek(0x39)!=57)
      _8BP_music();
  
    _basic_pen_txt(1); // dejamos con el transparente naranja para que cuando pasen por encima no borre
    juego=1;
    Energia=0;
    
    _basic_call(0xbc14); // borra pantalla        
    borraSprites();
    buenoY=32*5; buenoX=16;        
    _8BP_setupsp_3(31,9,20); _8BP_setupsp_3(31,0,1+32+64); _8BP_locatesp_3(31,buenoY,buenoX); //bueno  
    _8BP_setupsp_3(31,7,1);
    dirBueno=4;
    generaMalos();
    
    

    for (int y1=0;y1<=23;y1++) 
    {        
      _8BP_layout_3(y1, 0, @c[y1+(nivel*24)]); 
    }   
   _8BP_printspall();    
    pintaDatos();    
    
    pintaEnergia(-1);        
    
    //_basic_call(0xBB03); // borra buffer teclado
    while (juego==1)
    {
        _8BP_autoall();   
        _8BP_locatesp_3(31,buenoY,buenoX);               

        for (int cual=0;cual<cuantos;cual++)
        {
          mueveMalo(cual);          
          _8BP_anima_1(cual+5);
        }
        _8BP_printspall();

        //if (god==-1) {
          _8BP_colsp_2(31,&tocado);
          if (tocado<32) {
            follao();
          }
        //}
        
        if (cayendo==1) goto finteclas;
        
    
        if (dirBueno>2) {
          tecladoV();
          tecladoH();
        }
        else {
          tecladoH();
          tecladoV();          
        }
          
        finteclas:        

          // cae por propio peso
          _8BP_locatesp_3(31,buenoY,buenoX);     
          if (cayendo==0) {
            _8BP_mover_3(31,2,0);
            _8BP_colay_3(32, &tocado,31);
            _8BP_mover_3(31,-2,0);
            if (tocado==0) {
                //mensaje(1,"MODO DIOS");
                _8BP_setupsp_3(31,7,3);   
                _8BP_printsp_1(31);
                dirBueno=2;
                cayendo=1;
                buenoY+=2;
            }       
          }
          else
          if (cayendo==1) {
            if (buenoY % 32==0) {
              _8BP_locatesp_3(31,buenoY,buenoX);               
              _8BP_setupsp_3(31,7,1);   
              _8BP_printsp_1(31);
              dirBueno=4;
              cayendo=0;
            }
            else buenoY+=2;
          }
          
          //if (dirBueno<3) goto sigue; // 20220304 quito esto sino falla tecla z autopulsandose
          
           if (_basic_inkey(tecla5)==0) // CAVAR CON TECLA Z
           { 
              //_basic_print("HAS ENTRADO");
              if (general-ultimaTecla>4 && buenoY<160) {            
               int yActual=(buenoY+24)/8;
               int xActual;
               char pongo=0;
               getPiso(yActual,pisoActual);
               ultimaTecla=general;
               switch (dirBueno ){
                   case 3:                 
                      xActual=(buenoX)/4;  xActual--;                      
                      if (hayCompanero(buenoY,buenoX-4,-1)==-1 && (unsigned char)tocoEscalera(buenoY, buenoX-4)==32)
                      {                        
                        switch ((char)pisoActual[xActual]) {
                          case '<': // es suelo solido
                            pongo='U';                 
                            //mensaje(1,"PUNGO SUEL2"); 
                            break;
                          case 'U': // es suelo2
                            pongo='T';                 
                            //mensaje(1,"PONGO SUEL3");
                            break;              
                          case 'T': // es suelo2
                            pongo=' ';                 
                            //mensaje(1,"PONGO VACIO");
                            break;       
                        }                        
                        //26 suelo2=U
                        //25 suelo3=T
                        if (pongo>0) {
                          if (traeSecuenciaBueno()!=9) {
                            _8BP_setupsp_3(31,7,9);     
                            //dirBueno=0;
                          }                  
                          else
                              _8BP_anima_1(31);                            
                          _basic_sound(1,100,1,7,0,1,0);
                          pisoActual[xActual]=pongo;
                          _8BP_layout_3(yActual,0,pisoActual);                            
                          if (pongo==' ')
                            _8BP_printsp_3(27,buenoY+24,xActual*4); // pinto suelo vacio                             
                          _8BP_locatesp_3(25,240,10); 
                          _8BP_locatesp_3(26,240,10); 
                          _8BP_locatesp_3(27,240,10);                       
                        }
                      }
               
                    break;
                    case 4:   
                                    
                      xActual=(buenoX)/4;  xActual+=2;
                      //mensaje(1,_basic_str(buenoX));
                      //mensaje(2,_basic_str((unsigned char)tocoEscalera(buenoY, buenoX+4)));
                      
                      if (hayCompanero(buenoY,buenoX+4,-1)==-1 && (unsigned char)tocoEscalera(buenoY, buenoX+8)==32)
                      {                      
                        switch ((char)pisoActual[xActual]) {
                          case '<': // es suelo solido
                            pongo='U';                 
                            //mensaje(1,"PUNGO SUEL2"); 
                            break;
                          case 'U': // es suelo2
                            pongo='T';                 
                            //mensaje(1,"PONGO SUEL3");
                            break;              
                          case 'T': // es suelo2
                            pongo=' ';                 
                            //mensaje(1,"PONGO VACIO");
                            break;      
                        }                        
                        //26 suelo2=U
                        //25 suelo3=T
                        if (pongo>0) {
                          if (traeSecuenciaBueno()!=8) {
                            _8BP_setupsp_3(31,7,8);     
                            //dirBueno=0;
                          }                  
                          else
                              _8BP_anima_1(31);                            
                            
                          _basic_sound(1,100,1,7,0,1,0);
                          pisoActual[xActual]=pongo;
                          _8BP_layout_3(yActual,0,pisoActual);                      
                          if (pongo==' ')
                            _8BP_printsp_3(27,buenoY+24,xActual*4); // pinto suelo vacio 
                          _8BP_locatesp_3(25,240,10); 
                          _8BP_locatesp_3(26,240,10); 
                          _8BP_locatesp_3(27,240,10);                       
                        }
                      }

                    break;
               } // switch
              } // inf tecla
              //_8BP_printat_4(0,8*24,40,pisoActual);   
              goto sigue;
           } // tecla Z
           
           
          if (_basic_inkey(tecla6)==0) { // RELLENAR CON TECLA X
              //_basic_print("HAS ENTRADO en tecla x");
              if (general-ultimaTecla>4) {            
               int yActual=(buenoY+24)/8;
               int xActual;
              char pongo=0;
              getPiso(yActual,pisoActual);
               ultimaTecla=general;
               switch (dirBueno ){
                   case 3:                
                                                        
                      xActual=(buenoX)/4;  xActual--;
                      
                      switch ((char)pisoActual[xActual]) {
                        case ' ': // es suelo vacio
                          pongo='T';
                          //mensaje(1,"PONGO SUEL3");             
                          break;                        
                        case 'T': // es suelo solido
                          pongo='U';                 
                          //mensaje(1,"PUNGO SUEL2"); 
                          break;
                        case 'U': // es suelo2
                          pongo='<';                 
                          //mensaje(1,"RESTAURO");
                          break;              
                      }                        
                      //26 suelo2=U
                      //25 suelo3=T
                      if (pongo>0) {
                        if (traeSecuenciaBueno()!=9) {
                          _8BP_setupsp_3(31,7,9);     
                        }                  
                        else
                            _8BP_anima_1(31);                            
                        _basic_sound(1,100,1,7,0,1,0);
                        pisoActual[xActual]=pongo;
                        _8BP_layout_3(yActual,0,pisoActual);                            
                        
                        temp=hayCompanero(buenoY+24,xActual*4,-1);
                        if (pongo=='<' && temp>-1) {                          
                            //mensaje(1, "A CASCARLA ");                          
                            //tecla();
                            dirs[temp][0]=33;                            
                            dirs[temp][2]=0; // 220226
                            _8BP_setupsp_3((temp+5),7,datosSprites[ datosNivel[nivel][temp]  ][3]); // machacas los cuernos al malo y cae. pongo animacion up/down
                            _8BP_setupsp_4(temp+5,5,4,0);
                        }                          
                        
                        _8BP_locatesp_3(25,240,10); 
                        _8BP_locatesp_3(26,240,10); 
                        _8BP_locatesp_3(27,240,10);                       
                      }
                    break;
                    case 4:   
                                                         
                      xActual=(buenoX)/4;  xActual+=2;
                      switch ((char)pisoActual[xActual]) {
                        case ' ': // es suelo vacio
                          pongo='T';
                          //mensaje(1,"PONGO SUEL3");             
                          break;                        
                        case 'T': // es suelo solido
                          pongo='U';                 
                          //mensaje(1,"PUNGO SUEL2"); 
                          break;
                        case 'U': // es suelo2
                          pongo='<';                 
                          //mensaje(1,"RESTAURO");
                          break;
                      }                        
                      //26 suelo2=U
                      //25 suelo3=T
                      if (pongo>0) {
                        if (traeSecuenciaBueno()!=8) {
                          _8BP_setupsp_3(31,7,8);     
                        }                  
                        else
                            _8BP_anima_1(31);                            
                          
                        _basic_sound(1,100,1,7,0,1,0);
                        pisoActual[xActual]=pongo;
                        _8BP_layout_3(yActual,0,pisoActual);                      
                        
                        temp=hayCompanero(buenoY+24,xActual*4,-1);
                        if (pongo=='<' && temp>-1) {                          
                            //mensaje(1, "A CASCARLA ");                          
                            //tecla();
                            dirs[temp][0]=33;
                            _8BP_setupsp_3((temp+5),7,datosSprites[ datosNivel[nivel][temp]  ][3]); // pongo animacion hacia abajo para que no deje rastro cuernos
                            _8BP_setupsp_4(temp+5,5,4,0);
                        }
                          
                        
                        _8BP_locatesp_3(25,240,10); 
                        _8BP_locatesp_3(26,240,10); 
                        _8BP_locatesp_3(27,240,10);                       
                      }
                    break;
               } // switch
              } // inf tecla
              //_8BP_printat_4(0,8*24,40,pisoActual);   
           } // tecla X         

        sigue:
          general++;
        //_8BP_printat_4(0,200-(8*2),65,_basic_str(buenoX));
        //_8BP_printat_4(0,200-(8*2),75,_basic_str(buenoY));
        //for (int pausa=0;pausa<4000;pausa++);

        
        // cuando pasan TANTOS ciclos se espabila el malo enganchado.
        if (general % 80 ==0) {
            for (int temp=0;temp<cuantos;temp++)
                if (dirs[temp][0]==55) {
                    dirs[temp][0]=0;
                    char pisoTemporal[21]="12345678901234567890";
                    int yActual=traeYMalo(temp);
                    int xActual=traeXMalo(temp);
                    yActual=yActual/8; yActual+=3;
                    xActual=xActual/4;
                    getPiso(yActual,pisoTemporal);
                    pisoTemporal[xActual]='<';
                    _8BP_layout_3(yActual,0,pisoTemporal);   
                        _8BP_locatesp_3(25,240,10); 
                        _8BP_locatesp_3(26,240,10); 
                        _8BP_locatesp_3(27,240,10); 
                }
        }
        if (general % 30 == 0) {
          pintaEnergia(Energia);
          Energia+=energiaCacho;          
          if (Energia>639-energiaCacho)
              follao();
        }          
    }                  
  }
  fin:
  return 0;	
}
void tecladoH()
{
    
          //tecla izquierda
          if (_basic_inkey(tecla3)==0) {
              //_basic_print("HAS ENTRADO en tecla left");
            if (buenoY % 32==0 && buenoX>0) {
              if (dirBueno!=3 || traeSecuenciaBueno()==9) {
                
                {
                  dirBueno=3;
                  _8BP_printsp_1(31);
                  _8BP_setupsp_3(31,7,2);
                }
              }          
              else
              if (dirBueno==3 && buenoY % 32==0 ) {
                _8BP_anima_1(31); _basic_sound(1,50,1,7,0,0,0);
                buenoX--;
              }
            }
          }        
    
          if (_basic_inkey(tecla4)==0) {           
          //_basic_print("HAS ENTRADO en tecla right");
            if (buenoY % 32==0 && buenoX<76) {
              if (dirBueno!=4 || traeSecuenciaBueno()==8) {
                
                {
                dirBueno=4;
                _8BP_printsp_1(31);
                _8BP_setupsp_3(31,7,1);
                }
              }
              else
              if (dirBueno==4 && buenoY % 32 == 0) {
                _8BP_anima_1(31);   _basic_sound(1,50,1,7,0,0,0);
                buenoX++;
              }
            }
          }
          

}
void tecladoV()
{
    int tocado=0;
    
          // tecla arriba con tocoescalera
          if (_basic_inkey(tecla1)==0) {
              tocado=0;
              if (dirBueno!=1) {
                if (tocoEscalera(buenoY+14,buenoX)==59 && buenoX%4==0)  {
                    dirBueno=1;       
                    _8BP_setupsp_3(31,7,3);                                 
                }
              }        
              else            
              {                
                if (tocoEscalera(buenoY+14,buenoX)==59 && buenoX%4==0)  {
                 
                  _8BP_anima_1(31); _basic_sound(1,230,1,7,0,1,0);
                  buenoY-=2;
                }
              }            
          } 

          // tecla ABAJO con tocoescalera
          if (_basic_inkey(tecla2)==0) {
              tocado=0;
              if (dirBueno!=2) {
                if (tocoEscalera(buenoY+24,buenoX)==59 && buenoX%4==0)  {
                    dirBueno=2;       
                    _8BP_setupsp_3(31,7,3);                                 
                }
              }        
              else            
              {                
                if (tocoEscalera(buenoY+24,buenoX)==59 && buenoX%4==0)  {
                 
                  _8BP_anima_1(31); _basic_sound(1,230,1,7,0,1,0);
                  buenoY+=2;
                }
              }            
          } 

}
void generaMalos()
{

  unsigned int inventaX, inventaY, tipoMalo;
  inventaX=0;
  inventaY=0;
  for (int cua=0;cua<7;cua++)
      if (datosNivel[nivel][cua]>-1)
        cuantos=cua+1;        
    
  for(int cua=0;cua<cuantos;cua++)
  {
    tipoMalo=datosNivel[nivel][cua];
    dirs[cua][0]=4; dirs[cua][1]=0; dirs[cua][2]=0;
    _8BP_setupsp_3(5+cua,9,datosSprites[tipoMalo][0]);
    _8BP_setupsp_3(5+cua,7,datosSprites[tipoMalo][1]);
    _8BP_setupsp_3(5+cua,0,1+2+4+8+16+64);
    _8BP_setupsp_4(5+cua,5,0,1);
    //_8BP_locatesp_3(5+cua,(cua*4)*8,cua*4); 
    _8BP_locatesp_3(5+cua,inventaY,inventaX); 
    inventaX+=4; if (inventaX>76) inventaX=0;
    inventaY+=32; if (inventaY>32*4) inventaY=0;
  }
}
void fito_mode0()
{  
  //SCR_SET_MODE 0
  __asm
    ld  a, #0
    call  #0xBC0E
  __endasm;    
}
void tecla()
{
  //_basic_call(0xBB18); // pulsa una tecla
  while (_basic_inkey(18));
  
}
void borraSprites()
{
    
    for (int n=0;n<=31;n++) {
      _8BP_setupsp_3(n,0,0);
      _8BP_locatesp_3(n,240,0);
    }
  
  // inicializo direcciones y cayendos de malos
    for (int n=0;n<20;n++) {
        dirs[n][0]=0;
        dirs[n][1]=0;
        dirs[n][2]=0;
    }
}

void mueveMalo(int traeCual)
{
      int *xMalo, *yMalo;
      int tocado=0;
      yMalo=(unsigned int *)(27001+(5+traeCual)*16);
      xMalo=yMalo+1;      
      char puedes[20]={0};
      char cuantosPuedes=0;
      
      int xMaloInt=*xMalo;
      int yMaloInt=*yMalo;
      int temp;
      
      
      int tipoBicho=datosNivel[nivel][traeCual];
      
      // direcciones que puede tomar
      
      if (dirs[traeCual][0]==0) {
                cuantosPuedes=0;
                puedes[cuantosPuedes]=3;
                cuantosPuedes++;             
                puedes[cuantosPuedes]=4;
                cuantosPuedes++;  
      }

      if (*yMalo%32==0) 
      {

        // va a izquierda pero ve a un compañero sufriendo
        if (dirs[traeCual][0]==3) {
          temp=hayCompanero(*yMalo+24,*xMalo-1, traeCual);
          if (temp>-1) {
            if (dirs[temp][0]==33) {// el cmpañero que ve a la izquierda sufriendo tiene direccion 33 (cayendo)
              //mensaje(1,"TE VEO COLGAO!!");
              //tecla();
              //mensaje(1,"               ");
              _8BP_setupsp_4(traeCual+5,5,0,0);
              dirs[traeCual][0]=0;
              cuantosPuedes=0;
              puedes[cuantosPuedes]=4;
              cuantosPuedes++;                  
            }
          }
        }
        
        // va a derecha pero ve a un compañero sufriendo
        if (dirs[traeCual][0]==4) {
            temp=hayCompanero(*yMalo+24,*xMalo+1, traeCual);
            if (temp>-1) { // va a izquierda pero ve a un compañero sufriendo
              if (dirs[temp][0]==33) {// el cmpañero que ve a la derecha sufriendo tiene direccion 33 (cayendo)
                //mensaje(1,"TE VEO COLGAO!!");
                //tecla();
                //mensaje(1,"               ");
                _8BP_setupsp_4(traeCual+5,5,0,0);
                dirs[traeCual][0]=0;
                cuantosPuedes=0;
                puedes[cuantosPuedes]=3;
                cuantosPuedes++;                  
              }
            }
        }        

      
        if (dirs[traeCual][0]==3 && hayCompanero(*yMalo,*xMalo-1, traeCual)>-1) { // va a izquierda pero ve a un compañero
           // mensaje(1,"TOCO YENDO A LEFT");
            //tecla();
            //mensaje(1,"                 ");
            _8BP_setupsp_4(traeCual+5,5,0,0);
            dirs[traeCual][0]=0;
            cuantosPuedes=0;
            puedes[cuantosPuedes]=3;
            cuantosPuedes++;             
            puedes[cuantosPuedes]=4;
            cuantosPuedes++;  
            goto seguimos;


        }      
        if (dirs[traeCual][0]==4 && hayCompanero(*yMalo,*xMalo+2, traeCual)>-1) { // va a right pero ve a un compañero
            //mensaje(1,"TOCO YENDO A RIGHT");
            //tecla();
            //mensaje(1,"                  ");
            _8BP_setupsp_4(traeCual+5,5,0,0);
            dirs[traeCual][0]=0;
            cuantosPuedes=0;
            puedes[cuantosPuedes]=4;
            cuantosPuedes++;      
            puedes[cuantosPuedes]=3;
            cuantosPuedes++;                  
            goto seguimos;


        }
      } // fin de si estas alineado con los pisos (%32)
      
      if (*yMalo%32==24 && *yMalo<32*5) {                                // cae al hoyo y se queda sufriendo... parte A1
        if (dirs[traeCual][0]==2)
          if (dirs[traeCual][1]>0) {
              //_8BP_printat_4(0,200-24,0,"colgado");
              //for (int pausa=0;pausa<1000;pausa++);
              //mensaje(1,"               ");
              //tecla();
              //_8BP_printat_4(0,200-24,0,"       ");
              _8BP_setupsp_3(traeCual+5,7,datosSprites[tipoBicho][4]);
              _8BP_anima_1(traeCual+5);
              _8BP_setupsp_4(traeCual+5,5,0,0);
              dirs[traeCual][0]=33;
              
              dirs[traeCual][2]=general;
              //tecla();
          }            
        // esta sufriendo pero ha pasado el tiempo.
        if (dirs[traeCual][2]>0 && dirs[traeCual][1]!=-1)
          if (dirs[traeCual][0]==33 && general-dirs[traeCual][2]>tiempoSufriendo) {      
            //_8BP_printat_4(1,*yMalo,*xMalo-8,"SUBO");                                    // parte A1, ver A2
            //tecla();
            _8BP_setupsp_3(traeCual+5,7, datosSprites[ tipoBicho  ][3]);
            _8BP_setupsp_4(traeCual+5,5,-1,0);
            dirs[traeCual][1]=-1;
            dirs[traeCual][2]=-1;

            //tecla();
          }        
      }
      
      if (*yMalo%32==0 && *xMalo%4==0) {            
      
      if (dirs[traeCual][1]==-1 && dirs[traeCual][2]==-1) // se ha elevado tras sufrir y llegó a planta // parte A2
        if (dirs[traeCual][0]==33) {     
                //_8BP_printat_4(1,*yMalo,*xMalo-8,"PLANTA");                                    
                //tecla();
                dirs[traeCual][0]=0;
                dirs[traeCual][1]=0;
                dirs[traeCual][2]=0;

                char pisoTemporal[21]="12345678901234567890";
                int yActual=traeYMalo(traeCual);
                int xActual=traeXMalo(traeCual);
                yActual=yActual/8; yActual+=3;
                xActual=xActual/4;
                getPiso(yActual,pisoTemporal);
                pisoTemporal[xActual]='<';
                _8BP_layout_3(yActual,0,pisoTemporal);   
                _8BP_locatesp_3(25,240,10); 
                _8BP_locatesp_3(26,240,10); 
                _8BP_locatesp_3(27,240,10); 

                cuantosPuedes=0;
                puedes[cuantosPuedes]=3;
                cuantosPuedes++;              
                puedes[cuantosPuedes]=4;
                cuantosPuedes++;                          
   
                goto seguimos;
        }
        if ((unsigned char)tocoEscalera(*yMalo+16, *xMalo)==59)
        {
          if (dirs[traeCual][0]==1) {
              //_8BP_printsp_3(28,*yMalo-8,*xMalo);
              if ((unsigned char)tocoEscalera(*yMalo-8, *xMalo)!=59) {   //estaba subiendo pero ya no puede subir mas          
                //mensaje(2,"PARA DE SUBR YAA");
                //tecla();
                //mensaje(2,"                ");              
                cuantosPuedes=0;
                puedes[cuantosPuedes]=3;
                cuantosPuedes++;              
                puedes[cuantosPuedes]=4;
                cuantosPuedes++;                          
                puedes[cuantosPuedes]=2;
                cuantosPuedes++;    
                goto seguimos;
              }
          }
         
          // puedes subir          
          if (tocoEscalera(*yMalo-8, *xMalo)==59 && *yMalo>0) {
              //_8BP_printsp_3(28,*yMalo-8,*xMalo);
              //mensaje(2,"PUEDEEEEEE SUBIR");
              //tecla();
              //mensaje(2,"                ");
              puedes[cuantosPuedes]=1;
              cuantosPuedes++;
              if (rand()%10>5 && *yMalo<buenoY) // 220226 - que suba si está mas bajo que el bueno (random)
              {
                puedes[cuantosPuedes]=3;
                cuantosPuedes++;              
                puedes[cuantosPuedes]=4;
                cuantosPuedes++;              
              }
          }          
          // puedes bajar
          if (tocoEscalera(*yMalo+24, *xMalo)==59) {
              //_8BP_printsp_3(28,*yMalo+24,*xMalo);
              //mensaje(2,"PUEDEEEEEE BAJAR");
              //mensaje(2,"                ");
              puedes[cuantosPuedes]=2;
              cuantosPuedes++;                
              puedes[cuantosPuedes]=3;
              cuantosPuedes++;              
              puedes[cuantosPuedes]=4;
              cuantosPuedes++;                 
          }                    
  
        } // multiplo x de 4 y multiplo y de 32
        
        // puede bajar por hoyo
        if (tocoEscalera(*yMalo+24, *xMalo)==32) {
             if (dirs[traeCual][0] != 33  && dirs[traeCual][1] == 0) { // METO CAMBIO EN 20220215_2327 (dirs 1 igual a0)
              //_8BP_printsp_3(28,*yMalo+24,*xMalo);
              //mensaje(2,"SE CAE EL MALETE");
              //tecla();
              //mensaje(2,"                ");
              cuantosPuedes=0;
              puedes[cuantosPuedes]=2;
              dirs[traeCual][1]++; // USO el nivel 1 de la mtriz para indicar que baja más rapido por caida desde hoyo
              cuantosPuedes++;       
              goto seguimos;
            }
            else
                dirs[traeCual][1]++; // uso para indicar que baje mas rapido por caida y para acumular pisos bajados
        }         

          if ((dirs[traeCual][0]==2 || dirs[traeCual][0]==33) && dirs[traeCual][1]!=-1) {
              //_8BP_printsp_3(28,*yMalo+24,*xMalo);
              if (tocoEscalera(*yMalo+24, *xMalo)!=32) {   //estaba bajando pero toca suelo
                //mensaje(2,"PARA DE CAER yAA");
                //tecla();               
                for (int pausa=0;pausa<3000;pausa++);
                //mensaje(2,"                ");      
                  if (dirs[traeCual][1]>0) {
                      sonidoLaser();
                      //mensaje(1,"HA CAIDO ALTURAS     ");
                      //mensaje(2,_basic_str(dirs[traeCual][1])); // estaba bajando porque caia al vacio y toca suelo
                      _8BP_printsp_1(traeCual+5);
                      char cadena[6]="     ";
                      //_basic_locate(0,10); _basic_print(_basic_str(datosSprites[ datosNivel[nivel][traeCual]  ][5]));
                      if ( dirs[traeCual][1]>=datosSprites[ datosNivel[nivel][traeCual]  ][5]) {
                            
                        //strcpy(cadena,_basic_str(datosSprites[ datosNivel[nivel][traeCual]  ][6]));
                        puntos+=datosSprites[ datosNivel[nivel][traeCual]  ][6]*dirs[traeCual][1];
                        strcpy(cadena,_basic_str(datosSprites[datosNivel[nivel][traeCual]  ][6]*dirs[traeCual][1]));
                        //dirs[traeCual][1]=0;                                              
                        pintaDatos();                        
                        _8BP_printat_4(1,*yMalo,*xMalo,cadena); // pinta puntos
                        for (unsigned int pausa=0;pausa<60000;pausa++);
                        _8BP_printat_4(1,*yMalo,*xMalo,"    ");
                        _8BP_setupsp_3(5+traeCual,9,19); // lo mato
                        _8BP_printsp_1(5+traeCual);
                        _8BP_locatesp_3(5+traeCual,240,0);
                        if (quedanMalos()==0) {
                            finNivel();
                          //_basic_locate(7,10); _basic_print("GOOD!!!");
                          //nivel++; if (nivel+1>nNiveles) nivel=0;
                          //tecla();
                          //juego=0; menu=0;//aqui
                        }
                      }
                      else {
                        dirs[traeCual][1]=0;
                        dirs[traeCual][1]=0;                   
                        dirs[traeCual][2]=0;
                        _8BP_printat_4(1,*yMalo,*xMalo-8,"JAJA");
                        for (unsigned int pausa=0;pausa<60000;pausa++);
                        _8BP_printat_4(1,*yMalo,*xMalo-8,"    ");
                      }
                          
                      //tecla();                     
                  }                          
                cuantosPuedes=0;
                puedes[cuantosPuedes]=3;
                cuantosPuedes++;              
                puedes[cuantosPuedes]=4;
                cuantosPuedes++;
                goto seguimos;
              }
          }        
          
        if (tocoEscalera(*yMalo+24, *xMalo)=='T' || tocoEscalera(*yMalo+24, *xMalo)=='U' ) {   // malo cae en medio cavado ENGANCHADO
            //_8BP_printsp_3(28,*yMalo+24,*xMalo);
            //mensaje(2,"SE CAE EL MALETE");
            //mensaje(2,"                ");
            sonidoError();
            _8BP_setupsp_4(traeCual+5,5,0,0);
            dirs[traeCual][0]=55;
            goto seguimos;
        }                   
        
       
          
        seguimos:
        if (*xMalo==80) {   // ojo que tiene que ser multiplo de 4 la x , y multiplo de 32 la y
            cuantosPuedes=0;
            puedes[cuantosPuedes]=3;
            cuantosPuedes++;   
            //mensaje(1,_basic_str(traeCual));
        }          
        else
        if (*xMalo==-4) {    // ojo que tiene que ser multiplo de 4 la x , y multiplo de 32 la y
            cuantosPuedes=0;
            puedes[cuantosPuedes]=4;
            cuantosPuedes++;              
            //mensaje(2,_basic_str(traeCual));
        }          
        

        
      }    
      if (cuantosPuedes>0)                          // direcciones a las que puede dirigirse el malo
      {
        int inventa=_basic_rnd(cuantosPuedes);
        //mensaje(1,cuantosPuedes);
        //mensaje(2,_basic_str(inventa));

        dirs[traeCual][0]=puedes[inventa];
        if (puedes[inventa]==1) {
            _8BP_printsp_1(traeCual+5);
            _8BP_setupsp_4((traeCual+5),5,-2,0);     
            
            _8BP_setupsp_3((traeCual+5),7,datosSprites[tipoBicho][3]);
            goto final;
        }
        if (puedes[inventa]==2) {
            if (dirs[traeCual][1]==0) 
            {
              _8BP_printsp_1(traeCual+5);
              _8BP_setupsp_4(traeCual+5,5,2,0);     
            }
            else 
            {
              _8BP_printsp_1(traeCual+5);
              _8BP_setupsp_4(traeCual+5,5,4,0);
              //dirs[traeCual][1]=0;
            }
            _8BP_setupsp_3((traeCual+5),7,datosSprites[tipoBicho][3]); 
            goto final;
        }
        if (puedes[inventa]==3) {
          if (hayCompanero(*yMalo,*xMalo-1, traeCual)==-1)  { // si cambias haycopanero aqui cambilo tambien en muevemalos
              _8BP_printsp_1(traeCual+5);            
              _8BP_setupsp_4((traeCual+5),5,0,-1);     
              _8BP_setupsp_3((traeCual+5),7,datosSprites[tipoBicho][2]); 
              goto final;
            }
            else { dirs[traeCual][0]=0;     }
        }
        if (puedes[inventa]==4) {
          if (hayCompanero(*yMalo,*xMalo+2, traeCual)==-1 )  {    // si cambias haycopanero aqui cambilo tambien en muevemalos         
            _8BP_printsp_1(traeCual+5);
            _8BP_setupsp_4((traeCual+5),5,0,1);     
            _8BP_setupsp_3((traeCual+5),7,datosSprites[tipoBicho][1]); 
          }
          else { dirs[traeCual][0]=0;    }
        }        
      }
      
      final:
      if (dirs[traeCual][0]==0)
          _8BP_setupsp_4((traeCual+5),5,0,0);  
}

void borde(int traeBorde)
{
    _basic_border(traeBorde);
    for (int paus=0;paus<1000;paus++);
    //tecla();
    _basic_border(0);
    
}
//tocoEScalera devuelve que letra está en el layout en y,x
int *tocoEscalera(int traeY, int traeX) // envia la y y x del malo. ya se convierte aqui dentro
{
    int xLayout, yLayout;
    unsigned int letra=0;
    
    yLayout=traeY/8;
    xLayout=(traeX/4);
    
    if (yLayout>24 || yLayout<0 || xLayout>19 || xLayout<0)
        return 0;
    
  
  letra =(int)_basic_peek(42040+(20*yLayout)+xLayout);
  return letra;
}
int hayCompanero(int yMalo, int xMalo, int traeYoMismo)
{
    int *xFor, *yFor;
    
    for (int ab=0;ab<cuantos;ab++) {
      yFor=(unsigned int *)(27001+(5+ab)*16);
      xFor=yFor+1;              
      if (abs(xMalo-*xFor)<4 && ab!=traeYoMismo)
          if (abs(yMalo-*yFor)<2) {
              return ab;
           }
    }
    return -1;        
}
void getPiso(char traeAltura, char *pisoActual) // a altura tiene que venir en rango 0-19 del layout
{  
  int yActual=traeAltura;
  int xActual;
  unsigned char *puntero=(unsigned int)42040+(20*yActual);
  unsigned char *punteroPiso=pisoActual;
  for (int teX=0;teX<20;teX++) {
    *(punteroPiso)=*puntero;
    puntero++; punteroPiso++;
  }    
}
unsigned int traeYMalo(int traeCual)
{
      int *xMalo, *yMalo;
      yMalo=(unsigned int *)(27001+(5+traeCual)*16);
      xMalo=yMalo+1;  
      return *yMalo;
}
unsigned int traeXMalo(int traeCual)
{
      int *xMalo, *yMalo;
      yMalo=(unsigned int *)(27001+(5+traeCual)*16);
      xMalo=yMalo+1;      

  return *xMalo;
}
unsigned int traeSecuenciaBueno()
{
      unsigned char *xMalo, *yMalo;
      yMalo=(unsigned int *)(27000+31*16);
      xMalo=yMalo+7;
      //mensaje(1,"secuencia es    ");
      //mensaje(2,_basic_str(*xMalo));
 
  return *xMalo;
}

int quedanMalos()
{
    for (int temp=0;temp<cuantos;temp++)
        if (traeYMalo(temp)!=240)
            return 1;
    return 0;
        
}
void sonidoError()
{
  _basic_sound(1,2000,2,7,0,0,15);
  //_basic_sound(1,10,10,7,0,1,0);
}
void sonidoLaser()
{
    //(nChannelStatus, int nTonePeriod, int nDuration, unsigned char nVolume, char nVolumeEnvelope, char nToneEnvelope, unsigned char nNoisePeriod);
    _basic_sound(2,478,50,6,0,1,0);   
}
void pintaDatos()
{
    _basic_locate(1,1); _basic_print("lv"); _basic_locate(3,1); _basic_print(_basic_str(nivel));
    if (puntos==0) {
      _basic_locate(5,1); _basic_print("pts"); _basic_locate(9,1); _basic_print("0     ");
    }
    else {
      _basic_locate(5,1); _basic_print("pts"); _basic_locate(9,1); _basic_print(_basic_str(puntos));
    }
    _basic_locate(17,1); _basic_print("liv"); _basic_locate(20,1); _basic_print(_basic_str(Vidas));    
}
void pintaEnergia(int traeEnergia)
{
  if (traeEnergia==-1) {
    _basic_pen_graph(6);
    _basic_plot(0,0); _basic_draw(0,4); _basic_draw(639,4); _basic_draw(639,0);  _basic_draw(0,0);
    _basic_pen_graph(4);
    _basic_plot(480,0); _basic_draw(480,4); _basic_draw(639,4); _basic_draw(639,0);  _basic_draw(480,0);
    return;
  }
  _basic_pen_graph(0);
  _basic_plot(traeEnergia,0); _basic_draw(traeEnergia,4);   
  _basic_draw(traeEnergia+energiaCacho,4); 
  _basic_pen_graph(26);
  _basic_draw(traeEnergia+energiaCacho,0);
  _basic_pen_graph(0);
  _basic_draw(0,0);
}
void finNivel()
{
  _basic_locate(8,10); _basic_print("GOOD!!!");
  _basic_locate(5,12); _basic_print("Press Enter!");
  nivel++; if (nivel+1>nNiveles) nivel=0;
  tecla();
  juego=0; menu=0;
  
    for (int n=0;n<20;n++) {
        dirs[n][0]=0;
        dirs[n][1]=0;
        dirs[n][2]=0;
    }  
}
void follao()
{
  _basic_locate(8,10); _basic_print("DEAD!!");
  _basic_locate(4,12); _basic_print("Press Enter!");            
    for (int co=0;co<cuantos;co++)
      _8BP_printsp_1(co+5);         
  _8BP_printsp_1(31);
  
  borde(3);
  Vidas--;
  if (Vidas==0) {    
    menu=1;
    juego=0;
    Energia=0;
    tecla();    
  }
  else {
    //menu=1;
    juego=0;
    Energia=0;
    tecla();          
  }
  borde(0);
  
  for (int n=0;n<20;n++) {
      dirs[n][0]=0;
      dirs[n][1]=0;
      dirs[n][2]=0;
  }  
}
char traeTecla(char *traeCadena, char *traeCadenaBorrado)
{
  unsigned char cualTecla, sal=0, x=22, y=72;
 
  _8BP_printat_4(0,y,x,traeCadena);
  
  
  cualTecla=0;
  while (_basic_inkey(cualTecla++)!=0)
      if (cualTecla>77) cualTecla=0;
      
  _8BP_printat_4(0,y,x+(strlen(traeCadena)*2)+2,_basic_str(cualTecla-1));  
      
  
  for (int pausa=0;pausa<15000;pausa++);
  _8BP_printat_4(0,y,x,traeCadenaBorrado);
  return cualTecla-1;
}