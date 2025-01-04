#include <algorithm>
#include <iostream>
#include <string>
#include <unordered_map>
#include <vector>

void findMaxFrequencyMotif(int k, const std::string &s) {
    std::unordered_map<std::string, int> motifCount;

    for (size_t i = 0; i <= s.length() - k; ++i) {
        std::string motif = s.substr(i, k);
        motifCount[motif]++;
    }

    int maxFrequency = 0;
    for (const auto &entry : motifCount) { maxFrequency = std::max(maxFrequency, entry.second); }

    std::vector<std::string> maxMotifs;
    for (const auto &entry : motifCount) {
        if (entry.second == maxFrequency) { maxMotifs.push_back(entry.first); }
    }

    std::cout << maxFrequency << std::endl;
    if (maxMotifs.size() == 1) {
        std::cout << maxMotifs[0] << std::endl;
    } else {
        std::cout << maxMotifs.size() << std::endl;
    }
}

int main() {
    int         k;
    std::string s;
    std::cin >> k;
    std::cin >> s;

    findMaxFrequencyMotif(k, s);
    return 0;
}
