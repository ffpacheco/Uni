#include <iostream>
#include <queue>
#include <string>
#include <utility>
using namespace std;

int main() {
    int t, n;
    cin >> t >> n;

    queue<pair<string, int>> q;

    int totalTime  = 0;
    int iterations = 0;

    for (int i = 0; i < n; i++) {
        string process;
        int    time;

        cin >> process >> time;

        q.push({ process, time });
    }

    while (!q.empty()) {
        int    processTime = q.front().second;
        string processName = q.front().first;

        iterations++;

        if (processTime <= t) {
            // processo acabou
            totalTime += processTime;
            cout << processName << ' ' << totalTime << ' ' << iterations << endl;
            q.pop();
        } else {
            // processo para o fim da queue
            totalTime   += t;
            processTime -= t;
            q.push({ processName, processTime });
            q.pop();
        }
    }
    return 0;
}