#include <iostream>

int main() {
    int q;
    std::cin >> q;
    int count = 0;
    for (int i = 0; i < q; i++) {
        int n;
        std::cin >> n;
        if (n == 42) { count++; }
    }
    std::cout << count << std::endl;
    return 0;
}