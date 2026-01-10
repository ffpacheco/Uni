teaches(algorithms, adalberto).
teaches(databases, bernadete).
teaches(copilers, capitolino).
teaches(statistics, diogenes).
teaches(networks, ermelinda).

attends(algorithms, alberto).
attends(algorithms, bruna).
attends(algorithms, cristina).
attends(algorithms, diogo).
attends(algorithms, eduarda).

attends(databases, antonio).
attends(databases, bruno).
attends(databases, cristina).
attends(databases, duarte).
attends(databases, eduardo).

attends(copilers, alberto).
attends(copilers, bernardo).
attends(copilers, clara).
attends(copilers, diana).
attends(copilers, eurico).

attends(statistics, antonio).
attends(statistics, bruna).
attends(statistics, claudio).
attends(statistics, duarte).
attends(statistics, eva).

attends(networks, alvaro).
attends(networks, beatriz).
attends(networks, claudio).
attends(networks, diana).
attends(networks, eduardo).

isStudentOf(X,Y) :- attends(S,X), teaches(S,Y).

commonStudents(X,Y,S) :- teaches(C,X), teaches(D,Y), attends(C,S), attends(D,S), X \= Y.

colleagues(X,Y) :- teaches(C,X), teaches(D,Y),  X \= Y, C\= D.
colleagues(X,Y) :- attends(C,X), attends(D,Y),  X \= Y, C = D.

moreThanOneCourse(X) :- setof(X, C^D^(attends(C,X), attends(D,X), C \= D), XS), member(X,XS).

% -----------------------------------------------------------------------

teachers(T):-
    setof(Teachers, Sub^teaches(Sub,Teachers) ,T).

studentsOf(T,S):-
    teaches(Sub, T),
    findall(Students, attends(Sub,Students),S ).

teachersOfList([],[]).
teachersOfList([Sub|Subjects], [T|Teachers]):-
    teaches(Sub, T),
    teachersOfList(Subjects, Teachers).

teachersOf(S,T):-
    findall(Subjects,attends(Subjects, S),Subs),
    teachersOfList(Subs,T).

common_courses(S1, S2, C):-
    findall(Subs1, attends(Subs1, S1), Courses1),
    findall(Subs2, attends(Subs2, S2), Courses2),
    intersection(Courses1, Courses2, C),
    C \= [].

moreThanOneCourse2(L):-
    setof(S, C1^C2^(attends(C1, S), attends(C2, S), C1 \= C2), L).

students(L):-
    setof(S, C^attends(C,S), L).

strangers(L) :-
    students(All),
    findall(S1-S2, (
        member(S1, All),
        member(S2, All),
        S1 @< S2,
        \+ (attends(C, S1), attends(C, S2))
    ), L).

share_multiple_courses(S1, S2) :-
    attends(C1, S1), attends(C1, S2),
    attends(C2, S1), attends(C2, S2),
    C1 \= C2.

good_groups(L) :-
    setof(S1-S2, (
        attends(_, S1),
        attends(_, S2),
        S1 @< S2,
        (share_multiple_courses(S1, S2)) ), L),!.
