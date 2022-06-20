#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "8BP.h"
#include "minibasic.h"

//void resetTimer();
void logica_fantasma(int id);
int logica_fantasma_precomputed(int id);
//declaramos las variables todas globales para poder
//acceder a ellas desde cualquier funcion, como en BASIC
// aunque aqui no se inicializan
//----------------------------------------------
int c; // ciclo de juego
int n; // 4 tiempos
int x;
int y;
int y2;//auxiliar
int dir; //direccion de paco 0,1,2,3,4
int cod; //colisionado
int cor; //colisionador
int col; //colision layout
int* scr; //score
int scr_dir;
int* target;//score a alcanzar para superar el nivel
int target_dir;//
int* hi;// hiscore
int hi_dir;
int* flaghi;//
int flaghi_dir;
int* music;//activacion musica
int music_dir;
int t1;//siempre es cero
int t2;
int d; //direccion pantalla

int fps;//frames per second
char* cfps;//char string frames per second
char dato;//para el peek a la pantalla
char* cad;//puntos

char rf[4];// rutas fantasma

int dfx[4];//direccion de x de cada fantasma
int dfy[4];//direccion de y de cada fantasma
int id; //id sprite de fantasma
char xf, yf; //coord fant
char newr;

char op;//operacion logica precopmputada fantasmas
int precomp;//flag precomputed
int co;//posicion lectura datos precomputed
int res;

/*******************************************
    MAIN
*******************************************/
int  main()
{
  //inicializamos las variables
  c=0;
  n=0;
  fps=0;
  t1=0;//_basic_time();
  dir=5; //quieto
  newr=0; //nueva ruta fant
  op=0; // inicializacion operacion logica precomputada
  precomp=0;
  co=0;
  // rutas iniciales de fantasmas
  rf[0]=5;//derecha
  rf[1]=6;//izq
  rf[2]=6;//izq
  rf[3]=5;//derecha
  for (n=0;n<4;n++){
    dfx[n]=27003+(27+n)*16;
    dfy[n]=27001+(27+n)*16;
  }
  int x2=0;//para comer cocos

  //configuramos comandos
  _8BP_printspall_4(0,0,0,0);
  //_8BP_colspall_2(&cor,&cod);
  _8BP_colsp_2(33,&cod);
  _8BP_colay_3(62, &col,31); 
  _8BP_colay_1(31);
  

  //recogida de variables
  //----------------------
  _8BP_peek_2(17900,&scr_dir); scr=(int*)scr_dir;
  _8BP_peek_2(17902,&target_dir);target=(int*)target_dir;
  _8BP_peek_2(17904,&music_dir);music=(int*)music_dir;
  _8BP_peek_2(17906,&hi_dir); hi=(int*)hi_dir;
  _8BP_peek_2(17908,&flaghi_dir);flaghi=(int*)flaghi_dir;
  _8BP_peek_2(17914,&precomp);// precomputed logic
  
  //preparamos x,y
  _8BP_peek_2(27499,&x);
  _8BP_peek_2(27497,&y);

  t1=_basic_time();
  
/*
  _basic_print("target:");
  _basic_print(_basic_str(*target));
  _basic_print("scr:");
  _basic_print(_basic_str(*scr));
  _basic_print("hi:");
  _basic_print(_basic_str(*hi));
*/

  //ciclo de juego
  //====================
  label_CICLO:
  
  c=c+1;//if (c==2000) {_8BP_poke_2(17910,0);_8BP_poke_2(17912,c);return 0;}
  n=c & 3;
  
  _8BP_autoall();
  if ((n & 1) >0 ) goto label_1340;//colision fantasmas(=1) y puntos (n=3)
  if (n>0) goto label_1190; //colay (n=2)
  else goto label_1260;//teclado (n=0)

  // rutina recolocacion (n=2)
  //---------------------------
  label_1190:
  
  _8BP_colay_1(31);
  if (col==0) goto label_1490;
  _8BP_setupsp_3(31,15,4); //ruta 4 es parado 
  if (dir==1) _8BP_mover_3(31,0,1);
  else if (dir==2) _8BP_mover_3(31,4,0);
  else if (dir==3) _8BP_mover_3(31,-4,0);
  else _8BP_mover_3(31,0,-1); //dir=0

  goto label_1490;
  
  //rutina teclado (n=0)
  //---------------------------
  label_1260:
  if (c & 63) goto label_1270;
  t2=_basic_time();
  fps=64*300/(t2-t1);
  cfps=_basic_str(fps);
  _8BP_printat_4(0,190,74,cfps);
  t1=t2;
  //resetTimer();
  

  label_1270:
  if (dir>0) {
    if (_basic_inkey(27)==0){ 
      _8BP_mover_3(31,0,1);_8BP_colay_1(31);_8BP_mover_3(31,0,-1);
      if (col==0){
        _8BP_setupsp_3(31,15,0); dir=0;
        goto label_1490;
      }
      else goto label_1490;// hay colision layout
    }
  }
  if (dir!=1){
    if (_basic_inkey(34)==0) {
      _8BP_mover_3(31,0,-1);_8BP_colay_1(31);_8BP_mover_3(31,0,1);
      if (col==0){
        _8BP_setupsp_3(31,15,1); dir=1;
        goto label_1490;
      }
      else goto label_1490;// hay colision layout
    }
  } 
  if (dir!=2){
    if (_basic_inkey(67)==0) {
      _8BP_mover_3(31,-1,0);_8BP_colay_1(31);_8BP_mover_3(31,1,0);
      if (col==0){
        _8BP_setupsp_3(31,15,2); dir=2;
        goto label_1490;
      }
      else goto label_1490;// hay colision layout
    }
  } 
  if (dir<3){
    if (_basic_inkey(69)==0) {
      _8BP_mover_3(31,1,0);_8BP_colay_1(31);_8BP_mover_3(31,-1,0);
      if (col==0){
        _8BP_setupsp_3(31,15,3); dir=3;
        goto label_1490;
      }
      else goto label_1490;// hay colision layout
    }
  }
  goto label_1490;
  
  label_1340: 
  //detecta puntos (n=3) y colision fant (n=1)
  //---------------------------
  //deteccion colisiones (n=1)
  if (n==1) {
    _8BP_colsp_1(31);
    if (cod<32) goto label_1810;
    else goto label_1490;  
  }
  //detecta puntos (n=3)
  //----------------------
 
  _8BP_peek_2(27499,&x);
  y=(int)_basic_peek(27497);
  if (dir==0) {y2=y+8;x2=x+2;}
  else if (dir==1) {y2=y+8;x2=x;}
  else if (dir==2)  {y2=y;;x2=x;}
  else if (dir==3)  {y2=y+12;x2=x;}
  else {y2=y+8;x2=x;}//dir 4?
  label_1400:
  //d= 0xA438 + ((y2+3)/8)*20 + (x2+1)/4;//los ajustes son para simular division / basic que es float con CINT 
  //d= 0xA438 + ((y2+3)/8)*20 + (x2+1)/4;//los ajustes son para simular division / basic que es float con CINT 
  d= 0xA438 + ((y2+3)/8)*20 + (x2+1)/4;//los ajustes son para simular division / basic que es float con CINT 
  dato=_basic_peek(d);
  /*
   if ((d-0xA438) != dant || x==39){
    dant =d-0xA438;
    _basic_print(_basic_str(dant));
    _basic_print("->");
    _basic_print(_basic_str(y2));
    _basic_print(",");
    _basic_print(_basic_str(x));
    _basic_print(",");
    _basic_print(_basic_str(dir));
    _basic_print(",");
    _basic_print(_basic_str(dato));
    _basic_print("\r\n");
  }
*/
  //deteccion tecla "M"  
  if (_basic_inkey(38)==0){
    if (*music==1) {*music=0;_8BP_music();}
    else {*music=1;_8BP_music_4(0,0,0,6);}
  }
  if (dato<60) {if (dato>32) goto label_1440; else goto label_1490;}

  //rutina incremento puntos
  label_1440:
  _basic_poke(d,32); 

  *scr=(*scr)+1;
  cad=_basic_str(*scr);
  _8BP_printat_4(0,0,62,cad);
  if (*music==0) _basic_sound(4,400,10,15,0,1,0);

  if ((*scr)==(*target)) {goto label_2060;}
  if ((*hi)>(*scr)) goto label_1490;
  _basic_pen_txt(2);
  _basic_locate(18,14);_basic_print("NEW");
  _basic_locate(16,15);_basic_print("HI-SCORE");
  *hi=30000;
  *flaghi=1;
  
  //rutina fantasmas (cada frame)
  //-----------------------------------
  label_1490:
  id=27+n;
  if (precomp==0) logica_fantasma(id);
  else {
    res =logica_fantasma_precomputed(id);
    if (res==-1) {
      _8BP_poke_2(17910,0);//muerte como si fantasma
      _8BP_poke_2(17912,c);
      return 0;
    } 
  }


  _8BP_printspall();
  goto label_CICLO;


  //rutina colision y muerte
  //-------------------------
  label_1810:
  //chequeo tuneles
  if (cod<27){
    if (cod==26) {_8BP_mover_3(31,0,-80);goto label_1490;}
    else {_8BP_mover_3(31,0,80);goto label_1490;}
  }
  //la colision es con un fantasma
   _8BP_poke_2(17910,0);//muerte
   _8BP_poke_2(17912,c);
   return 0;

  //fin de nivel
  label_2060:
  _8BP_poke_2(17910,1);//next level
  _8BP_poke_2(17912,c);
  return 0;	
}

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void logica_fantasma(int id){
 
  if (rf[n]<7){
    xf =_basic_peek(dfx[n]);
    if ((xf & 3)!=0) return;  
  }
  else goto label_1650;//ruta vertical
  if (rf[n]>5) goto label_1590; //izq

  //ruta derecha
  newr=(1+newr) & 3;
  if (newr==1) goto label_1550;
  if (newr==2) goto label_1560;

  label_1540:
  _8BP_mover_3(id,0,1);_8BP_colay_1(id);_8BP_mover_3(id,0,-1); if (col==0) return;//sigue
  label_1550:
  _8BP_mover_3(id,-1,0);_8BP_colay_1(id);_8BP_mover_3(id,1,0); if (col==0) {rf[n]=7;_8BP_setupsp_3(id,15,7);return;}
  label_1560:
  _8BP_mover_3(id,1,0);_8BP_colay_1(id);_8BP_mover_3(id,-1,0); if (col==0) {rf[n]=8;_8BP_setupsp_3(id,15,8);return;}
  if (xf>75) {_8BP_mover_3(id,0,-80); return;}
  goto label_1540;

  //ruta izquierda
  label_1590: 
  if (xf<200) newr=(1+newr) & 3; else {_8BP_mover_3(id,0,80);return;} 
  if (newr==1) goto label_1620;
  if (newr==2) goto label_1630;
  
  label_1610:
  _8BP_mover_3(id,0,-1);_8BP_colay_1(id);_8BP_mover_3(id,0,1); if (col==0) return;//sigue
  label_1620:
  _8BP_mover_3(id,-1,0);_8BP_colay_1(id);_8BP_mover_3(id,1,0); if (col==0) {rf[n]=7;_8BP_setupsp_3(id,15,7);return;}
   label_1630:
  _8BP_mover_3(id,1,0);_8BP_colay_1(id);_8BP_mover_3(id,-1,0); if (col==0) {rf[n]=8;_8BP_setupsp_3(id,15,8);return;}
  goto label_1610;

  //ruta arriba
  label_1650: 
  yf=_basic_peek(dfy[n]);
  if (yf & 7) return; 
  if (rf[n]==8) goto label_1720;
  newr=(1+newr) & 3;
  if (newr==1) goto label_1690;
  if (newr==2) goto label_1700;

  label_1680:
  _8BP_mover_3(id,-1,0);_8BP_colay_1(id);_8BP_mover_3(id,1,0); if (col==0) return;//sigue
  label_1690:
  _8BP_mover_3(id,0,1);_8BP_colay_1(id);_8BP_mover_3(id,0,-1); if (col==0) {rf[n]=5;_8BP_setupsp_3(id,15,5);return;}
   label_1700:
  _8BP_mover_3(id,0,-1);_8BP_colay_1(id);_8BP_mover_3(id,0,1); if (col==0) {rf[n]=6;_8BP_setupsp_3(id,15,6);return;}
  goto label_1680;

  //ruta abajo
  label_1720:
  newr=(1+newr) & 3;
  if (newr==1) goto label_1750;
  if (newr==2) goto label_1760;  

  label_1740:
  _8BP_mover_3(id,1,0);_8BP_colay_1(id);_8BP_mover_3(id,-1,0); if (col==0) return;//sigue
  label_1750:
  _8BP_mover_3(id,0,1);_8BP_colay_1(id);_8BP_mover_3(id,0,-1); if (col==0) {rf[n]=5;_8BP_setupsp_3(id,15,5);return;}
   label_1760:
  _8BP_mover_3(id,0,-1);_8BP_colay_1(id);_8BP_mover_3(id,0,1); if (col==0) {rf[n]=6;_8BP_setupsp_3(id,15,6);return;}
  goto label_1740;

  

}
int logica_fantasma_precomputed(int id){

  if (op<8) {op=_basic_peek(40000+co);}
  else {op=op-1; return 0;}
  co=co+1;if (co==2000) return -1;
  if (op>=7) return 0;
  if (op>3)  {
    if (op==4) {_8BP_mover_3(id,0,80);return 0;}
    if (op==5) {_8BP_setupsp_3(id,15,5);return 0;}
    if (op==6) {_8BP_setupsp_3(id,15,6);return 0;}
  }
  if (op==1) {_8BP_setupsp_3(id,15,7);return 0;}
  if (op==2) {_8BP_setupsp_3(id,15,8);return 0;}
  if (op==3) {_8BP_mover_3(id,0,-80);return 0;}
  return 0; //nunca llega aqui
}