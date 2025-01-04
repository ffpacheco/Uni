#include <iostream>
#include <queue>
#include <vector>
using namespace std;

int main() {
    int N;
    cin >> N;

    priority_queue<int, vector<int>, greater<int>> minHeap;

    for (int i = 0; i < N; i++) {
        int length;
        cin >> length;
        minHeap.push(length);
    }

    int totalCost = 0;

    while (minHeap.size() > 1) {
        int first = minHeap.top();
        minHeap.pop();

        int second = minHeap.top();
        minHeap.pop();

        int combined  = first + second;
        totalCost    += combined;

        minHeap.push(combined);
    }

    cout << totalCost << endl;

    return 0;
}
