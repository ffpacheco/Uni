#include <vector>
#include <string>
#include <sstream>
using namespace std;
void decomposeLine(std::string s, std::vector<std::string> &words)
{
    std::string word;
    istringstream iss(s);
    while (iss >> word)
    {
        words.push_back(word);
    }
}