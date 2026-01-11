unifiable([],_,[]).
unifiable([H|L1], Term, L2):-
    copy_term(H,Copy),
    copy_term(Term,T),
    (
        Copy = T -> L2 = [H|Rest], unifiable(L1,Term,Rest);
        unifiable(L1,Term,L2)
        ).
