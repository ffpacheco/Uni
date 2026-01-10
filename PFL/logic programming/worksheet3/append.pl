list_append(L1, L2, L3) :-
    append(L1, L2, L3).

list_member(Elem, List) :-
    append(_, [Elem|_], List).

list_last(List, Last) :-
    append(_, [Last], List),!.

list_nth(N, List, Elem) :-
    length(List, Len),
    between(1, Len, N),
    N1 is N - 1,
    length(Prefix, N1),
    append(Prefix, [Elem|_], List).

