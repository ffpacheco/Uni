#include <iostream>
#include <vector>
#include <sstream>
#include <algorithm>
using namespace std;

struct Team
{
    string name;
    int points;
    int goalsAverage;
};

Team createTeam(const string &input)
{
    string name;
    int wins, draws, losses, goalsScored, goalsAgainst;

    istringstream iss(input);
    iss >> name >> wins >> draws >> losses >> goalsScored >> goalsAgainst;

    int points = 3 * wins + draws;
    int goalsAverage = goalsScored - goalsAgainst;
    return Team{name, points, goalsAverage};
}

bool compare(const Team &a, const Team &b)
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
    int N;
    cin >> N;
    cin.ignore();
    vector<Team> teams;

    for (int i = 0; i < N; i++)
    {
        string input;
        getline(cin, input);
        teams.push_back(createTeam(input));
    }

    sort(teams.begin(), teams.end(), compare);
    for (int i = 0; i < N; i++)
    {
        cout << teams[i].name << ' ' << teams[i].points << ' ' << teams[i].goalsAverage << endl;
    }

    return 0;
}