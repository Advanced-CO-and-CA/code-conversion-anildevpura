/******************************************************************************
* file: Lab_Assignment_5.3.s
* author: Anil Kumar Devpura
* Guide: Prof. Madhumutyam IITM, PACE and G S Nitesh Narayana
******************************************************************************/
  @ BSS section
      .bss

  @ DATA SECTION
    .data
		BCDNUM: .ascii "92529679"
		NUMBER: .word 0x00000000

  @ TEXT section
      .text

.globl _main

main: 
	LDR R1,=BCDNUM 				/*load the address of BCDNUM */
	LDR R2,=NUMBER 				/*oad the address of NUMBER*/
	LDR R3,=0x0 				/*nit with 0, counter for 8 digits*/
	LDR R4,=0x0 				/*init with 0, tmp result*/
	LDR R5,=0xA					/*init with 10, will be used to move tmp result to shift one position*/
LOOP:
	LDRB R6,[R1],#1 			/*load the BCDNUM first digit into R6*/
	AND R6,#0x0F 			    /* mask the higher order nibble, will get digit */
	MLA R4,R4,R5,R6				/*Shifting one position and adding current element.*/
	ADD R3,#1 				    /*increment the count*/
	CMP R3,#8					/*checking for end*/
	BNE LOOP					/*loop to get next string*/
	STR R4,[R2] 				/*store the result*/
	SWI 0x11					/*End Signal*/
	.end
