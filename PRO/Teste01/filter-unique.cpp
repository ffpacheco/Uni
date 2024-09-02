#include "print_array.h"
#include <map>
using namespace std;

int filter_unique(const int arr[], int size, int out[])
{
    map<int, int> mapa;
    if (size == 1)
    {
        out[0] = arr[0];
        return 1;
    }
    for (int i = 0; i < size; i++)
    {
        if (mapa.find(arr[i]) == mapa.end())
        {
            mapa[arr[i]] = 1;
        }
        else
        {
            mapa[arr[i]]++;
        }
    }
    int count = 0;
    for (int i = 0; i < size; i++)
    {
        if (mapa[arr[i]] == 1)
        {
            out[count++] = arr[i];
        }
    }
    return count;
}