#include <iostream>
#include "interval.h"
using namespace std;
bool interseta(interval a, interval b){
    if (a.end.h<b.start.h || (a.end.h==b.start.h && a.end.m <= b.start.m)){
        return false;
    }
    
    if (b.end.h<a.start.h || (b.end.h==a.start.h && b.end.m <= a.start.m)){
        return false;
    }
    else{
        return true;
    }
}
interval intersection(interval a, interval b){
    interval res;
    time_of_day min, max;
    if (interseta(a,b)){
        min=(a.start.h < b.start.h ||(a.start.h== b.start.h && a.start.m < b.start.m )) ? b.start : a.start;
        max=(a.end.h >b.end.h ||(a.end.h== b.end.h && a.end.m > b.end.m )) ? b.end : a.end;
        res= {min,max};
    }
    else{
        res={{0,0},{0,0}};
    }
    return res;
}

