factorial(0,1).
factorial(N,F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1,F1),
    F is N * F1.

sum_rec(0,0).
sum_rec(N,F) :-
    N >0,
    N1 is N -1,
    sum_rec(N1,F1),
    F is N + F1.

pow_rec(X, 0, 1).
pow_rec(X, 1, X).
pow_rec(X, Y, P) :-
    Y>1,
    Y1 is Y -1,
    pow_rec(X, Y1, P1),
    P is X * P1.

square_rec(N,S) :-
    square_rec_aux(N,N,0,S).

square_rec_aux(N,0,Acc, Acc).
square_rec_aux(N,Y,Acc, S) :-
    Y>0,
    Y1 is Y -1,
    Acc1 is Acc +N,
    square_rec_aux(N,Y1,Acc1,S).

fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,F) :-
    N>1,
    N1 is N -1,
    N2 is N -2,
    fibonacci(N1,F1),
    fibonacci(N2,F2),
    F is F1 + F2.

collatz(N,S) :-
    collatz_aux(N,0,S).

collatz_aux(1,Acc,Acc).
collatz_aux(N,Acc,S) :-
    N > 1,
    (N mod 2 =:= 0 ->  N1 is N // 2; N1 is 3 * N + 1),
    Acc1 is Acc + 1,
    collatz_aux(N1,Acc1,S).

is_prime(X) :-
    X>0,
    \+ factor(X,2).

factor(X,Y) :-
    Y*Y =< X,
    (X mod Y =:= 0 ;
    Y1 is Y + 1,
    factor(X,Y1)).
