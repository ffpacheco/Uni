unsigned int knapsackBF(unsigned int values[], unsigned int weights[], unsigned int n, unsigned int maxWeight, bool usedItems[])
{

    unsigned int maxV = 0;
    unsigned int bestMask;
    for (unsigned int i = 0; i < n; i++)
    {
        usedItems[i] = false;
    }
    for (unsigned int mask = 1; mask < (1 << n); mask++)
    {
        int weight = 0;
        int value = 0;
        for (unsigned int i = 0; i < n; i++)
        {
            if (mask & (1 << i))
            {
                value += values[i];
                weight += weights[i];
            }
        }
        if (weight <= maxWeight && value > maxV)
        {
            maxV = value;
            bestMask = mask;
        }
    }
    for (unsigned int i = 0; i < n; i++)
    {
        if (bestMask & (1 << i))
        {
            usedItems[i] = true;
        }
    }

    return maxV;
}