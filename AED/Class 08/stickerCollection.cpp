#include <iostream>
#include <set>
using namespace std;

int main() {
    int c, b;
    cin >> c;
    set<int> collection;
    set<int> newCards;

    for (int i = 0; i < c; i++) {
        int card;
        cin >> card;
        collection.insert(card);
    }
    cin >> b;

    for (int i = 0; i < b; i++) {
        int card;
        cin >> card;
        if (collection.find(card) == collection.end()) { newCards.insert(card); }
    }

    cout << newCards.size() << endl;
    if (!newCards.empty()) {
        for (auto it = newCards.begin(); it != newCards.end(); ++it) {
            if (it != newCards.begin()) cout << ' ';
            cout << *it;
        }
        cout << endl;
    }

    return 0;
}
