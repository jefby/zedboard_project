#include "xparameters.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "xil_cache.h"
#include "devcfg.h"
#include "xil_io.h"
#include "xil_types.h"

// Parameters for Partial Reconfiguration
#define LAB1_ELFBIN_ADDR  0x00200000 // BIN formatted ELF address
#define LAB1_ELFBINFILE_LEN  0x0000c00c // BIN formatted ELF length
#define LAB1_ELF_EXEC_ADDR  0x002003c0 // ELF main() entry point
#define LAB1_BITFILE_ADDR   0x00210000 // BIT file storage address
#define LAB1_BITFILE_LEN  0x03dbafc // BIN formatted BITfile length

#define LAB3_ELFBIN_ADDR  0x00600000
#define LAB3_ELFBINFILE_LEN  0x0000c00c
#define LAB3_ELF_EXEC_ADDR  0x006003c0
#define LAB3_BITFILE_ADDR   0x00610000
#define LAB3_BITFILE_LEN  0x003dbafc

#define QSPI_BASEADDR 0xFC000000

// Read function for STDIN
extern char inbyte(void);

static int Reset = 1;

// Driver Instantiations
static XDcfg *XDcfg_0;

// prototype for load_elf
void load_elf(u32 loadaddress);

void *(memcpy_qspi)(void * s1, const void * s2, u32 n)
{
	char *dst = (char *)s1;
	char *src = (char *)s2;

	/* Loop and copy.	*/
	while (n-- != 0)
		*dst++ = *src++;
	return s1;
}


int main()
{
	int Status;
	u32 FlashReadAddress=0;
	u32 DdrDestinationAddress=0;


	// Initialize Device Configuration Interface
	XDcfg_0 = XDcfg_Initialize(XPAR_XDCFG_0_DEVICE_ID);

	// transfer the lab1elf.bin into the DDR memory at 0x00200000
	FlashReadAddress=QSPI_BASEADDR+LAB1_ELFBIN_ADDR;
	DdrDestinationAddress=LAB1_ELFBIN_ADDR;
	memcpy_qspi((unsigned char *)DdrDestinationAddress, (unsigned char *)FlashReadAddress, LAB1_ELFBINFILE_LEN);

	// transfer the lab3elf.bin into the DDR memory at 0x00600000
	FlashReadAddress=QSPI_BASEADDR+LAB3_ELFBIN_ADDR;
	DdrDestinationAddress=LAB3_ELFBIN_ADDR;
	memcpy_qspi((unsigned char *)DdrDestinationAddress, (unsigned char *)FlashReadAddress, LAB3_ELFBINFILE_LEN);

	// Display Menu
    int Exit = 0;
    int OptionCurr;
    int OptionNext = 1; // start-up default
	while(Exit != 1) {
		do {
			print("    1: Lab1\n\r");
			print("    2: Lab3\n\r");
			print("    0: Exit\n\r");
			print("> ");

			OptionCurr = OptionNext;
			OptionNext = inbyte();
			if (isalpha(OptionNext)) {
				OptionNext = toupper(OptionNext);
			}

			xil_printf("%c\n\r", OptionNext);
		} while (!isdigit(OptionNext));

		if (OptionCurr == OptionNext)
			continue;

		switch (OptionNext) {
			case '0':
				Exit = 1;
				break;
			case '1':
				Reset = 1;
				// Flush and disable Data Cache
				Xil_DCacheDisable();
				xil_printf("Moving lab1 BIT file\n\r");
				// Invalidate and enable Data Cache
				Xil_DCacheEnable();
				Xil_Out32(0xF8000008,0x0000DF0D); // Unlock devcfg.SLCR
				Xil_Out32(0xF8000900,0x0); // turn-off the level shifter
				Xil_Out32(0xF8000240,0xFFFFFFFF); // Put all FCLK in reset condition for 1.0 silicon for 3.0 it should be opposite
				Status = XDcfg_TransferBitfile(XDcfg_0, QSPI_BASEADDR+LAB1_BITFILE_ADDR, LAB1_BITFILE_LEN);
				if (Status != XST_SUCCESS) {
					xil_printf("Error : FPGA configuration failed!\n\r");
					exit(EXIT_FAILURE);
				}
				xil_printf("Lab1.bin moved to PL!, executing its application.\n\r");
				Xil_Out32(0xF8000900, 0xF); // turn-ON the level shifter
				Xil_Out32(0xF8000240,0x00000000); // Bring all FCLK out of reset condition
				Xil_Out32(0xF8000004,0x767B); // Lock devcfg.SLCR
				load_elf(LAB1_ELF_EXEC_ADDR);
				break;
			case '2':
				Reset = 1;
				// Flush and disable Data Cache
				Xil_DCacheDisable();
				xil_printf("Moving lab3 BIT file\n\r");
				// Invalidate and enable Data Cache
				Xil_DCacheEnable();
				Xil_Out32(0xF8000008,0x0000DF0D); // Unlock devcfg.SLCR
				Xil_Out32(0xF8000900,0x0); // turn-off the level shifter
				Xil_Out32(0xF8000240,0xFFFFFFFF); // Put all FCLK in reset condition for 1.0 silicon for 3.0 it should be opposite
				Status = XDcfg_TransferBitfile(XDcfg_0, QSPI_BASEADDR+LAB3_BITFILE_ADDR, LAB3_BITFILE_LEN);
				if (Status != XST_SUCCESS) {
					xil_printf("Error : FPGA configuration failed!\n\r");
					exit(EXIT_FAILURE);
				}
				xil_printf("Lab3.bin moved to PL!, executing its application.\n\r");
				Xil_Out32(0xF8000900, 0xF); // turn-ON the level shifter
				Xil_Out32(0xF8000240,0x00000000); // Bring all FCLK out of reset condition
				Xil_Out32(0xF8000004,0x767B); // Lock devcfg.SLCR
				load_elf(LAB3_ELF_EXEC_ADDR);
				break;
			default:
				break;
		}
	}

    return 0;
}

