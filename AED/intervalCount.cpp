#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

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
        int A, B;
        cin >> A >> B;

        auto min = lower_bound(nums.begin(), nums.end(), A);
        auto max = upper_bound(nums.begin(), nums.end(), B);
        
        int count = max - min;
        cout << count << endl;
    }

    return 0;
}
