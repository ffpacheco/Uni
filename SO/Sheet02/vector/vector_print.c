#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "vector.h"
void vector_print(vector* v) {
    printf("Vector = (%f, %f, %f)\n", v->x, v->y, v->z);
}
