#include <iostream>
#include <unordered_map>
using namespace std;

int main() {
    int c;
    cin >> c;
    unordered_map<int, int> sequence;

    for (int i = 0; i < c; i++) {
        int s;
        cin >> s;

        if (sequence.find(s) == sequence.end()) sequence[s] = 1;
        else { sequence[s]++; }
    }
    int remove = 0;
    for (auto &pair : sequence) {
        if (pair.first > pair.second) remove += pair.second;
        if (pair.first < pair.second) remove += (pair.second - pair.first);
    }
    cout << remove << endl;

    return 0;
}