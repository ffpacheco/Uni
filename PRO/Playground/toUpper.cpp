#include <string>
void toUpperStr(std::string s)
{
    for (char &c : s)
    {
        c = toupper(c);
    }
}