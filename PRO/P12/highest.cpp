#include <string>
#include <map>
#include <list>
#include <vector>
#include <algorithm>
using namespace std;

string student_highest_avg(map<string, list<int>> m)
{
    double highest = 0;
    string top;
    for (auto students : m)
    {
        string name = students.first;
        list<int> grades = students.second;

        double average = 0;
        double count = 0;
        for (int grade : grades)
        {
            average += grade;
            count += 1;
        }
        average /= count;

        if (average > highest)
        {
            highest = average;
            top = name;
        }
    }
    return top;
}