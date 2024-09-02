#include <iostream>
using namespace std;
int main()
{
    int h1, m1, h2, m2;
    cin >> h1 >> m1 >> h2 >> m2;
    h1 = h1 * 60;
    h2 = h2 * 60;
    int time1 = h1 + m1;
    int time2 = h2 + m2;
    if (time1 >= time2)
    {
        cout << time1 - time2;
    }
    else
    {
        cout << time2 - time1;
    }
    return 0;
}