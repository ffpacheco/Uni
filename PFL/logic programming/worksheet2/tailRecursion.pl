factorial(0,1).
factorial(N,S):- factorial_helper(N,1,S).

factorial_helper(0,Acc,Acc).
factorial_helper(N,Acc,S) :-
    N>0,
    N1 is N - 1,
    Acc1 is Acc * N,
    factorial_helper(N1,Acc1,S).


sum_rec(N,S) :-
    N>=0,
    sum_rec_helper(N,0,S), !.

sum_rec_helper(0,Acc,Acc).
sum_rec_helper(N,Acc,S) :-
    N1 is N -1,
    Acc1 is N + Acc,
    sum_rec_helper(N1,Acc1,S).


pow_rec(N,Y,S) :-
    Y>=0,
    pow_rec_helper(N,Y,1,S), !.

pow_rec_helper(N,0,Acc,Acc).
pow_rec_helper(N,Y,Acc,S) :-
    Y1 is Y-1,
    Acc1 is Acc * N,
    pow_rec_helper(N,Y1,Acc1,S).


square_rec(N,S) :-
    square_rec_helper(N,N,0,S), !.

square_rec_helper(N,0,Acc,Acc).
square_rec_helper(N,M,Acc,S) :-
    M1 is M - 1,
    Acc1 is Acc + N,
    square_rec_helper(N,M1,Acc1,S).
