is_ordered(List) :-
    is_orderedaux(List, 0).

is_orderedaux([], _).
is_orderedaux([H|T], Prev) :-
    H >= Prev,
    is_orderedaux(T, H).

insert_ordered(Value, List1, List2) :-
    insert_orderedaux(Value, List1, List2).

insert_orderedaux(Value, [], [Value]).
insert_orderedaux(Value, [H|T], [Value,H|T]) :-
    Value =< H.
insert_orderedaux(Value, [H|T], [H|Result]) :-
    Value > H,
    insert_orderedaux(Value, T, Result), !.

insert_sort(List, OrderedList):-
    insert_sortaux(List, [], OrderedList).

insert_sortaux([], Acc, Acc).
insert_sortaux([H|T], Acc, OrderedList):-
    insert_ordered(H, Acc, Temp),
    insert_sortaux(T, Temp, OrderedList), !.
