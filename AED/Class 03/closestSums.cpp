#include <algorithm>
#include <iostream>
#include <limits.h>
#include <vector>
using namespace std;

int main() {
    int n;
    cin >> n;
    vector<int> nums(n);
    for (int i = 0; i < n; i++) { cin >> nums[i]; }
    int q;
    cin >> q;
    vector<int> queries(q);
    for (int i = 0; i < q; i++) { cin >> queries[i]; }

    vector<int> allSums;
    allSums.push_back(0);
    for (int num : nums) {
        int size = allSums.size();
        for (int j = 0; j < size; j++) { allSums.push_back(num + allSums[j]); }
    }
    sort(allSums.begin(), allSums.end());
    allSums.erase(unique(allSums.begin(), allSums.end()));

    for (int qu : queries) {
        auto res  = lower_bound(allSums.begin(), allSums.end(), qu);
        auto res2 = upper_bound(allSums.begin(), allSums.end(), qu);

        if (res == allSums.begin()) cout << allSums[0] << endl;
        if (res2 == allSums.end()) cout << allSums[allSums.size() - 1] << endl;
        if (allSums[res - allSums.begin()] - qu < allSums[res2 - allSums.begin()])
            cout << allSums[res - allSums.begin()] << endl;
        else { cout << allSums[res2 - allSums.begin()] << endl; }
    }
    return 0;
}