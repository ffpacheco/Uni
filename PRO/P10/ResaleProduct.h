#ifndef RESALEPRODUCT_H
#define RESALEPRODUCT_H

#include "Product.h"

class ResaleProduct : public Product
{
public:
    ResaleProduct(int id, float price, int profit) : Product(id, price), profit_(profit){};

    int get_profit_margin() const
    {
        return profit_;
    }
    void set_profit_margin(int margin)
    {
        profit_ = margin;
    }
    float get_sell_price() const
    {
        return price_ * (double(profit_ + 100.0) / 100.0);
    }

private:
    int profit_;
};
#endif