#include <algorithm>
#include <iostream>
#include <vector>

int main() {
    int N, K;
    std::cin >> N >> K;
    std::vector<int> skills(N);

    for (int i = 0; i < N; i++) {
        int S;
        std::cin >> S;
        skills[i] = S;
    }

    sort(skills.begin(), skills.end(), std::greater<int>());

    for (int i = 0; i < K; i++) { std::cout << skills[i] << std::endl; }

    return 0;
}