#include <iostream>
#include "interval.h" 

bool in_interval (interval x, time_of_day y){
    if (y.h>x.end.h || y.h<x.start.h){
        return false;
    }    

    if ((y.h==x.end.h && y.m >= x.end.m )){
        return false;
    }
    if ( (y.h==x.start.h && y.m<x.start.m)){
        return false;
    }
    return true;
}

int search_intervals(time_of_day t, const interval a[], int n, interval& u){
    int tmpmin=0, casos=0;

    time_of_day lim1, lim2;

    for (int i =0; i<n; ++i){
        if(in_interval(a[i],t)){
            ++casos;
            if (casos==1){
                lim1=a[i].start;
                lim2=a[i].end;
            }
            else{
                if (lim1.h>a[i].start.h ||(lim1.h==a[i].start.h && lim1.m >a[i].start.m)){ 
                    lim1=a[i].start;
                }   
                if(lim2.h<a[i].end.h ||(lim2.h==a[i].end.h && lim2.m <a[i].end.m)){ 
                lim2=a[i].end;
                }
            }
        } 
    }

    if (casos==0){
        u={t,t};
        return 0;
    }
    
    u={lim1,lim2};
    tmpmin = (lim2.h-lim1.h)*60 + (lim2.m-lim1.m);
    return tmpmin;
}