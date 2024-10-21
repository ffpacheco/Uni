#include <iostream>
#include <vector>
using namespace std;

int main()
{
    int N, K, T;
    cin >> N >> K >> T;
    vector<int> nums(N);

    for (int i = 0; i < N; i++)
    {
        int Q;
        cin >> Q;
        nums[i] = Q;
    }

    int count = 0;
    int elements = 0;
    for (int i = 0; i < K; i++)
    {
        if (nums[i] >= T)
        {
            elements++;
        }
    }
    if (elements >= (K + 1) / 2)
    {
        count++;
    }

    for (int i = K; i < N; i++)
    {
        if (nums[i - K] >= T)
            elements--;
        if (nums[i] >= T)
            elements++;
        if (elements >= (K + 1) / 2)
        {
            count++;
        }
    }
    cout << count << endl;

    return 0;
}