#include <string>
#include <vector>
using namespace std;

string longest_prefix(const vector<string> &v)
{
    if (v.empty())
        return "";

    string res = v[0];
    for (size_t j = 0; j < v.size(); j++)
    {
        size_t c = 0;
        while (res[c] == v[j][c] && c < v[j].size() && c < res.size())
        {
            c++;
        }
        res = res.substr(0, c);
    }
    return res;
}