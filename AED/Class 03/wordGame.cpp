#include <algorithm>
#include <iostream>
#include <vector>
using namespace std;

bool canForm(const string &a, const string &b, vector<int> &sqc, int key) {
    int          n = a.size();
    int          m = b.size();
    vector<bool> removed(n, false);
    for (int i = 0; i < key; i++) { removed[sqc[i] - 1] = true; }
    int j = 0;
    for (int i = 0; i < n; i++) {
        if (!removed[i] && a[i] == b[j]) j++;
        if (j == m) return true;
    }
    return j == m;
}

int binarySearch(const string &a, const string &b, vector<int> &sqc) {
    int low  = 0;
    int high = a.size();
    int res  = 0;
    while (low <= high) {
        int mid = low + (high - low) / 2;
        if (canForm(a, b, sqc, mid)) {
            res = mid;
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    return res;
}

int main() {
    string a, b;
    cin >> a >> b;
    vector<int> nums(a.size());

    for (int i = 0; i < a.size(); i++) { cin >> nums[i]; }
    cout << binarySearch(a, b, nums) << endl;

    return 0;
}