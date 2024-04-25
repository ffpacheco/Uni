 void trim(char s[]){
    int l=0;
    while(s[l]!= '\0'){
        l++;
    }
    int star=0;
    while( s[star]==' '){
        star++;
    }
    int end =l-1;
    while (s[end] == ' '){
        end--;
    }
    for (int i=0; i<= end-star; i++){
        s[i]=s[star+i];
    }
    s[end-star]='\0';
 }