#include <iostream>

unsigned long hstr_to_integer(const char hstr[]){
    int l=0;
    unsigned long res=0;
    while(hstr[l]!= '\0'){
        l++;
    } 

    for(int i=0; i<l; ++i){
        res*=16;
        if (hstr[i] >= 'a' && hstr[i] <= 'f') {
            res+= (hstr[i] - 'a' + 10);

        } else if (hstr[i] >= 'A' && hstr[i] <= 'F') {
            res+=( hstr[i] - 'A' + 10) ;

        }else if (hstr[i] >='0' && hstr[i] <= '9'){
            res+=(hstr[i] - '0' ) ;
        }

    }return res;
}


