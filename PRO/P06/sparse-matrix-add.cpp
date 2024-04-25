#include "smatrix.h"
#include <iostream>
#include <string>
#include <vector>
using namespace std;

void sum(const smatrix &a, const smatrix &b, smatrix &r) {
    size_t i = 0, j = 0;
    int    res = 0;

    while (i < a.size() && j < b.size()) {
        if (a[i].row < b[j].row) {
            r.push_back(a[i]);
            i++;
        } else if (a[i].row > b[j].row) {
            r.push_back(b[j]);
            j++;
        } else if (a[i].col < b[j].col) {
            r.push_back(a[i]);
            i++;
        } else if (a[i].col > b[j].col) {
            r.push_back(b[j]);
            j++;
        } else {
            res = a[i].value + b[j].value;
            if (res != 0) { r.push_back({ a[i].row, a[i].col, res }); }
            i++;
            j++;
        }
    }
    while (i < a.size()) {
        r.push_back(a[i]);
        i++;
    }
    while (j < b.size()) {
        r.push_back(b[j]);
        j++;
    }
}