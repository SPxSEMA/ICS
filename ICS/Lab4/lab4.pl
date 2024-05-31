% Проверка, является ли X элементом списка
elem(X,[X|_]).
elem(X,[_|Tail]) :- elem(X,Tail).

% Проверка наличия общего элемента в списках
elems(X,[Y|_]) :- elem(Y,X).
elems(X,[_|Tail]) :- elems(X,Tail).

% Подбор книг по критериям пользователя
list_book(Author,Genres,MinPages,MaxPages,Language,MinAge,MaxAge,Acc,Books) :-
    book(Book,Author,Genre,Pages,Language,MinAge,MaxAge),
    elems(Genre,Genres),
    Pages > MinPages-1,
    Pages < MaxPages+1,
    MinAge =< MaxAge,
    MinAge =< MaxAge,
    \+ elem(Book,Acc), !,
    list_book(Author,Genres,MinPages,MaxPages,Language,MinAge,MaxAge,[Book|Acc],Books).

list_book(_,_,_,_,_,_,_,Books,Books).

% Подсказка пользователю о книгах, соответствующих его критериям
suggest_book(M) :- 
    write('Введите желаемого автора: '),
    read(Author),
    write('Выберите жанры книг: \n   фэнтези   роман   детектив   научная_фантастика\n'),
    read(Genres),
    write('Введите минимальное количество страниц: '),
    read(MinPages),
    write('Введите максимальное количество страниц: '),
    read(MaxPages),
    write('Введите желаемый язык книги: '),
    read(Language),
    write('Введите минимальный возраст читателя: '),
    read(MinAge),
    write('Введите максимальный возраст читателя: '),
    read(MaxAge),
    list_book(Author,Genres,MinPages,MaxPages,Language,MinAge,MaxAge,[],M).
    

% База данных о книгах
book(harry_potter, jk_rowling, фэнтези, 400, русский, 10, 99).
book(lord_of_the_rings, jrr_tolkien, фэнтези, 1200, русский, 12, 99).
book(pride_and_prejudice, jane_austen, роман, 300, английский, 16, 99).
book(sherlock_holmes, arthur_conan_doyle, детектив, 350, английский, 14, 99).
book(foundation, isaac_asimov, научная_фантастика, 500, русский, 12, 99).
book(dune, frank_herbert, научная_фантастика, 800, русский, 14, 99).
book(1984, george_orwell, дистопия, 328, английский, 16, 99).
book(brave_new_world, aldous_huxley, дистопия, 311, английский, 16, 99).
book(fahrenheit_451, ray_bradbury, научная_фантастика, 179, английский, 14, 99).
book(the_catcher_in_the_rye, jd_salinger, роман, 224, английский, 16, 99).
book(to_kill_a_mockingbird, harper_lee, роман, 281, английский, 14, 99).
book(the_great_gatsby, f_scott_fitzgerald, роман, 218, английский, 16, 99).
book(les_miserables, victor_hugo, роман, 1463, французский, 16, 99).
book(wuthering_heights, emily_bronte, роман, 342, английский, 16, 99).
book(the_hobbit, jrr_tolkien, фэнтези, 320, английский, 10, 99).
book(the_little_prince, antoine_de_saint_exupery, сказка, 96, французский, 6, 99).
book(alice_in_wonderland, lewis_carroll, фэнтези, 272, английский, 8, 99).
book(the_da_vinci_code, dan_brown, триллер, 454, английский, 16, 99).
book(the_casual_vacancy, jk_rowling, драма, 503, английский, 16, 99).
book(the_shining, stephen_king, ужасы, 447, английский, 18, 99).