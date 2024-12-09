#include <iostream>
#include <set>
using namespace std;

int main() {
    int           a, b;
    multiset<int> Alice;
    multiset<int> Bob;

    cin >> a;
    for (int i = 0; i < a; i++) {
        int card;
        cin >> card;
        Alice.insert(card);
    }

    cin >> b;
    for (int i = 0; i < b; i++) {
        int card;
        cin >> card;
        Bob.insert(card);
    }

    while (!Bob.empty() && !Alice.empty()) {
        auto bobCard   = --Bob.end();
        auto aliceCard = --Alice.end();

        if (*aliceCard > *bobCard) {
            int newCard = *aliceCard - *bobCard;
            Bob.erase(bobCard);
            Alice.erase(aliceCard);
            Alice.insert(newCard);
        } else if (*aliceCard < *bobCard) {
            int newCard = *bobCard - *aliceCard;
            Bob.erase(bobCard);
            Alice.erase(aliceCard);
            Bob.insert(newCard);
        } else {
            Bob.erase(bobCard);
            Alice.erase(aliceCard);
        }
    }

    if (!Alice.empty()) {
        cout << "Alice wins" << endl;
        cout << Alice.size() << endl;
    } else if (!Bob.empty()) {
        cout << "Bob wins" << endl;
        cout << Bob.size() << endl;
    } else {
        cout << "Tie" << endl;
        cout << Bob.size() << endl;
    }


    return 0;
}