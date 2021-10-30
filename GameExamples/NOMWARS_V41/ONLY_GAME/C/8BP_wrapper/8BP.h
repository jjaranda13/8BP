/****************************************************************
  8BP interface  for your 8BP programs written in C language
  this set of routines provides the same RSX commands but in C
  
*****************************************************************/


// code




#include <stdio.h>
#include <string.h>

#ifndef __8BP_H
#define __8BP_H
/*----------------------------------------------------------------*/
void _8BP_3D_1(int flag);
void _8BP_3D_3(int flag, int sp_fin,int offsety);
/*----------------------------------------------------------------*/
void _8BP_anima_1(int sp);
void _8BP_animall();
/*----------------------------------------------------------------*/
void _8BP_auto_1(int sp);
void _8BP_autoall();
void _8BP_autoall_1(int flag);
/*----------------------------------------------------------------*/
void _8BP_colay_3(int umbral, int* colision, int sp);
void _8BP_colay_2(int* colision, int sp);
void _8BP_colay_1(int sp);
void _8BP_colay();
/*----------------------------------------------------------------*/
void _8BP_colsp_3(int operation, int a, int b);/* op 32 ini,fin or 34 dy,dx*/
void _8BP_colsp_2(int sp, int* colision); /*op 33 or sp*/
void _8BP_colsp_1(int sp);
/*----------------------------------------------------------------*/
void _8BP_colspall_2(int* collider, int* collided);
void _8BP_colspall_1(int collider_ini);
void _8BP_colspall();
/*----------------------------------------------------------------*/
void _8BP_layout_3(int y, int x, char* cad); 
/*----------------------------------------------------------------*/
void _8BP_locatesp_3(char sp, int y, int x);
/*----------------------------------------------------------------*/
void _8BP_map2sp_2(int y, int x);
void _8BP_map2sp_1(unsigned char status);
/*----------------------------------------------------------------*/
void _8BP_mover_3(int sp, int dy,int dx);
void _8BP_mover_1(int sp);
void _8BP_moverall_2(int dy, int dx);
void _8BP_moverall();
/*----------------------------------------------------------------*/
void _8BP_music_4(int flag_c, int flag_repetition,int song, int speed);
void _8BP_music();
/*----------------------------------------------------------------*/
void _8BP_peek_2(int address, int* dato);
void _8BP_poke_2(int address, int dato);
/*----------------------------------------------------------------*/
void _8BP_printat_4(int flg,int y,int x,char* cad) ; 
/*----------------------------------------------------------------*/
void _8BP_printsp_1(int sp) ;
void _8BP_printsp_2(int sp,int bits_background) ;
void _8BP_printsp_3(int sp,int y,int x) ; 
/*----------------------------------------------------------------*/
void _8BP_printspall_4(int ini, int fin, int flag_anima, int flag_sync);
void _8BP_printspall_1(int order_type);
void _8BP_printspall();
/*----------------------------------------------------------------*/
void _8BP_rink_1(int step);
void _8BP_rink_N(int num_params,int* ink_list);
/*----------------------------------------------------------------*/
void _8BP_routesp_2(int sp, int pasos);
void _8BP_routesp_1(int sp);
/*----------------------------------------------------------------*/
void _8BP_routeall();
/*----------------------------------------------------------------*/
void _8BP_setlimits_4(int xmin,int xmax, int ymin, int ymax);
/*----------------------------------------------------------------*/
void _8BP_setupsp_3(int sp, int param, int value);
void _8BP_setupsp_4(int sp, int param, int value1,int value2);
/*----------------------------------------------------------------*/
void _8BP_stars_5(int star_ini, int num_stars,int color, int dy, int dx);
void _8BP_stars();
/*----------------------------------------------------------------*/
void _8BP_umap_6(int map_ini, int map_fin, int y_ini, int y_fin, int x_ini, int x_fin);

/*----------------------------------------------------------------*/


#define _8BP_PASS_PARAM  \
   ld    ix,#2  ;posicion primer parametro \
   add   ix,sp;
    
#define _8BP_PASS_PARAM_CRITICAL  \
   Ld    IX,#4 ; pos primer param \
   add   IX,sp 
   
/* =========================================================================== */


/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void comandos_8BP_V41(){
	
__asm   
     _3D        == 0x645D;
     ANIMA      == 0x6fcc;
     ANIMALL    == 0x7716;
     AUTO       == 0x7184;
     AUTOALL    == 0x71d2;
     COLAY      == 0x7201;
     COLSP      == 0x73ac;
     COLSPALL   == 0x75b1;
     LAYOUT     == 0x7062;
     LOCATESP   == 0x6C71;
     MAP2SP     == 0x6499;
     MOVER      == 0x753e;
     MOVERALL   == 0x76f0;
     MUSIC      == 0x6F58;
     PEEK       == 0x6931;
     POKE       == 0x6944;
     PRINTAT    == 0x6064;
     PRINTSP    == 0x6C94;
     PRINTSPALL == 0x62a1;
     RINK       == 0x7630;
     ROUTESP    == 0x65f7;
     ROUTEALL   == 0x65d6;
     SETLIMITS  == 0x6870;
     SETUPSP    == 0x7101;
     STARS      == 0x743c;
     UMAP       == 0x5f2f;
  
__endasm;
}

/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_3D_inv3(int offsety,int sp_fin, int flag)
{
	
  offsety;
  sp_fin;
  flag;
  __asm
    ld a, #3 
    _8BP_PASS_PARAM
    call _3D ;
    
  __endasm;			
  
}
//----------------------------------------------------------------------------
void _8BP_3D_3(int flag, int sp_fin,int offsety)  
{
_8BP_3D_inv3(offsety,sp_fin,flag);
}
//----------------------------------------------------------------------------
void _8BP_3D_1(int flag) 
{
  flag;
  __asm
    ld a, #1
    _8BP_PASS_PARAM
    call _3D ;   
  __endasm;			

}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_anima_1(int sp) 
{
  sp;
  __asm
    ld a, #1
    _8BP_PASS_PARAM
    call ANIMA ;  
  __endasm;			

}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_animall() 
{
  __asm
    ld a,#0
    call ANIMALL ;  
  __endasm;			
	
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_auto_1(int sp) 
{
  sp;
  __asm
    ld a, #1
    _8BP_PASS_PARAM
    call AUTO ;  
  __endasm;			
	
}
//----------------------------------------------------------------------------
void _8BP_autoall_1(int flag) 
{
  flag;
  __asm
    ld a, #1
    _8BP_PASS_PARAM
    call AUTOALL ;  
  __endasm;			
	
}
//----------------------------------------------------------------------------
void _8BP_autoall() 
{
  __asm
    ld a, #0
    call AUTOALL ;  
  __endasm;			
	
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_colay_inv3( int sp,int* colision,int umbral)
{
sp;colision;umbral;
__asm
    ld a, #3
    _8BP_PASS_PARAM
    CALL COLAY
  __endasm;		
	
}
//----------------------------------------------------------------------------
void _8BP_colay()
{
__asm
    ld a, #0
    CALL COLAY
  __endasm;		
	
}
//----------------------------------------------------------------------------
void _8BP_colay_inv2(int sp, int* colision)
{
sp;colision;
__asm
    ld a, #2
    _8BP_PASS_PARAM
    CALL COLAY
  __endasm;		
	
}
void _8BP_colay_2(int* colision, int sp)
{
  _8BP_colay_inv2(sp, colision);
}

//----------------------------------------------------------------------------
void _8BP_colay_1(int sp)
{
sp;
__asm
    ld a, #1
    _8BP_PASS_PARAM
    CALL COLAY
  __endasm;		
	
}

//----------------------------------------------------------------------------
void _8BP_colay_3(int umbral, int* colision, int sp)
{
_8BP_colay_inv3( sp,colision,umbral);
}


/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_colsp_inv3( int b, int a,int operation)
{
  b;
  a;
  operation;
  __asm
    ld a, #3
    _8BP_PASS_PARAM
    CALL COLSP
  __endasm;		
	
}
//----------------------------------------------------------------------------
void _8BP_colsp_inv2(int* colision,int sp)
{
  colision;
  sp;
  __asm
    ld a, #2
    _8BP_PASS_PARAM
    CALL COLSP
  __endasm;		
	
}
//----------------------------------------------------------------------------
void _8BP_colsp_3(int operation, int a, int b)  
{
  _8BP_colsp_inv3(b,a,operation);
}
//----------------------------------------------------------------------------
void _8BP_colsp_2(int sp, int* colision)  
{
  _8BP_colsp_inv2(colision, sp);
}
//----------------------------------------------------------------------------
void _8BP_colsp_1(int sp)  
{
  sp;
  __asm
    ld a, #1
    
    _8BP_PASS_PARAM
    
    CALL COLSP
  __endasm;		
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_colspall_inv2(int* collided,int* collider) 
{
  collided;
  collider;	
  __asm
    ld a, #2
    _8BP_PASS_PARAM
    CALL COLSPALL
  __endasm;
}
//----------------------------------------------------------------------------
void _8BP_colspall() 
{
  __asm
    ld a, #0
    CALL COLSPALL
  __endasm;	
}
//----------------------------------------------------------------------------
void _8BP_colspall_1(int collider_ini) __critical
{
  collider_ini;
  __asm
    ld a, #1
    _8BP_PASS_PARAM
    CALL COLSPALL
    
  __endasm;	
}
//----------------------------------------------------------------------------
void _8BP_colspall_2(int* collider, int* collided) 
{
  _8BP_colspall_inv2(collided,collider);
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_locatesp_inv3(int x, int y, char sp)
{
x;
y;
sp;
  __asm
    ld a, #3
    _8BP_PASS_PARAM
    CALL LOCATESP
  __endasm;	

}
//----------------------------------------------------------------------------
void _8BP_locatesp_3(char sp, int y, int x) 
{
 _8BP_locatesp_inv3( x, y, sp);
}

/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_music_inv4(int speed, int song, int flag_repetition, int flag_c) 
{
speed;
song;
flag_repetition;
flag_c;
  __asm
    ld a, #4
    _8BP_PASS_PARAM
    CALL MUSIC
   
  __endasm;		
}
//----------------------------------------------------------------------------
void _8BP_music_4(int flag_c, int flag_repetition,int song, int speed)  
{
_8BP_music_inv4(speed, song, flag_repetition, flag_c);

}
//----------------------------------------------------------------------------
void _8BP_music()
{
  __asm
    ld a, #0
    CALL MUSIC
 __endasm;		
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void getDescriptor(char* desc,char *cad)
{
  	
  
  char len=strlen(cad);
  desc[0]=len;
  int **p;
  p=desc+1;
  *p=cad;
  
	
}
//----------------------------------------------------------------------------
void _8BP_printat_inv(char *descriptor , int x, int y,int flag) 
{
descriptor;
x;
y;
flag;
  __asm
    ld a, #4    
    _8BP_PASS_PARAM
    CALL PRINTAT    
 __endasm;			
 
}
//----------------------------------------------------------------------------
void _8BP_printat_4(int flag,int y,int x, char* cad)  
{
  	
  char descriptor[3]={0,0,0};
  char len=strlen(cad);
  descriptor[0]=len;
  int **p;
  p=descriptor+1;
  *p=cad;  
    
  
  _8BP_printat_inv(descriptor, x, y, flag);   

} 
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_printsp_inv3(int x,int y, int sp)  
{
x;
y;
sp;

  __asm    
   ld a, #3 ; se envian 3 parametros
    _8BP_PASS_PARAM
   CALL PRINTSP  
  __endasm;	
}
//----------------------------------------------------------------------------
void _8BP_printsp_inv2(int bits, int sp) 
{
bits;
sp;
__asm      
   ld a, #2 
   _8BP_PASS_PARAM
   
   call PRINTSP ;    
  __endasm;	

}
//----------------------------------------------------------------------------
void _8BP_printsp_3(int sp, int y, int x)  
{
  _8BP_printsp_inv3( x, y,  sp);
}
//----------------------------------------------------------------------------
void _8BP_printsp_2(int sp,int bits_background)  
{
  _8BP_printsp_inv2( bits_background,  sp);
}
//----------------------------------------------------------------------------
void _8BP_printsp_1(int sp)  
{
  sp;
   __asm   
   
   ld a, #1
   _8BP_PASS_PARAM
   CALL PRINTSP
  __endasm;	
  
  
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_printspall_inv4(int flag_sync,int flag_anima, int fin, int ini)
{
flag_sync;
flag_anima;
fin;
ini;
  __asm   
   ld a, #4
   _8BP_PASS_PARAM
   CALL PRINTSPALL
  __endasm;	
}
//----------------------------------------------------------------------------
void _8BP_printspall_4(int ini, int fin, int flag_anima, int flag_sync)  
{
_8BP_printspall_inv4(flag_sync, flag_anima, fin, ini);
}
//----------------------------------------------------------------------------
void _8BP_printspall_1(int order_type)  
{
  order_type;	
__asm   
   ld a, #1
   _8BP_PASS_PARAM
   CALL PRINTSPALL
  __endasm;	
}
//----------------------------------------------------------------------------
void _8BP_printspall() 
{
__asm   
   ld a, #0
   CALL PRINTSPALL
  __endasm;	
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_routeall()
{
__asm   
   ld a, #0;
   CALL ROUTEALL
  __endasm;	

}


void _8BP_routesp_inv2(int pasos, int sp) 
{
pasos;
sp;
__asm   
   ld a, #2 ;
   _8BP_PASS_PARAM
   CALL ROUTESP
  __endasm;	
}
//----------------------------------------------------------------------------
void _8BP_routesp_2(int sp, int pasos)  
{
  _8BP_routesp_inv2(pasos,sp) ;
}
//----------------------------------------------------------------------------
void _8BP_routesp_1(int sp)  
{
sp;
  __asm   
   ld a, #1 ;
   _8BP_PASS_PARAM
   CALL ROUTESP
  __endasm;	
	
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_setlimits_inv4(int ymax, int ymin, int xmax,int xmin)
{
xmin;xmax;ymin;ymax;
  __asm   
   ld a, #4 ;
   _8BP_PASS_PARAM
   CALL SETLIMITS
  __endasm;	


}

void _8BP_setlimits_4(int xmin,int xmax, int ymin, int ymax)
{
_8BP_setlimits_inv4( ymax,  ymin,  xmax, xmin);
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_setupsp_inv3(int value,int param, int sp) 
{
value;
param;
sp;
  __asm   
   ld a, #3 ; se envian 3 parametros
   _8BP_PASS_PARAM
   CALL SETUPSP
  __endasm;	
}
//----------------------------------------------------------------------------
void _8BP_setupsp_inv4(int value2,int value1,int param, int sp) 
{
value1;
value2;
param;
sp;
  __asm   
   ld a, #4 ;
   _8BP_PASS_PARAM
   CALL SETUPSP
  __endasm;	
}
//----------------------------------------------------------------------------
void _8BP_setupsp_3(int sp,int param, int value)  
{
  _8BP_setupsp_inv3(value,param, sp);
}
//----------------------------------------------------------------------------
void _8BP_setupsp_4(int sp,int param, int value1,int value2) 
{
  _8BP_setupsp_inv4(value2,value1,param, sp);
}

/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_stars_inv5(int dx, int dy, int color, int num_stars,int star_ini)
{
dx;
dy;
color;
num_stars;
star_ini;
  __asm   
   ld a, #5 
   _8BP_PASS_PARAM
   CALL STARS
  __endasm;	
}
//----------------------------------------------------------------------------
void _8BP_stars_5(int star_ini, int num_stars,int color, int dy, int dx)  
{
  _8BP_stars_inv5(dx, dy, color, num_stars,star_ini);
}	
//----------------------------------------------------------------------------
void _8BP_stars() 
{
  __asm   
   ld a, #0
   CALL STARS
  __endasm;	

}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_layout_inv3(char* descriptor, int x,int y)
{
descriptor;x;y;
__asm
  ld a,#3
  _8BP_PASS_PARAM
  CALL LAYOUT
__endasm;

}
//----------------------------------------------------------------------------
void _8BP_layout_3(int y, int x, char* cad)
{

char descriptor[3]={0,0,0};
  char len=strlen(cad);
  descriptor[0]=len;
  int **p;
  p=descriptor+1;
  *p=cad;  
  
_8BP_layout_inv3(descriptor, x,  y );
	
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_map2sp_inv2(int x, int y)
{
x;y;
__asm
 ld a,#2
  _8BP_PASS_PARAM
  CALL MAP2SP
__endasm;	
}
void _8BP_map2sp_2(int y, int x)
{

  _8BP_map2sp_inv2(x,y);
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_map2sp_1(unsigned char status)
{
status;
__asm
 ld a,#1
  _8BP_PASS_PARAM
  CALL MAP2SP
__endasm;	
	
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_mover_inv3(int dx,int dy,int sp)
{
dy;dx;sp;	
__asm
 ld a,#3
  _8BP_PASS_PARAM
  CALL MOVER
__endasm;	
	
}
void _8BP_mover_3(int sp, int dy,int dx)
{
_8BP_mover_inv3(dx,dy,sp);
}
void _8BP_mover_1(int sp)
{
sp;
__asm
 ld a,#1
  _8BP_PASS_PARAM
  CALL MOVER
__endasm;	
	
	
}
void _8BP_moverall_inv2(int dx, int dy)
{
dx;dy;
__asm
 ld a,#2
  _8BP_PASS_PARAM
  CALL MOVERALL
__endasm;	
	
}
void _8BP_moverall_2(int dy, int dx)
{
_8BP_moverall_inv2(dx,dy);
}

void _8BP_moverall()
{
__asm
 ld a,#0
  CALL MOVERALL
__endasm;	

}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_peek_2(int address, int* dato)
{
int *p;
p=(int *)address;	
*dato=*p; //mas facil imposible
}

void _8BP_poke_2(int address,int dato)
{
int *p;
p=(int *)address;
*p=dato; //mas facil imposible
}

/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_rink_1(int step)
{
step;
__asm
 ld a,#1
  _8BP_PASS_PARAM
  CALL RINK
__endasm;	
}
//-----------------------------------------------------------------------
char _8BP_rink_N_color1;
int _8BP_rink_N_inverse_list[17];
void _8BP_rink_N(int num_params,int* ink_list)
{
int i;
char* p;

p=ink_list;
_8BP_rink_N_color1=num_params;

// doy la vuelta a la lista
for (i=0;i<num_params;i++)
    _8BP_rink_N_inverse_list[i]=ink_list[num_params-i-1];

__asm
 
  ld hl, #__8BP_rink_N_color1;
  ld a,(hl)
  ld ix, #__8BP_rink_N_inverse_list;
    
  CALL RINK
__endasm;	
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _8BP_umap_inv6(int x_fin,int x_ini, int y_fin, int y_ini, int map_fin, int map_ini)
{
x_fin;x_ini;y_fin;y_ini;map_fin;map_ini;	
__asm
  ld a,#6
  _8BP_PASS_PARAM
  CALL UMAP
__endasm;	


}
//-----------------------------------------------------------------------
void _8BP_umap_6(int map_ini, int map_fin, int y_ini, int y_fin, int x_ini, int x_fin)
{
_8BP_umap_inv6(x_fin,x_ini,y_fin,y_ini, map_fin, map_ini);

}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
#endif