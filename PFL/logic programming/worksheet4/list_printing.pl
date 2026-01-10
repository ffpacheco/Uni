print_full_list(List):-
    write("["),
    print_full_list_el(List),
    write("]").

print_full_list_el([]).
print_full_list_el([H| []]):-
     write(H), !.

print_full_list_el([H|List]):-
    write(H),
    write(", "),
    print_full_list_el(List).

print_list(L):-
    length(L, Size),
    Size =< 11,
    print_full_list(L), !.

print_list(L):-
    length(L, Size),
    Size>11,
    Rests is Size-9,
    Padding is Rests // 2,
    SecondPadding is Rests-Padding,
    length(FirstPart,3),
    append(FirstPart, Rest, L),
    print_full_list(FirstPart),
    write("..., "),
    length(FirstSkip, SecondPadding),
    append(FirstSkip, Rest2, Rest),
    length(MiddlePart, 3),
    append(MiddlePart, Rest3, Rest2),
    print_full_list(MiddlePart),
    write("..., "),
    length(SecondSkip, Padding),
    append(SecondSkip, Rest4, Rest3),
    print_full_list(Rest4), !.

print_matrix([]).
print_matrix([H|List]):-
    print_full_list(H),
    nl,
    print_matrix(List), !.

print_numbered_matrix(L):-
    print_numbered_matrix_aux(L, 1), !.
print_numbered_matrix_aux([], _).
print_numbered_matrix_aux([H|List], N):-
    write(N),
    write(" "),
    print_full_list(H),
    nl,
    N1 is N+1,
    print_numbered_matrix_aux(List, N1), !.

print_list(L, S, Sep, E):-
    write(S),
    print_list_aux(L,Sep),
    write(E).

print_list_aux([],_).
print_list_aux([H|[]],_):-
    write(H).
print_list_aux([H|List], Step):-
    write(H),
    write(Step),
    print_list_aux(List, Step), !.
