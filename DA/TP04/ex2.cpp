#include <iostream> 
#include <algorithm> 

std::string hanoiDC(unsigned int n, char src, char dest)
{
    if (n == 1)
    {
        return std::string(1, src) + "->" + dest;
    }

    char aux;
    std::string res;
    if (n > 1)
    {
        aux = 'A' + 'B' + 'C' - src - dest;
        res += hanoiDC(n - 1, src, aux) + ',';
        res += std::string(1, src) + "->" + dest + ',';
        res += hanoiDC(n - 1, aux, dest);
    }
    return res;
}
