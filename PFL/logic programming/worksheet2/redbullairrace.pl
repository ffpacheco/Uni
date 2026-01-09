pilot(lamb).
pilot(besenyei).
pilot(chambliss).
pilot(maclean).
pilot(mangold).
pilot(jones).
pilot(bonhomme).

belongsTo(lamb, breitling).
belongsTo(besenyei, redBull).
belongsTo(chambliss, redBull).
belongsTo(maclean, mediterranean).
belongsTo(mangold, cobra).
belongsTo(jones, matador).
belongsTo(bonhomme, matador).

drives(lamb, mx2).
drives(besenyei, edge540).
drives(chambliss, edge540).
drives(maclean, edge540).
drives(mangold, edge540).
drives(jones, edge540).
drives(bonhomme, edge540).

circuit(istanbul).
circuit(budapeste).
circuit(porto).

winner(jones,porto).
winner(mangold, budapeste).
winner(mangold, istanbul).

gates(istanbul, 9).
gates(budapeste, 6).
gates(porto, 5).

winnerTeam(Circuit, Team) :- winner(Pilot,Circuit), belongsTo(Pilot, Team).

moreThanOneWin(X) :- winner(X,Y), winner(X,Z), Y \= Z, !.

winnerPlane(Plane, Circuit) :- winner(Pilot, Circuit), drives(Pilot, Plane).

most_gates(X) :-
    gates(X, GX),
    \+ (
        gates(_, GY),
        GY > GX
    ), !.

least_gates(X) :-
    gates(X, GX),
    \+ (
        gates(_, GY),
        GY < GX
    ), !.

gate_diff(X) :-
    most_gates(Z),
    least_gates(Y),
    gates(Z,GZ),
    gates(Y,GY),
    X is GZ-GY.

same_team(X, Y) :-
    belongsTo(X, Team),
    belongsTo(Y, Team), X\=Y, X@<Y.

is_from_winning_team(P, C):-
    winner(WP,C),
    belongsTo(WP,WT),
    belongsTo(P,WT).
