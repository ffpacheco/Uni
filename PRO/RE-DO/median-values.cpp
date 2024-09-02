#include "bits/stdc++.h"
#include "show_file.h"
using namespace std;
void calc_medians(const string &input_fname, const string &output_fname)
{
    ifstream ifile(input_fname);
    ofstream ofile(output_fname);

    string series;
    while (getline(ifile, series))
    {
        vector<double> serievec;
        if (series[0] == '#')
            continue;
        string iden;

        istringstream iss(series);
        iss >> iden;

        double number;
        double median;

        while (iss >> number)
            serievec.push_back(number);

        sort(serievec.begin(), serievec.end());
        if (serievec.size() % 2 == 0)
        {
            median = 0.5 * (serievec[serievec.size() / 2 - 1] + serievec[serievec.size() / 2]);
        }
        else
        {
            median = serievec[serievec.size() / 2];
        }

        ofile << iden << ' ' << fixed << setprecision(1) << median << endl;
    }
}
