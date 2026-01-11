% flight(origin, destination, company, code, hour, duration)
flight(porto, lisbon, tap, tp1949, 1615, 60).
flight(lisbon, madrid, tap, tp1018, 1805, 75).
flight(lisbon, paris, tap, tp440, 1810, 150).
flight(lisbon, london, tap, tp1366, 1955, 165).
flight(london, lisbon, tap, tp1361, 1630, 160).
flight(porto, madrid, iberia, ib3095, 1640, 80).
flight(madrid, porto, iberia, ib3094, 1545, 80).
flight(madrid, lisbon, iberia, ib3106, 1945, 80).
flight(madrid, paris, iberia, ib3444, 1640, 125).
flight(madrid, london, iberia, ib3166, 1550, 145).
flight(london, madrid, iberia, ib3163, 1030, 140).
flight(porto, frankfurt, lufthansa, lh1177, 1230, 165).

get_all_nodes(ListOfAirports):-
    setof(Airport,
        A^B^C^D^E^F^G^H^I^J^
        (flight(Airport,A,B,C,D,E) ;
         flight(F,Airport,G,H,I,J)),
        ListOfAirports).

get_all_companies(ListOfCompanies):-
    setof(Company,
        A^B^C^D^E^
        (flight(B,A,Company,C,D,E)),
        ListOfCompanies).

company_airports(Company, Airports):-
    setof(Airport,
        A^C^D^E^F^H^I^J^
        (flight(Airport,A,Company,C,D,E) ;
         flight(F,Airport,Company,H,I,J)),
         Airports).

most_diversified(Company):-
    get_all_companies(ListOfCompanies),
    findall(
        Count-Comp,
        (member(Comp,ListOfCompanies),
        company_airports(Comp,Airports),
        length(Airports,Count)
        ), Pares),

    keysort(Pares, Sorted),
    last(Sorted, MaxC-_),
    member(MaxC-Company, Sorted).

% -----------------DFS-------------------------

flights_dfs(O, D, F):-
    flights_dfs(O, D, [O], F).

flights_dfs(D, D, _, []).

flights_dfs(O, D, Visited, [Code|Flights]):-
    flight(O, N, _Company,Code,_, _),
    \+ memberchk(N, Visited),
    flights_dfs(N,D, [N|Visited], Flights).

find_flights(Origin, Destination, Flights):-
    flights_dfs(Origin, Destination, Flights).

% -----------------BFS-------------------------

find_flights_bfs(Origin, Dest, Codes) :-
    bfs_queue([airport(Origin, [Origin], [])], Dest, Codes),!.

bfs_queue([airport(Dest, _, Codes) | _], Dest, Codes).

bfs_queue([airport(S, Visited, PathToS) | Rest], Dest, FinalPath) :-
    findall(airport(N, [N|Visited], NewPath),
        (
          flight(S, N, _, Code, _, _),
          \+ member(N, Visited),
          append(PathToS, [Code], NewPath)
        ),
        Neighbors),

    append(Rest, Neighbors, NextQueue),
    bfs_queue(NextQueue, Dest, FinalPath).

% -----------------------------

find_all_flights(Origin, Destination, ListOfFlights) :-
    findall(
        Flights,
        find_flights(Origin, Destination, Flights)
        , ListOfFlights
    ).

find_flights_least_stops(Origin, Destination, ListOfFlights):-
    findall(
        Flights,
        find_flights_bfs(Origin, Destination, Flights), ListOfFlights
        ).

find_flights_stops(Origin, Destination, Stops, ListFlights):-
    findall(
        Flights,
        stops_dfs(Origin,Destination,Stops,Flights)
        ,ListFlights).

stops_dfs(O,D,S,F):-
    stops_flights(O,D,Acc,V,F),
    subset(S,V).

stops_flights(D,D,V,V,F).

stops_dfs(C, D, V, TotalV, [Code|Rest]):-
    flight(C, N, _, Code, _, _),
    \+ memberchk(N, V),
    stops_dfs(N, D, [N|V], TotalV, Rest).

subset([],_).
subset([H|R],List):-
    member(H,List),
    subset(R,List).

% -----------------------------

filter_max([],_,[]).

filter_max([F|Flights],MaxSize,Result):-
    length(F, Len),
    (
        Len =< MaxSize ->
        Result = [F|Rest],
        filter_max(Flights,MaxSize,Rest);
        filter_max(Flights,MaxSize,Result)
    ).

find_circular_trip(MaxSize, Origin, Cycle):-
    findall(Paths, circular_dfs(Origin,Origin,Paths),Flights),
    filter_max(Flights,MaxSize,Cycle).

circular_dfs(O,D,[Code|Flights]):-
    flight(O,N,_,Code,_,_),
    flights_dfs(N,D,[N], Flights).

% --------------------------------------

strongly_connected(ListOfNodes) :-
    forall(member(A, ListOfNodes),
        forall(member(B, ListOfNodes),
            (A == B ; can_reach(A, B, ListOfNodes))
        )
    ).

can_reach(Origin, Dest, AllowedNodes) :-
    dfs_connectivity(Origin, Dest, [Origin], AllowedNodes).

dfs_connectivity(Dest, Dest, _, _).

dfs_connectivity(Current, Dest, Visited, AllowedNodes) :-
    flight(Current, Next, _, _, _, _),
    member(Next, AllowedNodes),
    \+ member(Next, Visited),
    dfs_connectivity(Next, Dest, [Next|Visited], AllowedNodes).

% ----------------------------------

strongly_connected_components(MaxComponents) :-
    setof(A, B^C^D^E^F^flight(A, B, C, D, E, F), AllAirports),

    findall(S, (gen_sub_set(AllAirports, S), S \= [], strongly_connected(S)), AllSCCs),

    findall(M, (member(M, AllSCCs), \+ (member(O, AllSCCs), M \= O, is_subset(M, O))), MaxComponents).

gen_sub_set([], []).
gen_sub_set([H|T], [H|Sub]) :- gen_sub_set(T, Sub).
gen_sub_set([_|T], Sub)     :- gen_sub_set(T, Sub).

is_subset([], _).
is_subset([H|T], List) :-
    member(H, List),
    is_subset(T, List).

% ----------------------------------
bridges(ListOfBridges) :-
    findall(flight(U, V, Comp, Code, Dep, Arr),
            is_bridge(U, V, Comp, Code, Dep, Arr),
            ListOfBridges).

is_bridge(U, V, Comp, Code, Dep, Arr) :-
    flight(U, V, Comp, Code, Dep, Arr),
    \+ can_reach_cycle(V, U).

can_reach_cycle(Start, Target) :-
    dfs_bridge(Start, Target, [Start]).

dfs_bridge(Target, Target, _).
dfs_bridge(Current, Target, Visited) :-
    flight(Current, Next, _, _, _, _),
    \+ member(Next, Visited),
    dfs_bridge(Next, Target, [Next|Visited]).
