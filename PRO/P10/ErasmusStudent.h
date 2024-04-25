#ifndef ERASMUSSTUDENT_H
#define ERASMUSSTUDENT_H

#include "Student.h"
#include <string>
#include <sstream>

class ErasmusStudent : public Student
{
public:
    ErasmusStudent(int id, const string &name, const string &course, const string &country) : Student(id, name, course), country_(country) {}

    const string &country() const
    {
        return country_;
    }

    string to_string() const override
    {
        ostringstream out;
        out << id() << '/' << name() << '/' << course() << '/' << country_;
        return out.str();
    }

private:
    string country_;
};
#endif