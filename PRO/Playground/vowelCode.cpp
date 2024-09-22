#include <string>

std::string encode(const std::string &str)
{
    std::string res;
    for (char c : str)
    {
        switch (c)
        {
        case 'a':
            res += "1";
            break;
        case 'e':
            res += "2";
            break;
        case 'i':
            res += "3";
            break;
        case 'o':
            res += "4";
            break;
        case 'u':
            res += "5";
            break;
        default:
            res += c;
        }
    }
    return res;
}

std::string decode(const std::string &str)
{
    std::string res;
    for (char c : str)
    {
        switch (c)
        {
        case '1':
            res += "a";
            break;
        case '2':
            res += "e";
            break;
        case '3':
            res += "i";
            break;
        case '4':
            res += "o";
            break;
        case '5':
            res += "u";
            break;
        default:
            res += c;
        }
    }
    return res;
}