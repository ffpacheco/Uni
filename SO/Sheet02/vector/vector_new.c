#include "vector.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
vector* vector_new(double x, double y, double z) {
    vector* v = (vector*)malloc(sizeof(vector)); 
    v->x = x;
    v->y = y;
    v->z = z;
    return v;
}
