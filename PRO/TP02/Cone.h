#ifndef CONE_H
#define CONE_H

#include "Solid3D.h"
#include <cmath>
using namespace std;

class Cone : public Solid3D
{
public:
    Cone(point center, double radius, double height) : Solid3D(center), radius_(radius), height_(height) {}
    double radius() const { return radius_; }
    double height() const { return height_; }
    virtual double volume() const { return M_PI * radius() * radius() * height() / 3; }

private:
    double radius_, height_;
};

#endif