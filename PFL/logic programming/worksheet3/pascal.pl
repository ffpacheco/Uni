pascal(0, []) :- !.
pascal(N, Lines):-
    pascal_helper(N, [[]], Lines).

pascal_helper(0, Acc, Final) :-
    reverse(Acc, Final).

pascal_helper(N, [], Final) :-
    N > 0,
    N1 is N - 1,
    pascal_helper(N1, [[1]], Final).

pascal_helper(N, [LastRow|Rest], Final) :-
    N > 0,
    next_row(LastRow, NextRow),
    N1 is N - 1,
    pascal_helper(N1, [NextRow, LastRow|Rest], Final).

next_row([H|T], [1|Rest]) :-
    compute_sums([H|T], Rest).

compute_sums([_], [1]).
compute_sums([X, Y | T], [Sum | Rest]) :-
    Sum is X + Y,
    compute_sums([Y | T], Rest).
