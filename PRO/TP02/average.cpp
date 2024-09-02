#include <string>
#include <fstream>
#include <sstream>
#include <iostream>
#include "show_file.h"
using namespace std;
void average(const string &input_fname, const string &output_fname)
{
    ifstream ifile(input_fname);
    ofstream ofile(output_fname);
    string line;
    int linecounter = 0;
    while (getline(ifile, line))
    {
        linecounter++;
        istringstream iss(line);
        double value;
        double sum = 0;
        double media = 0;
        while (iss >> value)
        {
            sum += value;
            media++;
        }
        double average = sum / media;

        ofile << fixed << setprecision(3) << average << endl;
    }
    ofile << "lines=" << linecounter;
}