#include <iostream>
#include <string>
#include <vector>
using namespace std;

string longest_prefix(const vector<string> &v) {
    size_t min = string::npos;
    string shorty;
    for (size_t i = 0; i < v.size(); i++) {
        if (v[i].length() <= min) { min = v[i].length(); }
    }

    string prefix = "";
    for (size_t j = 0; j < min; ++j) {
        char current_char = v[0][j];
        for (size_t i = 1; i < v.size(); ++i) {
            if (v[i][j] != current_char) { return prefix; }
        }
        prefix += current_char;
    }

    return prefix;
}
