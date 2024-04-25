#include <iostream>
using namespace std;
int main(){
    int k;
    cin>> k;
    int reverse=0;
    while (k!=0){
        reverse+=k%10;
        k=k/10;
        reverse=reverse*10;
    }

    cout<<reverse/10;
    return 0;
}