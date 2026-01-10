print_n(N,S):-
    N > 0,
    write(S),
    N1 is N - 1,
    print_n(N1, S).
print_n(0,_).

print_text(Text,S,Padding) :-
    write(S), print_n(Padding, ' '), write(Text),  print_n(Padding, ' '), write(S).

print_banner(Text, S, Padding):-
    atom_length(Text, L),
    X is L + 2 + (2 * Padding),
    print_n(X, S),
    nl,
    write(S),
    Y is X - 2,
    print_n(Y, ' '),
    write(S),
    nl,
    write(S),
    print_n(Padding, ' '),
    write(Text),
    print_n(Padding, ' '),
    write(S),
    nl,
    write(S),
    print_n(Y, ' '),
    write(S),
    nl,
    print_n(X, S).

read_number(X):-
    readaux(0,X).

readaux(Acc,X):-
    peek_code(Ch), Ch\=10,
    get_code(Ch),
    NewAcc is 10 *Acc + (Ch - 48),
    readaux(NewAcc,X).

readaux(X,X):-
    peek_code(Ch),
    Ch = 10.

read_string(Str):-
    read_string_aux([], StrRev),
    reverse(StrRev, Str2),
    atom_chars(Str, Str2).

read_string_aux(Acc, Str):-
    peek_code(Ch), Ch \= 10,
    get_code(Ch),
    char_code(C, Ch),
    read_string_aux([C|Acc], Str).

read_string_aux(Str, Str):-
    peek_code(Ch),
    Ch = 10, get_code(Ch).

banner:-
    write('text: '),
    read_string(Text),
    write('symbol: '),
    get_char(Symb),
    get_char(_),
    write('padding: '),
    read_number(Padding), nl,
    print_banner(Text, Symb, Padding).

longest_string(List, Longest):-
    maplist(len_str_pair, List, PairedList),
    sort(PairedList, Sorted),
    last(Sorted, _-Longest).

len_str_pair(Str, Len-Str):-
    atom_length(Str, Len).

print_strings([], _, _,_).
print_strings([H|List], Symb, Padding, LongestSize):-
    atom_length(H, ThisSize),
    NewPad is (LongestSize - ThisSize)// 2  + Padding,
    write(Symb),
    print_n(NewPad, ' '),
    write(H),
    print_n(NewPad, ' '),
    write(Symb),nl,
    print_strings(List,Symb, Padding, LongestSize).

print_multi_banner(List, Symb, Padding):-
    longest_string(List, Longest),
    atom_length(Longest,X),
    Z is X + 2 + 2 * Padding,
    print_n(Z, Symb),
    nl,
    write(Symb),
    Y is Z -2,
    print_n(Y,' '),
    write(Symb),
    nl,
    print_strings(List, Symb, Padding, X),
    write(Symb),
    print_n(Y, ' '),
    write(Symb),nl,
    print_n(Z, Symb).


christmasLine(Level, LongestLine, MaxLevel):-
    Level<MaxLevel,
    X is 1+Level*2,
    Padding is (LongestLine - X)// 2,
    print_n(Padding, ' '),
    print_n(X, '*'),
    print_n(Padding, ' '),
    NewLevel is Level +1,
    nl,
    christmasLine(NewLevel, LongestLine, MaxLevel), !.

christmasLine(Level, LongestLine, MaxLevel):-
    Level=MaxLevel,
    X is 1,
    Padding is (LongestLine - X)// 2,
    print_n(Padding, ' '),
    print_n(X, '*'),
    print_n(Padding, ' '),
    nl.

oh_christmas_tree(N) :-
    N>0,
    LongestLineSize is 1 + N *2,
    Current is 0,
    christmasLine(Current, LongestLineSize, N).
