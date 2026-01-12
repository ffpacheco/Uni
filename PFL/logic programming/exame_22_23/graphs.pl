%G1
edge(g1, br, o).
edge(g1, br, ni).
edge(g1, o, ni).
edge(g1, o, c).
edge(g1, o, h).
edge(g1, h, c).
edge(g1, h, n).
edge(g1, n, he).
edge(g1, c, he).
% G2
edge(g2, br, h).
edge(g2, br, ni).
edge(g2, h, ni).
edge(g2, h, o).
edge(g2, h, c).
edge(g2, o, c).
edge(g2, o, n).
edge(g2, n, he).
edge(g2, c, he).
edge(g2, cl, he).

common_edges(G1,G2,L):-
    findall(
        A-B,
        (edge(G1, A, B),
        edge(G2, A, B))
    ,L
    ).

common_subgraphs(G1,G2,Subgraphs):-
    common_edges(G1,G2,CommonEdges),
    build_components(CommonEdges, [], Subgraphs).

build_components([], Acc, Acc).
build_components([V1-V2 | Rest], Groups, Final) :-
    separate_groups(V1, V2, Groups, Related, Unrelated),
    flatten([V1, V2 | Related], Combined),
    sort(Combined, NewGroup),
    build_components(Rest, [NewGroup | Unrelated], Final).

separate_groups(_, _, [], [], []).
separate_groups(V1, V2, [G|Gs], [G|Related], Unrelated) :-
    (member(V1, G) ; member(V2, G)), !,
    separate_groups(V1, V2, Gs, Related, Unrelated).
separate_groups(V1, V2, [G|Gs], Related, [G|Unrelated]) :-
    separate_groups(V1, V2, Gs, Related, Unrelated).
