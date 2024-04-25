#include "cdata.h"
#include <iostream>
using namespace std;

int *expand_cdata(const cdata a[], int n) {
    int size = 0;
    for (int i = 0; i < n; ++i) { size += a[i].count; }
    int *res = new int[size];
    int  ind = 0;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < a[i].count; ++j) {
            res[ind] = a[i].value;
            ind++;
        }
    }
    return res;
}