#include <stdio.h>
#include "NUC1xx.h"
#include "SYS.h"
#include "GPIO.h"
#include "Seven_segment.h"
#include "Scankey.h"
#include "LCD.h"

void seven_segment_rotate(unsigned char num, unsigned char number) {
	unsigned char temp,i;
	temp = number;
	for(i=0; i<8; i++) {
		if((temp&0x01)==0x01)
			DrvGPIO_SetBit(E_GPE,i);
		else
			DrvGPIO_ClrBit(E_GPE,i);
		temp = temp>>1;
	}
	DrvGPIO_SetBit(E_GPC, 4+num);
}

void seg_display(int16_t value , int16_t valSeg, int16_t time){
	
	int digit1, t;
	unsigned char SEGS[6] =   {0xF7, 0xEF, 0xFE, 0xDF, 0xBF, 0xFB};
	int8_t digit;
	digit = value / 1000;
	
	value = value - digit * 100;
	digit = value / 10;
	
	value = value - digit * 10;
	digit1 = value;
	
	for(t=0; t<time; t++){
		
		close_seven_segment();
		show_seven_segment(1,digit);
		DrvSYS_Delay(6000);
		
		close_seven_segment();
		show_seven_segment(0,digit1);
		DrvSYS_Delay(6000);

        close_seven_segment();
		seven_segment_rotate(3,SEGS[valSeg]);
		DrvSYS_Delay(6000);
	}
	close_seven_segment();
}

int main(void){
	
	char TEXT0[16] = "TEST 1";
	uint32_t i = 69;
	uint32_t seg= 0;
	int8_t number;
	int32_t timer = 30;
	UNLOCKREG();
	DrvSYS_Open(50000000);
	
	LOCKREG();
	
	init_LCD();
	clear_LCD();
	OpenKeyPad();
	
	
	print_Line(0,TEXT0);
	while(1) {
		number = ScanKey();
		if(number == 3 && timer!= 70){
				timer = timer + 20;
		}else if(number ==8 && timer!= 10){
				timer = timer - 20;
		}
		seg_display(i, seg, timer);
        if(i==0)
            i = 70;
        if(seg==6)
            seg = 0;
				
			seg_display(i, seg, timer);
				seg++;
		i--;
	}
}
