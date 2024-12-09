#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

struct Point
{
    int x, y;

    bool operator<(const Point &p) const
    {
        return y < p.y || (y == p.y && x < p.x);
    }
};

int crossProduct(const Point &O, const Point &A, const Point &B)
{
    return (A.x - O.x) * (B.y - O.y) - (A.y - O.y) * (B.x - O.x);
}

vector<Point> convexHull(vector<Point> &points)
{
    int n = points.size();
    if (n < 3)
        return points;

    sort(points.begin(), points.end());

    vector<Point> hull;

    for (const auto &p : points)
    {
        while (hull.size() >= 2 && crossProduct(hull[hull.size() - 2], hull[hull.size() - 1], p) <= 0)
        {
            hull.pop_back();
        }
        hull.push_back(p);
    }

    int lowerHullSize = hull.size();
    for (int i = n - 1; i >= 0; --i)
    {
        while (hull.size() > lowerHullSize && crossProduct(hull[hull.size() - 2], hull[hull.size() - 1], points[i]) <= 0)
        {
            hull.pop_back();
        }
        hull.push_back(points[i]);
    }

    hull.pop_back();

    return hull;
}

int main()
{
    int N;
    cin >> N;

    vector<Point> points(N);
    for (int i = 0; i < N; ++i)
    {
        cin >> points[i].x >> points[i].y;
    }

    vector<Point> hull = convexHull(points);

    cout << hull.size() << endl;
    for (const auto &p : hull)
    {
        cout << p.x << " " << p.y << endl;
    }

    return 0;
}
