#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "vector.h" 
double vector_mod(vector* v) {
    return sqrt(v->x * v->x + v->y * v->y + v->z * v->z);
}
