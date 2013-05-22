#include "xparameters.h"
#include <stdio.h>
#include "xutil.h"
#include "xuartps.h" //if PS uart is used
#include "xscutimer.h" //if PS Timer is used
#include "xaxicdma.h" //if CDMA is used
#include "xscugic.h"	//if PS GIC is used
#include "xil_exception.h"	//if interrupt is used
#include "xil_cache.h"
#include "xil_printf.h"

#define RESET_LOOP_COUNT	10	//Number of times to check reset is done
#define LENGTH	32768	//source and destination buffers lengths in number of bytes
#define BRAM_MEMORY 0x80000000	//Address of BRAM Port B mapped through 2nd BRAM controller
#define DDR_MEMORY 0x1000000	//1M
#define TIMER_DEVICE_ID XPAR_SCUTIMER_DEVICE_ID
#define TIMER_LOAD_VALUE	0xFFFFFFFF
#define INTC_DEVICE_INT_ID	XPAR_SCUGIC_SINGLE_DEVICE_ID

volatile static int Done = 0;	//DMA transfer is done
volatile static int Error = 0;	/*DMA bus error occurs*/

XUartPs Uart_Ps;	//Instance of the UART device
XScuTimer Timer;	//Cortex A9 SCU Private Timer Instance
XScuGic Gic;	//PS GIC

int	getNumber()
{
	Xuint8	byte;
	Xuint8	uartBuffer[16];
	Xboolean	validNumber;
	int digitIndex;
	int digit,number,sign;
	int c;

	while(1)
	{
		byte = 0x0;
		digit = 0;
		digitIndex = 0;
		number = 0;
		validNumber = XTRUE;


		//get bytes from uart until RETURN is entered
		while(byte != 0x0d)
		{
			while(!XUartPs_IsReceiveData(STDIN_BASEADDRESS));
			byte = XUartPs_ReadReg(STDIN_BASEADDRESS,XUARTPS_FIFO_OFFSET);

			uartBuffer[digitIndex] = byte;
			XUartPs_Send(&Uart_Ps,&byte,1);
			digitIndex++;
		}

		//calculate number from string of digits
		for(c=0;c <(digitIndex - 1);c++)
		{
			if(c == 0)
			{
				//check if first byte is a "-"
				if(uartBuffer[c]==0x2D)
				{
					sign = -1;
					digit = 0;
				}
				//check if first byte is a digit
				else if((uartBuffer[c]>>4)==0x03)
				{
					sign = 1;
					digit = (uartBuffer[c]&0x0F);
				}
				else
					validNumber = XFALSE;
			}//if(c==0)
			else
			{
				//check byte is a digit
				if((uartBuffer[c]>>4) == 0x03)
					digit = (uartBuffer[c]&0x0F);
				else
					validNumber = XFALSE;
			}//else
			number = (number *10)+ digit;
		}//for
		number *=sign;
		if(validNumber == XTRUE)
		{
			print("\r\n");
			return number*4;//number of bytes
		}
		print("This is not a valid number.\n\r");
	}//while(1)
}


static void Example_CallBack(void *CallBackRef,u32 IrqMask,int *IgnorePtr)
{
	if(IrqMask & XAXICDMA_XR_IRQ_ERROR_MASK)
	{
		Error = 1;
	}
	if(IrqMask & XAXICDMA_XR_IRQ_IOC_MASK)
		Done = 1;
}

int SetupIntrSystem(XScuGic *GicPtr,XAxiCdma *DmaPtr)
{
	int Status;
	Xil_ExceptionInit();

	//connect the interrupt controller interrupt handler to the hardware interrupt handling logic in
	//the processor
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_IRQ_INT,(Xil_ExceptionHandler)XScuGic_InterruptHandler,GicPtr);

	//connect a device driver handler that will be called when an interrupt for the device occurs,
	//the device driver handler performs the specific interrupt processing for the device
	Status = XScuGic_Connect(GicPtr,XPAR_FABRIC_AXICDMA_0_VEC_ID,
							(Xil_InterruptHandler)XAxiCdma_IntrHandler,
							(void*)DmaPtr
							);

	if(Status != XST_SUCCESS)
		return XST_FAILURE;
	//Enable the interrupt for the device
	XScuGic_Enable(GicPtr,XPAR_FABRIC_AXICDMA_0_VEC_ID);

	return XST_SUCCESS;
}


Xuint8 menu(void)
{
	Xuint8 byte;
	print("Enter 1 for BRAM to BRAM transfer\r\n");
	print("Enter 2 for BRAM to DDR3 transfer\r\n");
	print("Enter 3 for DDR3 to BRAM transfer\r\n");
	print("Enter 4 for DDR3 to DDR3 transfer\r\n");
	print("Enter 5 to exit\r\n");

	while(!XUartPs_IsReceiveData(STDIN_BASEADDRESS));
	byte = XUartPs_ReadReg(STDIN_BASEADDRESS,
											XUARTPS_FIFO_OFFSET);
	XUartPs_Send(&Uart_Ps,&byte,1);
	return (byte);
}


int main(void)
{
	Xuint8 select;
	int i,CDMA_Status;
	int numofbytes;
	u8 * source,*destination;
	u8 * source_save,*destination_save;
	Xint32 software_cycles,interrupt_cycles,polled_cycles;
	int test_done = 0;

	//UART related definitions
	int Status;
	XUartPs_Config *Config;

	volatile u32 CntValue;
	XScuTimer_Config *ConfigPtr;
	XScuTimer*TimerInstancePtr = &Timer;

	//
	XAxiCdma xcdma;
	XAxiCdma_Config *CdmaCfgPtr;

	XScuGic_Config *GicConfig;

	Config = XUartPs_LookupConfig(XPAR_PS7_UART_1_DEVICE_ID);
	if(NULL == Config)
	{
		return XST_FAILURE;
	}

	Status = XUartPs_CfgInitialize(&Uart_Ps,Config,Config->BaseAddress);
	if(Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	//initialize timer counter
	ConfigPtr = XScuTimer_LookupConfig(TIMER_DEVICE_ID);
	Status = XScuTimer_CfgInitialize(TimerInstancePtr,ConfigPtr,ConfigPtr->BaseAddr);
	if(Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}

	//initialize GIC
	GicConfig = XScuGic_LookupConfig(INTC_DEVICE_INT_ID);
	if(NULL == GicConfig)
	{
		xil_printf("XScuGic_LookupConfig(%d) failed!\r\n",INTC_DEVICE_INT_ID);
		return XST_FAILURE;
	}
	Status = XScuGic_CfgInitialize(&Gic,GicConfig,GicConfig->CpuBaseAddress);
	if(Status != XST_SUCCESS)
	{
		xil_printf("XScuGic_CfgInitialize failed!\r\n");
		return XST_FAILURE;
	}

	//Disable DCache
	Xil_DCacheDisable();



	//
	XScuTimer_LoadTimer(TimerInstancePtr,TIMER_LOAD_VALUE);

	//
	XScuTimer_Start(TimerInstancePtr);

	print("--Simple DMA Design Example!\r\n");

	CntValue = XScuTimer_GetCounterValue(TimerInstancePtr);

	xil_printf("Above message printing took %d clock cycles!\r\n",TIMER_LOAD_VALUE-CntValue);

	CdmaCfgPtr = XAxiCdma_LookupConfig(XPAR_AXI_CDMA_0_DEVICE_ID);
	if(!CdmaCfgPtr)
	{
		return XST_FAILURE;
	}
	Status = XAxiCdma_CfgInitialize(&xcdma,CdmaCfgPtr,CdmaCfgPtr->BaseAddress);
	if(Status != XST_SUCCESS)
	{
		xil_printf("Status=%x\r\n",Status);
		return XST_FAILURE;
	}

	print("Central DMA initialize\r\n");

	print("Setting up interrupt system\r\n");

	Status = SetupIntrSystem(&Gic,&xcdma);
	if(Status != XST_SUCCESS)
	{
		return XST_FAILURE;
	}
	Xil_ExceptionEnable();
	print("Enter number of words you want to transfter between 1 and 8192\r\n");

	numofbytes = getNumber();
	if(numofbytes > 32768)
		numofbytes = 32768;
	select = menu();
	test_done = 0;
	while(test_done == 0)
	{
		switch(select)
		{
		case '1':
			source = source_save = BRAM_MEMORY;
			destination = destination_save = BRAM_MEMORY+LENGTH;
			print("BRAM to BRAM transfer\r\n");
			break;
		case '2':
			source = source_save = BRAM_MEMORY;
			destination = destination_save = DDR_MEMORY;
			print("BRAM to DDR transfer\r\n");
			break;
		case '3':
			source = source_save = DDR_MEMORY;
			destination = destination_save = BRAM_MEMORY;
			print("DDR to BRAM transfer\r\n");
			break;
		case '4':
			source = source_save = DDR_MEMORY;
			destination = destination_save = DDR_MEMORY + LENGTH;
			print("DDR to DDR transfer\r\n");
			break;
		case '5':
			test_done = 1;
			break;
		default:
			source = source_save = DDR_MEMORY;
			destination = destination_save = DDR_MEMORY + LENGTH;
			print("DDR to DDR transfer\r\n");
			break;
		}
		if(test_done)
			break;
		//initialize src memory
		for(i=0;i<numofbytes;++i)
		{
			*(source+i)=numofbytes-i;
		}

		//Non-DMA mode
		//reset timer
		XScuTimer_RestartTimer(TimerInstancePtr);

		for(i=0;i<numofbytes;++i)
			*(destination+i)=*(source+i);
		CntValue = XScuTimer_GetCounterValue(TimerInstancePtr);
		xil_printf("Moving %d bytes through processor took %d clock cycles\r\n",numofbytes,TIMER_LOAD_VALUE-CntValue);
		software_cycles = TIMER_LOAD_VALUE - CntValue;

		for(i=0;i<numofbytes;++i)
			*(destination+i)=0;

		//DMA in polling mode
		XAxiCdma_IntrDisable(&xcdma,XAXICDMA_XR_IRQ_ALL_MASK);
		print("Starting transfer through DMA in poll mode\r\n");
		//reset timer
		XScuTimer_RestartTimer(TimerInstancePtr);
		Status = XAxiCdma_SimpleTransfer(&xcdma,(u32)source,(u32)destination,numofbytes,NULL,NULL);

		if(Status != XST_SUCCESS)
		{
			CDMA_Status = XAxiCdma_GetError(&xcdma);
			if(CDMA_Status != 0)
			{
				XAxiCdma_Reset(&xcdma);
				xil_printf("Error code = %x\r\n",CDMA_Status);
			}
			return XST_FAILURE;
		}
		while(XAxiCdma_IsBusy(&xcdma));//wait
		CntValue = XScuTimer_GetCounterValue(TimerInstancePtr);
		CDMA_Status = XAxiCdma_GetError(&xcdma);
		if(CDMA_Status != 0)
		{
			XAxiCdma_Reset(&xcdma);
			xil_printf("Erorr code =0x%x\r\n",CDMA_Status);
		}
		else
		{
			xil_printf("Moving %d bytes through DMA in poll mode took %d clock cycles\r\n",numofbytes,TIMER_LOAD_VALUE-CntValue);
			print("Transfer complete\r\n");
			polled_cycles = TIMER_LOAD_VALUE - CntValue;
			Error = 0;
		}

		destination = destination_save;
		source = source_save;

		for(i=0;i<numofbytes;++i)
		{
			if(destination[i] != source[i])
			{
				xil_printf("Data match failed at =%d,source data =0x%x,destination data =0x%x\r\n",i,source[i],destination[i]);
				break;
			}
		}//for
		print("Transfer data verified\r\n");
		xil_printf("Improvement using Polled DMA %d %%\r\n",(software_cycles-polled_cycles)*100/software_cycles);

		//setting up for interrupt driven DMA
		//clear destination memory
		for(i=0;i<numofbytes;i++)
			*(destination)=0;
		Error = 0;
		Done = 0;
		XAxiCdma_IntrEnable(&xcdma,XAXICDMA_XR_IRQ_ALL_MASK);
		Status = XAxiCdma_SimpleTransfer(&xcdma,(u32)source,(u32)destination,numofbytes,Example_CallBack,(void*)&xcdma);

		//reset timier
		XScuTimer_RestartTimer(TimerInstancePtr);
		while((Done == 0)&(Error == 0))
		{
			CntValue = XScuTimer_GetCounterValue(TimerInstancePtr);
		}

		if(Error != 0)
		{
			xil_printf("Error Code =0x%x\r\n",XAxiCdma_GetError(&xcdma));
			XAxiCdma_Reset(&xcdma);
		}
		else
		{
			xil_printf("Moving %d bytes through DMA in Interrupt mode take %d clock cycles\r\n",numofbytes,TIMER_LOAD_VALUE-CntValue);
			print("Transfer Complete\r\n");
			interrupt_cycles = TIMER_LOAD_VALUE - CntValue;
			Error = 0;
		}

		destination = destination_save;
		source = source_save;

		for(i=0;i<numofbytes;++i)
		{
			if(destination[i] != source[i])
			{
				xil_printf("Data match failed at =%d,source data =0x%x,destination data =0x%x\r\n",i,source[i],destination[i]);
				break;
			}
		}//for
		print("Transfer data verified\r\n");
		xil_printf("Improvement using Interrupt DMA %d %%\r\n",(software_cycles-interrupt_cycles)*100/software_cycles);

		Error = 0;
		Done = 0;
		select = menu();
	}

	print("--Exiting main()--\r\n");
	return 0;
}
