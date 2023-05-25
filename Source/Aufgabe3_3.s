/*
 * Aufgabe_3_3.S
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe : - Unterprogrammaufruf mit Übergabe mehrerer Parameter – Division 
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global _start /* Specify global symbol */
_start:
      pc = r15
      lr = r14
      sp = r13

      .equ A,4        //Divident
      .equ B,2        //Divisior
      .equ E,0        //Error
      .equ Q,0        //Quotient (Ergebnis der Div)

      ldr sp, =0x40001000       

      mov r2,#E       //r2 Fehlerregister
      mov r0,#A
      mov r1,#B
      mov r4,#Q

      bl Division     // Shit mist f*** L hat gefehlt!     
      b Ende          // Unbedingter Sprung zum Label Ende:


Division:
      stmfd sp!, {r4, lr}     // Speichern des verwendeten Registers und des lr auf Stack
      ldr r4,=0               // Laden von R4, Arbeitsregister mit 0
      // Prüfen ob Divisior 0 --> E =1
      movs r1,r1
      moveq r2,#1            // Fehlerregister R2 mit 1 laden
      beq divZero
      
div:  add r4,r4,#1            // inkrementiere Quot um 1
      subs r0,r0,r1
      bcs div                 // So lange C gesetzt, läuft die Div weiter
      add r0,r0,r1            //Korrigieren des Quotienten mit +1 da Unterlauf
      sub r4,r4,#1
      mov r1,r4               // Speichern des Arbeitsregisters R4 in R1

divZero: 
      ldmfd sp!, {r4, pc}     // Lesen des verwendeten Registers und des pc vom Stack           <-- Hier ist noch ein Fehler
      
Ende:                         // Label ende

stop:
	nop
	bal stop
.end
