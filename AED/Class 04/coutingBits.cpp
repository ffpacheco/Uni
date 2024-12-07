#include <algorithm>
#include <iostream>
#include <vector>

int onesCount(int x) {
    int ones = 0;
    while (x > 0) {
        if (x % 2 > 0) ones++;
        x = x / 2;
    }
    return ones;
}

bool compare(int a, int b) {
    int aCount = onesCount(a);
    int bCount = onesCount(b);
    if (aCount == bCount) return a < b;
    return aCount > bCount;
}

int main() {
    int N;
    std::cin >> N;
    std::vector<int> nums(N);

    for (int i = 0; i < N; i++) {
        int S;
        std::cin >> S;
        nums[i] = S;
    }

    sort(nums.begin(), nums.end(), compare);

    for (int i = 0; i < N; i++) { std::cout << nums[i] << std::endl; }

    return 0;
}