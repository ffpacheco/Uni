:- use_module(library(lists)).
:- use_module(library(between)).

rotate(List,Position,Rotations,NewList):-
    nth1(Position, List, ToRotate, Rest),
    rotate_list(Rotations, ToRotate, Rotated),
    nth1(Position,NewList,Rotated,Rest).

getHead([H|_], H).

indMatch(List,Code):-
    getHead(List,L),
    Code=:=L.

matches([],[]).
matches([H|List], [C|Code]):-
    indMatch(H,C),
    matches(List,Code).


matches2([],[]).
matches2([[H|_]|Rest], [H|Code]):-
    matches2(Rest,Code).

move(Initial,Final):-
    length(Initial, LenCodex),
    nth1(1,Initial,List),
    length(List, Len),
    MaxAmount is Len -1,
    between(1,LenCode,Index),
    between(1,MaxAmount,Amount),
    rotate(Initial, Index,Amount,Final).

solve(Code,Key,[Code|States]):-
    solve_aux(Code,Key,[Code],States).

solve_aux(Code,Key,_,[]):-
    matches(Code,Key).

solve_aux(Code,Key,Path,[Next|States]):-
    length(Code, LenCode),
    nth1(1,Code,List),
    length(List, Len),
    MaxAmount is Len -1,
    between(1,LenCode,Index),
    between(1,MaxAmount,Amount),
    rotate(Code, Index,Amount,Next),
    \+ member(Next,Path),
    solve_aux(Next,Key,[Next|Path],States).
