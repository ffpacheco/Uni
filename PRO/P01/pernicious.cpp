#include <iostream>
using namespace std;

bool isprime(int k){
    if (k<2){ 
        return false;
        }
    else{
        for (int i=2; i<k;++i){
            if (k%i==0){ 
                return false;
            }
        }
        return true;
    }
}

int bin(int k){                         //recebe o int original
    int ones=0;
    while (k !=0){
        if (k%2!=0) { 
            ++ones;
            }
        k = k/2;
    }
    return ones;
}

bool ispernicious (int k){               // recebe o numero de uns "calculado" por bin
    return isprime(bin(k));
}

int main(){
    int a, b;
    cin>>a;
    cin>>b;
    for (int i=a;i<=b;++i){
        if (isprime(i) && ispernicious(i)){
                cout<< i << " ";
            }
        }
    cout << endl;
    return 0;
}