/*
 * Aufgabe_7.2.c
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe :    GPIO-Ausgabe
 */

#include <stdio.h>
#include <stdlib.h>
#include "LPC21xx.H"

#define IOSET1         (*((volatile unsigned long *) 0xE0028014))
#define IODIR1         (*((volatile unsigned long *) 0xE0028018))
#define IOCLR1         (*((volatile unsigned long *) 0xE002801C))

#define LED_0_bm (1 << 16)
#define LED_1_bm (1 << 17) // Position der LED in dem Port definieren
#define LED_2_bm (1 << 18)
#define LED_3_bm (1 << 19)
#define LED_4_bm (1 << 20)
#define LED_5_bm (1 << 21)
#define LED_6_bm (1 << 22)
#define LED_7_bm (1 << 23)

int delay(int time) {
    for (int delay = time; delay > 0; delay--){}
}

int main(void) {
    
    IODIR1 = 0x00FF0000;
    int time = 0xA0000;
    
    //Outerloop
    for (int i = 0; i < 10; i++) {
      IOSET1 = LED_0_bm ;
      delay(time);
      IOCLR1 = LED_0_bm ;

      IOSET1 = LED_1_bm ;
      delay(time);
      IOCLR1 = LED_1_bm ;

      IOSET1 = LED_2_bm ;
      delay(time);
      IOCLR1 = LED_2_bm ;

      IOSET1 = LED_3_bm ;
      delay(time);
      IOCLR1 = LED_3_bm ;

      IOSET1 = LED_4_bm ;
      delay(time);
      IOCLR1 = LED_4_bm ;

      IOSET1 = LED_5_bm ;
      delay(time);
      IOCLR1 = LED_5_bm ;

      IOSET1 = LED_6_bm ;
      delay(time);
      IOCLR1 = LED_6_bm ;

      IOSET1 = LED_7_bm ;
      delay(time);
      IOCLR1 = LED_7_bm ;
    }
    

}

void IRQ_Routine (void) {while (1) ;}
void FIQ_Routine (void) {while (1) ;}
void SWI_Routine (void) {while (1) ;}
void UNDEF_Routine (void) {while (1) ;}