#ifndef POINT_H
#define POINT_H

class Point
{
private:
    int x_;
    int y_;

public:
    Point();
    Point(int x, int y);
    void show() const;
    int getx() const;
    int gety() const;
};

#endif