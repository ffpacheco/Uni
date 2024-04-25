#include <iostream>
using namespace std;

int adigits(int a, int b, int c){
    int max;
    int min;
    int mid;
    max=(a>=b)?((a>=c)?a:c):((b>=c)?b:c);
    min=(a<=b)?((a<=c)?a:c):((b<=c)?b:c);
    if ((a == max && b == min) || (a == min && b == max)) {
        mid = c;
    } else if ((b == max && c == min) || (b == min && c == max)) {
        mid = a;
    } else {
        mid = b;
    }
    int res= max*100+mid*10+min;
    return res;
}