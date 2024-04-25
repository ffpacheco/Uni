#include <iostream>
using namespace std;
bool isprime(int k){
    for (int j = 2; j < k; ++j){
        if (k%j== 0){
            return false;
        }
    }
    return true;
}
int main(){
    int n;
    cin>> n;
    if (n>1){
        for (int i=2;i<=n; ++i){
            if (isprime(i)){
                cout<< i << " ";
            }

        }
        cout<< endl;
    }   

    return 0;
}