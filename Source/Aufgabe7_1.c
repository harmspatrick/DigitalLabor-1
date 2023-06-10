/*
 * Aufgabe_7.1.c
 *
 *  Created on: 10.03.2023
 *      Author: tavin
 *
 *	Aufgabe :   Bit-Manipulation
 */

#include <stdio.h>
#include <stdlib.h>
#include "LPC21xx.H"

int main(void) {

/*
word 16bit

byte 8bit

nibble 4bit

*/

  unsigned int a = 0x12345678; //Basiswert
  unsigned int b = (a >> 8);    // nur das 3. Nibble von Rechts an der niedrigsten Stelle
  b &=0xf;
  unsigned int c = ~(a);  // c enthält den inversen Wert des Basiswertes
  unsigned int d = (a >> 4);    // alle Bits, bis auf das zweite Nibble von rechts, auf 1
  unsigned int mask = 0x11111101;
  
  d &=0xf;
  d = (d << 4);
  d = (d ^ mask);

  //printf("a: %Ix \n", a);
  //printf("b: %Ix \n", b);
  //printf("c: %Ix \n", c);
  //printf("d: %Ix \n", d);
  //printf("mask: %Ix \n", mask);

}


void IRQ_Routine (void) {while (1) ;}
void FIQ_Routine (void) {while (1) ;}
void SWI_Routine (void) {while (1) ;}
void UNDEF_Routine (void) {while (1) ;}