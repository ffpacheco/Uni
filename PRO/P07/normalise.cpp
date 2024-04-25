#include "print.h"
#include <cctype>
#include <fstream>
#include <string>
using namespace std;

void normalise(const string &input_fname, const string &output_fname) {
    ifstream in(input_fname);
    ofstream out(output_fname);
    string   linha;

    while (getline(in, linha)) {
        if (linha.find_first_not_of(' ') == string::npos) { continue; }
        size_t start_pos = linha.find_first_not_of(' ');
        size_t end_pos   = linha.find_last_not_of(' ');
        linha            = linha.substr(start_pos, end_pos - start_pos + 1);
        for (char &c : linha) { c = toupper(c); }
        out << linha << '\n';
    }
}