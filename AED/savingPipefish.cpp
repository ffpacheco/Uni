#include <iostream>
#include <vector>

int main()
{
    int n, k, t;
    std::cin >> n >> k >> t;
    std::vector<int> nums(n);
    int s = (k + 1) / 2;
    int validElement = 0;
    int count = 0;

    for (int i = 0; i < n; i++)
    {
        int q;
        std::cin >> q;
        nums[i] = q;
    }
    // 1a vez
    for (int i = 0; i < k; i++)
    {
        if (nums[i] >= t)
            validElement++;
    }
    if (validElement >= s)
    {
        count++;
    }
    //-

    for (int i = k; i < n; i++)
    {
        if (nums[i - k] >= t)
            validElement--;
        if (nums[i] >= t)
            validElement++;
        if (validElement >= s)
            count++;
    }
    std::cout << count << std::endl;
    return 0;
}