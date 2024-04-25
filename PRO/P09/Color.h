#ifndef COLOR_H 
#define COLOR_H

class Color{
    private:

    unsigned char red_;
    unsigned char green_;
    unsigned char blue_;
public:
    Color(const Color& c);
    Color(unsigned char red, unsigned char green, unsigned char blue);  

    unsigned char red() const;
    unsigned char green() const;
    unsigned char blue() const;

    bool equal_to(const Color& other) const;
    static const Color RED, GREEN, BLUE, BLACK, WHITE;

    void invert();
};
#endif