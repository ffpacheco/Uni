#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "list.h"
node* node_new(int val, node* p) {
node* q = (node*)malloc(sizeof(node));
q->val = val;
q->next = p;
return q;
}
