
#include <stdio.h>
#include <xil_io.h>
#include <sleep.h>
#include "xiicps.h"
#include <xil_printf.h>
#include <xparameters.h>
#include "lab6.h"
#include "xuartps.h"
#include "fir.h"
#include "xfir_fir_io.h"


unsigned char IicConfig(unsigned int DeviceIdPS);
void AudioPllConfig();
void AudioWriteToReg(unsigned char u8RegAddr, unsigned char u8Data);
void AudioConfigureJacks();
void LineinLineoutConfig();
void fir_software (short *y, short x);

XIicPs Iic;

typedef short		Xint16;
typedef long		Xint32;

void bypass_filter(void)
{
	unsigned long u32DataL, u32DataR;
	unsigned long u32Temp;

	while (1)
	{

		do //wait for RX data to become available
		{
			u32Temp = Xil_In32(I2S_STATUS_REG);
		} while ( u32Temp == 0);

		Xil_Out32(I2S_STATUS_REG, 0x00000001); //Clear data rdy bit

		u32DataL = Xil_In32(I2S_DATA_RX_L_REG);
		u32DataR = Xil_In32(I2S_DATA_RX_R_REG);
		Xil_Out32(I2S_DATA_TX_L_REG, u32DataL);
		Xil_Out32(I2S_DATA_TX_R_REG, u32DataR);
	}
}

void filter_input(void)
{
	unsigned long u32DataL, u32DataR;
	unsigned long u32Temp;
	Xint16 Sample_L, Sample_R;

	while (1)
	{
		do //wait for RX data to become available
		{
			u32Temp = Xil_In32(I2S_STATUS_REG);
		} while ( u32Temp == 0);

		Xil_Out32(I2S_STATUS_REG, 0x00000001); //Clear data rdy bit

		u32DataL = Xil_In32(I2S_DATA_RX_L_REG);
		u32DataR = Xil_In32(I2S_DATA_RX_R_REG);
		Sample_L = (u32DataL >> 8);
		Sample_R = (u32DataR >> 8);

		Xil_Out32(XPAR_FIR_LEFT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_X_DATA, Sample_L); // send left channel sample
		Xil_Out32(XPAR_FIR_RIGHT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_X_DATA, Sample_R); // send right channel sample
		Xil_Out32(XPAR_FIR_LEFT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_AP_CTRL, 0x1); // pulse ap_start left channel
		Xil_Out32(XPAR_FIR_LEFT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_AP_CTRL, 0x0);
		Xil_Out32(XPAR_FIR_RIGHT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_AP_CTRL, 0x1); // pulse ap_start right channel
		Xil_Out32(XPAR_FIR_RIGHT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_AP_CTRL, 0x0);
		while(1){
			if(Xil_In32(XPAR_FIR_LEFT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_Y_CTRL))
				break;
			else
				continue;
		}
		Sample_L = Xil_In32(XPAR_FIR_LEFT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_Y_DATA);
		while(1){
			if(Xil_In32(XPAR_FIR_RIGHT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_Y_CTRL))
				break;
			else
				continue;
		}
		Sample_R = Xil_In32(XPAR_FIR_RIGHT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_Y_DATA);

		u32DataL = Sample_L << 8;
		u32DataR = Sample_R << 8;
		Xil_Out32(I2S_DATA_TX_L_REG, u32DataL);
		Xil_Out32(I2S_DATA_TX_R_REG, u32DataR);
	}
}

void filter_hw_accel_input(short * Sample_L_out, short Sample_L_in)
{

		Xil_Out32(XPAR_FIR_LEFT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_X_DATA, Sample_L_in); // send left channel sample
		Xil_Out32(XPAR_FIR_LEFT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_AP_CTRL, 0x1); // pulse ap_start left channel
		Xil_Out32(XPAR_FIR_LEFT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_AP_CTRL, 0x0);
		while(1){
			if(Xil_In32(XPAR_FIR_LEFT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_Y_CTRL))
				break;
			else
				continue;
		}
		*Sample_L_out = Xil_In32(XPAR_FIR_LEFT_S_AXI_FIR_IO_BASEADDR+XFIR_FIR_IO_ADDR_Y_DATA);
}

int main(void)
{
	int sw_check;
	short signal, output;

	//Configure the IIC data structure
	IicConfig(XPAR_XIICPS_0_DEVICE_ID);

	//Configure the Audio Codec's PLL
	AudioPllConfig();

	//Configure the Line in and Line out ports.
	//Call LineInLineOutConfig() for a configuration that
	//enables the HP jack too.
	AudioConfigureJacks();

	sw_check = Xil_In32(XPAR_AXI_GPIO_0_BASEADDR+8);

	if(sw_check & 0x1) // SW0 determines if want to profile or run
	{
	  int i;
	  for (i=0;i<SAMPLES;i++) {
		  if(i==0)
			  signal = 0x8000;
		  else
			  signal = 0;
		  #ifdef SW_PROFILE
		  	  fir_software(&output,signal);
		  #else
		  	  filter_hw_accel_input(&output,signal);
		  #endif
	  }
	}
	else
	{
		if(sw_check & 0x2)   // SW1 determines if want to filter or bypass
			bypass_filter(); // if SW1=1 then bypass the filter
		else
			filter_input();  // if SW1=0 then use the hardware filter
	}
    return 0;
}

unsigned char IicConfig(unsigned int DeviceIdPS)
{

	XIicPs_Config *Config;
	int Status;

	//Initialize the IIC driver so that it's ready to use
	//Look up the configuration in the config table, then initialize it.
	Config = XIicPs_LookupConfig(DeviceIdPS);
	if(NULL == Config) {
		return XST_FAILURE;
	}

	Status = XIicPs_CfgInitialize(&Iic, Config, Config->BaseAddress);
	if(Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	//Set the IIC serial clock rate.
	XIicPs_SetSClk(&Iic, IIC_SCLK_RATE);

	return XST_SUCCESS;
}


/******************************************************************************
 * Configures audio codes's internal PLL. With MCLK = 8 MHz it configures the
 * PLL for a VCO frequency = 49.152 MHz, and an audio sample rate of 48 KHz.
 *
 * @param	none.
 *
 * @return	none.
 *****************************************************************************/
void AudioPllConfig() {

	unsigned char u8TxData[8], u8RxData[6];
	int Status;

	Status = IicConfig(XPAR_XIICPS_0_DEVICE_ID);//, FMC_IIC_ID, HDMI_IIC_ID);
	if(Status != XST_SUCCESS) {
		xil_printf("\nError initializing IIC");
		//return XST_FAILURE;
	}

	AudioWriteToReg(R0_CLOCK_CONTROL, 0x0E);

	// Write 6 bytes to R1
	u8TxData[0] = 0x40;
	u8TxData[1] = 0x02;
	u8TxData[2] = 0x02; // byte 1
	u8TxData[3] = 0x71; // byte 2
	u8TxData[4] = 0x02; // byte 3
	u8TxData[5] = 0x3C; // byte 4
	u8TxData[6] = 0x21; // byte 5
	u8TxData[7] = 0x01; // byte 6


	XIicPs_MasterSendPolled(&Iic, u8TxData, 8, (IIC_SLAVE_ADDR >> 1));
	while(XIicPs_BusIsBusy(&Iic));

	// Poll PLL Lock bit
	u8TxData[0] = 0x40;
	u8TxData[1] = 0x02;

	do {
		XIicPs_MasterSendPolled(&Iic, u8TxData, 2, (IIC_SLAVE_ADDR >> 1));
		while(XIicPs_BusIsBusy(&Iic));
		XIicPs_MasterRecvPolled(&Iic, u8RxData, 6, (IIC_SLAVE_ADDR >> 1));
		while(XIicPs_BusIsBusy(&Iic));
	}
	while((u8RxData[5] & 0x02) == 0);

	AudioWriteToReg(R0_CLOCK_CONTROL, 0x0F);//COREN
}

/******************************************************************************
 * Function to write one byte (8-bits) to one of the registers from the audio
 * controller.
 *
 * @param	u8RegAddr is the LSB part of the register address (0x40xx).
 * @param	u8Data is the data byte to write.
 *
 * @return	none.
 *****************************************************************************/
void AudioWriteToReg(unsigned char u8RegAddr, unsigned char u8Data) {

	unsigned char u8TxData[3];

	u8TxData[0] = 0x40;
	u8TxData[1] = u8RegAddr;
	u8TxData[2] = u8Data;

	XIicPs_MasterSendPolled(&Iic, u8TxData, 3, (IIC_SLAVE_ADDR >> 1));
	while(XIicPs_BusIsBusy(&Iic));
}

/******************************************************************************
 * Configures audio codes's various mixers, ADC's, DAC's, and amplifiers to
 * accept stereo input from line in and push stereo output to line out
 *
 * @param	none.
 *
 * @return	none.
 *****************************************************************************/
void AudioConfigureJacks()
{
	AudioWriteToReg(R4_RECORD_MIXER_LEFT_CONTROL_0, 0x01); //enable mixer 1
	AudioWriteToReg(R5_RECORD_MIXER_LEFT_CONTROL_1, 0x07); //unmute Left channel of line in into mxr 1 and set gain to 6 db
	AudioWriteToReg(R6_RECORD_MIXER_RIGHT_CONTROL_0, 0x01); //enable mixer 2
	AudioWriteToReg(R7_RECORD_MIXER_RIGHT_CONTROL_1, 0x07); //unmute Right channel of line in into mxr 2 and set gain to 6 db
	AudioWriteToReg(R19_ADC_CONTROL, 0x13); //enable ADCs

	AudioWriteToReg(R22_PLAYBACK_MIXER_LEFT_CONTROL_0, 0x21); //unmute Left DAC into Mxr 3; enable mxr 3
	AudioWriteToReg(R24_PLAYBACK_MIXER_RIGHT_CONTROL_0, 0x41); //unmute Right DAC into Mxr4; enable mxr 4
	AudioWriteToReg(R26_PLAYBACK_LR_MIXER_LEFT_LINE_OUTPUT_CONTROL, 0x05); //unmute Mxr3 into Mxr5 and set gain to 6db; enable mxr 5
	AudioWriteToReg(R27_PLAYBACK_LR_MIXER_RIGHT_LINE_OUTPUT_CONTROL, 0x11); //unmute Mxr4 into Mxr6 and set gain to 6db; enable mxr 6
	AudioWriteToReg(R29_PLAYBACK_HEADPHONE_LEFT_VOLUME_CONTROL, 0x00);//Mute Left channel of HP port (LHP)
	AudioWriteToReg(R30_PLAYBACK_HEADPHONE_RIGHT_VOLUME_CONTROL, 0x00); //Mute Right channel of HP port (LHP)
	AudioWriteToReg(R31_PLAYBACK_LINE_OUTPUT_LEFT_VOLUME_CONTROL, 0xE6); //set LOUT volume (0db); unmute left channel of Line out port; set Line out port to line out mode
	AudioWriteToReg(R32_PLAYBACK_LINE_OUTPUT_RIGHT_VOLUME_CONTROL, 0xE6); // set ROUT volume (0db); unmute right channel of Line out port; set Line out port to line out mode
	AudioWriteToReg(R35_PLAYBACK_POWER_MANAGEMENT, 0x03); //enable left and right channel playback (not sure exactly what this does...)
	AudioWriteToReg(R36_DAC_CONTROL_0, 0x03); //enable both DACs

	AudioWriteToReg(R58_SERIAL_INPUT_ROUTE_CONTROL, 0x01); //Connect I2S serial port output (SDATA_O) to DACs
	AudioWriteToReg(R59_SERIAL_OUTPUT_ROUTE_CONTROL, 0x01); //connect I2S serial port input (SDATA_I) to ADCs

	AudioWriteToReg(R65_CLOCK_ENABLE_0, 0x7F); //Enable clocks
	AudioWriteToReg(R66_CLOCK_ENABLE_1, 0x03); //Enable rest of clocks
}

/******************************************************************************
 * Configures Line-In input, ADC's, DAC's, Line-Out and HP-Out.
 *
 * @param   none.
 *
 * @return	none.
 *****************************************************************************/
void LineinLineoutConfig() {

	AudioWriteToReg(R17_CONVERTER_CONTROL_0, 0x06);//96 kHz
	AudioWriteToReg(R64_SERIAL_PORT_SAMPLING_RATE, 0x06);//96 kHz
	AudioWriteToReg(R19_ADC_CONTROL, 0x13);
	AudioWriteToReg(R36_DAC_CONTROL_0, 0x03);
	AudioWriteToReg(R35_PLAYBACK_POWER_MANAGEMENT, 0x03);
	AudioWriteToReg(R58_SERIAL_INPUT_ROUTE_CONTROL, 0x01);
	AudioWriteToReg(R59_SERIAL_OUTPUT_ROUTE_CONTROL, 0x01);
	AudioWriteToReg(R65_CLOCK_ENABLE_0, 0x7F);
	AudioWriteToReg(R66_CLOCK_ENABLE_1, 0x03);

	AudioWriteToReg(R4_RECORD_MIXER_LEFT_CONTROL_0, 0x01);
	AudioWriteToReg(R5_RECORD_MIXER_LEFT_CONTROL_1, 0x05);//0 dB gain
	AudioWriteToReg(R6_RECORD_MIXER_RIGHT_CONTROL_0, 0x01);
	AudioWriteToReg(R7_RECORD_MIXER_RIGHT_CONTROL_1, 0x05);//0 dB gain

	AudioWriteToReg(R22_PLAYBACK_MIXER_LEFT_CONTROL_0, 0x21);
	AudioWriteToReg(R24_PLAYBACK_MIXER_RIGHT_CONTROL_0, 0x41);
	AudioWriteToReg(R26_PLAYBACK_LR_MIXER_LEFT_LINE_OUTPUT_CONTROL, 0x03);//0 dB
	AudioWriteToReg(R27_PLAYBACK_LR_MIXER_RIGHT_LINE_OUTPUT_CONTROL, 0x09);//0 dB
	AudioWriteToReg(R29_PLAYBACK_HEADPHONE_LEFT_VOLUME_CONTROL, 0xE7);//0 dB
	AudioWriteToReg(R30_PLAYBACK_HEADPHONE_RIGHT_VOLUME_CONTROL, 0xE7);//0 dB
	AudioWriteToReg(R31_PLAYBACK_LINE_OUTPUT_LEFT_VOLUME_CONTROL, 0xE6);//0 dB
	AudioWriteToReg(R32_PLAYBACK_LINE_OUTPUT_RIGHT_VOLUME_CONTROL, 0xE6);//0 dB
}

