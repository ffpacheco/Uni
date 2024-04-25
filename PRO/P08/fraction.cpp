#ifndef FRACTION_H
#define FRACTION_H
#include <cmath>
#include <iostream>
using namespace std;

class Fraction {
  public:
    Fraction();
    Fraction(int numerator_, int denominator_);
    int      numerator() const;
    int      denominator() const;
    int      gcd(int a, int b);
    Fraction sum(const Fraction &right);
    Fraction sub(const Fraction &right);
    Fraction mul(const Fraction &right);
    Fraction div(const Fraction &right);
    void     normalise();
    void     write() const;

  private:
    int numerator_;
    int denominator_;
};

Fraction::Fraction() {
    numerator_   = 0;
    denominator_ = 1;
}

Fraction::Fraction(int numerator_, int denominator_) {
    this->numerator_   = numerator_;
    this->denominator_ = denominator_;
    (*this).normalise();
}

int Fraction::numerator() const { return numerator_; }

int Fraction::denominator() const { return denominator_; }

Fraction Fraction::sum(const Fraction &right) {
    int numera   = right.numerator();
    int denomin  = right.denominator();
    int mul1     = denominator_;
    int mul2     = denomin;
    numerator_   = numerator_ * mul2;
    denominator_ = denominator_ * mul2;
    numera       = numera * mul1;
    denomin      = denomin * mul1;
    numerator_   = numerator_ + numera;

    (*this).normalise();
    return (*this);
}

Fraction Fraction::sub(const Fraction &right) {
    int denomin   = right.denominator();
    int numera    = right.numerator();
    int mul2      = denomin;
    int mul1      = denominator_;
    numerator_    = numerator_ * mul2;
    denominator_  = denominator_ * mul2; // SUBTRACT
    numera        = numera * mul1;
    denomin       = denomin * mul1;
    numerator_   -= numera;
    ;
    (*this).normalise();
    return (*this);
}

Fraction Fraction::mul(const Fraction &right) {
    int nu  = right.numerator();
    int den = right.denominator();

    numerator_   *= nu; // MULTIPLICATION
    denominator_ *= den;
    (*this).normalise();
    return (*this);
}

Fraction Fraction::div(const Fraction &right) {
    int nu        = right.numerator();
    int den       = right.denominator();
    numerator_   *= den; // DIVISION
    denominator_ *= nu;
    (*this).normalise();
    return (*this);
}

int Fraction::gcd(int a, int b) {
    while (b != 0) {
        int t = a;
        a     = b; // GCD
        b     = t % b;
    }
    return a;
}

void Fraction::normalise() {
    int great    = gcd(numerator_, denominator_);
    numerator_   = numerator_ / great;
    denominator_ = denominator_ / great;
    if (0 > denominator_) {
        numerator_   = -numerator_;
        denominator_ = -denominator_;
    }
}

void Fraction::write() const { cout << numerator_ << '/' << denominator_; }

#endif