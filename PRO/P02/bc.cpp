#include <iostream>
using namespace std;
unsigned long fact(unsigned long a){
    unsigned long res;
    res=1;
    for (unsigned long  i =1 ;i<=a;i++){
        res*=i;
    }

    return res;
}
unsigned long bc(unsigned long n, unsigned long k) {
    return fact(n) / (fact(k) * fact(n - k));
}
