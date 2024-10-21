#include <iostream>
#include <vector>
#include <map>
#include <algorithm>
using namespace std;

int main()
{
    int n;
    cin >> n;
    cin.ignore();
    vector<string> words(n);


    for (int i = 0; i < n; i++)
    {
        getline(cin, words[i]);
    }

    map<string, int> anagrams;
    
    for (string word : words)
    {
        sort(word.begin(), word.end());
        anagrams[word]++;
    }

    int count = 0;
    for (auto par : anagrams)
    {
        if (par.second > 1)
            count++;
    }
    cout << count << endl;

    return 0;
}