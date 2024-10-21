#include <iostream>
#include <vector>
#include <algorithm>
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

    int Q;
    cin >> Q;
    for (int i = 0; i < Q; i++)
    {
        int K;
        cin >> K;

        auto res = lower_bound(nums.begin(), nums.end(), K);
        if (res == nums.end())
            cout << "-1" << endl;
        else
        {
            cout << res - nums.begin() << endl;
        }
    }
    return 0;
}