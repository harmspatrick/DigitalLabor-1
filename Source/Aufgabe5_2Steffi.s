/*
 * Aufgabe_5_2.S
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
  .equ IOPIN0, 0xE0028000     // Port 0 Pin value register address
  .equ IODIR1, 0xE0028018     // Port 1 Direction register address
  .equ IOSET1, 0xE0028014     // Port 1 Output set register address
  .equ IOCLR1, 0xE002801C     // Port 1 Output clear register

  .equ dl,1000000            // Parameter Delay (übersichtlicher)

  ldr sp,=0x40001000         

  ldr r2, = IOSET1
  ldr r3, = IOCLR1
        
  ldr r1, = IODIR1            // pointer direction of port pin, 0 in, 1 out
  ldr r0, = 0x00ff0000        // Pins P1.16 to P1.23 as outputs for the eight LEDs
  str r0, [r1]                // Store with Pointer R1

        
outerloop:
  ldr r10, = 8                // Count
  ldr r0,  = 0x10000          // Setting lowest LED-Bit (#16) to high = 1
loop:
  ldr r2, = IOSET1            // r2 ist Pointer mit IOSET 
  str r0, [r2]                //Anschalten der Lampe
  bl Delay
  str r0, [r3]                //Ausschalten der Lampe
  mov r0, r0, lsl#1           // Inkrement mit logischen Linksshift
  cmp r0, #0x01, 8

  subs r10, #1                // Loop

  bne loop

  b outerloop

Delay:
  stmfd sp!, {r0 - r10, lr} 
  ldr r11, =dl             //Parameterübergabe
  wait: subs r11, r11, #1
  bne wait
  adds r11,r11,#1           // Setzt Z Flag auf 0
  ldmfd sp!, {r0 - r10, pc}     
        
stop:
	nop
	bal stop
.end