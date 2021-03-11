//
// Smpl_Timer_LCD
// 
// Timer0 set at one-shot   @ 1 sec or 1 Hz
// Timer1 set at periodic   @ 1 sec or 1 Hz
// Timer2 set at contiuous  @ 1 sec or 1 Hz

#include <stdio.h>	
#include <string.h>
#include "NUC1xx.h"
#include "LCD.h"
#include "GPIO.h"
#include "SYS.h"

#define  ONESHOT  0   // counting and interrupt when reach TCMPR number, then stop
#define  PERIODIC 1   // counting and interrupt when reach TCMPR number, then counting from 0 again
#define  TOGGLE   2   // keep counting and interrupt when reach TCMPR number, tout toggled (between 0 and 1)
#define  CONTINUOUS 3 // keep counting and interrupt when reach TCMPR number

static uint16_t Timer0Counter=0;
static uint16_t Timer1Counter=0;

//---------------------------------------------------------------------------------TIMER
void InitTIMER0(void)
{
	/* Step 1. Enable and Select Timer clock source */          
	SYSCLK->CLKSEL1.TMR0_S = 0;	//Select 12Mhz for Timer0 clock source 
  SYSCLK->APBCLK.TMR0_EN = 1;	//Enable Timer0 clock source

	/* Step 2. Select Operation mode */	
	TIMER0->TCSR.MODE=ONESHOT;		//Select once mode for operation mode

	/* Step 3. Select Time out period = (Period of timer clock input) * (8-bit Prescale + 1) * (24-bit TCMP)*/
	TIMER0->TCSR.PRESCALE=255;	// Set Prescale [0~255]
	TIMER0->TCMPR = 46875;		// Set TCMPR [0~16777215]
								// (1/12000000)*(255+1)* 46875 = 1 sec / 1 Hz

	/* Step 4. Enable interrupt */
	TIMER0->TCSR.IE = 1;
	TIMER0->TISR.TIF = 1;		//Write 1 to clear for safty		
	NVIC_EnableIRQ(TMR0_IRQn);	//Enable Timer0 Interrupt

	/* Step 5. Enable Timer module */
	TIMER0->TCSR.CRST = 1;		//Reset up counter
	TIMER0->TCSR.CEN = 1;		//Enable Timer0

//  	TIMER0->TCSR.TDR_EN=1;		// Enable TDR function
}

void TMR0_IRQHandler(void) // Timer0 interrupt subroutine 
{
	char TEXT1[16]="Timer0:         ";
	Timer0Counter++;
	sprintf(TEXT1+7,"%d",Timer0Counter);
	print_Line(1, TEXT1);
 	TIMER0->TISR.TIF =1; 	 

  DrvGPIO_ClrBit(E_GPA,14); // GPA14 = Red,   0 : on, 1 : off
	DrvSYS_Delay(1000000);			  
  DrvGPIO_SetBit(E_GPA,14); // GPA14 = Red,   0 : on, 1 : off
  
}

//---------------------------------------------------------------------------------TIMER
void InitTIMER1(void)
{
	/* Step 1. Enable and Select Timer clock source */          
	SYSCLK->CLKSEL1.TMR1_S = 0;	//Select 12Mhz for Timer1 clock source 
    SYSCLK->APBCLK.TMR1_EN =1;	//Enable Timer1 clock source

	/* Step 2. Select Operation mode */	
	TIMER1->TCSR.MODE=PERIODIC;		//Select periodic mode for operation mode

	/* Step 3. Select Time out period = (Period of timer clock input) * (8-bit Prescale + 1) * (24-bit TCMP)*/
	TIMER1->TCSR.PRESCALE=255;	// Set Prescale [0~255]
	TIMER1->TCMPR = 46875;		// Set TCMPR [0~16777215]								
								// (1/12000000)*(255+1)*46875 = 1 sec / 1 Hz

	/* Step 4. Enable interrupt */
	TIMER1->TCSR.IE = 1;
	TIMER1->TISR.TIF = 1;		//Write 1 to clear for safty		
	NVIC_EnableIRQ(TMR1_IRQn);	//Enable Timer1 Interrupt

	/* Step 5. Enable Timer module */
	TIMER1->TCSR.CRST = 1;		//Reset up counter
	TIMER1->TCSR.CEN = 1;		//Enable Timer1

//  	TIMER1->TCSR.TDR_EN=1;		// Enable TDR function
}

void TMR1_IRQHandler(void) // Timer1 interrupt subroutine 
{
	char TEXT2[16]="Timer1:        ";
	Timer1Counter+=1;
	sprintf(TEXT2+7,"%d",Timer1Counter);
	print_Line(2, TEXT2);
 	TIMER1->TISR.TIF =1; 	  

  DrvGPIO_ClrBit(E_GPA,13); // GPA13 = Green, 0 : on, 1 : off
	DrvSYS_Delay(1000000);			  
  DrvGPIO_SetBit(E_GPA,13); // GPA14 = Red,   0 : on, 1 : off
	
}

int32_t main (void)
{
	UNLOCKREG();
	SYSCLK->PWRCON.XTL12M_EN = 1;//Enable 12MHz Crystal
	SYSCLK->CLKSEL0.HCLK_S = 0;
	LOCKREG();

	init_LCD(); 
	clear_LCD();
	
	print_Line(0,"Smpl_Timer");                        
	InitTIMER0();
	InitTIMER1();

	while(1)
	{
		__NOP(); // No Operation
	}
}
