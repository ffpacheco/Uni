#include <iostream>
#include "print_array.h"
int* merge_arrays(const int a[], int na, const int b[], int nb){
    int size= na+nb;
    int* c= new int[size];
    for (int i=0; i<na; i++){
        c[i]=a[i];
    }
    for (int i=0; i<nb; i++){
        c[i+na]=b[i];
    }
    //buble swap
    for (int i=0; i<size-1;++i){
        for (int j=0; j<size-1-i;++j){
            if(c[j]>c[j+1]){
                int temp= c[j];
                c[j]=c[j+1];
                c[j+1]=temp;
            }
        }
    }

return c;
}
