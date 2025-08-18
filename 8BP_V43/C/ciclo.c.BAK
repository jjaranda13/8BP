#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "8BP.h"
#include "minibasic.h"

//declaramos las variables todas globales para poder
//acceder a ellas desde cualquier funcion, como en BASIC
// aunque aqui no se inicializan
//----------------------------------------------
int c;
char dir;
int x;
int y;
int cod;
int cor;
int i;
int puntos;
int t1;
int t2;
int fps;
/*******************************************
    MAIN
*******************************************/
int  main()
{
  //inicializamos las variables
  c=0;
  dir=0;
  x=40;
  y=100;
  cod=32;
  cor=32;
  i=0;
  puntos=0;
  fps=0;
  t1=_basic_time();
 
  //configuramos comandos
  _8BP_printspall_4(0,0,0,0);
  _8BP_colspall_2(&cor,&cod);

  //ciclo de juego
  //---------------
  label_CICLO:
  
  c=c+1;
   
   
  if (_basic_inkey(27)==0) {
     if (dir !=0) {
     	_8BP_setupsp_3(31,7,1);
     	dir=0;
     }
     else {
       _8BP_anima_1(31);
       x=x+1;
       goto label_195;
     }
  }   
  if (_basic_inkey(34)==0) {
     if (dir !=1) {
     	_8BP_setupsp_3(31,7,2);
     	dir=1;
     }
     else {
       _8BP_anima_1(31);
       x=x-1;
     }
  }
  label_195:
  //--------
  _8BP_locatesp_3(31,y,x);
  _8BP_autoall();
  _8BP_printspall();
  _8BP_colspall();


  if (cod<32) {
    _basic_border(7);
    _basic_sound(1,100,14,0,0,1,0);
    puntos=puntos-1;
    _8BP_setupsp_3(cod,0,9);
    _basic_locate(7,1);
    _basic_print(_basic_str(puntos));
    goto _label_250;
  	
  }
  else _basic_border(0);
  if (c %20 ==0) {
    puntos=puntos+10;
    _basic_locate(7,1);
    _basic_print(_basic_str(puntos));
    t2=t1;t1=_basic_time();
    fps=6000/(t1-t2);
    _basic_locate(17,1);_basic_print(_basic_str(fps));
  }
  
  if (c %5 ==0){
    _8BP_setupsp_3(i,9,19);_8BP_setupsp_4(i,5,4,_basic_rnd(3)-1);
    _8BP_setupsp_3(i,0,11);_8BP_locatesp_3(i,10,_basic_rnd(80));
    i=i+1;if (i==30) i=0;
  }

  _label_250:
  if (c<500) goto label_CICLO;
  
  _8BP_poke_2(42038,puntos);
  return 0;	
}
