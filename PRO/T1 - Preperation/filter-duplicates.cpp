#include "print_array.h"

int filter_duplicates(const int a[], int n, int b[]) {
    int index = 0;
    for (int i = 0; i < n; ++i) {
        if (i == 0 || a[i] != a[i - 1]) {
            b[index] = a[i];
            index++;
        }
    }
    return index;
}