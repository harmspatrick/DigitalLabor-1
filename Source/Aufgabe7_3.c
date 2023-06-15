/*
 * Aufgabe_7.3.c
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe :     GPIO-Eingabe
 */

#include <stdio.h>
#include <stdlib.h>
#include "LPC21xx.H"

#define IOPIN0 (*((volatile unsigned long *) 0xE0028000))
#define IOSET0 (*((volatile unsigned long *) 0xE0028004))

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

#define BTN_0_bm (1 << 10) // Position des Tasters in dem Port definieren
// Button_1 =  0x00000400
#define BTN_1_bm (1 << 11)
#define BTN_2_bm (1 << 12)
#define BTN_3_bm (1 << 13)


int delay(int time) {
    for (int delay = time; delay > 0; delay--){}
}

int leftToRight(int time) {

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

int rightToLeft(int time) {

      IOSET1 = LED_7_bm ;
      delay(time);
      IOCLR1 = LED_7_bm ;

      IOSET1 = LED_6_bm ;
      delay(time);
      IOCLR1 = LED_6_bm ;

      IOSET1 = LED_5_bm ;
      delay(time);
      IOCLR1 = LED_5_bm ;

      IOSET1 = LED_4_bm ;
      delay(time);
      IOCLR1 = LED_4_bm ;

      IOSET1 = LED_3_bm ;
      delay(time);
      IOCLR1 = LED_3_bm ;

      IOSET1 = LED_2_bm ;
      delay(time);
      IOCLR1 = LED_2_bm ;

      IOSET1 = LED_1_bm ;
      delay(time);
      IOCLR1 = LED_1_bm ;

      IOSET1 = LED_0_bm ;
      delay(time);
      IOCLR1 = LED_0_bm ;
}

int main(void) {
    
    IODIR1 = 0x00FF0000;
    int time = 0xA0000;
    
    //Outerloop
    //for (int i = 0; i < 50; i++) {
    while(1){


      leftToRight(time);
      
      if (!(IOPIN0 & BTN_0_bm)) {
        rightToLeft(time);
      }
      
    }
    //}

}

void IRQ_Routine (void) {while (1) ;}
void FIQ_Routine (void) {while (1) ;}
void SWI_Routine (void) {while (1) ;}
void UNDEF_Routine (void) {while (1) ;}