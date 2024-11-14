#include <iostream>
#include <vector>
#include <stack>
using namespace std;

int main()
{
    string expression;
    getline(cin, expression);

    stack<pair<char, int>> stk;
    vector<tuple<char, char, int, int>> pairs;

    bool nobraces = true;
    bool badlyMatched = false;

    for (int i = 0; i < expression.size(); ++i)
    {
        char ch = expression[i];
        if (ch == '(' || ch == '[' || ch == '{')
        {
            nobraces = false;
            stk.push({ch, i});
        }
        else if (ch == ')' || ch == ']' || ch == '}')
        {
            nobraces = false;
            if (stk.empty())
            {
                badlyMatched = true;
                break;
            }
            char topChar = stk.top().first;
            if (ch == ')' && topChar == '(' || ch == ']' && topChar == '[' || ch == '}' && topChar == '{')
            {
                pairs.push_back(topChar, ch, stk.top().second, i);
            }
            else
            {
                badlyMatched = true;
            }
        }
    }
    if (nobraces)
        cout << "no brides and grooms to marry" << endl;
    if (badlyMatched)
        cout << "badly matched pairs" << endl;
    return 0;
}
