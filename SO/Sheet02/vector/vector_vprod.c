#include "vector.h"
vector* vector_vprod(vector* v1, vector* v2) {
    double x = v1->y * v2->z - v1->z * v2->y;
    double y = v1->z * v2->x - v1->x * v2->z;
    double z = v1->x * v2->y - v1->y * v2->x;
    
    return vector_new(x, y, z);
}
