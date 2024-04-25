#include <vector>
#include <algorithm>
#include <iostream>
using namespace std;

template <typename A, typename B>
class Pair
{
private:
    A first_;
    B second_;

public:
    Pair(A a, B b) : first_(a), second_(b) {}

    A get_first() const
    {
        return first_;
    }
    B get_second() const
    {
        return second_;
    }

    void show() const
    {
        cout << "{" << first_ << "," << second_ << "}";
    }
};

template <typename A, typename B>
bool comparePairsSecond(const Pair<A, B> &a, const Pair<A, B> &b)
{
    return a.get_second() < b.get_second();
}

template <typename A, typename B>
bool comparePairsFirst(const Pair<A, B> &a, const Pair<A, B> &b)
{
    return a.get_first() < b.get_first();
}

template <typename A, typename B>
void sort_by_first(vector<Pair<A, B>> &v)
{
    sort(v.begin(), v.end(), comparePairsFirst<A, B>);
}

template <typename A, typename B>
void sort_by_second(vector<Pair<A, B>> &v)
{
    sort(v.begin(), v.end(), comparePairsSecond<A, B>);
}

template <typename A, typename B>
void show(vector<Pair<A, B>> &v)
{
    cout << "{";
    for (Pair<A, B> pair : v)
    {
        pair.show();
    }
    cout << "}";
}