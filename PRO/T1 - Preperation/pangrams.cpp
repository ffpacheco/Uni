bool pangram(const char s[], char m[]) {
    int len       = 0;
    int aplha[26] = { 0 };
    while (s[len] != '\0') { len++; }
    for (int i = 0; i < len; ++i) { m[i] = s[i]; }

    // converte pa lowercase
    for (int j = 0; j < len; j++) {
        if (m[j] >= 'A' && m[j] <= 'Z') { m[j] = m[j] - 'A' + 'a'; }
    }

    // muda alpha pa true sempre que coiso
    for (int i = 0; i < len; ++i) { aplha[m[i] - 'a'] = 1; }

    int index = 0;
    // se alpha for falso append no m
    for (int i = 0; i < 26; ++i) {
        if (aplha[i] == 0) {
            m[index] = i + 'a';
            index++;
        }
    }
    m[index] = '\0';
    int lm   = 0;
    while (m[lm] != '\0') { lm++; }
    if (lm == 0) { return true; }
    return false;
}

#include <iostream>

int main() {
    char atum[50];
    std::cout << pangram("abc", atum) << std::endl;
    std::cout << atum << std::endl;
    return 0;
}