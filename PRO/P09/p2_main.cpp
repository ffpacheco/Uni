#include "Date.h"
#include "Person.h"
#include <iostream>
#include <vector>
using namespace std;

void born_before(const vector<Person> &persons, const Date &date)
{
    date.show();
    cout << ":";
    for (Person individual : persons)
    {
        if (individual.get_birth_date().is_before(date))
        {
            cout << " ";
            individual.show();
        }
    }
}
