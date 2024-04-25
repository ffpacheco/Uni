#include "fraction.h"

int gcd(int x, int y){
    if (y==0){
        return x;
    }
    else{
        return gcd(y,x%y);
    }
}

fraction add(fraction a, fraction b){  
    fraction res;
    if (a.den != b.den){
        int t= a.den;
        a.den *=b.den;
        a.num*=b.den;
        b.den*= t; 
        b.num*=t;
    }
    res= {a.num+b.num, b.den};
    int num= res.num;
    int div=res.den;
    int gcdd=gcd(res.num, res.den);
    res={num/gcdd, div/gcdd};
    if (res.den <0){
        res.den*=-1;
        res.num*=-1;
    }
    return res;
}



fraction mul(fraction a, fraction b){
    fraction res;
    res.num= a.num * b.num;
    res.den = a.den * b.den;
    int gcdd=gcd(res.num, res.den);
    res={res.num/gcdd, res.den/gcdd};
    if (res.den <0){
        res.den*=-1;
        res.num*=-1;
    }
    return res;
}

