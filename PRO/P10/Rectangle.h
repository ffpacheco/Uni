#ifndef RECTANGLE_H
#define RECTANGLE_H
#include "Shape.h"
#include <cmath>

class Rectangle : public Shape
{
public:
    Rectangle(const point &p, double width, double height) : Shape(p), width_(width), height_(height) {}
    virtual double area() const
    {
        return width_ * height_;
    }
    virtual double perimeter() const
    {
        return 2.0 * width_ + 2.0 * height_;
    }
    virtual bool contains(const point &p) const override
    {
        if (p.y > height_ / 2.0 + get_center().y || p.y < get_center().y - height_ / 2.0)
        {
            return false;
        }

        if (p.x > width_ / 2.0 + get_center().x || p.x < get_center().x - width_ / 2.0)
        {
            return false;
        }
        
        return true;
    }

private:
    double width_, height_;
};

#endif