/*
 *
 *	write the LED port
 *	Author : jefby
 */

#include "xparameters.h"
#include "xgpio.h"
#include "xutil.h"

int main()
{
	XGpio led;
	int j = 0;
	int i;

	xil_printf("--Start of the Program -- \r\n");

	XGpio_Initialize(&led,XPAR_LED_DEVICE_ID);

	while(1)
	{
		j = 0;
		for (j=0;j<256;j++)
		{
			//write j to led
			XGpio_DiscreteWrite(&led,1,j);
			//delay 1s
			for(i=0;i<99999999;i++)
				;//delay 1 s
		}
	}
	return 0;
}
