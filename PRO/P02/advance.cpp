 #include <iostream>
 using namespace std;

bool leap(int y) {
    if (y % 4 == 0) {
        if (y % 100 == 0) {
            if (y % 400 == 0) {
                return true;  
            } else {
                return false; 
            }
        } else {
            return true; 
        }
    }
    return false; 
}
void advance(int delta, int& d, int& m, int& y){
    int diasmeses[13]= {0,31,28,31,30,31,30,31,31,30,31,30,31};
    if (leap(y)==true){
        diasmeses[2]=29;
    }
    d=d+delta;
    while (d>= 365 && not leap (y)){      
        y++;
        d-=365;
    }
    while (d>= 366 &&  leap (y)){
        y++;
        d-=366;
    }
    while(d >diasmeses[m]){
        d=d-diasmeses[m];
        m++;
        if (m==13){
            y++;
            m=1;
            if (leap(y)==true){
                diasmeses[2]=29;
            }
            else{ 
                diasmeses[2]=28;
            }
        }
    }
 }
