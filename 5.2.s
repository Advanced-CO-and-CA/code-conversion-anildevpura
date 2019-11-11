/******************************************************************************
* file: Lab_Assignment_5.2.s
* author: Anil Kumar Devpura
* Guide: Prof. Madhumutyam IITM, PACE and G S Nitesh Narayana
******************************************************************************/

  @ BSS section
      .bss
		NUMBER: .word 0x00
		ERR: .word 0x00
  @ DATA SECTION
    .data
		STRING: .word 0x31, 0x31, 0x30, 0x31, 0x30, 0x30, 0x31, 0x30
		N: .word 8
  @ TEXT section
      .text

.globl _main
_main:
	@Initilization 
	LDR R0,=STRING 				/*load the address of A_DIGIT*/
	LDR R3,=NUMBER 				/*load the address of H_DIGIT*/
	LDR R4,=ERR 				/*load the address of ERR*/
	LDR R5, = N					/*load the address of N*/
	LDR R6, [R5]				/* init the counter */
	MOV R2,#0					/* init to zero */
LOOP:
	LDR R1,[R0] 				/*load the content of A_DIGIT*/
	CMP R1,#0x32 				/* Comparing to know if the given number is alphabet of a digit ? */
	BLT NUMBERUPDATE   			/* For handling 0 to 9 else error hits */
	B ERROR						/* to handle error */
END:
	SWI 0x11					/* end signal */
	

NUMBERUPDATE:
	SUB R1,R1,#0x30				/*finding digit. */
	MOV R2,R2,LSL#1				/* Left shifit */	
	ADD R2, R2, R1				/* adding current digit */
	ADD R0, R0,#4				/* For next address */
	SUBS R6,R6,#1				/* reducing counter */
	BGT LOOP					/* For next number, */
	LDR R1,=0x00				/* No error setting */
	STR R2,[R3]					/* Store the Number */
	STR R1,[R4]					/* Store the Error */
	B END

ERROR:
	LDR R1,=0x00
	LDR R2,=0xFF
	STR R1,[R3]					/* Store 00 to Number */
	STR R2,[R4]					/* Store FF, the Error */
.end