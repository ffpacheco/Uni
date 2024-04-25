#ifndef CIRCLE_H
#define CIRCLE_H
#include "Shape.h"
#include <cmath>

class Circle : public Shape
{
public:
    Circle(const point &p, double radius) : Shape(p), radius_(radius) {}
    virtual double area() const
    {
        return M_PI * radius_ * radius_;
    }
    virtual double perimeter() const
    {
        return 2.0 * M_PI * radius_;
    }
    virtual bool contains(const point &p) const override
    {
        double dist = sqrt(pow(p.x - get_center().x, 2) + pow(p.y - get_center().y, 2));
        return dist <= radius_;
    }

private:
    double radius_;
};

#endif