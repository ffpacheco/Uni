#include <iostream>

int main(){
    int n;
    std::cin>> n;
    for ( int i = 1 ; i <= n; ++i ){
        if (i % 3 ==0 && i % 5 == 0 ){
            std::cout<< "" ;
        } else if ( i % 3==0 ){
            std::cout<< "Fizz ";
        } else if ( i % 5 == 0){
            std::cout<< "Buzz " ;
        } else{
            std::cout<< i << " ";
        }
    }
    return 0;
}