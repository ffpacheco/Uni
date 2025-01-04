#include <cctype>
#include <iostream>
#include <map>
#include <sstream>
#include <unordered_set>

void processTextAndDictionaries() {
    int N; // Number of languages
    std::cin >> N;

    std::map<std::string, std::unordered_set<std::string>> dictionaries;
    for (int i = 0; i < N; ++i) {
        std::string languageName;
        int         wordCount;
        std::cin >> languageName >> wordCount;

        std::unordered_set<std::string> dictionary;
        for (int j = 0; j < wordCount; ++j) {
            std::string word;
            std::cin >> word;
            dictionary.insert(word);
        }
        dictionaries[languageName] = dictionary;
    }

    // Read the full text T and process it
    std::cin.ignore(); // Consume the newline character
    std::string text;
    std::getline(std::cin, text);

    // Convert the text into lowercase words
    std::istringstream              stream(text);
    std::unordered_set<std::string> textWords;
    std::string                     word;
    while (stream >> word) {
        std::string cleanWord;
        for (char c : word) {
            if (std::isalpha(c)) {
                cleanWord += std::tolower(c);
            } else if (!cleanWord.empty()) {
                textWords.insert(cleanWord);
                cleanWord.clear();
            }
        }
        if (!cleanWord.empty()) { textWords.insert(cleanWord); }
    }

    // Compute word matches for each language
    for (const auto &[languageName, dictionary] : dictionaries) {
        int matchCount = 0;
        for (const auto &w : textWords) {
            if (dictionary.count(w)) { ++matchCount; }
        }
        std::cout << languageName << ": " << matchCount << std::endl;
    }
}

int main() {
    processTextAndDictionaries();
    return 0;
}
