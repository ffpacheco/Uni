safe(M,C):-
    (M == 0; M >=C);
    M_right is 3-M,
    C_right is 3-C,
    (M_right == 0, M_right>=C_right).

% possible moves:
% 1M, 2M, 1C, 2C, 1M1C

% state (M_left, C_left, Boat)

solve(state(0,0,right), _ , []).

solve(State1, VStates,[Move|Rest]):-
    move(State1,State2,Move),
    \+ member(State2,VStates),
    solve(State2, [State2|VStates], Rest).

move(state(M1,C1,left), state(M2,C2,right),move(M,C)):-
    member((M,C), [(1,0),(2,0),(0,1),(0,2),(1,1)]),
    M2 is M1 - M,
    C2 is C1 - C,
    M2>=0, C2>=0,
    safe(M2,C2).

move(state(M1,C1,right), state(M2,C2,left),move(M,C)):-
    member((M,C), [(1,0),(2,0),(0,1),(0,2),(1,1)]),
    M2 is M1 + M,
    C2 is C1 + C,
    M2=<3, C2=<3,
    safe(M2,C2).

missionaries_and_cannibals(Moves):-
    solve(state(3,3,left), [state(3,3,left)],Moves).
