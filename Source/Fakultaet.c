unsigned long fakultaet(int); // Hier sehen Sie, wie die Funktion aussieht.


int main() {
    unsigned long ergebnis;
    int zahl = 5;
    ergebnis = fakultaet(zahl);
    return 0;
}


unsigned long fakultaet(int wert) {

    unsigned long ergebnis = 1;
    
    if (wert > 1) {
        ergebnis = wert*fakultaet(wert-1);
    }


    return ergebnis;

}