#include <iostream>

const char *longest(const char *pa[]) {
    int max  = 0;
    int len  = 0;
    int temp = 0;
    while (pa[len] != nullptr) { len++; }
    for (int i = 0; i < len; ++i) {
        int lword = 0;
        while (pa[i][lword] != '\0') {
            lword++;
            if (max <= lword) {
                max  = lword;
                temp = i;
            }
        }
    }
    return pa[temp];
}