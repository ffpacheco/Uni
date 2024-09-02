#include <string>
#include <vector>
#include <sstream>
#include <iostream>
#include <map>
#include <algorithm>
using namespace std;
void count_words(const string &str, vector<pair<string, size_t>> &count)
{
    istringstream iss(str);
    string word;
    count.clear();
    while (iss >> word)
    {
        for (char &c : word)
            c = tolower(c);
        bool found = false;
        for (auto &par : count)
        {
            if (par.first == word)
            {
                par.second++;
                found = true;
            }
        }
        if (not found)
            count.push_back({word, 1});
    }
    sort(count.begin(), count.end(), [](pair<string, size_t> a, pair<string, size_t> b)
         { return a.first < b.first; });
}

void show_vector(const vector<pair<string, size_t>> &count)
{
    cout << "[ ";
    for (const auto &e : count)
    {
        cout << e.first << ":" << e.second << ' ';
    }
    cout << "]\n";
}