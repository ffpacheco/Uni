sliding_puzzle(Initial, Moves):-
    bfs_solve(Initial, Moves).

goal([[1, 2, 3], [4, 5, 6], [7, 8, 0]]).

find_zero(Board, R, C) :-
    nth0(R, Board, Row),
    nth0(C, Row, 0).

dfs_solve(Initial, Moves) :-
    dfs(Initial, [Initial], Moves).

dfs(State, _, []) :- goal(State).

dfs(State, Visited, [Dir|Moves]) :-
    move(State, Next, Dir),
    \+ member(Next, Visited),
    dfs(Next, [Next|Visited], Moves).

move(State, Next, up) :-
    find_zero(State, R, C),
    R > 0, R1 is R - 1,
    swap(State, R, C, R1, C, Next).

move(State, Next, down) :-
    find_zero(State, R, C),
    R < 2, R1 is R + 1,
    swap(State, R, C, R1, C, Next).

move(State, Next, left) :-
    find_zero(State, R, C),
    C > 0, C1 is C - 1,
    swap(State, R, C, R, C1, Next).

move(State, Next, right) :-
    find_zero(State, R, C),
    C < 2, C1 is C + 1,
    swap(State, R, C, R, C1, Next).

swap(Board, R1, C1, R2, C2, NewBoard) :-
    get_value(Board, R2, C2, V2),
    set_value(Board, R2, C2, 0, TempBoard),
    set_value(TempBoard, R1, C1, V2, NewBoard).

get_value(Board, R, C, Value) :-
    nth0(R, Board, Row),
    nth0(C, Row, Value).

set_value(Board, R, C, Val, NewBoard) :-
    nth0(R, Board, OldRow, RestRows),
    replace_nth(C, OldRow, Val, NewRow),
    nth0(R, NewBoard, NewRow, RestRows).

replace_nth(Index, List, Val, NewList) :-
    nth0(Index, List, _, Rest),
    nth0(Index, NewList, Val, Rest).


bfs_solve(Initial, Moves) :-
    bfs([[Initial, []]], [Initial], Moves).

bfs([[State, Path]|_], _, FinalMoves) :-
    goal(State),
    reverse(Path, FinalMoves).

bfs([[State, Path]|Rest], Visited, FinalMoves) :-
    findall([Next, [Dir|Path]],
            (move(State, Next, Dir), \+ member(Next, Visited)),
            NewPaths),
    findall(NS, member([NS, _], NewPaths), NewStates),
    append(Visited, NewStates, UpdatedVisited),
    append(Rest, NewPaths, NextQueue),
    bfs(NextQueue, UpdatedVisited, FinalMoves).
