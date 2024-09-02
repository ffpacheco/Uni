#include "Piece.h"
#include "Domino.h"
using namespace std;
bool Piece::can_be_left_to(const Piece &other) const
{
    if (other.get_left() == right_)
        return true;
    return false;
}
bool Piece::can_be_right_to(const Piece &other) const
{
    if (other.get_right() == left_)
        return true;
    return false;
}
const Piece &Domino::left() const { return pieces_.front(); }
const Piece &Domino::right() const { return pieces_.back(); }

bool Domino::place_left(const Piece &p)
{
    if (p.can_be_left_to(pieces_.front()))
    {
        pieces_.push_front(p);
        return true;
    }
    return false;
}
bool Domino::place_right(const Piece &p)
{
    if (p.can_be_right_to(pieces_.back()))
    {
        pieces_.push_back(p);
        return true;
    }
    return false;
}