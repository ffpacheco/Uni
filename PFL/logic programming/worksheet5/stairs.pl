steps(Steps, N, L):-
    findall(Path, climb(Steps, Path), L),
    length(L, N).

climb(0,[]).

climb(Steps, [1|Rest]):-
    Steps>=1,
    N is Steps-1,
    climb(N,Rest).

climb(Steps, [2|Rest]):-
    Steps>=2,
    N is Steps-2,
    climb(N, Rest).
