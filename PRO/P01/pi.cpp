#include <iomanip>
#include <iostream>
using namespace std;

int main() {
    int k, d;
    cin >> k;
    cin >> d;
    double x = 0;
     for (int n = 0; n <= k; ++n) {
        if (n % 2 == 0) {
            x += 1.0 / (2 * n + 1); 
        } else {
            x -= 1.0 / (2 * n + 1); 
        }
    }

    x *= 4;

    cout << fixed << setprecision(d) << x;

    return 0;
}
