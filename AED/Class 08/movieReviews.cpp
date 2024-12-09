#include <iostream>
#include <unordered_map>
#include <vector>
using namespace std;

int main() {
    int n;
    cin >> n;
    unordered_map<string, vector<int>> movies;

    for (int i = 0; i < n; i++) {
        string movie;
        cin >> movie;
        int score;
        cin >> score;
        movies[movie].push_back(score);
    }
    cout << movies.size() << endl;

    int maxReviews = 0;

    for (auto &movie : movies) {
        int count = movie.second.size();
        if (count > maxReviews) maxReviews = count;
    }

    int count = 0;
    for (auto &movie : movies) {
        if (movie.second.size() == maxReviews) count++;
    }
    cout << maxReviews << " " << count << endl;
    int posMovies = 0;
    for (auto &movie : movies) {
        int pos = 0;
        int neg = 0;
        for (int scores : movie.second) {
            if (scores >= 5) pos++;
            if (scores < 5) neg++;
        }
        if (pos > neg) posMovies++;
    }
    cout << posMovies << endl;

    return 0;
}