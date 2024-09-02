#include <string>
#include <vector>
#include <sstream>
#include "print_string.h"

using namespace std;
void split(const string &s, vector<string> &v)
{
    istringstream iss(s);
    string word;

    while (iss >> word)
    {
        v.push_back(word);
    }
}