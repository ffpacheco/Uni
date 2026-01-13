dec2bin(Dec, BinList, N):-
    dec2binaux(Dec,[],List),!,
    length(List, L),
    L=<N,
    padding(List,L,N, BinList).

dec2binaux(0,BinList,BinList).
dec2binaux(Dec,Acc,BinList):-
    Dec2 is Dec // 2,
    Rem is Dec rem 2,
    dec2binaux(Dec2,[Rem|Acc], BinList).

padding(BinList,L,N, Final):-
    L<N,
    L2 is L+1,
    append([0], BinList, List),
    padding(List,L2,N, Final).

padding(BinList,N,N, BinList).


paddingr(BinList,L,N, Final):-
    L<N,
    L2 is L+1,
    append(BinList,[0], List),
    paddingr(List,L2,N, Final).
paddingr(BinList,N,N,BinList).


initialize(DecNumber, Bits, Padding, List):-
    dec2bin(DecNumber,Res,Bits),
    PaddingLeft is Bits + Padding,
    padding(Res,Bits,PaddingLeft,Lpadded),
    PaddingRight is PaddingLeft + Padding,
    paddingr(Lpadded,PaddingLeft,PaddingRight,List).

print_generation(List):-
write("|"),
print_aux(List, 1).


print_aux([],_).
print_aux([L|List],N):-
    (L = 1-> write("M"); write(".")),
    (N = 8 -> (write("|"), R is 1); R is N +1),
    print_aux(List,R).

