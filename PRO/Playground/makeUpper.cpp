#include <string>

std::string makeUpperCase(const std::string &input_str)
{
    std::string outStr;
    for (char c : input_str)
    {
        outStr += toupper(c);
    }
    return outStr;
}