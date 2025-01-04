#include <iostream>
#include <vector>
using namespace std;

string checkHeapType(const vector<int> &arr) {
    int  n         = arr.size();
    bool isMaxHeap = true;
    bool isMinHeap = true;

    for (int i = 0; i <= (n - 2) / 2; i++) {
        int left  = 2 * i + 1;
        int right = 2 * i + 2;

        if (left < n) {
            if (arr[i] < arr[left]) { isMaxHeap = false; }
            if (arr[i] > arr[left]) { isMinHeap = false; }
        }

        if (right < n) {
            if (arr[i] < arr[right]) { isMaxHeap = false; }
            if (arr[i] > arr[right]) { isMinHeap = false; }
        }
    }

    if (isMaxHeap && isMinHeap) {
        return "max or min heap";
    } else if (isMaxHeap) {
        return "max heap";
    } else if (isMinHeap) {
        return "min heap";
    } else {
        return "none";
    }
}

int main() {
    int N;
    cin >> N;

    while (N--) {
        int L;
        cin >> L;

        vector<int> arr(L);
        for (int i = 0; i < L; i++) { cin >> arr[i]; }

        cout << checkHeapType(arr) << endl;
    }

    return 0;
}
