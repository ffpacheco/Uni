#ifndef FRACTION_H
#define FRACTION_H
#include <iostream>
using namespace std;
class Fraction
{

private:
    int numerator_, denominator_;

public:
    Fraction();
    Fraction(int numerator, int denominator);
    int get_numerator() const;
    int get_denominator() const;
    Fraction sum(const Fraction &right);
    Fraction sub(const Fraction &right);
    Fraction mul(const Fraction &right);
    Fraction div(const Fraction &right);
    int Fraction::gcd(int a, int b);
    void Fraction::normalise();
    void Fraction::write() const;
};

int Fraction::gcd(int a, int b)
{
    while (b != 0)
    {
        int tmp = a;
        a = b;
        b = tmp % b;
    }
    return a;
}
void Fraction::normalise()
{
    int g = gcd(numerator_, denominator_);
    numerator_ /= g;
    denominator_ /= g;
    if (denominator_ < 0)
    {
        numerator_ = -numerator_;
        denominator_ = -denominator_;
    }
}
void Fraction::write() const
{
    cout << numerator_ << '/' << denominator_;
}
Fraction Fraction::sum(const Fraction &right)
{

    int den2 = right.get_denominator();
    int num2 = right.get_numerator();
    denominator_ *= den2;
    numerator_ *= den2;
    den2 *= denominator_;
    num2 *= numerator_;
    return ()
};
Fraction sub(const Fraction &right);
Fraction mul(const Fraction &right);
Fraction div(const Fraction &right);
#endif