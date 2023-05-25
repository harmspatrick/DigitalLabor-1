/*
 * Aufgabe_5_3.S
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe : - Ein- und Ausgabe über Taster und LEDs
 */
.text /* Specify that code goes in text segment */
.code 32 /* Select ARM instruction set */
.global _start /* Specify global symbol */
_start:

        .equ BUTTON_1, 0x00000400   // Button 1 Mask
        .equ BUTTON_2, 0x00000800   
        .equ BUTTON_3, 0x00001000
        .equ BUTTON_4, 0x00002000

        .equ IOPIN0, 0xE0028000     // Port 0 Pin value register address
        .equ IODIR1, 0xE0028018     // Port 1 Direction register address
        .equ IOSET1, 0xE0028014     // Port 1 Output set register address
        .equ IOCLR1, 0xE002801C     // Port 1 Output clear register

        ldr sp,=0x40001000          // Baseaddress Stack

        ldr r1, =IODIR1             // point to port 1 direction register
        ldr r2, =IOSET1             // pointer to port 1 pin set control register
        ldr r3, =IOCLR1             // pointer to port 1 pin clear control register
        ldr r4, =IOPIN0             // pointer to port 0 input register
        ldr r5, =BUTTON_1           // load Button 1 mask to register r1
        ldr r6, =BUTTON_2 
        ldr r7, =BUTTON_3 
        ldr r8, =BUTTON_4

        ldr r0, =0x00ff0000         // set P1.16 to P1.23 as ...
        str r0, [r1]                // ... outputs

loop:
        bl read_button_1 
        bl read_button_2 
        bl read_button_3 
        bl read_button_4 
        b loop

read_button_1:
        stmfd sp!, {r0 - r9, lr} 
        mov r9, #0x10000            // Turn on 1st LED, setting lowest LED-Bit to high (1)
        ldr r0, [r4]                // Load pushbutton values to register r0 (IOPIN0)

        ands r0, r5, r0             // check if button 1 is pressed
        beq noled1                  // branch if not 
        
        str r9, [r2] 
        mov r9, r9, lsl #1 
        str r9, [r3]
        b led1_done

noled1:
        str r9, [r3]                // turn selected pin off
        mov r9, r9, lsl #1          // increment output value
        str r9, [r2]                // turn selected pin on

led1_done:
        ldmfd sp!, {r0 - r9, pc}


read_button_2:
        stmfd sp!, {r0 - r9, lr} 
        //mov r9, #0x50000            // Turn on 1st LED, setting lowest LED-Bit to high (1)
        mov r9, #0x10000
        mov r9, r9, lsl #2
        ldr r0, [r4]                // Load pushbutton values to register r0 (IOPIN0)

        ands r0, r6, r0             // check if button 1 is pressed
        beq noled2                  // branch if not 
        
        str r9, [r2] 
        mov r9, r9, lsl #1 
        str r9, [r3]
        b led2_done

noled2:
        str r9, [r3]                // turn selected pin off
        mov r9, r9, lsl #1          // increment output value
        str r9, [r2]                // turn selected pin on

led2_done:
        ldmfd sp!, {r0 - r9, pc}



read_button_3:
        stmfd sp!, {r0 - r9, lr} 
        //mov r9, #0x100000            // Turn on 1st LED, setting lowest LED-Bit to high (1)
        mov r9, #0x10000
        mov r9, r9, lsl #4
        ldr r0, [r4]                // Load pushbutton values to register r0 (IOPIN0)

        ands r0, r7, r0             // check if button 1 is pressed
        beq noled3                  // branch if not 
        
        str r9, [r2] 
        mov r9, r9, lsl #1 
        str r9, [r3]
        b led3_done

noled3:
        str r9, [r3]                // turn selected pin off
        mov r9, r9, lsl #1          // increment output value
        str r9, [r2]                // turn selected pin on

led3_done:
        ldmfd sp!, {r0 - r9, pc}


read_button_4:
        stmfd sp!, {r0 - r9, lr} 
        //mov r9, #0x500000            // Turn on 1st LED, setting lowest LED-Bit to high (1)
        mov r9, #0x10000
        mov r9, r9, lsl #6
        ldr r0, [r4]                // Load pushbutton values to register r0 (IOPIN0)

        ands r0, r8, r0             // check if button 1 is pressed
        beq noled4                  // branch if not 
        
        str r9, [r2] 
        mov r9, r9, lsl #1 
        str r9, [r3]
        b led4_done

noled4:
        str r9, [r3]                // turn selected pin off
        mov r9, r9, lsl #1          // increment output value
        str r9, [r2]                // turn selected pin on

led4_done:
        ldmfd sp!, {r0 - r9, pc}



stop:
	nop
	bal stop
.end