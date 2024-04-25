#include <iostream>
using namespace std;

unsigned long fact(unsigned long x) {
    double acc;
    acc = 1;
    if (x==1){
        return 1;
    } 
    for(unsigned long i=1; i<=x; i++) acc = acc*i;
    return acc;
}

unsigned long bc(unsigned long n, unsigned long k) {
    return fact(n) / (fact(k)*fact(n-k));
}

unsigned long bell(unsigned long n){
    if(n<=1) return 1;
    double C;
    C=0;
    for(unsigned long i=0; i<n; i++) C += bc(n-1,i)*bell(i);
    return C;
}