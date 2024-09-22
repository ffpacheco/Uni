#include <string>
#include <vector>

std::vector<std::string> solution(const std::string &s)
{
    int pairs = (s.size() + 1) / 2;

    std::vector<std::string> result(pairs);

    for (int i = 0; i < pairs; ++i)
    {
        if (i * 2 + 1 < s.size())
        {
            result[i] = s.substr(i * 2, 2);
        }
        else
        {
            result[i] = s.substr(i * 2, 1) + '_';
        }
    }

    return result;
}