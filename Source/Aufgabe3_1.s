/*
 * Aufgabe_3_1.S
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe :  Unterprogrammaufruf – Delay
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global _start /* Specify global symbol */
_start:

      pc = r15
      lr = r14
      sp = r13

      ldr sp, =0x40001000       // RAM Start = 0x40000000, Stack = 4kByte Offset

      //stmfd sp!,              // Liste der zu sichernden Register, einschließlich Link-Register lr

      //Ab hier Programm 2_3
      .equ Numvals, 5
      .equ Sum,0
      mov r3, #Numvals        // Count
      ldr r4, = 0             // Summe
      ldr r5, =datstart       // Zeiger

CountGroesser0:
      ldr r6, [r5], #4
      adds r4, r6
      bl Delay                // Branch and Link zu Delay
      subs r3, #1
      bne CountGroesser0
      b stop

      //Neue Delay Subroutine
Delay:
      stmfd sp!, {r7, lr}     // Speichern des verwendeten Registers und des lr auf Stack
      ldr r7, =2              // Speichern mit Hilfe des Pseudobefehls den Verzögerungswert in R7
      wait: subs r7, r7, #1   // dekrementieren des Wertes bis null erreicht und beenden der Schleife.
      bne wait
      adds r7,r7,#1           // Setzt Z Flag auf 0
      ldmfd sp!, {r7, pc}     // Lesen des verwendeten Registers und des pc vom Stack


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