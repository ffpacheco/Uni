#include <iostream>
#include <unordered_map>
#include <vector>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> events(n);

    for (int i = 0; i < n; i++) { cin >> events[i]; }

    vector<int>             ordered(n);
    unordered_map<int, int> map;

    for (int i = 0; i < n; i++) {
        if (map.find(events[i]) == map.end()) {
            ordered[i] = -1;
        } else {
            ordered[i] = map[events[i]];
        }
        map[events[i]] = i + 1;
    }

    for (int i = 0; i < n; i++) {
        if (i > 0) { cout << ' '; }
        cout << ordered[i];
    }
    cout << endl;
    return 0;
}