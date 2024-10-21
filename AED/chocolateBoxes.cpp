#include <iostream>
#include <limits.h>
#include <vector>
#include <algorithm>
using namespace std;

int main()
{
    int n, k;
    cin >> n >> k;
    vector<int> nums(n);

    for (int i = 0; i < n; i++)
    {
        cin >> nums[i];
    }
    sort(nums.begin(), nums.end());

    int minDiff = INT_MAX;
    for (int i = 0; i <= n - k; i++)
    {
        int curDiff = nums[i + k - 1] - nums[i];
        minDiff = min(minDiff, curDiff);
    }
    cout << minDiff << endl;
    return 0;
}