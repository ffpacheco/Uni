#include "complex.h"
#include <stdlib.h>
complex* complex_div(complex* z, complex* w) {
    complex* result = (complex*)malloc(sizeof(complex));

  
    double denominator = w->x * w->x + w->y * w->y;
    result->x = (z->x * w->x + z->y * w->y) / denominator;  
    result->y = (z->y * w->x - z->x * w->y) / denominator;  

    return result;
}

