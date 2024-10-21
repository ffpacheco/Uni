#include <algorithm>
#include <iostream>
#include <vector>
#include <numeric>
using namespace std;

int cabins(vector<int> &sqc, int key)
{
    int high = sqc.size() - 1;
    int low = 0;
    int res = 0;
    while (low <= high)
    {   
        if (sqc[high] + sqc[low] <= key)
        {
            low++;
            high--;
        }
        else
        {
            high--;
        }
        res++;
    }
    return res;
}

int main()
{
    int n, k;
    cin >> n >> k;
    vector<int> weight(n);
    for (int i = 0; i < n; i++)
    {
        cin >> weight[i];
    }

    sort(weight.begin(), weight.end());

    cout << cabins(weight, k) << endl;

    return 0;
}