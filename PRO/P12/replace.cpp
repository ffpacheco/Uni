#include <map>
#include <string>
#include <iostream>
using namespace std;
void replace(const map<char, char> &r, string &s)
{
    for (char &c : s)
    {
        auto iterator = r.find(c);
        if (iterator != r.end())
        {
            c = iterator->second;
        }
    }
}