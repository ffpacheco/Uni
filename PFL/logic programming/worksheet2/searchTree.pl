pairs(X, Y):- d(X), q(Y).
pairs(X, X):- u(X).
u(1).
d(2).
d(4).
q(4).
q(16).

pairs(X,Y)
|
+-- Clause 1: d(X), q(Y)
|   |
|   +-- d(X)=d(2)
|   |   |
|   |   +-- q(Y)=q(4)   --> solution: X=2, Y=4
|   |   |
|   |   +-- q(Y)=q(16)  --> solution: X=2, Y=16
|   |
|   +-- d(X)=d(4)
|       |
|       +-- q(Y)=q(4)   --> solution: X=4, Y=4
|       |
|       +-- q(Y)=q(16)  --> solution: X=4, Y=16
|
+-- Clause 2: pairs(X,X) :- u(X)
    |
    +-- u(1)            --> solution: X=1, Y=1
