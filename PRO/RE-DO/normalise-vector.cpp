#include "print_vector.h"
#include <vector>
#include <string>
#include <algorithm>
using namespace std;
template <typename T>
void normalise(vector<T> &v, const T &min, const T &max)
{
    for (size_t i = 0; i < v.size(); i++)
    {
        if (v[i] < min)
        {
            v[i] = min;
        }
        if (v[i] > max)
        {
            v[i] = max;
        }
    }
}