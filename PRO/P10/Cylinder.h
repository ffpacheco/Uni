#ifndef CYLINDER_H
#define CYLINDER_H

#include "Solid.h"
#include <cmath>

class Cylinder : public Solid
{
private:
    double radius_, height_;

public:
    Cylinder(const point &center, const double radius, const double height) : Solid(center), radius_(radius), height_(height) {}
    double radius() const
    {
        return radius_;
    }
    double height() const
    {
        return height_;
    }
    double area() const override final
    {
        return 2.0 * M_PI * radius_ * (radius_ + height_);
    }
};
#endif