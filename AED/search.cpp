#include <iostream>
#include <vector>
using namespace std;

int search(const vector<int>& sqc, int key)
{
    int high = sqc.size() - 1;
    int low = 0;
    while (low <= high)
    {
        int mid = low + (high - low) / 2;
        if (key < sqc[mid])
        {
            high = mid - 1;
        }
        else if (key > sqc[mid])
        {
            low = mid + 1;
        }
        else
        {
            return mid;
        }
    }

    return -1;
}

int main()
{

    int N;
    cin >> N;
    vector<int> nums(N);
    for (int i = 0; i < N; i++)
    {
        int S;
        cin >> S;
        nums[i] = S;
    }

    int Q;
    cin >> Q;
    for (int i = 0; i < Q; i++)
    {
        int X;
        cin >> X;
        int res = search(nums,X);
        cout << res << endl;
    }
    return 0;
}