#include <iostream>
#include <sstream>
#include <stack>
#include <utility>
#include <vector>
using namespace std;

int main() {
    string line;
    getline(cin, line);


    stack<pair<char, int>>                         safe;
    vector<pair<pair<char, int>, pair<char, int>>> out;


    for (size_t i = 0; i < line.size(); i++) {
        char c = line[i];


        if (c == '(' || c == '{' || c == '[') {
            safe.push({ c, i });


        } else if (c == ')' || c == '}' || c == ']') {
            if (safe.size() == 0) {
                cout << "badly matched pairs" << endl;
                return 0;
            }


            char top = safe.top().first;

            if ((c == ')' && top == '(') || (c == '}' && top == '{') || (c == ']' && top == '[')) {
                out.push_back({
                    { safe.top().first, safe.top().second },
                    {                c,                 i }
                });
                safe.pop();
            } else {
                cout << "badly matched pairs" << endl;
                return 0;
            }
        }
    }
    if (!safe.empty()) {
        cout << "badly matched pairs" << endl;

    } else if (out.empty()) cout << "no brides and grooms to marry" << endl;
    else {
        for (auto pair : out) {
            cout << pair.first.first << pair.second.first << " " << pair.first.second << " "
                 << pair.second.second << endl;
        }
    }

    return 0;
}