#include <vector>
#include <string>
unsigned roman_to_arab(const std::string &roman)
{
    unsigned r = 0;
    std::vector<std::pair<char, unsigned>> roman_to_int = {
        {'I', 1},
        {'V', 5},
        {'X', 10},
        {'L', 50},
        {'C', 100},
        {'D', 500},
        {'M', 1000}};

    for (size_t i = 0; i < roman.size(); i++)
    {
        for (size_t j = 0; j < roman_to_int.size(); j++)
        {
            if (roman[i] == roman_to_int[j].first)
            {

                r += roman_to_int[j].second;
            }
        }
    }
    return r;
}
