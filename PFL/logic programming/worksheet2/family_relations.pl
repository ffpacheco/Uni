female(grace).
female(dede).
female(claire).
female(gloria).
female(barb).
female(pameron).
female(lily).
female(alex).
female(haley).
female(poppy).
male(frank).
male(jay).
male(javier).
male(merle).
male(cameron).
male(bo).
male(manny).
male(joe).
male(mitchell).
male(phil).
male(dylan).
male(luke).
male(rexford).
male(calhoun).
male(george).
parent(grace,phil).
parent(frank,phil).
parent(dede,claire).
parent(jay,claire).
parent(dede,mitchell).
parent(jay,mitchell).
parent(javier,manny).
parent(gloria,manny).
parent(gloria,joe).
parent(jay,joe).
parent(barb,cameron).
parent(merle,cameron).
parent(merle,pameron).
parent(barb,pameron).
parent(pameron,calhoun).
parent(bo,calhoun).
parent(cameron,lily).
parent(mitchell,lily).
parent(mitchell,rexford).
parent(cameron,rexford).
parent(phil,haley).
parent(claire,haley).
parent(claire,alex).
parent(phil,alex).
parent(phil,luke).
parent(claire,luke).
parent(haley,george).
parent(dylan,poppy).
parent(dylan,george).
parent(haley,poppy).

grandparent(X,Y) :- parent(X,Z), parent(Z,Y).

sibling(X,Y) :- parent(Z,X), parent(Z,Y), parent(W,X), parent(W,Y), W\=Z, X \= Y.

father(X,Y) :- male(X), parent(X,Y).
mother(X,Y) :- female(X), parent(X,Y).

grandfather(X,Y) :- male(X), grandparent(X,Y).
grandmother(X,Y) :- female(X), grandparent(X,Y).

halfSibling(X,Y) :- parent(Z,X), parent(Z,Y), X \= Y,
                    parent(W,X), parent(V,Y), W \= V, W \= Z, V \= Z.

cousin(X,Y) :- parent(Z,X), parent(W,Y), sibling(Z,W).

uncle(X,Y) :- male(X), sibling(X,Z), parent(Z,Y).
aunt(X,Y) :- female(X), sibling(X,Z), parent(Z,Y).

marriage(gloria,jay,2008).
marriage(dede,jay,1968).
divorce(dede,jay,2003).

ancestor_of(X, Y) :- parent(X, Y).
ancestor_of(X, Y) :- parent(X, Z), ancestor_of(Z, Y).

descendant_of(X, Y) :- parent(Y, X).
descendant_of(X, Y) :- parent(Z, X), descendant_of(Z, Y).

marriage_years(X, Y, Years) :-
    marriage(X, Y, StartYear),
    divorce(X, Y, EndYear),
    Years is EndYear - StartYear.

desceOfGloriaNotJay(X) :- descendant_of(X, gloria), \+ descendant_of(X, jay).
ancestersHaleyandLily(X) :- ancestor_of(X, haley), ancestor_of(X, lily).

born(jay, 1946-5-23).
born(claire, 1970-11-13).
born(mitchell, 1973-7-10).

before(Y1-_-_, Y2-_-_) :- Y1 < Y2, !.
before(Y1-M1-_, Y2-M2-_) :- Y1 =:= Y2, M1 < M2, !.
before(Y1-M1-D1, Y2-M2-D2) :- Y1 =:= Y2, M1 =:= M2, D1 < D2.

older(X, Y, Older) :-
    born(X, DateX),
    born(Y, DateY),
    before(DateX, DateY),
    Older = X, !.
older(X, Y, Older) :-
    born(X, DateX),
    born(Y, DateY),
    before(DateY, DateX),
    Older = Y.

oldest(X) :-
    born(X, _),
    \+ (
        born(_, DateY),
        born(X, DateX),
        before(DateY, DateX)
        ), !.
