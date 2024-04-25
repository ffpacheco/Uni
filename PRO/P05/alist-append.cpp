#include "alist.h"
#include <iostream>

void append(alist *a, const alist *b) { // alist = size, elements
    int  size = a->size + b->size;
    int *c    = new int[size];
    for (int i = 0; i < a->size; ++i) { c[i] = a->elements[i]; }
    for (int i = 0; i < b->size; ++i) { c[i + a->size] = b->elements[i]; }
    a->size = size;
    delete[] a->elements;
    a->elements = c;
}