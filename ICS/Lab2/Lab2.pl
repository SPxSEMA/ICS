% соответствие слов на английском и французском языках
translation(issue, probleme).
translation(car, voiture).
translation(shirt, chemise).
translation(example, exemple).
translation(translate, traduire).

% предикат для перевода списка слов
translate([], []).
translate([Word|Tail1], [Translation|Tail2]) :- translation(Word, Translation), translate(Tail1, Tail2).

% предложение для перевода
sentence([], []).
sentence([Word|Tail1], [Translation|Tail2]) :- translation(Word, Translation), sentence(Tail1, Tail2).

 %  ?-sentence([car, shirt, issue, example, translate], Translation).
 %   Translation = [probleme, voiture, chemise, exemple, traduire]