#include <string>
#include <set>
using namespace std;

bool pangram(const string &s, string &m)
{
    int t = 0;
    set<char> schars;
    string alpha = "abcdefghijklmnopqrstuvwxyz";
    for (char c : s)
    {
        if (isalpha(c))
        {
            schars.insert(tolower((c)));
        }
    }
    for (char c : alpha)
    {
        if (schars.find(c) == schars.end())
        {
            m += c;
        }
    }
    for (auto it = schars.begin(); it != schars.end(); it++)
    {
        t += 1;
    }
    if (t == 26)
        return true;
    return false;
}