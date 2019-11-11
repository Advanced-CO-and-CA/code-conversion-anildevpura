/******************************************************************************
* file: Lab_Assignment_5.1.s
* author: Anil Kumar Devpura
* Guide: Prof. Madhumutyam IITM, PACE and G S Nitesh Narayana
******************************************************************************/

  @ BSS section
      .bss
		H_DIGIT: .byte 0
  @ DATA SECTION
    .data
		A_DIGIT: .byte 0x45		

  @ TEXT section
      .text

.globl _main

_main:
	@Initilization 
	LDR R0,=A_DIGIT				 /*load the address of A_DIGIT*/
	LDR R2,=H_DIGIT 			 /*load the address of H_DIGIT*/
	LDR R1,[R0] 				 /*load the content of A_DIGIT*/
	CMP R1,#0x41 				 /* Comparing to know if the given number is alphabet of a digit ? */
	BLT DIGIT   				 /* For handling 0 to 9 */
	SUB R1,R1,#0x41 			 /* For chars#, 0 is A, 1 for B and so on */
	ADD R1,R1,#0xA  			 /* Adding A to char# */
	B STORE

DIGIT:
	SUB R1,R1,#0x30 			 /*subtracting zero to get the digit , 0=>0x30, */

STORE:
	STR R1,[R2]					/*store the result*/
	SWI 0x11					/*end signal */
	.end