
char *repeat(const char str[], int n) {
    int len = 0, i = 0;
    while (str[len]) { ++len; }
    char *res = new char[len * n + 1];
    while (i != n) {
        for (int j = 0; j < len; ++j) { res[(i * len) + j] = str[j]; }
        ++i;
    }
    res[len * n] = '\0';
    return res;
}

#include <iostream>

int main() {
    std::cout << repeat("atum", 4) << std::endl;
    return 0;
}