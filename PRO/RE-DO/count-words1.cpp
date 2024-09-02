#include <fstream>
#include <cctype>
#include <iostream>
#include <string>
using namespace std;

int count(const string &fname, const string &word)
{
    ifstream file(fname); // open
    int count = 0;
    string lowfile;
    for (char c : word)
    {
        lowfile += tolower(c);
    }

    string fword;
    while (file >> fword)
    {
        string lowword;
        for (char c : fword)
        {
            lowword += tolower(c);
        }
        if (lowfile == lowword)
        {
            count += 1;
        }
    }
    return count;
}