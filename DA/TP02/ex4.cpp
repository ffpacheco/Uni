double fractionalKnapsackGR(unsigned int values[], unsigned int weights[], unsigned int n, unsigned int maxWeight, double usedItems[])
{
    double weight = 0, value = 0;

    for (int i = 0; i < n; i++)
    {
        usedItems[i] = 0;
    }

    while (weight < maxWeight)
    {
        int item = -1;
        double bestRatio = -1.0;

        for (int i = 0; i < n; i++)
        {
            if (usedItems[i] == 0)
            {
                double ratio = (double)values[i] / weights[i];
                if (ratio > bestRatio)
                {
                    item = i;
                    bestRatio = ratio;
                }
            }
        }
        if (item == -1)
        {
            break;
        }

        if (weight + weights[item] <= maxWeight)
        {
            weight += weights[item];
            value += values[item];
            usedItems[item] = 1;
        }
        else
        {
            double percentage = (maxWeight - weight) / (double)weights[item];
            weight += percentage * weights[item];
            value += percentage * values[item];
            usedItems[item] = percentage;
            break;
        }
    }
    return value;
}