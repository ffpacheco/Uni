#include <iostream>
#include <vector>
#include <limits.h>
using namespace std;

int main()
{
    int N;
    cin >> N;
    vector<int> nums(N);
    for (int i = 0; i < N; i++)
    {
        int Q;
        cin >> Q;
        nums[i] = Q;
    }

    int current = 0;
    int max = INT_MIN;
    for (int i = 0; i < N; i++)
    {
        current += nums[i];
        if (current < 0)
        {
            current = 0;
        }

        if (current > max)
        {
            max = current;
        }
    }
    cout << max << endl;
    return 0;
}