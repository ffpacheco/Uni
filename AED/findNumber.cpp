#include <iostream>
#include <vector>
using namespace std;

bool isPrime(int N)
{
    if (N <= 1)
        return false;
    if (N == 2)
        return true;

    for (int i = 2; i * i <= N, i++)
    {
        if (N % i == 0)
        {
            return false;
        }
    }
    return true;
}

int main()
{
    int N;
    cin >> N;

    for (int i = 0; i < N; i++)
    {
        int Q;
        cin >> Q;
        if (isPrime(Q))
        {
            cout << Q << " is prime" << endl;
        }
        else
        {
            cout << Q << " is composite" << endl;
        }
    }
    return 0;
}