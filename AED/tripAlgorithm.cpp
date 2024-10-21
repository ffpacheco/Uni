#include <algorithm>
#include <iostream>
#include <numeric>
#include <vector>
using namespace std;

bool canSplit(vector<int> &sqc, int days, int max)
{
    int current = 0;
    int req = 1;
    for (int dist : sqc)
    {
        if (current + dist > max)
        {
            req++;
            current = dist;
            if (req > days)
            {
                return false;
            }
        }
        else
        {
            current += dist;
        }
    }
    return true;
}

int Search(vector<int> &sqc, int key)
{
    int high = accumulate(sqc.begin(), sqc.end(), 0);
    int low = *max_element(sqc.begin(), sqc.end());
    int best = high;
    while (low <= high)
    {
        int mid = low + (high - low) / 2;
        if (canSplit(sqc, key, mid))
        {
            best = mid;
            high = mid - 1;
        }
        else
        {
            low = mid + 1;
        }
    }
    return best;
}

int main()
{
    int n;
    cin >> n;
    vector<int> dist(n);
    for (int i = 0; i < n; i++)
    {
        cin >> dist[i];
    }
    int q;
    cin >> q;
    for (int i = 0; i < q; i++)
    {
        int S;
        cin >> S;
        cout << Search(dist, S) << endl;
    }

    return 0;
}