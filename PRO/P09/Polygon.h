#ifndef POLYGON_H
#define POLYGON_H

#include "Point.h"
#include <vector>
class Polygon
{
private:
    std::vector<Point> poly;

public:
    Polygon();
    Polygon(std::vector<Point> points);

    bool get_vertex(unsigned long ind, Point &p) const;
    void add_vertex(int ind, Point p);

    double perimeter();
    void show() const;
};
#endif