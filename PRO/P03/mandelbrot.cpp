#include "complex.h"

void add(const complex& a, const complex& b, complex& r){
    r.x=a.x+b.x;
    r.y=a.y+b.y;
    }
void mul(const complex& a, const complex& b, complex& r){
    r.x=a.x*b.x-a.y*b.y ;
    r.y= a.x* b.y +a.y*b.x;
    }
void mandelbrot(const complex& c, unsigned int n, complex& z_n){
        if (n==0){
            z_n={0,0};
        }
    else{
        mandelbrot(c,n-1,z_n);
        complex potato;
        mul(z_n,z_n,potato);
        complex banana;
        add(c,potato,banana);
        z_n= banana;
    }
}