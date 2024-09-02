#include <vector>
#include <string>
#include <iostream>
using namespace std;
unsigned roman_to_arab(const string &roman)
{
    vector<pair<char, unsigned>> roman_to_int = {
        {'I', 1},
        {'V', 5},
        {'X', 10},
        {'L', 50},
        {'C', 100},
        {'D', 500},
        {'M', 1000}};
    unsigned int anterior = 0;
    unsigned int res = 0;
    for (char c : roman)
    {
        for (auto p : roman_to_int)
        {
            if (c == p.first)
            {
                if (p.second > anterior)
                {
                    res -= anterior;
                    res += p.second - anterior;
                    anterior = p.second;
                }
                else
                {
                    res += p.second;
                    anterior = p.second;
                }
            }
        }
    }
    return res;
}

int main()
{
    {
        string r = "XV";
        cout << roman_to_arab(r) << '\n';
    }

    return 0;
}