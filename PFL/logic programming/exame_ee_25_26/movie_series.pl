:-dynamic by/3.

% by(Character, Movie, Actor)
by(jackRyan, theSumOfAllFears, benAffleck).
by(cathyMuller, theSumOfAllFears, bridgetMoynahan).
by(jackRyan, theHuntForRedOctober, alecBaldwin).
by(jackRyan, patriotGames, harrisonFord).
by(cathyMuller, patriotGames, anneArcher).
by(jackRyan, clearAndPresentDanger, harrisonFord).
by(cathyMuller, clearAndPresentDanger, anneArcher).
by(president, airForceOne, harrisonFord).
by(frasierCrane, cheers, kelseyGrammer).
by(frasierCrane, frasier, kelseyGrammer).
by(rachelGreen, friends, jenniferAniston).
by(monicaGeller, friends, courteneyCox).
by(phoebeBuffay, friends, lisaKudrow).
by(ursulaBuffay, friends, lisaKudrow).
by(joeyTribbiani, friends, mattLeBlanc).
by(joeyTribbiani, joey, mattLeBlanc).
by(alexGarrett, joey, andreaAnders).
by(stephenColbert, dailyShow, stephenColbert).
by(stephenColbert, theColbertReport, stephenColbert).
by(addisonMontgomery, privatePractice, kateWalsh).
by(addisonMontgomery, greysAnatomy, kateWalsh).
by(mattMurdock, daredevil, benAffleck).
by(elektraNatchios, daredevil, jenniferGarner).
by(elektraNatchios, elektra, jenniferGarner).
by(elektraNatchios, elektra, lauraWard).
by(sydneyBristow, alias, jenniferGarner).

plays_twins(Actor,Movie):-
    by(Ch1,Movie,Actor),
    by(Ch2,Movie,Actor),
    Ch1 \= Ch2.

actor_movies(Actor,Movies):-
    actor_movies_aux(Actor,[],Movies).

actor_movies_aux(Actor,Acc,Movies):-
    by(_,Movie,Actor),
    \+ member(Movie,Acc),
    actor_movies_aux(Actor,[Movie|Acc],Movies),!.
actor_movies_aux(_,Acc,Acc).

playedBy(Character,List):-
    setof(
        Actor-Movies,
        M^(
        by(Character,M,Actor),
        findall(
            Movie,
            (by(Character,Movie,Actor)),
            Movies
            )
        ),
        List
        ).

most_popular(Exclude,List,NMovies):-
setof(
    HowManyMovies-Actor,
    Movies^C^M^
    (
        by(C,M,Actor),
        actor_movies(Actor,Movies),
        \+ member(Actor,Exclude),
        length(Movies,HowManyMovies)
    ), ListMoviesActors
    ),

    last(ListMoviesActors,MaxMovies-_),
    NMovies = MaxMovies,

    findall(
        Actor,
        (member(NMovies-Actor,ListMoviesActors),
        \+ (member(Movies2-_, ListMoviesActors),Movies2>NMovies)),
        List
        ).

connection_link(Actor1,Actor2,ConnectionList):-
    connects_dfs(Actor1,Actor2, C), reverse(C,ConnectionList).

connects_dfs(A1, A2, Path):-
    connects_dfs(A1, A2, [A1], Path).

connects_dfs(A2, A2, Path, Path).

connects_dfs(A1, A2, Acc, Path):-
    by(_,Movie,A1),
    by(_,Movie,A3),
    \+ memberchk(Movie, Acc),
    \+ memberchk(A3, Acc),
    connects_dfs(A3, A2, [A3,Movie|Acc], Path).

pretty_print([Actor1, Movie, Actor2| ConnectionList]):-
    write(Actor1), write(" worked in "), write(Movie), write(" with "), write(Actor2), write(","),
    pretty_print2(ConnectionList).
pretty_print2([]):-write(".").
pretty_print2([Movie, Actor| Rest]):-
    nl,write(" who worked in "), write(Movie), write(" with "), write(Actor), write(","),
    pretty_print2(Rest).
