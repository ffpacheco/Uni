#include <iostream>
#include <vector>

int Search(std::vector<int> &seq, int num)
{

    int min = 0;
    int max = seq.size() - 1;
    while (min <= max)
    {
        int med = min + (max - min) / 2;
        if (seq[med] < num)
        {
            min = med + 1;
        }
        else if (seq[med] > num)
        {
            max = med - 1;
        }
        else
        {
            return med;
        }
    }
    return -1;
}

int main()
{
    int n;
    std::cin >> n;
    std::vector<int> nums(n);

    for (int i = 0; i < n; i++)
    {
        int s;
        std::cin >> s;
        nums[i] = s;
    }

    int Q;
    std::cin >> Q;

    for (int i = 0; i < Q; i++)
    {
        int q;
        std::cin >> q;
        int res = Search(nums, q);
        std::cout << res << std::endl;
    }

    return 0;
}