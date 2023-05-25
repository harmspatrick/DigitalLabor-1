/*
 * Aufgabe_4_3.S
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe :  Addition zweier 64bit-Zahlen
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global _start /* Specify global symbol */
_start:

    ldr sp,=0x40001000
    ldr r0, = pointer1
    ldr r1, = pointer2  
    ldr r7, = 0

    bl Addition
    b stop

  Addition:
    stmfd sp!, {r5 - r7, lr}
    ldr r5, [r0]
    ldr r6, [r1], #4    //Inkrementierung Zeiger +4
    adds r5, r6 
    addcs r7, #1        //Carry Addition

    str r5, [r0], #4
    ldr r5, [r0]
    ldr r6, [r1]
    adds r5, r6
    add r5, r7
    str r5, [r0], #-4
    ldmfd sp!, {r5 - r7, pc}


  stop:
  	nop
  	bal stop


    pointer1:
    .word 0x11111111
    .word 0x22222222

    pointer2:
    .word 0x33333333
    .word 0x11111111

  .end