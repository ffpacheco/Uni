#include <iostream>
#include <cmath>
using namespace std;
int solve_eq(int a, int b, int c, double& x1, double& x2){
    int n=0;
    if (b*b - (4*a*c) <0){
        x1= nan("");
        x2= nan("");
    }
    else if(b*b-4*a*c ==0) {
        n=1;
        x2=nan("");
        x1= (-b)/(2.0*a);
    }
    else{
        n=2;
        x1= (-b-sqrt(b*b-4*a*c))/(2.0*a);
        x2= (-b+sqrt(b*b-4*a*c))/(2.0*a);
    }
    return n;
}
