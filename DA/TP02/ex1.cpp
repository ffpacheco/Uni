#include <climits>
int maxSubsequenceBF(int A[], unsigned int n, unsigned int &i, unsigned int &j)
{
    int maxsum = INT_MIN;
    int cursum = 0;
    i = j = 0;

    for (int k = 0; k < n; k++)
    {
        for (int l = k; l < n; l++)
        {
            cursum = 0;
            for (int m = k; m <= l; m++)
            {
                cursum += A[m];
                if (cursum > maxsum)
                {
                    maxsum = cursum;
                    j = l;
                    i = k;
                }
            }
        }
    }
    return maxsum;
}