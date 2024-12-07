#include <algorithm>
#include <iostream>
#include <numeric>
#include <vector>
using namespace std;

bool canSplit(vector<int> &sqc, int days, int max) {
    int current = 0;
    int reqdays = 1;
    for (int dist : sqc) {
        if (current + dist > max) {
            reqdays++;
            current = dist;

            if (reqdays > days) { return false; }
        } else {
            current += dist;
        }
    }
    return true;
}

int search(vector<int> &sqc, int days) {
    int high = accumulate(sqc.begin(), sqc.end(), 0);
    int low  = *max_element(sqc.begin(), sqc.end());
    int best = high;

    while (low <= high) {
        int mid = low + (high - low) / 2;

        if (canSplit(sqc, days, mid)) {
            best = mid;
            high = mid - 1;
        } else {
            low = mid + 1;
        }
    }
    return best;
}

int main() {
    int N;
    cin >> N;
    vector<int> dist(N);

    for (int i = 0; i < N; i++) {
        int D;
        cin >> D;
        dist[i] = D;
    }

    int Q;
    cin >> Q;

    for (int i = 0; i < Q; i++) {
        int K;
        cin >> K;
        int res = search(dist, K);
        cout << res << endl;
    }

    return 0;
}