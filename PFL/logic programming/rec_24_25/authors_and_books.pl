%author(AuthorID, Name, YearOfBirth, CountryOfBirth).
author(1, 'John Grisham', 1955, 'USA').
author(2, 'Wilbur Smith', 1933, 'Zambia').
author(3, 'Stephen King', 1947, 'USA').
author(4, 'Michael Crichton', 1942, 'USA').

%book(Title, AuthorID, YearOfRelease, Pages, Genres).
book('The Firm', 1, 1991, 432, ['Legal thriller']).
book('The Client', 1, 1993, 422, ['Legal thriller']).
book('The Runaway Jury', 1, 1996, 414, ['Legal thriller']).
book('The Exchange', 1, 2023, 338, ['Legal thriller']).

book('Carrie', 3, 1974, 199, ['Horror']).
book('The Shining', 3, 1977, 447, ['Gothic novel', 'Horror', 'Psychological horror']).
book('Under the Dome', 3, 2009, 1074, ['Science fiction', 'Political']).
book('Doctor Sleep', 3, 2013, 531, ['Horror', 'Gothic', 'Dark fantasy']).

book('Jurassic Park', 4, 1990, 399, ['Science fiction']).
book('Prey', 4, 2002, 502, ['Science fiction', 'Techno-thriller', 'Horror', 'Nanopunk']).
book('Next', 4, 2006, 528, ['Science fiction', 'Techno-thriller', 'Satire']).

book_genre(Title,Genre):-
    book(Title,_,_,_,Genres),
    member(Genre, Genres).

author_wrote_book_at_age(Author,Title, Age):-
    author(Id, Author, Birth, _),
    book(Title, Id, Year, _,_),
    Age is Year-Birth.

youngest_author(Author):-
    author_wrote_book_at_age(Author, _T1, Age),
    \+ ( author_wrote_book_at_age(_Author2, _T2, Age2), Age2<Age).

genres(Title):-
    book(Title,_,_,_,Genres),
    member(Genre,Genres),
    writeln(Genre), fail.
genres(_).

formTerm(_, [], []).
formTerm(TermList, [I|Indexes], [R|FinalResult]):-
    nth0(I, TermList, R),
    formTerm(TermList,Indexes,FinalResult),!.

filterArgs(Term, Indexes,NewTerm):-
    Term =..ListTerm,
    nth0(0, ListTerm, Name),
    formTerm(ListTerm, Indexes, Rest),
    NewTerm =..[Name|Rest].


diverse_books(Books):-
    setof(Len-Title,
        A^B^C^Genres^(book(Title, A, B, C, Genres),
        length(Genres, Len)),
        Raw),

    reverse(Raw, Sorted),
    [MaxLen-_|_]=Sorted,
    findall(
        Title,(
        member(Len-Title,Sorted),
        Len=MaxLen), Books).

diverse_books2(Books):-
    findall(Title,
        (book(Title, _ ,_,_, Genres), length(Genres, Len),
        \+ (book(_, _ ,_,_, Genres2), length(Genres2, Len2), Len2>Len)), Books).

country_authors(Country, Authors):-
    bagof(Name,Id^Year^(author(Id,Name,Year,Country)), Authors).

read_book(bernardete, 'The Firm').
read_book(bernardete, 'The Client').
read_book(clarice, 'The Firm').
read_book(clarice, 'Carrie').
read_book(deirdre, 'The Firm').
read_book(deirdre, 'Next').

getallmembers(A):-
    setof(Name, Book^Name^(read_book(Name,Book)), A).

popular(Title):-
    getallmembers(Members),
    length(Members, N),

    setof(Name, (read_book(Name,Title)), WhoRead),
    length(WhoRead, X),

    X >=0.75 * N.

:-op(400, xfx, wrote).
:-op(500, xfx, at).

Author wrote Book at Age:-
    author_wrote_book_at_age(Author,Book,Age).

