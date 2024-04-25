#include "Polygon.h"
#include "Point.h"
#include <vector>
#include <iostream>
#include <cmath>

double dist(Point a, Point b)
{
    double c = (a.getx() - b.getx()) * (a.getx() - b.getx());
    double d = (a.gety() - b.gety()) * (a.gety() - b.gety());
    return sqrt(c + d);
}

Polygon::Polygon() {}
Polygon::Polygon(std::vector<Point> points) : poly(points) {}

bool Polygon::get_vertex(unsigned long ind, Point &p) const
{
    if (ind < 1 || ind > poly.size())
    {
        return false;
    }
    p = poly[ind - 1];
    return true;
}
void Polygon::add_vertex(int ind, Point p)
{
    poly.insert(poly.begin() + ind - 1, p);
}
double Polygon::perimeter()
{
    double per;
    for (size_t i = 0; i < poly.size() - 1; i++)
    {
        per += dist(poly[i], poly[i + 1]);
    }
    per += dist(poly[0], poly[poly.size() - 1]);
    return per;
}
void Polygon::show() const
{
    std::cout << "{";
    for (Point ps : poly)
    {
        ps.show();
    }
    std::cout << "}";
}