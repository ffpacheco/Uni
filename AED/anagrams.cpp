#include <iostream>
#include <vector>
#include <map>
#include <string>
#include <algorithm>

using namespace std;

string sortPhrase(const string &s)
{
    string normalized = s;

    transform(normalized.begin(), normalized.end(), normalized.begin(), [](unsigned char c)
              { return tolower(c); });

    normalized.erase(remove(normalized.begin(), normalized.end(), ' '), normalized.end());
    sort(normalized.begin(), normalized.end());

    return normalized; 
}

int main()
{
    int N;
    cin >> N;     
    cin.ignore(); 

    vector<string> lines(N);     
    map<string, int> anagramMap; 

    for (int i = 0; i < N; i++)
    {
        getline(cin, lines[i]);
    }

    for (const string &phrase : lines)
    {
        string sortedPhrase = sortPhrase(phrase); 
        anagramMap[sortedPhrase]++;               
    }


    int anagramClassCount = 0;
    for (const auto &entry : anagramMap)
    {
        if (entry.second > 1)
        {
            anagramClassCount++; 
        }
    }


    cout << anagramClassCount << endl;

    return 0;
}
