#include "print_vector.h"
#include <iostream>
#include <string>
#include <vector>

template <typename T> void normalise(vector<T> &v, const T &min, const T &max) {
    for (size_t i = 0; i < v.size(); i++) {
        if (v[i] < min) {
            v.erase(v.begin() + i);
            v.insert(v.begin() + i, min);
        }
        if (v[i] > max) {
            v.erase(v.begin() + i);
            v.insert(v.begin() + i, max);
        }
    }
}