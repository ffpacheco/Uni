#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "list.h"
list* list_new() {
list* l = (list*) malloc(sizeof(list));
l->size = 0;
l->first = NULL;
return l;
}