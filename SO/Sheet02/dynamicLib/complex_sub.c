#include "complex.h"
#include <stdlib.h>
complex* complex_sub(complex* z, complex* w) {
    complex* result = (complex*)malloc(sizeof(complex));
    result->x = z->x - w->x;  
    result->y = z->y - w->y;  
    return result;
}
