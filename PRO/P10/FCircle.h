#ifndef FCIRCLE_H
#define FCIRCLE_H

#include <iostream>
#include "Figure.h"

class FCircle : public Figure
{
public:
    FCircle(double x_center, double y_center, int radius_) : Figure(x_center, y_center), radius(radius_) {}

    void draw() const override final
    {
        std::cout << 'C' << '(' << x_center_ << ',' << y_center_ << ')' << '(' << radius << ')';
    };

private:
    int radius;
};

#endif