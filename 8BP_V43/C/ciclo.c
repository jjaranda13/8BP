#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "8BP.h"
#include "minibasic.h"


char _xmap;
//int xini;
//int xfin;  
int x,x2;
int  main()
{
x=0;
for (_xmap=2;_xmap<32;_xmap+=2){ // 15 pasos
//xini=(int)_xmap-2;
//xfin=(int)_xmap;
x=0;
x2=2;
_8BP_setlimits_4(0,2,0,199);
_8BP_map2sp_2(0,30+_xmap);
//roll HW


__asm
  push hl
  push af
  ld hl, #__xmap
  ld a,(hl)
  ld l,a
  xor a
  ld H,a
  call 48133
  pop af
  pop hl
__endasm; 

_8BP_printspall();

}//for

return 0;
//sync
__asm
call 48409
__endasm;
_8BP_setlimits_4(0,80,0,199);
//_8BP_map2sp_2(0,30);
//actualizacion de coordenadas de todos los sprites
_8BP_moverall_2(0,-36);
_8BP_printspall();//empezamos a imprimir muy tarde. asi tengo barrido y medio

//recolocacion de pantalla
__asm
  push hl
  push af
  xor a
  ld l,a
  ld H,a
  call 48133
  pop af
  pop hl
__endasm; 
//_8BP_printspall();
_8BP_map2sp_2(300,30);//
return 0;
}