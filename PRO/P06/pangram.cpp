#include <iostream>
#include <string>
using namespace std;


bool pangram(const string& s, string& m){
    int len= s.length();
    bool letters[26] {0};
    for (int i=0; i<len; i++){
        if (s[i]>= 'A' && s[i]<='Z'){
            int j= s[i]-'A';
            letters[j]=true;
        }
         if (s[i]>= 'a' && s[i]<='z'){
            int j= s[i]-'a';
            letters[j]=true;
        }
    }
    for (int i =0; i<26; i++){
        if (letters[i] == false){
            m.push_back( i+'a');
        }
    }
    int l = m.length();
    if (l){
        return false;
    }
    return true;
}


int main(){
    { string s = "";
  string m = "";
  bool r = pangram(s, m);
  cout << '\"' << s << "\" "
       << boolalpha << r << " \"" << m << "\"\n"; }
    return 0;
}