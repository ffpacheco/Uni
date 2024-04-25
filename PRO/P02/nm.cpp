 unsigned long next_mersenne(unsigned long n){
    unsigned long exp=1;
    if (n==0){
        return 0;
    }
    else{
    while (2*exp -1<n){
        exp*=2;    
    }
    }
  return 2*exp -1;;  
 }