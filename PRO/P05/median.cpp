#include <iostream>
using namespace std;

int median(const int a[], int n) {
    int  res;
    int *copy = new int[n];
    for (int i = 0; i < n; ++i) { copy[i] = a[i]; }
    for (int i = 0; i < n - 1; ++i) {
        for (int j = 0; j < n - 1 - i; ++j) {
            if (copy[j] > copy[j + 1]) {
                int temp    = copy[j];
                copy[j]     = copy[j + 1];
                copy[j + 1] = temp;
            }
        }
    }

    if (n % 2 != 0) {
        res = copy[n / 2];
    } else {
        res = ((copy[n / 2 - 1] + copy[n / 2]) / 2);
    }
    delete[] copy;
    return res;
}
