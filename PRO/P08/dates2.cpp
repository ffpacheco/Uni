#include "Date2.h"
#include <iomanip>
#include <iostream>
#include <istream>
#include <sstream>
#include <string>

Date::Date() : year(1), month(1), day(1) {}

Date::Date(int year, int month, int day) : year(year), month(month), day(day) {
    if (!is_valid()) {
        this->year  = 0;
        this->month = 0;
        this->day   = 0;
    }
}

Date::Date(const std::string &year_month_day) {
    std::istringstream iss(year_month_day);
    char               delimiter;
    iss >> year >> delimiter >> month >> delimiter >> day;
    if (!is_valid()) {
        this->year  = 0;
        this->month = 0;
        this->day   = 0;
    }
}

bool Date::is_leap_year(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
}

int Date::get_year() const { return year; }

int Date::get_month() const { return month; }

int Date::get_day() const { return day; }

bool Date::is_valid() const {
    if (month < 1 || year < 1 || month > 12 || day < 1 || year > 9999
        || day > num_days(year, month)) {
        return false;
    }
    return true;
}

int Date::num_days(int year, int month) {
    static const int days_in_month[]
        = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    int days = days_in_month[month - 1];
    if (month == 2 && is_leap_year(year)) { days = 29; }
    return days;
}
