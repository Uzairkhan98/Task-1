#include <stdio.h>
#include "NUC1xx.h"
#include "SYS.h"
#include "GPIO.h"
#include "Seven_segment.h"
#include "Scankey.h"
#include "LCD.h"

void seg_display(int16_t value , int16_t valSeg, int16_t t){
	
	int digit1;
	unsigned char SEGS[6] =   {0xEF, 0xF7, 0x7F,0xFB , 0xFD, 0xDF};
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
		if(number == 3){
			if(timer < 55)
				timer = timer + 5;
		}else if(number ==8){
			if(timer > 5)
				timer = timer  -5;
		}
		seg_display(i, seg, timer);
        if(i==0)
            i = 70;
        if(seg==6)
            seg = 0;
				else
					seg++;
		i--;
		seg++;
	}
}
