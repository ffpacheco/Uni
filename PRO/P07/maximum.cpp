#include "show_file.h"
#include <cmath>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <string>
using namespace std;

void maximum(const string &input_fname, const string &output_fname) {
    ifstream input_file(input_fname);
    ofstream output_file(output_fname);
    double   valor;
    double   max   = -1000.0;
    int      count = 0;

    while (input_file >> valor) {
        double rounded = round(valor * 1000.0) / 1000.0;
        output_file << fixed << setprecision(3) << rounded << endl;

        if (rounded > max) { max = rounded; }

        count++;
    }
    output_file << "count=" << count << "/";
    output_file << fixed << setprecision(3) << "max=" << max << endl;
}
