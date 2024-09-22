#include <string>

std::string disemvowel(const std::string &str)
{
    std::string newStr;
    for (char c : str)
    {
        if (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' ||
            c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U')
        {
            continue;
        }
        newStr += c;
    }
    return newStr;
}