gcd(X,0,X):- !.
gcd(X,Y,G) :-
    Y > 0,
    Z is X mod Y,
    gcd(Y, Z, G).

lcm(X,Y,M) :-
    gcd(X,Y,G),
    M is (X*Y)//G.
