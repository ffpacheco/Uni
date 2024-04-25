#include <cctype>
#include <fstream>
#include <string>
using namespace std;

int count(const string &fname, const string &word) {
    ifstream file(fname);
    string   token;
    int      count = 0;
    string   lowercase;
    for (char c : word) { lowercase += tolower(c); }

    while (file >> token) {
        string lowercase_token;

        for (char c : token) { lowercase_token += tolower(c); }

        if (lowercase_token == lowercase) { count++; }
    }

    return count;
}