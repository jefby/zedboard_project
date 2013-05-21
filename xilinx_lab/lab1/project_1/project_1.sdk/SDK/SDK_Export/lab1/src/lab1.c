/*
 * lab1.c
 *
 *  Created on: 2013-5-20
 *      Author: jefby
 */
//include the hardware information
#include "xparameters.h"
//include the gpio driver api
#include "xgpio.h"
// This file contains utility functions such as memory test functions.
#include "xutil.h"
//The Xilinx PS GPIO driver. This driver supports the Xilinx PS GPIO
// Controller.
#include "xgpiops.h"

static XGpioPs psGpioInstancePtr;
static int iPinNumber = 7;//LED LD9 is connect to MIO pin 7

int main(void)
{
	XGpio sw,led;
	int i,pshb_check,sw_check;
	//static XGpio GPIOInstance_Ptr;
	XGpioPs_Config * GpioConfigPtr;
	int xStatus;
	int iPinNumberEMIO = 54;
	u32 uPinDirectionEMIO = 0x0;
	u32 uPinDirection = 0x1;

	xil_printf("--Start of the Program!--\r\n");
	//AXI GPIO switches initialization
	XGpio_Initialize(&sw,XPAR_DIP_DEVICE_ID);
	//AXI GPIO led initialization
	XGpio_Initialize(&led,XPAR_LED_DEVICE_ID);

	//PS Gpio initialize
	GpioConfigPtr = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
	if(GpioConfigPtr == NULL)
	{
		return XST_FAILURE;
	}
	xStatus = XGpioPs_CfgInitialize(&psGpioInstancePtr,GpioConfigPtr,GpioConfigPtr->BaseAddr);
	if(XST_SUCCESS != xStatus)
	{
		print("PS GPIO INIT FAILED!\n\r");
	}

	//PS GPIO pin setting to output
	XGpioPs_SetDirectionPin(&psGpioInstancePtr,iPinNumber,uPinDirection);
	XGpioPs_SetOutputEnablePin(&psGpioInstancePtr,iPinNumber,1);

	//EMIO PIN Setting to input port
	XGpioPs_SetDirectionPin(&psGpioInstancePtr,iPinNumberEMIO,uPinDirectionEMIO);
	XGpioPs_SetOutputEnablePin(&psGpioInstancePtr,iPinNumberEMIO,0);

	xil_printf("--Press BTNR to see LED 9 lit --\r\n");
	xil_printf("--Change slide switches to see corresponding output on LEDs --\r\n");

	while(1)
	{
		sw_check = XGpio_DiscreteRead(&sw,1);//read the status of switches
		XGpio_DiscreteWrite(&led,1,sw_check);//write the led with the sw_check
		pshb_check = XGpioPs_ReadPin(&psGpioInstancePtr,iPinNumberEMIO);//read data from the iPinNumberEMIO
		XGpioPs_WritePin(&psGpioInstancePtr,iPinNumber,pshb_check);//write the value to iPinNumber(LD9)
		if(sw_check == 0xFF)
			break;
		for(i=0;i<9999999;i++);//delay loop
	}
	xil_printf("--End of Program");
	return 0;
}

