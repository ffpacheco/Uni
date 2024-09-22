#include <cmath>

bool narcissistic(int value)
{
    int dig = 0;
    int og = value;
    int sum = 0;
    while (value != 0)
    {
        ++dig;
        value = value / 10;
    }
    value = og;
    while (value != 0)
    {
        int a = value % 10;
        sum += pow(a, dig);
        value = value / 10;
    }
    return (sum == og);
}