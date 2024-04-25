#include <iostream>
using namespace std;

int main(){
    int n;
    cin>> n;
    int x1, y1;
    int dist=0;
    cin>> x1>>y1;
    for (int i=1;i<n;++i){
        int x2,y2;
        cin>> x2>>y2;
        dist+= abs(x2-x1)+abs(y2-y1);
        x1=x2;
        y1=y2;
    }
    cout<<dist;
    return 0;
}