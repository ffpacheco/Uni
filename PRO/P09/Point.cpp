#include "Point.h"
#include <iostream>

Point::Point() : Point(0, 0) {}
Point::Point(int x, int y) : x_(x), y_(y) {}
int Point::getx() const
{
    return x_;
}
int Point::gety() const
{
    return y_;
}
void Point::show() const
{
    std::cout << "(" << x_ << "," << y_ << ")";
}