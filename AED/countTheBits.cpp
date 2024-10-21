#include <algorithm>
#include <vector>
#include <iostream>

using namespace std;

int bits(int n)
{
    int ones = 0;
    while (n > 0)
    {
        if (n % 2 != 0)
        {
            ones++;
        }
        n = n / 2;
    }
    return ones;
}

bool compare(int a, int b)
{
    return (bits(a) > bits(b) || (bits(a) == bits(b) && a < b));
}
int main()
{

    int n;
    cin >> n;
    vector<int> nums(n);
    for (int i = 0; i < n; i++)
    {
        cin >> nums[i];
    }
    sort(nums.begin(), nums.end(), compare);
    for (int num : nums)
    {
        cout << num << endl;
    }
    return 0;
}