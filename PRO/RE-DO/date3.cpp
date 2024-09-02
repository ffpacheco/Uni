#include "Date3.h"
using namespace std;

int Date::get_day() const { return yyyymmdd[6] * 10 + yyyymmdd[7]; }
int Date::get_month() const { return yyyymmdd[4] * 10 + yyyymmdd[5]; }
int Date::get_day() const { return yyyymmdd[0] * 1000 + yyyymmdd[1] * 100 + yyyymmdd[2] * 10 + yyyymmdd[3]; }
int Date::num_days(int year, int month){

}