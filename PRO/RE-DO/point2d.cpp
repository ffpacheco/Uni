#include "bits/stdc++.h"
#include "Point2d.h"
using namespace std;
void Point2d::translate(const Point2d &t)
{
    x += t.x;
    y += t.y;
}
double Point2d::distance_to(const Point2d &p) const
{
    return sqrt((x - p.x) * (x - p.x) + (y - p.y) * (y - p.y));
}