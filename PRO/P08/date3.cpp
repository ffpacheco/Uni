#include "Date3.h"
#include <iomanip>
#include <iostream>
#include <sstream>
#include <string>
using namespace std;

int Date::get_year() const {
    return (yyyymmdd[1] - '0') * 100 + (yyyymmdd[2] - '0') * 10 + yyyymmdd[3]
           - '0' + (yyyymmdd[0] - '0') * 1000;
}

int Date::get_month() const {
    return (yyyymmdd[4] - '0') * 10 + yyyymmdd[5] - '0';
}

int Date::get_day() const {
    return (yyyymmdd[6] - '0') * 10 + yyyymmdd[7] - '0';
}

int Date::num_days(int year, int month) {
    if (((year % 4 == 0) && !((year % 100 == 0) && !(year % 400 == 0)))
        && (month == 2)) {
        return 29;
    } else if (!((year % 4 == 0) && !((year % 100 == 0) && !(year % 400 == 0))) && (month == 2)) {
        return 28;
    } else if ((month == 11) || (month == 4) || (month == 6) || (month == 9)) {
        return 30;
    } else {
        return 31;
    }
}

bool Date::is_valid() const {
    int year   = (*this).get_year();
    int month  = (*this).get_month();
    int day    = (*this).get_day();
    int number = num_days(year, month);

    if ((year <= 9999) && (year >= 1) && (month > 0) && (month < 13)
        && (day > 0) && (day <= number)) {
        return true;
    }
    return false;
}

Date::Date(const string &year_month_day) {
    int    unit;
    string t    = "";
    bool   flag = false;
    char   l1, l2;
    int    hold = 2;

    istringstream iss(year_month_day);

    if (iss >> unit) {
        t = to_string(unit);
        while (t.size() < 4) { t = "0" + t; }
        yyyymmdd = yyyymmdd + t;
    } else {
        flag = true;
    }

    if (iss >> l1) {
        hold--;
    } else {
        flag = true;
    }

    if (iss >> unit) {
        t = to_string(unit);
        while (t.size() < 2) { t = "0" + t; }
        yyyymmdd = yyyymmdd + t;
    } else {
        flag = true;
    }

    if (iss >> l2) {
        hold--;
    } else {
        flag = true;
    }

    if (iss >> unit) {
        t = to_string(unit);
        while (t.size() < 2) { t = "0" + t; }
        yyyymmdd = yyyymmdd + t;
    } else {
        flag = true;
    }

    if ((!((*this).is_valid())) || (l1 != '/') || (l2 != '/')
        || (flag == true)) {
        yyyymmdd = "00000000";
    }
}

Date::Date(int year, int month, int day) {
    string a(to_string(year));
    while (a.size() != 4) { a = "0" + a; }

    string b = to_string(month);
    while (b.size() != 2) { b = "0" + b; }

    string c = to_string(day);
    while (c.size() != 2) { c = "0" + c; }

    yyyymmdd = a + b + c;

    if (!((*this).is_valid())) { yyyymmdd = "00000000"; }
}

Date::Date() { yyyymmdd = "00010101"; }