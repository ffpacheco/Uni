
#include <iostream>
#include <list>
#include <sstream>

using namespace std;

int main()
{

    string input;
    getline(cin, input);
    istringstream iss(input);
    int k = 0;
    string word;
    while (iss >> word)
        k++;

    int n;
    cin >> n;
    cin.ignore();
    list<string> lst;
    for (int i = 0; i < n; i++)
    {
        string name;
        cin >> name;
        lst.push_back(name);
    }
    auto it = lst.begin();
    while (lst.size() != 1)
    {
        for (int i = 1; i < k; i++)
        {
            ++it;
            if (it == lst.end())
                it = lst.begin();
        }
        cout << *it << endl;
        it = lst.erase(it);

        if (it == lst.end())
            it = lst.begin();
    }
    cout << *it << endl;
    return 0;
}