/*
 * Aufgabe_3_3.S
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe : Berechnung der Summe aus fünf Zahlen an fortlaufenden Adressen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global _start /* Specify global symbol */
_start:
      .equ Numvals, 5
      .equ Sum,0
      mov r3, #Numvals  // Count
      ldr r4, = 0       // Summe
      ldr r5, =datstart // Zeiger

CountGroesser0:
      ldr r6, [r5], #4
      adds r4, r6
      subs r3, #1
      bne CountGroesser0

stop:
	nop
	bal stop

.data 

.global datstart 

datstart:

  .word 0x01    //32 Bit Worte
  .word 0x02
  .word 0x03
  .word 0x08
  .word 0x05
  
.end
