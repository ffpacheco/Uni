 #include "fraction.h"

int gcd(int a, int b){
    if (b==0){
        return a;
    }
    else{
        return gcd(b, a%b);
    }
}

fraction sum(const fraction fa[], int n){
    fraction a{0,1};
    
    for (int i=0; i<n; ++i){
         a.num = a.num * fa[i].den + fa[i].num * a.den;
         a.den *=fa[i].den;
    }
    
    int gcd_value = gcd(a.num, a.den);
    a.num /= gcd_value;
    a.den /= gcd_value;

    return a;
 }