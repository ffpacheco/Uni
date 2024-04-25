int nrl(const char s[], char low[]){
    int alpha[26]={};
    int len=0;
    while (s[len]!='\0'){
        len++;
    }
    for (int i =0; i<len; ++i){
        if ( s[i] >= 'A' && s[i]<='Z'){
            alpha[s[i]-'A']++;
        }
        if ( s[i] >= 'a' && s[i]<='z'){
            alpha[s[i]-'a']++;
        }
    }
    int occ=0;
    for (int i =0; i<26; ++i){
        if (alpha[i]==1){
            occ++;
        }
    }
    
    int ind=0;
    for (int j=0; j<26; ++j){
            if ( alpha [j]==1){
                low[ind]=j+'a';
                ind++;
            }
        }
    low[ind]='\0';
    
    return occ;
}