#include "bits/stdc++.h"
#include "show_file.h"
using namespace std;
void maximum(const string &input_fname, const string &output_fname)
{
    // ler o file:
    ifstream ifile(input_fname);
    ofstream ofile(output_fname);
    double valor;

    double max = -1000;
    int count = 0;

    while (ifile >> valor)
    {
        ofile << fixed << setprecision(3) << valor << endl;
        if (valor > max)
            max = valor;
        count++;
    }
    ofile << "count=" << count << "/max=" << max;
}