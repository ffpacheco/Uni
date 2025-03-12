
bool subsetSumBF(unsigned int A[], unsigned int n, unsigned int T, unsigned int subset[], unsigned int &subsetSize)
{
    subsetSize = 0;

    for (unsigned int mask = 1; mask < (1 << n); mask++)
    {
        unsigned int sum = 0;
        for (unsigned int i = 0; i < n; i++)
        {
            if (mask & (1 << i))
            {
                sum += A[i];
            }
        }
        if (sum == T)
        {
            for (unsigned int i = 0; i < n; i++)
            {
                if (mask & (1 << i))
                {
                    subset[subsetSize] = A[i];
                    subsetSize++;
                }
            }
            return true;
        }
    }
    return false;
}