#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "8BP.h"
#include "minibasic.h"

//prototipos de funciones
int  rutina_colision();

//variables globales
 unsigned int c=0;
 unsigned int last=0;
 unsigned int sp=0;
 int x=40;
 int y=100;	
 unsigned int e=16;
 unsigned int ex=0;
 int cor=32;
 int cod=32;
 int rescol=0;
 unsigned int puntos=0;
 char* puntos_str="   ";
 const char CHAR_CR[]={13,0};
unsigned int ruta=0;

/*******************************************
    MAIN
*******************************************/
int  main()
{
char cosa=0;
unsigned int tiempo=0;	
unsigned int last_tiempo=0;	
int fps=0;
 //const char CHAR_CR[]={13,0};
//const 
char *cad="AAA";
 c=0;
 last=0;
 sp=0;
 x=40;
 y=100;	
 e=11;
 ex=0;
 cor=32;
 cod=32;
 rescol=0;
 puntos=0;
 
 
 int tintas[5]={1,2,2,3,3};
 
 // configuramos colspall
 // ----------------------
 _8BP_colspall_2(&cor,&cod);
 

 _8BP_map2sp_1(1);
 
 _8BP_umap_6(41600,41660,0,1000,0,1000);
 CICLO:
 
   //ciclo de juego
   //---------------     
   
   c=c+1;
      
   if (_basic_inkey(27)>0) goto label_140;
   x=x+1; goto label_160;
 
   label_140:
   //--------
   if (_basic_inkey(34)>0) goto label_160;
   x=x-1;
   
   label_160:
   //--------
   if (_basic_inkey(67)>0) goto label_180;
   y=y-2;goto label_200;
   
   label_180:
   //--------
   if (_basic_inkey(69)>0) goto label_200;
   y=y+2;
 
   label_200:
   //--------
   if (c-last<8) goto label_270;
   if (_basic_inkey(47)>0) goto label_270;
   
   sp=23+ sp % 8; last=c;
   _8BP_setupsp_3(sp,9,48);//disparo
   _8BP_setupsp_3(sp,0,1+8+32);
   _8BP_locatesp_3(sp,y-4,x);
   _8BP_setupsp_4(sp,5,-5,0);
   _basic_sound(1,10,10,7,0,1,0);
   
   label_270:
   //--------
   _8BP_locatesp_3(31,y,x);
   _8BP_autoall_1(1);
   _8BP_map2sp_2((c <<1)%300,0);
   _8BP_printspall();
   _8BP_colspall();
      
   
   // creacion de enemigos y fps
   //----------------------
   if ((c & 63)>0) goto label_450;
   
   //fps compute
   tiempo=_basic_time();// & 32767;
   fps=64*300/(tiempo-last_tiempo);
   _basic_locate(10,25);//_basic_print(_basic_str(fps));
   _8BP_printat_4(0,0,60,_basic_str(fps) );
   last_tiempo=tiempo;
      
   ruta=9+_basic_rnd(2) ; 
   ex=10+_basic_rnd(50) ;
  
   for (int i=1;i<5;i++)
     {
     e=e+1;if (e==22) e=10;
     _8BP_setupsp_3(e,9,49);//ovni
     _8BP_setupsp_3(e,0,128+8+3);
     _8BP_setupsp_3(e,15,ruta);
     _8BP_locatesp_3(e,-80,ex);
     _8BP_routesp_2(e,i*6);
     }

   
   label_450:
   //--------
   _8BP_stars_5(0,10,4,2,0);
   if (cor <32) rescol=rutina_colision();
   if (rescol==1) goto END;
   
   
   if (c==3000) return 0;
   goto CICLO;
 
  END:	
  //--------
  return 0;	
}


/***************************************
RUTINA DE COLISION
*****************************************/
int  rutina_colision()
{
if (cor==31) return 1;

_8BP_setupsp_3(cor,7,15);


_8BP_setupsp_3(cor,0,5);

if (cod<22){
  _basic_border(7);	
  _basic_sound(1,2000,10,7,0,0,15);
  _8BP_setupsp_3(cod,7,15);//animacion 
  _8BP_setupsp_3(cod,0,5);
  _basic_call(0xbd19);
  _basic_border(0);	
  puntos+=10;
  puntos_str= _basic_str(puntos);
  _8BP_printat_4(0,0,40, puntos_str);
  }

return 0;

}

