#include <unordered_map>
#include <algorithm>
#include <string>
using Ingredients = std::unordered_map<std::string, int>;

int cakes(const Ingredients &recipe, const Ingredients &available)
{
    int cake = 9999999;
    for (const auto &par : recipe)
    {
        int weHave = 0;
        int required = par.second;
        if (available.find(par.first) != available.end())
        {
            weHave = available.at(par.first);
        }
        else
        {
            weHave = 0;
        }
        cake = std::min(weHave / required, cake);
    }
    return cake;
}