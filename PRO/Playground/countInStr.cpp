#include <map>
#include <string>

std::map<char, unsigned> count(const std::string &string)
{
    std::map<char, unsigned> mapa;
    for (char c : string)
    {
        if (mapa.find(c) == mapa.end())
        {
            mapa.emplace(c, 1);
        }
        else
        {
            mapa[c]++;
        }
    }
    return mapa;
}