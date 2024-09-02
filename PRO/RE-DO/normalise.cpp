#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include "bits/stdc++.h"
using namespace std;
#include "print.h"

void normalise(const string &input_fname, const string &output_fname)
{
    ifstream ifile(input_fname);
    ofstream ofile(output_fname);
    string line;
    while (getline(ifile, line))
    {
        istringstream iss(line);
        string word;
        size_t start = line.find_first_not_of(' ');
        size_t end = line.find_last_not_of(' ');
        if (start == string::npos)
            continue;
        for (size_t i = start; i <= end; i++)
        {
            ofile << (char)toupper(line[i]);
        }
        ofile << endl;
    }
}