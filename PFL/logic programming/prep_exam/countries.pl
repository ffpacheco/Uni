% Country, Capital, Continent, Population
country('Bolivia', 'Bogota', 'South America', 12.08).
country('Chile', 'Santiago', 'South America', 19.49).
country('Peru', 'Lima', 'South America', 33.72).
country('Mozambique', 'Maputo', 'Africa', 32.08).
country('South Africa', 'Cape Town', 'Africa', 59.39).
country('Lesotho', 'Maseru', 'Africa', 2.281).

:- dynamic borders/2.

% borders (Country, ListOfNeighbors)
borders('Bolivia', ['Chile'-861, 'Peru'-4300]).
borders('Chile', ['Peru'-169, 'Bolivia'-861]).
borders('Peru', ['Chile'-169, 'Bolivia'-4300]).
borders('Mozambique', ['South Africa'-496]).
borders('South Africa', ['Mozambique'-496, 'Lesotho'-909]).
borders('Lesotho', ['South Africa'-909]).


is_enclave(C):-
    borders(C,ListOfNeighbors),
    length(ListOfNeighbors, 1).

long_border_neighbors(MinLength,Country1,Country2):-
    borders(Country1,Neighbors),
    member(Country2-D, Neighbors),
    D>=MinLength.

cleanNeighborsList([],List, List).
cleanNeighborsList([N-_|Rest],Acc,List):-
    cleanNeighborsList(Rest,[N|Acc], List).

capitalsOfList([],List,List).
capitalsOfList([C|Countries],Capitals, List):-
    country(C,Capital,_,_),
    capitalsOfList(Countries,[Capital|Capitals], List).

neighbors_capitals(Country,Capitals):-
    borders(Country,Neighbors),
    cleanNeighborsList(Neighbors,[],CleanList),
    capitalsOfList(CleanList,[],Capitals).

second_largest_population_of_continent(Continent,Country):-
    country(MostPopCountry,_,Continent,MaxPop),
    \+ (country(_,_,Continent,Pop), Pop>MaxPop),
    country(Country,_,Continent,Population),
    Country \= MostPopCountry,
    \+ (country(C,_,Continent,MaxPop2), C\= MostPopCountry, MaxPop2>Population).

similar_neighbors(C,N1,N2):-
    borders(C,Neighbors),
    nth1(Index1, Neighbors, N1-D1),
    nth1(Index2, Neighbors, N2-D2),
    Diff is Index1 - Index2,
    Diff = 1,
    Diference is abs(D2-D1),
    Diference<1000.

are_borders_sorted(Borders):-
    \+ (append(_,[_-N1, _-N2 | _],Borders), N2<N1).

print_countries():-
    country(Country,Capital,Continent,_),
    write(Capital),
    write(", capital of "),
    write(Country),
    write(", in "),
    write(Continent),
    nl, fail.

print_countries().

get_countries(Countries):-
    get_countries_aux([],Countries).

get_countries_aux(Acc, Countries):-
    country(C,_,_,_),
    \+ member(C,Acc),!,
    get_countries_aux([C|Acc],Countries).

get_countries_aux(Acc,Acc).

big_country_continent_capitals(MinPop,Continent,Capitals):-
    bagof(
        Capital,
        A^Capital^Pop^(country(A,Capital,Continent,Pop),
        Pop>=MinPop),
        Capitals
        ).

most_populated_neighbours(Country, SortedNeighbors):-
    borders(Country,Neighbors),
    findall(Neighs, member(Neighs-_, Neighbors), CleanNeighs),
    findall(
        Pop-C,
        (member(C,CleanNeighs),
        country(C,_,_,Pop)),
        PopCountry
        ),
    sort(PopCountry,Reversed),
    reverse(Reversed,CountriesPop),
    findall(C, (member(_-C, CountriesPop)), SortedNeighbors).

trajectory(C1,C2,Traj):-
    connects_dfs(C1,C2,[C1],R),
    reverse(R,Traj).

connects_dfs(C2, C2, Acc, Acc).

connects_dfs(C1, C2, Acc, Traj):-
    borders(C1,Neighbors),
    findall(Neighs, member(Neighs-_, Neighbors), CleanNeighs),
    member(N,CleanNeighs),
    \+ memberchk(N, Acc),
connects_dfs(N, C2, [N|Acc], Traj),!.
