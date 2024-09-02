#include <iostream>
#include <map>
#include <sstream>
#include <string>
#include <algorithm>
#include <cctype>

using namespace std;
void show_map(const map<string, size_t> &count)
{
    cout << "[ ";
    for (const auto &e : count)
    {
        cout << e.first << ":" << e.second << ' ';
    }
    cout << "]\n";
}

void count_words(const string &str, map<string, size_t> &count)
{
    istringstream iss(str);
    string word;

    while (iss >> word)
    {
        transform(word.begin(), word.end(), word.begin(), ::tolower);

        count[word]++;
    }
}
