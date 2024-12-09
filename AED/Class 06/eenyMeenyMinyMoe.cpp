#include <iostream>
#include <list>
#include <sstream>
using namespace std;

int main() {
    string line;
    getline(cin, line);
    istringstream iss(line);
    int           k = 0;
    string        word;
    while (iss >> word) k++;

    int n;
    cin >> n;
    list<string> children;

    for (int i = 0; i < n; i++) {
        string child;
        cin >> child;
        children.push_back(child);
    }

    auto it = children.begin();
    while (!children.empty()) {
        for (int i = 0; i < k - 1; i++) {
            it++;
            if (it == children.end()) it = children.begin();
        }
        cout << *it << endl;
        it = children.erase(it);
        if (it == children.end()) it = children.begin();
    }

    return 0;
}