/*
 * Aufgabe_3_2.S
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe : : Unterprogrammaufruf mit Parameterübergabe – Delay mit Zeitvariable 
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global _start /* Specify global symbol */
_start:
      pc = r15
      lr = r14
      sp = r13
      .equ dl,2               // --> Parameterübergabe
      ldr sp, =0x40001000       

      
      .equ Numvals, 5
      .equ Sum,0
      mov r3, #Numvals
      ldr r4, = 0
      ldr r5, =datstart

CountGroesser0:
      ldr r6, [r5], #4
      adds r4, r6
      ldr r0, =dl
      bl Delay                // Branch and Link zu Delay
      subs r3, #1
      bne CountGroesser0
      b stop

Delay:
      stmfd sp!, {r7, lr} 
      ldr r7, =dl             //Parameterübergabe
      wait: subs r7, r7, #1
      bne wait
      adds r7,r7,#1           // Setzt Z Flag auf 0
      ldmfd sp!, {r7, pc}     


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