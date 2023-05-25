/*
 * Aufgabe_4_1.S
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe :  Verwendung des Stacks
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global _start /* Specify global symbol */
_start:

    ldr sp,=0x40001000

    bl Subroutine1

  stop:
  	nop
  	bal stop

  Subroutine1:

    stmfd sp!, {r7, lr}

    bl Subroutine2

    ldmfd sp!, {r7, pc}
  

  Subroutine2:

    stmfd sp!, {r7, lr}
    ldmfd sp!, {r7, pc}

  .end
