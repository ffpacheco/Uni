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
