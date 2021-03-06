#include "xparameters.h"

#define PWM_BASEADDR 0x44A00000;
#define PWM_FBADDR 0x44A00004;
#define PWM_LRADDR 0x44A00008;

volatile unsigned int *ctr = (unsigned int *) PWM_BASEADDR;
volatile unsigned int *FB = (unsigned int *) PWM_FBADDR;
volatile unsigned int *LR = (unsigned int *) PWM_LRADDR;

int main()
{
	*ctr=0x0F;
	*FB=0x1000E000;
	*LR=0xE0001000;
	for(;;);
	return 0;
}

