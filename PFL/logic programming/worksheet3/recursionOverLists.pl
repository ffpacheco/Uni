list_size([], 0).
list_size([_|T], Size) :-
    list_size(T, Size2),
    Size is Size2 + 1.

list_sum([], 0).
list_sum([H|T], Sum) :-
    list_sum(T, Sum2),
    Sum is H + Sum2.

list_prod([], 1).
list_prod([H|T], Prod) :-
    list_prod(T, Prod2),
    Prod is H * Prod2.

inner_product([],[],[]).
inner_product([H1|List1], [H2|List2], [R|Result]) :-
    R is H1*H2,
    inner_product(List1, List2, Result).

count(_,[],0).
count(Elem, [H|List], N) :-
    count(Elem, List, N2),
    ( H = Elem ->  N is N2 + 1; N is N2 ), !.

