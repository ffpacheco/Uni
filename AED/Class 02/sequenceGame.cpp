#include <iostream>
#include <limits.h>
#include <vector>

int main() {
    int n;
    std::cin >> n;
    std::vector<int> nums(n);
    for (int i = 0; i < n; ++i) { std::cin >> nums[i]; }

    int max_sum     = INT_MIN;
    int current_sum = 0;

    for (int i = 0; i < n; ++i) {
        current_sum += nums[i];

        if (current_sum > max_sum) { max_sum = current_sum; }

        if (current_sum < 0) { current_sum = 0; }
    }

    std::cout << max_sum << std::endl;

    return 0;
}