#include "Date2.h"
#include <sstream>
#include <iostream>
using namespace std;
Date::Date() : year(1), month(1), day(1) {}

Date::Date(const std::string &year_month_day)
{
    istringstream iss(year_month_day);
    
}

int Date::num_days(int year, int month)
{
    if (month == 2 && year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))
        return 29;
    if (month == 2)
        return 28;
    if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month = 12)
        return 31;
    else
        return 30;
}
bool Date::is_valid() const
{
    if (year <= 9999 && year >= 1)
    {
        return true;
    }
    if (month >= 1 && month <= 12)
    {
        return true;
    }
    if (day >= 1 && day <= 31)
        return true;
    return false;
}