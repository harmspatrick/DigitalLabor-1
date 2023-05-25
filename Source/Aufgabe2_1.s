/*
 * Aufgabe_2_1.S
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe : 64 Bit Addition
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global _start /* Specify global symbol */
_start:
	
      mov r0, #2
      mov r1, #(1<<31)
      mov r2, #1
      mov r3, #(1<<31)
      ldr r4, =0
      ldr r5, =0  // Carry1
      ldr r6, =0
      ldr r7, =0  // Carry2
      

//add_loop:                 // loop

      adds r6,r1,r3      // Add r1 and r3, accumulate resoult in r6, sett addition flags
      adcs r7,r0,r2     // Add r0 (A) und r2 (C) und speicher in r7


      movcs r5,#1
      movcc r5,#0
      

//      bcc add_loop      // if carry bit is clear jump to adress of add_loop label
	

stop:
	nop
	bal stop
.end
