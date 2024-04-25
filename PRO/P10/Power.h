#ifndef POWER_H
#define POWER_H

#include "Operation.h"

class Power : public Operation
{
public:
    Power(int op1, int op2) : Operation(op1, op2) {}

    int operation() const override
    {
        int r = get_op1();
        if (get_op2() == 0)
        {
            r = 1;
        }

        else
        {
            for (int i = 0; i < get_op2() - 1; i++)
            {
                r *= get_op1();
            }
        }
        return r;
    }
};

#endif