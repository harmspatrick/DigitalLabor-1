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

  unsigned int a = 0x12345678;            //Basiswert
  unsigned int b = (a >> 8) & 0xf;        // nur das 3. Nibble von Rechts an der niedrigsten Stelle, 
  unsigned int c = ~(a);                  // c enthält den inversen Wert des Basiswertes
  unsigned int d = a | ~0xF0; // alle Bits, bis auf das zweite Nibble von rechts, auf 1

  for (int i = 0; i < 10; i++) {i--;}

}


void IRQ_Routine (void) {while (1) ;}
void FIQ_Routine (void) {while (1) ;}
void SWI_Routine (void) {while (1) ;}
void UNDEF_Routine (void) {while (1) ;}