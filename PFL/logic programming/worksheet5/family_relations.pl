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

% -----------------------------------------------------------------------

children(Person, Children):-
    findall(Child,parent(Person, Child), Children).

children_of([],[]).
children_of([H | ListOfPeople], [H-C |ListOfPairs]):-
    findall(Child, parent(H, Child), C),
    children_of(ListOfPeople, ListOfPairs).

family(F):-
    setof(Member, P^(parent(Member,P); parent(P,Member)), F).

iscouple(C1, C2) :-
    parent(C1, X),
    parent(C2, X),
    C1 \= C2.

couple(C1-C2) :-
    var(C1), var(C2), !,
    setof(A-B, (iscouple(A,B), A@<B), AllCouples),
    member(C1-C2, AllCouples).

couple(C1-C2) :-
    nonvar(C1), nonvar(C2), !,
    iscouple(C1,C2).

couples(C1-C2) :-
    setof(A-B, (iscouple(A,B), A@<B), AllCouples),
    member(C1-C2, AllCouples).

spouse_childrenaux(Person, B/C) :-
    iscouple(Person, B),
    setof(Child, (parent(Person, Child), parent(B, Child)), C).

spouse_children(Person, All) :-
    setof(B/C, spouse_childrenaux(Person, B/C), All).

immediate_family(Person, Parents-SpouseChildren):-
    findall(Parent, (parent(Parent,Person)), Parents),
    spouse_children(Person,SpouseChildren).

parents_of_two(P):-
    setof(Parents, X^Y^(parent(Parents, X), parent(Parents,Y), X\=Y), P).
