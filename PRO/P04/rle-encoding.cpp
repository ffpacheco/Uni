
void rle_encode(const char str[], char rle[]){
    int n=1;
    int l= 0;
    while (str[l] != '\0'){
    l++;
    }
    int index=0;
    for (int i=0; i<l; ++i){
        while (str[i]==str[i+1]){
            n++;
            i++;
        }
        if (n>9){
             int temp = n;
            int divisor = 1;
            while (temp / 10 != 0) {
                divisor *= 10;
                temp /= 10;
            }
            while (divisor != 0) {
                rle[index++] = '0' + (n / divisor); 
                n %= divisor; 
                divisor /= 10; 
            }
            rle[index++]=str[i];
        }
        else{
        rle[index]= '0'+n;
        index++;
        rle[index]=str[i];
        index++;
        n=1;
        }
    }  
    rle[index]='\0';
}