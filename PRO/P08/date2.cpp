#include "Date2.h"
#include <iomanip>
#include <iostream>
#include <sstream>
#include <string>
using namespace std;

Date::Date() { year = month = day = 1; }

Date::Date(int year, int month, int day) {
    this->year  = year;
    this->month = month;
    this->day   = day;
}

// construtor
int Date::num_days(int year, int month) {
    int dias[12] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
    if (month == 2 && year % 4 == 0 && (year % 100 != 0 || year % 400 == 0))
        return 29;
    else { return dias[month - 1]; }
}

Date::Date(const string &year_month_day) {
    int  inyear, inmonth, inday;
    char on, tw;

    stringstream iss(year_month_day);
    if ((iss >> inyear >> on >> inmonth >> tw >> inday) && (on == '/')
        && (tw == '/')) {
        if ((inyear > 0) && (inyear < 10000) && (inmonth > 0) && (inmonth < 13)
            && (inday <= num_days(inyear, inmonth)) && (inday > 0)) {
            this->year  = inyear;
            this->month = inmonth;
            this->day   = inday;
        } else {
            this->year  = 0;
            this->month = 0;
            this->day   = 0;
        }
    } else {
        this->year  = 0;
        this->month = 0;
        this->day   = 0;
    }
}

int Date::get_day() const { return day; }

int Date::get_month() const { return month; }

int Date::get_year() const { return year; }

bool Date::is_valid() const {
    if (year >= 1 && year <= 9999 && month >= 1 && month <= 12 && day >= 1
        && day <= num_days(year, month)) {
        return true;
    } else {
        return false;
    }
}