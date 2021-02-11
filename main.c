#include <stdio.h>
#include "NUC1xx.h"
#include "SYS.h"
#include "GPIO.h"
#include "Seven_segment.h"
#include "Scankey.h"
#include "LCD.h"

void seg_display(int16_t value , int16_t valSeg){
	
	int digit1, t;
	unsigned char SEGS[6] =   {0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F};
	int8_t digit;
	digit = value / 1000;
	
	value = value - digit * 100;
	digit = value / 10;
	
	value = value - digit * 10;
	digit1 = value;
	
	for(t=0; t<30; t++){
		
		close_seven_segment();
		show_seven_segment(1,digit);
		DrvSYS_Delay(6000);
		
		close_seven_segment();
		show_seven_segment(0,digit1);
		DrvSYS_Delay(6000);

        close_seven_segment();
		show_seven_segment(3,SEGS[valSeg]);
		DrvSYS_Delay(6000);
	}
	close_seven_segment();
}

int main(void){
	
	char TEXT0[16] = "TEST 1";
	uint32_t i = 69;
	uint32_t seg= 0;
	int8_t number;
	UNLOCKREG();
	DrvSYS_Open(50000000);
	
	LOCKREG();
	
	init_LCD();
	clear_LCD();
	OpenKeyPad();
	
	
	print_Line(0,TEXT0);
	while(1) {
		seg_display(i, seg);
        if(i==0)
            i = 70;
        if(seg==6)
            seg = 0;
				else
					seg++;
		number = ScanKey();
		i--;
		seg++;
	}
}
