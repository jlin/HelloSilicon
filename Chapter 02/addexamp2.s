//
// Example of 128-Bit addition with the ADD/ADC instructions.
//
.global _start	            // Provide program starting address to linker
.align 4

// Load the registers with some data
// First 64-bit number is 0x0000000000000003FFFFFFFFFFFFFFFF
_start:	MOV	X2, #0x0000000000000003
	MOV	X3, #0xFFFFFFFFFFFFFFFF	//Assembler will change to MOVN
// Second 64-bit number is 0x00000000000000050000000000000001
	MOV	X4, #0x0000000000000005
	MOV	X5, #0x0000000000000001

	ADDS	X1, X3, X5	// Lower order word
	ADC	X0, X2, X4	// Higher order word

// Setup the parameters to exit the programc
// and then call the kernel to do it.
// X0 is the return code and will be what we
// calculated above.
	MOV     X16, #1		// System call number 1 terminates this program
	SVC     #0x80		// Call kernel to terminate the program

