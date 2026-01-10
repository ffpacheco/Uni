% class(Course, ClassType, DayOfWeek, Time, Duration)
class(pfl, t, '2 Tue', 15, 2).
class(pfl, tp, '2 Tue', 10.5, 2).
class(lbaw, t, '3 Wed', 10.5, 2).
class(lbaw, tp, '3 Wed', 8.5, 2).
class(ipc, t, '4 Thu', 14.5, 1.5).
class(ipc, tp, '4 Thu', 16, 1.5).
class(fsi, t, '1 Mon', 10.5, 2).
class(fsi, tp, '5 Fri', 8.5, 2).
class(rc, t, '5 Fri', 10.5, 2).
class(rc, tp, '1 Mon', 8.5, 2).

same_day(Course1, Course2):-
    class(Course1,_,Date1,_,_),
    class(Course2,_,Date2,_,_),
    Date1==Date2,!.

daily_courses(Day, Courses):-
    findall(Course, class(Course,_,Day,_,_),Courses ).

short_classes(L):-
    findall(Course-Day/Time, (class(Course,_,Day,Time,Duration), Duration<2),L ).

course_classes(Course, Classes):-
    findall(Day/Time-Type, (class(Course,Type,Day,Time,_)), Classes).

courses(L):-
    setof(Course, Type^Day^Time^Duration^class(Course,Type,Day,Time,Duration), L).

translateDay('1 Mon', 'Mon').
translateDay('2 Tue', 'Tue').
translateDay('3 Wed', 'Wed').
translateDay('4 Thu', 'Thu').
translateDay('5 Fri', 'Fri').

schedule():-
    setof(Day/Time-Course-Type-Duration,
        class(Course,Type,Day,Time,Duration),
        Courses),
    forall(member(Day/Time-Course-Type-Duration, Courses),
    (translateDay(Day,TDay), write(TDay/Time-Course-Type-Duration), nl)).

getDay(Day) :-
    get_char(Char1),
    get_char(Char2),
    get_char(Char3),
    get_char(_),
    DayList = [Char1, Char2, Char3],
    atom_chars(Day, DayList).

getTime(Time) :-
    read_line_to_codes(user_input,CodesLine),
    atom_codes(Atom, CodesLine),
    atom_number(Atom, Time).

getHead([H|_], H).

find_class():-
    write("Day: "),
    getDay(InputDay),
    write("Time: "),
    getTime(InputTime),
    translateDay(Day,InputDay),
    findall(
        Course-Type-Day-Time-Duration,
        (
            class(Course,Type,Day,Time,Duration),
            Time=<InputTime,
            Time + Duration>InputTime
        ),
        PossibleClasses
    ),

    (PossibleClasses == [] -> write("No classes taking place"), nl;

        getHead(PossibleClasses, CourseName-CourseType-CourseDay-CourseTime-CourseDuration),
        (CourseTime==InputTime ->
            (write(CourseName-CourseType), write(" is now staring"))
            ;
            (write(CourseName-CourseType), write(" is now taking place"))
        )
    ).
