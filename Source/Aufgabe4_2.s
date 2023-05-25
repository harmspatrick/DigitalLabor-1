/*
 * Aufgabe_4_2.S
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe : BCD-Addition
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global _start /* Specify global symbol */
_start:

    ldr sp,=0x40001000

  
    ldr r2, = 0x12345678  //NumA
    ldr r3, = 0x55555555  //NumB
    ldr r4, = 8       //Count
    ldr r5, = 0x0f    //Maske

    bl Addition
    b stop
  

  Addition:
    stmfd sp!, {r2 - r5, lr}

    ldr r6, = 0       //BCD_cy (Carry)
    ldr r7, = 0       //Result
    ldr r8, = 0x0     //tem1
    ldr r9, = 0x0     //tem2

  Countgroesser0:
    and r8, r2, r5
    and r9, r3, r5
    add r8, r9
    add r8, r6
    subs r8, #10
    bcs true
    add r8, #10
    ldr r6, = 0

  ifend:
    add r7, r8
    mov r2, r2, ror #4
    mov r3, r3, ror #4
    mov r7, r7, ror #4
    subs r4, #1
    bne Countgroesser0
    ldmfd sp!, {r2 - r5, pc}


  true:
    ldr r6, = 1 //Carry Bit
    b ifend



  stop:
  	nop
  	bal stop

  .end