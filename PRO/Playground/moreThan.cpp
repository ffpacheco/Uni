#include <vector>
#include <map>

std::vector<int> deleteNth(std::vector<int> arr, int n)
{
    std::map<int, int> count;
    std::vector<int> res;

    for (int c : arr)
    {
        if (count[c] < n)
        {
            res.push_back(c);
            count[c]++;
        }
    }

    return res;
}