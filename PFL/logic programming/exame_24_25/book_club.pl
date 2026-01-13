% gives_gift_to(Giver, Gift, Receiver)
gives_gift_to(bernardete, 'The Exchange', celestina).
gives_gift_to(celestina, 'The Brethren', eleuterio).
gives_gift_to(eleuterio, 'The Summons', felismina).
gives_gift_to(felismina, 'River God', juvenaldo).
gives_gift_to(juvenaldo, 'Seventh Scroll', leonilde).
gives_gift_to(leonilde, 'Sunbird', bernardete).
gives_gift_to(marciliano, 'Those in Peril', nivaldo).
gives_gift_to(nivaldo, 'Vicious Circle', sandrino).
gives_gift_to(sandrino, 'Predator', marciliano).

circle_size(Person, Size):-
    gives_gift_to(Person,_,P2),
    connects_dfs(P2,Person,Path),
    length(Path,Size).

connects_dfs(S, Person, List):-
connects_dfs(S, Person, [S], List).

connects_dfs(Person, Person, Acc, Acc).

connects_dfs(S, Person, Acc, List):-
    gives_gift_to(S,_,N),
    \+ memberchk(N, Acc),
    connects_dfs(N, Person, [N|Acc], List).

largest_circle(People):-
    gives_gift_to(P1,_,P2),
    connects_dfs(P2,P1,People),!,
    length(People,Len),
    \+ ( gives_gift_to(P3,_,P4), connects_dfs(P3,P4,P), length(P,Len2), Len2>Len).
