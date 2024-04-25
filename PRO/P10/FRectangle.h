#ifndef FRECTANGLE_H
#define FRECTANGLE_H

#include <iostream>
#include "Figure.h"

class FRectangle : public Figure
{
public:
    FRectangle(double x_center, double y_center, int width, int height) : Figure(x_center, y_center), width_(width), height_(height) {}

    void draw() const override final
    {
        std::cout << 'R' << '(' << x_center_ << ',' << y_center_ << ')' << '(' << width_ << ',' << height_ << ')';
    };

private:
    int width_, height_;
};

#endif

// Figure *t = new FRectangle(...)
// t->draw()