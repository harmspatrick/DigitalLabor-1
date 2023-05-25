/*
 * Aufgabe_2_1.S
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe :  Multiplikation durch wiederholte Addition
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global _start /* Specify global symbol */
_start:
      
      .equ A,4
      .equ B,0
      mov r0,#A
      mov r1,#B

      ldr r2, =0  // Carry1
      ldr r3, =0  // Carry2



           // Schleife Multiplikation
      movs r1,r1
      beq ende    // Branch equal --> ende
beginn:
      adds r2,r2,r0
      add r3,r3,#1
      subs r1,r1,#1
      bne beginn

      // Ja es lässt sich auch am Ende der Schleife testen

ende:             // Label ende
	

stop:
	nop
	bal stop
.end
