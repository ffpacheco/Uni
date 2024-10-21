#include <iostream>
#include <vector>
using namespace std;

int main()
{
    int n;
    cin >> n;
    vector<int> nums(n);
    for (int i = 0; i < n; i++)
    {
        cin >> nums[i];
    }
    int s;
    int count = 0;
    cin >> s;
    for (int i = 0; i < s; i++)
    {
        int a, b;
        cin >> a >> b;

        auto it = lower_bound(nums.begin(), nums.end(), a);
        auto it2 = lower_bound(nums.begin(), nums.end(), b+1);

        if (it == nums.end())
            cout << "0" << endl;
        else
        {
            int res = it2 - it;
            cout << res << endl;
        }
    }
    return 0;
}