#include "print_string.h"
#include <iostream>
#include <string>
#include <vector>

void split(const string &s, vector<string> &v) {
    size_t pos = 0;
    while (pos < s.length()) {
        // onde começa a 1º string:

        size_t start = s.find_first_not_of(' ', pos);
        if (start == string::npos) { break; }

        // onde acaba a 1º string:

        size_t end = s.find(' ', start);
        if (end == string::npos) { end = s.length(); }
        v.push_back(s.substr(start, end - start));
        pos = end;
    }
}
