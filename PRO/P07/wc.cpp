#include "wc.h"
#include <fstream>
#include <sstream>
#include <string>
using namespace std;

wcresult wc(const string &filename) {
    ifstream file(filename);
    wcresult result = { 0, 0, 0 };
    string   line;

    while (getline(file, line)) {
        result.lines++;
        result.bytes += line.size() + 1;

        istringstream iss(line);
        string        word;
        while (iss >> word) { result.words++; }
    }

    return result;
}