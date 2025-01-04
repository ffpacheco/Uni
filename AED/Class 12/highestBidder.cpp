#include <iostream>
#include <queue>
#include <string>
#include <unordered_set>
using namespace std;

int main() {
    int N;
    cin >> N;

    priority_queue<pair<int, string>> maxHeap;     
    unordered_set<string>             activeBuyers; 

    for (int i = 0; i < N; i++) {
        string event;
        cin >> event;

        if (event == "OFFER") {
            string name;
            int    price;
            cin >> name >> price;

            maxHeap.push({ price, name });
            activeBuyers.insert(name);
        } else if (event == "SALE") {
            while (!maxHeap.empty()) {
                auto   topOffer = maxHeap.top();
                string buyer    = topOffer.second;
                int    price    = topOffer.first;

                if (activeBuyers.find(buyer) != activeBuyers.end()) {
                    cout << price << " " << buyer << endl;
                    activeBuyers.erase(buyer); 
                    maxHeap.pop();
                    break;
                } else {
                    maxHeap.pop();
                }
            }
        }
    }

    return 0;
}
