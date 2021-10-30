#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "8BP.h"
#include "minibasic.h"

void creaDispEne_1990();
void procesaEvento_1500();
void procesaEventoBanda_1880();
//declaramos las variables todas globales para poder
//acceder a ellas desde cualquier funcion, como en BASIC
// aunque aqui no se inicializan
//----------------------------------------------
int model;
int c;
int x;
int y;
int col;
int cor;
int puntos;

//arrays
int po[9];
int seq[16];
int dirsp[32];
int enecount[8];

//variables eventos
int m;
int nextm;

int enesp;
int k;

//variables fps
int ta;
int tb;
int fps;
int f1,f2;

int t;
int i,j;
int muertos;
int banda;

char scroll;
char up,dw,iz,der,fr;

char modo;
char pres, bomb;

int dir;
int dif;
int pini,pfin1,pfin2,p1,p2;
int pot, tabu;
int Nbanda;

char level;
char vidas;

int inmune;
int enek;
int direk;
int yene,xene;
int offr,rk;
int evdir,evtipo;
int rb;
int tinta;

char keyb;//teclas o joy
int eneim,enex,eney;
int enesq, ener,tr;

/*******************************************
    MAIN
*******************************************/

int  main()
{
  //inicializamos las variables
  c=3;
  k=0;
  enesp=15;
  
  muertos=0;
  banda=0;
  scroll=0;
  modo=0;
  evtipo=0;

  x=40;// joe x
  y=16*8;//joe y
  col=32;
  cor=32;
  
  
  fps=0;
  t=0;
  

 

  

  bomb=0;
  pres=0;
  dir=0;
  dif=0;

  //inicializacion de arrays
  po[1]=0;po[4]=2;po[3]=4;po[5]=6;po[2]=8;po[8]=10;po[6]=12;po[7]=14;
  seq[0]=1;seq[1]=2;seq[2]=2;seq[3]=2;seq[4]=3;seq[5]=4;seq[6]=4;seq[7]=4;seq[8]=5;
  seq[9]=6;seq[10]=6;seq[11]=6;seq[12]=7;seq[13]=8;seq[14]=8;seq[15]=8;
  for (i=0;i<32;i++){
    dirsp[i]=27000+i*16;
  }
  pot=10;//potencia de 10 para medir score
  tabu=0;//tabulador score
  level=0;


  

  

  inmune=_basic_peek(42547);
  

  pfin1=0;
  p1=0;p2=0;
  tinta=0;
  
  

  _8BP_peek_2(42540,&puntos);
  while (pot<puntos){
    tabu=tabu+2;pot=pot*10;
  }
  for (i=0;i<8;i++) enecount[i]=0;

  _8BP_printat_4(0,8,6-tabu,_basic_str(puntos));

  level=_basic_peek(42544);
  vidas=_basic_peek(42545);
  keyb=_basic_peek(42546);

  Nbanda= level*8+16;//numero de nazis en final fase


  if (keyb==0) {up=67;dw=69;fr=47;iz=34;der=27;}
  else {up=72;dw=73;fr=76;iz=74;der=75;}

  _8BP_peek_2(42550+level*6,&evdir);

 
  if (_basic_peek(42548)==1){
    _8BP_peek_2(42574+level*4+2,&m);//cambia el m inicial
    _8BP_peek_2(42574+level*4,&evdir);//cambia la direccion inicial de eventos
    //nextm=m;
    //_8BP_printat_4(0,120,0,"HEY");
  }
  else{
    m=0; 
    //nextm=m;
    }
  //_8BP_printat_4(0,100,0,_basic_str(evdir));
  _8BP_peek_2(evdir,&nextm); //obtiene el siguiente m 
  //_8BP_printat_4(0,110,0,_basic_str(nextm));
  //nextm=m;
  evtipo=0;

  yene=0;xene=0;
  rk=0;

  i=28;//disparo
  j=29;//bomba
  
  ta=_basic_time();
 
  //configuramos comandos
  _8BP_printspall_4(0,0,1,0);
  _8BP_colspall_2(&cor,&col);
  _8BP_colsp_3(32,0,22);
  _8BP_autoall_1(1);
  

  //ciclo de juego
  //-------------------------------------------------
  label_CICLO:
  c=c+1;
  //FPS computo
  //-------------------
  if (c & 7) goto label_710;
  /*
  tb=_basic_time();  
  if (tb>ta) { 
    fps=(7*3000)/(tb-ta);
    f1=fps/10;
    if (f1<10) goto label_fps;// no esta preparado para imprimirlo bien si baja de 10
    f2=fps % 10; 
    _8BP_printat_4(0,195,0,_basic_str(f1));
    _8BP_printat_4(0,195,4,".");
    _8BP_printat_4(0,195,6,_basic_str(f2));
    
    label_fps:
    ta=_basic_time();
    
  }else ta=_basic_time();
  */
  //creacion disparo enemigo
  //------------------------
  creaDispEne_1990();

  //banda
  if (banda) {
    if (c & 15) goto label_740;
    else procesaEventoBanda_1880();
    goto label_740;
  }

  //control de eventos basados en m (m es la posicion del mapa) 3*8=24. 
  //la resolucion es salto m = 24 (cada 8 ciclos)
  //--------------------------------------------------------------------
  label_710:
  //if (m & 7 > 0) goto label_740;
  if (m==nextm) procesaEvento_1500();
 
  label_740:  
  // CONTROLES .UP es el mas complejo
  //------------------------
  if (_basic_inkey(up)>0) goto label_840;
  else if (y>0) goto label_750;
  else goto label_880;

  label_750:
  t=1; if (y>120) goto label_820;
  // con scroll si y =120
  //----------------------
  if (scroll>0) goto label_820;

  //con scroll
  if (modo>0) {
    if (x>31){
      if (x<42){
        m=m+3;_8BP_map2sp_2(m,0);_8BP_moverall_2(3,0); goto label_880;
      }
    }
  }

  _8BP_mover_3(31,-3,0);_8BP_colsp_1(31);
  //if (col==32) {
  if (col>22) {
    m=m+3;
    _8BP_map2sp_2(m,0);
    _8BP_moverall_2(3,0);  
    goto label_880;
  }
  else{
    _8BP_mover_3(31,3,0);goto label_880;
  }

  //sin scroll
  label_820:
  if (modo>0){
    if (x>31){
      if (x<42){
        y=y-2;goto label_880;
      }
    }
  }
  _8BP_mover_3(31,-2,0);_8BP_colsp_1(31);
  //if (col==32){
  if (col>22){
    y=y-2;
    goto label_880;
  }
  else {
    _8BP_mover_3(31,2,0);
    goto label_880;
  }

  label_840:
  if (_basic_inkey(dw)>0) goto label_880;
  t=2; if (modo>0){
    if (y<180){
      if (x>31 && x<42){
        y=y+2;
        goto label_880;
      }
      else{
        _8BP_mover_3(31,2,0);_8BP_colsp_1(31);
        //if (col==32) {
        if (col>22) {
          y=y+2;
          goto label_880;
        }
        else{
          _8BP_mover_3(31,-2,0);
          goto label_880;
        }
      }
    }
  }
  //linea 860
  if (y<180){
    _8BP_mover_3(31,2,0);
    _8BP_colsp_1(31);
    //if (col==32){
    if (col>22){
      y=y+2;
    }
    else{
      _8BP_mover_3(31,-2,0);
    }
  }
  //870 dere e izq no necesitan corregir el mover pues despues hay un locate
  label_880:
  if (_basic_inkey(der)>0) goto label_910;
  else {
    t=t+3;
    if (x<65) goto label_890;
    else goto label_960;
  }
  label_890:
  if (modo>0) {
    if (x>31 && x<41){
      x=x+1;
      goto label_960;
    }
  }
  
  //900
  _8BP_mover_3(31,0,1);_8BP_colsp_1(31);
  //if (col==32){
  if (col>22){
    x=x+1;goto label_960;
  }else goto label_960;

  label_910:
  if (_basic_inkey(iz)>0) goto label_950;
  else {
    t=t+6; if (x>8) goto label_920;
    else goto label_950;
  }

  label_920:
  if (modo>0) {
    if(x>33 && x<42){
      x=x-1;goto label_960;
    }
  }
  
  _8BP_mover_3(31,0,-1);_8BP_colsp_1(31); if (col>22) x=x-1;

  //940 dir computation
  label_950:
  if (t!=0) goto label_960;else goto label_1070;

  label_960:
   
  dif=dir-po[t];t=0;
  if (dif!=0) goto label_980;else goto label_1040;

  label_980:
  if (dif<0){
    if (dif<-8){
      dir=dir-1; goto label_1010;
    }
    else {
      dir=dir+1;goto label_1020;
    }
  }
  if (dif>8) {
    dir=(1+dir) & 15; goto label_1020; // a lo mejor puedo quitar los parentesis
  }
  dir=dir-1;
  
  label_1010:
  dir=dir & 15;

  label_1020:
  _8BP_setupsp_3(31,7,seq[dir]);
  
  //anima and locate joe
  label_1040:
  _8BP_anima_1(31);
  _8BP_locatesp_3(31,y,x);

  //fire control
  label_1070:
  if (_basic_inkey(fr)>0){
    if (pres>0){
      pres=0;bomb=0;goto label_1160;
    }
    else goto label_1160;
  }
  if (pres>0){
    bomb=bomb+1;
    if (bomb<8) goto label_1160;
    else goto label_1430;
  }
  i=23+ (i % 6);
  //fire creation
  label_1110:
  _8BP_setupsp_3(i,15,dir);
  _8BP_locatesp_3(i,y+4,x+2);
  _8BP_setupsp_3(i,0,233);
  pres=1;

  //1150 -- 2 MODOS DE PRINTSPALL 0=normal.1 =puente
  label_1160:
  _8BP_autoall();
  if (modo>0) goto label_1200;

  //1170 -- modo 0 normal ---
  _8BP_printspall();goto label_1230;

  
  //1190 -- modo 1 puente ---
  label_1200:
  if (m>pfin1) {
    _8BP_setlimits_4(8,72,0,m+p2);
  }else{
    _8BP_setlimits_4(8,72,m+p1,200);
  }
  _8BP_printsp_1(31);_8BP_setlimits_4(8,72,0,200);_8BP_printspall();

  //1220 -- RUTINA COLISION
  label_1230:
  if (c & 1) {
  //if (c >0) {
    _8BP_colspall();
    if (cor==32) goto label_CICLO;
  } else{
    cor=32;goto label_CICLO;
  }
  if (cor==31) goto label_1360;
  else{
    if (cor<29){
      _8BP_setupsp_3(cor,0,69);_8BP_setupsp_3(cor,7,9);//fire
    }
  }
  if (col<15) goto label_CICLO;//disparo a decorado <11 o disp <15
  puntos=puntos+5;if (puntos==pot) {
    tabu=tabu+2;pot=pot*10;
  }
  _8BP_printat_4(0,8,6-tabu,_basic_str(puntos));
  if (_basic_peek(dirsp[col])<128) goto label_1320;

  
  //1300
  _8BP_setupsp_3(col,7,15);_8BP_setupsp_3(col,0,85);
  if (banda>0) {
    muertos=muertos+1;
    if (muertos==Nbanda){
      level=level+1; 
      _basic_poke(42548,0);//para resetear el comienzo a mitad
      goto label_FIN;
    }
  }
  //1310
  goto label_CICLO;  

  label_1320:
  if (cor<29) {
    enecount[col-15]=enecount[col-15]-1;if (enecount[col-15]>0) goto label_CICLO;
  }
  _8BP_setupsp_3(col,7,10);
  _8BP_setupsp_3(col,0,85);
  goto label_CICLO;  


  label_1360:
  if (col<11) goto label_CICLO;
  //1370 -- muerte joe
  if (inmune==1) goto label_CICLO;
  _8BP_setupsp_3(col,0,65);
  vidas=vidas-1;_8BP_music();
  _8BP_setupsp_3(31,0,64);
  
  for (int i=y;i<=y+25;i++){
    
    _8BP_autoall();_8BP_printspall();
    //_8BP_animall();
    _8BP_setlimits_4(8,72,y,y+25);
    _8BP_printsp_3(31,i,x);
    _basic_sound(1,i*5,5,14,0,0,0);
    _8BP_setlimits_4(8,72,0,200);

  }
  if (m>800) _basic_poke(42548,1);//para empezar mas tarde
  goto label_FIN;


  //RUTINA BOMBA
  label_1430:
  j=29+ (j % 2) ; if (_basic_peek(dirsp[j])>0) goto label_1160;
  _8BP_setupsp_3(j,15,16);
  _8BP_locatesp_3(j,y,x+1);
  _8BP_setupsp_3(j,0,128+64+8+1+16);//no colisionador
  bomb=0;
  goto label_1160;
  //-----end rutina bomba
  
  goto label_FIN;


  
  label_FIN:
  //al salir actualizamos los puntos, las vidas y el nivel
  _8BP_poke_2(42540,puntos);
  _basic_poke(42544,level);
  _basic_poke(42545,vidas);

 // _basic_poke(42548,m/10);


  return 0;
}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void creaDispEne_1990() {
  k=11 + k % 4;
  if (_basic_peek(dirsp[k])>0) return;
  enek=15+enek %8;direk=dirsp[enek];
  if (_basic_peek(direk)>0) goto label_2030;
  else return;

  label_2030:
  yene=0;_8BP_peek_2(direk+1,&yene);xene=_basic_peek(direk+3);
  _8BP_setupsp_3(k,0,128+64+8+2+1);
  _8BP_locatesp_3(k,yene,xene);offr=31;
  if (x<xene){
    offr=offr+8;
    if (y<yene) offr=offr+4;
  }else{
    if (y>yene) offr=offr+4;
  }
  rk=1+rk %4;
  _8BP_setupsp_3(k,15,offr+rk);
}

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void procesaEvento_1500(){
  _8BP_peek_2(evdir+2,&evtipo);
  
  switch (evtipo)  {

    case 1: //evento puente
      modo=1;_8BP_setupsp_3(31,0,64);
      pini=0;
      _8BP_peek_2(evdir+4,&pini);pfin1=pini+44;pfin2=pfin1+80;p2=-pfin1+112;p1=-pini+120;
      evdir=evdir +6;
      break;

    case 2: //fin puente
      if (y==120) {
        _8BP_setlimits_4(8,72,0,200);_8BP_setupsp_3(31,0,64+32+1);modo=0;
      }
      evdir=evdir +4;
      break;

    case 3://ink
     
      _8BP_peek_2(evdir+4,&tinta);
      _basic_ink(1,tinta);
      evdir=evdir +6;
      break;

    case 4://finscroll
      scroll=1;_8BP_map2sp_1(2);_8BP_map2sp_2(m,0);
      evdir=evdir +4;
      break;

    case 5: //banda
      procesaEventoBanda_1880();
      break;

    case 6://enemigo fijo
      
      eneim=0;_8BP_peek_2(evdir+4,&eneim);
      enesp=15 + enesp % 8; // 8 enemigos del 15 al 22
      _8BP_peek_2(evdir+6,&enecount[enesp-15]);//disparos para morir
      _8BP_peek_2(evdir+8,&eney);_8BP_peek_2(evdir+10,&enex);
      _8BP_setupsp_3(enesp,9,eneim);
      _8BP_locatesp_3(enesp,eney,enex);
      _8BP_setupsp_3(enesp,0,1+16+64+2);
      
      evdir=evdir+12;
      break;

    case 7://enemigo movil
      _8BP_peek_2(evdir+4,&enesq);//macroseq
      _8BP_peek_2(evdir+6,&eney);_8BP_peek_2(evdir+8,&enex);
      _8BP_peek_2(evdir+10,&ener);//ruta
      _8BP_peek_2(evdir+12,&tr);//transparencia
      enesp=15 + enesp % 8;//del 15 al 22
      _8BP_setupsp_3(enesp,5,1);
      _8BP_setupsp_3(enesp,7,enesq);
      _8BP_locatesp_3(enesp,eney,enex);
      _8BP_setupsp_3(enesp,0,159+tr);
      _8BP_setupsp_3(enesp,15,ener);
      evdir=evdir+14;
      break;

 
  }
  _8BP_peek_2(evdir,&nextm);
  
}
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void procesaEventoBanda_1880(){
  if (banda==0){
    for (int i=15 ;i<=22;i++){
      _8BP_setupsp_3(i,0,0);
    }
    rb=26;
    muertos=0;
    m=m+1;
  }
  if (banda>Nbanda-1) return;
  if (banda-muertos==8) return;
  enesp=15 +enesp % 8;

  if (_basic_peek(dirsp[enesp])>0) return;
  banda=banda+1;
  _8BP_setupsp_3(enesp,5,1);
  _8BP_setupsp_3(enesp,7,32);
  _8BP_locatesp_3(enesp,0,40);
  _8BP_setupsp_3(enesp,0,223);
  rb=rb+1;if (rb==31) rb=26;
  _8BP_setupsp_3(enesp,15,rb);
}