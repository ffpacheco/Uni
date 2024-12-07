#include <iostream>
#include <vector>
using namespace std;

int binarySearch(vector<int> &sqc, int key) {
    int min   = 0;
    int max   = sqc.size() - 1;
    int bound = -1;
    while (min <= max) {
        int mid = min + (max - min) / 2;
        if (sqc[mid] >= key) {
            bound = mid;
            max   = mid - 1;
        } else {
            min = mid + 1;
        }
    }
    return bound;
}

int main() {
    int N;
    cin >> N;

    vector<int> nums(N);

    for (int i = 0; i < N; i++) {
        int S;
        cin >> S;
        nums[i] = S;
    }
    int Q;
    cin >> Q;

    for (int i = 0; i < Q; i++) {
        int X;
        cin >> X;
        int bound = binarySearch(nums, X);
        cout << bound << endl;
    }
    return 0;
}