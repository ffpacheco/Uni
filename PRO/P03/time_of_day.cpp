#include <iostream>
#include "time_of_day.h"
using namespace std;

time_of_day tick(time_of_day t){
    time_of_day res;
    if(t.m==59){
        res.h=t.h+1;
        res.m=0;
        if(res.h==24){
            res.h=0;
        }
    }

    else{
        res.m=t.m+1;
        res.h=t.h;
    }
    return res;
}