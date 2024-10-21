#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
bool compare(int a, int b ){
    return a>b;
}
int main()
{
    int N, K;
    cin >> N >>K;
    vector<int> players(N);
    for (int i = 0; i < N; i++)
    {
        cin >> players[i];
    }

    sort(players.begin(), players.end(), compare);

    for (int i = 0; i < K; i++)
    {
        cout << players[i] << endl;
    }

    return 0;
}