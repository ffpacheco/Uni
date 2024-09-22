#include <string>

std::string transformLine(std::string s)
{
    for (char &c : s)
    {
        if (isalpha(c))
        {
            c = toupper(c);
        }
        else
        {
            c = ' ';
        }
    }
    return s;
}
