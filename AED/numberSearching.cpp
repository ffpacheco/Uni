#include <iostream>
#include <vector>

int Search(std::vector<int> seq, int num)
{
    int min = 0;
    int max = seq.size() - 1;
    while (min <= max)
    {
        int med = min + (max - min) / 2;
        if (med < num)
        {
            min = med;
        }
        if (med > num)
        {
            max = med;
        }
    }
}

int main()
{
    int n;
    std::cin >> n;
    std::vector<int> nums(n);

    for (int i = 0; i < n; i++)
    {

        int q;
        std::cin >> q;
        nums[i] = q;
    }

    return 0;
}