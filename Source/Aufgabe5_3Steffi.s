/*
 * Aufgabe_5_3.S
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe : Addition
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global _start /* Specify global symbol */
_start:

  ldr sp,=0x40001000 

  .equ IOPIN0, 0xE0028000     
  .equ IODIR1, 0xE0028018     
  .equ IOSET1, 0xE0028014     
  .equ IOCLR1, 0xE002801C 

  .equ BUTTON_1, 0x00000400   // Button 1 Maske
  .equ BUTTON_2, 0x00000800   // Button 2 Maske
  .equ BUTTON_3, 0x00001000   // Button 3 Maske
  .equ BUTTON_4, 0x00002000   // Button 4 Maske

  ldr r1, = IODIR1
  ldr r2, = IOSET1
  ldr r3, = IOCLR1
  ldr r4, = IOPIN0

  ldr r5, = BUTTON_1    // Button Maske in r5 laden
  ldr r6, = BUTTON_2
  ldr r7, = BUTTON_3
  ldr r8, = BUTTON_4

  ldr r0, = 0x00ff0000    // set P1.16 to P1.23 as . . .
  str r0, [r1]            // . . . outputs


loop:
  
  //am Anfang des loops, da die immer resetten werden sollen
  mov r9,  #0x10000   // Pin 1 leuchtet, soll immer resettet werden

  ldr r0, [r4]    
  bl read_button_1
  bl read_button_2
  bl read_button_3
  bl read_button_4
  b loop


//---- Button 1 ---- //

read_button_1:

  stmfd sp!, {r0 - r9, lr}
  ands r0, r5, r0   // prüfe, ob Button 1 gedrückt ist
  beq noled1    // branch, wenn der Button gedrückt ist

  str r9, [r2]    // Pin 1 anschalten
  mov r9, r9, lsl #1    // Inkrement durch logischen Linksshift
  str r9, [r3]    // Pin 2 ausschalten

  b led1_done

  noled1:
  str r9, [r3]   // Pin 1 ausschalten
  mov r9, r9, lsl #1    // Inkrement mit logischem Linksshift
  str r9, [r2]   // Pin 2 anschalten

  led1_done:
  ldmfd sp!, {r0 - r9, pc}


//---- Button 2 ---- //

read_button_2:

  stmfd sp!, {r0 - r9, lr}
  mov r9, r9, lsl #2    // Pin 3 leuchtet
  ands r0, r6, r0
  beq noled2

  str r9, [r2]    // Pin 3 anschalten
  mov r9, r9, lsl #1
  str r9, [r3]    // Pin 4 ausschalten

  b led2_done

  noled2:
  str r9, [r3]   // Pin 3 ausschalten
  mov r9, r9, lsl #1
  str r9, [r2]   // Pin 2 anschalten

  led2_done:
  ldmfd sp!, {r0 - r9, pc}

//---- Button 3 ---- //

read_button_3:

  stmfd sp!, {r0 - r9, lr}
  mov r9, r9, lsl #4
  ands r0, r7, r0
  beq noled3

  str r9, [r2]   // Pin 5 anschalten
  mov r9, r9, lsl #1
  str r9, [r3]   // Pin 6 ausschalten

  b led3_done

  noled3:
  str r9, [r3]   // Pin 5 ausschalten
  mov r9, r9, lsl #1
  str r9, [r2]   // Pin 6 anschalten

  led3_done:
  ldmfd sp!, {r0 - r9, pc}

//---- Button 4 ---- //

read_button_4:

  stmfd sp!, {r0 - r9, lr}
  mov r9, r9, lsl #6
  ands r0, r8, r0
  beq noled4

  str r9, [r2]   // Pin 7 anschalten
  mov r9, r9, lsl #1
  str r9, [r3]   // Pin 8 ausschalten
  
  b led4_done

  noled4:
  str r9, [r3]   // Pin 7 ausschalten
  mov r9, r9, lsl #1
  str r9, [r2]   // Pin 8 anschalten

  led4_done:
  ldmfd sp!, {r0 - r9, pc}

// ---- end ---- //
stop:
	nop
	bal stop
.end