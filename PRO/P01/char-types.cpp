#include <iostream>
using namespace std;
int main(){
    int size;
    cin>> size;
    int digits=0,chars=0,neither=0;
    for (int i=0; i<size; ++i ){
        char elem;
        cin>> elem;
        if (isalpha(elem)){
            chars++;
        }
        else if (isdigit(elem)){
            digits++;
        }
        else {
            neither++;
        }
    }
    cout << chars << " " << digits<< " " <<neither;

    return 0;
}
