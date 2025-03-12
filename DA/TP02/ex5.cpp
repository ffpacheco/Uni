
#include <algorithm>

bool aux(unsigned int C[], unsigned int Stock[], unsigned int n, unsigned int T, unsigned int usedCoins[], int index)
{
    if (T == 0)
        return true;
    if (index >= n || T < 0)
    {
        return false;
    }
    for (int i = 0; i <= Stock[index]; i++)
    {
        int rest = T - i * C[index];
        if (rest >= 0)
        {
            usedCoins[index] = i;
            if (aux(C, Stock, n, rest, usedCoins, index + 1))
            {
                return true;
            }
        }
    }
    usedCoins[index] = 0;
    return false;
}

bool changeMakingBF(unsigned int C[], unsigned int Stock[], unsigned int n, unsigned int T, unsigned int usedCoins[])
{
    for (int i = 0; i < n; i++)
    {
        usedCoins[i] = 0;
    }
    return aux(C, Stock, n, T, usedCoins, 0);
}
