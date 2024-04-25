#include "show_file.h"
#include <cmath>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <string>
using namespace std;

void calc_medians(const string &input_fname, const string output_fname) {
    ifstream input_file(input_fname);
    ofstream output_file(output_fname);

    string linha;
    string identifier;
    string valor;

    while (getline(input_file, linha)) {
        int vsize = 0;
        if (linha[0] == '#') continue;

        vector<double> vec;
        istringstream  line_stream(linha);

        while (line_stream) {
            line_stream >> valor;

            if (line_stream) {
                if (vsize == 0) identifier = valor + ' ';
                else vec.push_back(stod(valor));
                vsize++;
            }
        }
        vsize--;
        sort(vec.begin(), vec.end());

        if (vsize % 2 != 0) {
            output_file << identifier << fixed << setprecision(1)
                        << vec[vsize / 2] << endl;
        } else {
            output_file << identifier << fixed << setprecision(1)
                        << 0.5 * (vec[vsize / 2 - 1] + vec[vsize / 2]) << endl;
        }
    }
}
