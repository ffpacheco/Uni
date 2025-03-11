#include "cmath"

int crossSum(int A[], int i, int m, int j, int & start, int &end) {
    int left = INT_MIN;
    int lsum =0;
    int leftindex=0, rightindex=0;
    for (int k=m; k>=i; k--) {
        lsum+=A[k];
        if (lsum>left) {
            left=lsum;
            leftindex=k;
        }
    }
    int right =INT_MIN;
    int rsum =0;
    for (int k=m+1; k<=j; k++) {
        rsum+=A[k];
        if (rsum>right) {
            right=rsum;
            rightindex=k;
        }
    }
    start=leftindex;
    end=rightindex;
    return left+right;
}

int maxSub(int A[], int i, int j , int & start, int &end) {
    if ( i == j ) {
        start=end=i;
        return A[i];
    }
    int m = i + ( j - i ) / 2;

    int leftStart, leftEnd, rightStart, rightEnd, crossStart, crossEnd;
    int left = maxSub(A,i, m , leftStart, leftEnd);
    int right = maxSub(A,m + 1, j, rightStart, rightEnd);
    int cross = crossSum(A,i,m,j, crossStart,crossEnd);


    if ( left >= right &&  left >= cross ) {
        start= leftStart;
        end= leftEnd;
        return left;
    }
    if ( left <= right &&  right >= cross ) {
        start= rightStart;
        end= rightEnd;
        return right;
    }
    start= crossStart;
    end= crossEnd;
    return cross;
}


int maxSubsequenceDC(int A[], unsigned int n, int &i, int &j) {
    if ( n==1) return A[0];

    return maxSub(A,0,n-1, i, j);
}

