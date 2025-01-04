#include <iostream>
#include <queue>
#include <tuple>
#include <vector>

using namespace std;

int dx[] = { -1, 1, 0, 0 };
int dy[] = { 0, 0, -1, 1 };

int bfs(const vector<string> &maze, int R, int C, pair<int, int> start, pair<int, int> treasure) {
    queue<tuple<int, int, int>> q;
    vector<vector<bool>>        visited(R, vector<bool>(C, false));

    q.push(make_tuple(start.first, start.second, 0));
    visited[start.first][start.second] = true;

    while (!q.empty()) {
        int x, y, dist;
        tie(x, y, dist) = q.front();
        q.pop();

        if (make_pair(x, y) == treasure) { return dist; }

        for (int i = 0; i < 4; ++i) {
            int nx = x + dx[i], ny = y + dy[i];

            if (nx >= 0 && nx < R && ny >= 0 && ny < C && !visited[nx][ny] && maze[nx][ny] != '#') {
                visited[nx][ny] = true;
                q.push(make_tuple(nx, ny, dist + 1));
            }
        }
    }

    return -1;
}

int main() {
    int N;
    cin >> N;

    while (N--) {
        int R, C;
        cin >> R >> C;

        vector<string> maze(R);
        pair<int, int> player, treasure;

        for (int i = 0; i < R; ++i) {
            cin >> maze[i];
            for (int j = 0; j < C; ++j) {
                if (maze[i][j] == 'P') { player = make_pair(i, j); }
                if (maze[i][j] == 'T') { treasure = make_pair(i, j); }
            }
        }

        cout << bfs(maze, R, C, player, treasure) << endl;
    }

    return 0;
}
