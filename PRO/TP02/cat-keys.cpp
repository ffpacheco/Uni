#include <string>
#include <map>
#include <climits>
#include <list>
using namespace std;
string cat_keys(list<map<string, unsigned>> lst)
{
    string res;
    unsigned minor = UINT_MAX;
    map<string, unsigned> minimap;
    
    for (map<string, unsigned> mapas : lst)
    {
        for (auto &pares : mapas)
        {
            if (pares.second < minor)
            {
                minor = pares.second;
                minimap = mapas;
            }
        }
    }
    for (auto &pares : minimap)
    {
        res += pares.first;
    }
    return res;
}