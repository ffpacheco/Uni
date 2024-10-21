#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

struct Team
{
    string name;
    int points;
    int goalsAverage;
};

bool compare(Team a, Team b)
{
    if (a.points != b.points)
    {
        return a.points > b.points;
    }
    if (a.goalsAverage != b.goalsAverage)
    {
        return a.goalsAverage > b.goalsAverage;
    }

    return a.name < b.name;
}

int main()
{
    int n;
    cin >> n;
    vector<Team> teams(n);
    for (int i = 0; i < n; i++)
    {
        string name;
        int wins, draws, losses, goalsScored, goalsAgainst;
        cin >> name >> wins >> draws >> losses >> goalsScored >> goalsAgainst;
        int points = 3 * wins + draws;
        int goalsAverage = goalsScored - goalsAgainst;
        teams[i] = Team{name, points, goalsAverage};
    }

    sort(teams.begin(), teams.end(), compare);
    for (int i = 0; i < n; i++)
    {
        cout << teams[i].name << " " << teams[i].points << " " << teams[i].goalsAverage << endl;
    }

    return 0;
}