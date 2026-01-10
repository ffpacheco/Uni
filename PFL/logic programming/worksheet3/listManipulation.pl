invert([], []).
invert([H|T], Result) :-
    invert(T, Inv),
    append(Inv, [H], Result).

del_one(_,[],[]).
del_one(Elem, [Elem|List1], List1).
del_one(Elem, [H|List1], [H|List2]):-
    H \= Elem, del_one(Elem, List1, List2).

del_all(_,[],[]).
del_all(Elem, [Elem|List1], List2):-
    del_all(Elem,List1, List2),!.

del_all(Elem, [H|List1], [H|List2]):-
    Elem\=H,
    del_all(Elem,List1,List2).

del_all_list([],List,List).
del_all_list([H|ListElems], List1, List2):-
    del_all(H,List1,Temp), del_all_list(ListElems, Temp, List2).

del_dups([],[]).
del_dups([H|List1], [H|List2]):-
    del_all(H,List1, Temp),
    del_dups(Temp, List2).

list_perm([], []).
list_perm([H|L1], L2):-
    del_one(H, L2, Temp),
    list_perm(L1, Temp),!.
