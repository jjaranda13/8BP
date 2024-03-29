/****************************************************************
  MINI BASIC for your 8BP programs
  this set of routines provides mainly BASIC functions used
  in your game cycle. 
  makes easier to translate your BASIC game cycle to C language
*****************************************************************/
#ifndef __BASIC_H
#define __BASIC_H






#include <stdlib.h>
#include <stdio.h>
#include <string.h>


void _basic_border(char color);//example _basic_border(7)
void _basic_call(unsigned int address); // example _basic_call(0xbd19)
void _basic_draw(int x, int y);
void _basic_ink(char ink1,char ink2);
char _basic_inkey(char key); //takes around 0.3 ms. slow but simple
void _basic_locate(unsigned int x, unsigned int y);// example _basic_locate(2,25);_basic_print("TEST");
void _basic_move(int x, int y);
void _basic_paper(char ink);
char _basic_peek(unsigned int address);
void _basic_pen_graph(char ink);
void _basic_pen_txt(char ink);
void _basic_poke(unsigned int address, unsigned char data);
void _basic_plot(int x, int y);
void _basic_print(char *cad); // example _basic_print("Hola \r\nAdios")
unsigned int _basic_rnd(int max); //example num=_basic_rnd(50)
void _basic_sound(unsigned char nChannelStatus, int nTonePeriod, int nDuration, unsigned char nVolume, char nVolumeEnvelope, char nToneEnvelope, unsigned char nNoisePeriod);
char* _basic_str(int num);  // similar to STR$ example _basic_print(_basic_str(num))
unsigned int _basic_time(); //return an unsigned int,(0..65535). As integer, when reach 32768 go to -32768






//============================================================
#define _BASIC_PASS_PARAM  \
   ld    ix,#2; posicion primer parametro \
   add   ix,sp;

#define _BASIC_PASS_PARAM_CRITICAL  \
   ld    ix,#4; posicion primer parametro \
   add   ix,sp;


/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
unsigned int _basic_time()
{
 __asm
 call 0xbd0d
 ret 
 __endasm;
 	
 return 0;
 
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
unsigned int  _basic_rnd_x=0;
unsigned int _basic_rnd(int max)
{

max;

 __asm
 call 0xbd0d
  ld b,h
  ld c, l
  ld hl,#__basic_rnd_x; con el # es direccion,  el _ es imprescindible en cualquier caso
  ld (hl),c
  inc hl
  ld (hl),b
 __endasm;
 	
 return _basic_rnd_x % max;	
 

 
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _basic_border(char color) 
{
color;
__asm
    ; recoge primer parametro
    ;------------------------
    _BASIC_PASS_PARAM
    ld a,(ix)
     
    ld b, a
    ld c, a
    call 0xbc38
    
__endasm;	
}

/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
/* funcion DisplayChar simplemente imprime un char*/ 
void DisplayChar( char c )
{
c;
__asm
    
    ld    hl,#2; recoge primer parametro
    add   hl,sp
    ld    a,(hl)
    
    
    call 0xbb5a
    
__endasm;
}

/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _basic_print(char *cad)
{
char * textPtr;
textPtr=cad;

while( *textPtr != 0 )
    {
        DisplayChar( *textPtr);
        textPtr++;
    }
} 
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
char _basic_inkey(char key) __naked 
{

key;
__asm
  
 
    _BASIC_PASS_PARAM
    ld a, (ix)  
    CALL 0xBB1E
  
    jr nz, pressed
    ld l,#1
    ret
  
  pressed:
    ld l,#0
    ret
  
__endasm;

 return 0;

	
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
// inline function to swap two numbers
inline void swap(char *x, char *y) {
	char t = *x; *x = *y; *y = t;
}
//---------------------------------------------------------------------------
// function to reverse buffer[i..j]
char* reverse(char *buffer, int i, int j)
{
	while (i < j)
		swap(&buffer[i++], &buffer[j--]);

	return buffer;
}
//---------------------------------------------------------------------------
char* _basic_str(int value) 
{
	// invalid input
	// consider absolute value of number
	static char buffer[]="          ";
	int n = abs(value);

	int i = 0;
	while (n)
	{
		int r = n % 10;

		buffer[i++] = 48 + r ;
		
		n = n / 10;
	}

	// if number is 0
	if (i == 0)
	  buffer[i++] = '0';

	// If  value is negative, the resulting string 
	// is preceded with a minus sign (-)
	if (value < 0 )
	  buffer[i++] = '-';

	buffer[i] = 0; // null terminate string

	// reverse the string and return it
	return reverse(buffer, 0, i - 1);
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _basic_call (unsigned int address) 
{
address;
__asm
   _BASIC_PASS_PARAM
  ld l, (ix)  
  ld h, 1(ix)  
  ld (dir+1),hl
  
  dir:  CALL 0xbd19 ; la direccion 0xbd19 se machaca con la que venga
__endasm;	
	
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */
void _basic_locate (unsigned int x, unsigned int y) 
{
x;y;
__asm
  _BASIC_PASS_PARAM
  ld l, 2(ix)  
  ld h, (ix)  
  call 0xbb75
__endasm;	
	
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/

//Firmware requires it in the central 32K of RAM (0x4000 to 0xC000), move it as you need...
//#define SOUND_BUFF 0x4FF6 //9 bytes
//#define ENT_BUFF 0x4FE6 //16 bytes
//#define ENV_BUFF 0x4FD6 //16 bytes

////////////////////////////////////////////////////////////////////////
//sound
////////////////////////////////////////////////////////////////////////
//unsigned char bQueue = 0;

//unsigned char _basic_SOUND_BUFF[]={0,0,0,0,0,0,0,0,0};
//#define _basic_SOUND_BUFF 0xd7de  // 9 bytes en el sexto segmento oculto

#define _basic_SOUND_BUFF 0xf7f1  // 9 bytes en el sexto segmento oculto


//unsigned char ENT_BUFF[]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
//unsigned char ENV_BUFF[]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

////////////////////////////////////////////////////////////////////////
void _basic_sound(unsigned char nChannelStatus, int nTonePeriod, int nDuration, unsigned char nVolume, char nVolumeEnvelope, char nToneEnvelope, unsigned char nNoisePeriod) 
{
  //This function uses 9 bytes of memory for sound buffer. Firmware requires it in the central 32K of RAM (0x4000 to 0xC000)
  /*
    The bytes required to define the sound are as follows
    byte 0 - channel status byte
    byte 1 - volume envelope to use
    byte 2 - tone envelope to use
    bytes 3&4 - tone period
    byte 5 - noise period
    byte 6 - start volume
    bytes 7&8 - duration of the sound, or envelope repeat count 
  */

nChannelStatus;
nTonePeriod;
nDuration;
nVolume;
nVolumeEnvelope;
nToneEnvelope;
nNoisePeriod;
  
//unsigned char SOUND_BUFF={0,0,0,0,0,0,0,0,0};
//unsigned char SOUND_BUFF="         ";
  __asm
    ld    ix,#2; 
    add   ix,sp;
   
   
    //;LD HL, #SOUND_BUFF
    LD HL, #_basic_SOUND_BUFF
    
    //LD HL, #__basic_SOUND_BUFF
    
    
    LD A,  (IX) ;nChannelStatus
    
    LD (HL), A
    INC HL

    LD A,6 (IX) ;nVolumeEnvelope
    LD (HL), A
    INC HL

    LD A, 7 (IX) ;nToneEnvelope
    LD (HL), A
    INC HL

    LD A, 1 (IX) ;nTonePeriod
    
    LD (HL), A
    INC HL
    
    LD A, 2 (IX) ;nTonePeriod
    LD (HL), A
    INC HL

    LD A, 8 (IX) ;nNoisePeriod
    LD (HL), A
    INC HL

    LD A,  5 (IX) ;nVolume
    LD (HL), A
    INC HL

    LD A,  3 (IX) ;nDuration
    LD (HL), A
    INC HL
    LD A,  4 (IX) ;nDuration
    LD (HL), A
    INC HL

    //LD HL, #SOUND_BUFF
    //LD HL, #__basic_SOUND_BUFF
    LD HL, #_basic_SOUND_BUFF
    
    CALL #0xBCAA ;SOUND QUEUE
    
  __endasm;
  
  
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
void _basic_ink (char ink1, char ink2)
{
ink1;ink2;
__asm
   
  _BASIC_PASS_PARAM
  ld a, (ix)
  ld b, 1(ix)
  ld c,b
  call 0xbc32	
	
	
__endasm;	
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
char _basic_peek(unsigned int address)
{
address;

__asm
  _BASIC_PASS_PARAM
  ld l, (ix)
  ld h,1(ix)
  ld a,(hl)
  ld l,a
  ret
__endasm;

return 0;

}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
void _basic_poke(unsigned int address, unsigned char data)
{
address;
data;

__asm
  _BASIC_PASS_PARAM
  ld l, (ix)
  ld h,1(ix)
  
  
  ld a,2(ix)
  ld (hl),a
  ret
__endasm;
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
void _basic_pen_txt(char ink)
{
ink;
__asm
  _BASIC_PASS_PARAM
  ld a, (ix)
  
  call 0xbb90 // TXT SET PEN
__endasm;

	
}
void _basic_pen_graph(char ink)
{
ink;
__asm
  _BASIC_PASS_PARAM
  ld a, (ix)
  call 0xbbde
__endasm;
	
}




/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
void _basic_paper(char ink)
{
ink;	
__asm
  _BASIC_PASS_PARAM
  ld a, (ix)
  call 0xbb96
__endasm;

}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
void _basic_plot(int x, int y){
x;y;
__asm

	_BASIC_PASS_PARAM
	
	ld e,(ix)
	ld d, 1(ix)
	ld l, 2(ix)
	ld h, 3(ix)
	call	0xBBEA  ; GRA PLOT ABSOLUTE
		
	ret
__endasm;
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
void _basic_move(int x, int y){
x;y;
__asm

	_BASIC_PASS_PARAM
	
	ld e,(ix)
	ld d, 1(ix)
	ld l, 2(ix)
	ld h, 3(ix)
	call	0xBBC0  ; GRA MOVE ABSOLUTE
		
	ret
__endasm;
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/
void _basic_draw(int x, int y)
{
x;y;
__asm
	_BASIC_PASS_PARAM
	ld e,(ix)
	ld d, 1(ix)
	ld l, 2(ix)
	ld h, 3(ix)


	call	0xBBF6	; GRA LlNE ABSOLUTE
	ret


__endasm;	
	
}
/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/

#endif