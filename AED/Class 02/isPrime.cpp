#include <iostream>

bool Prime(int n) {
    if (n <= 1) return false;
    if (n == 2 || n == 3) return true;

    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) { return false; }
    }
    return true;
}

int main() {
    int q;
    std::cin >> q;
    for (int i = 0; i < q; i++) {
        int n;
        std::cin >> n;
        if (Prime(n)) {
            std::cout << n << " is prime\n";
        } else {
            std::cout << n << " is composite\n";
        }
    }

    return 0;
}