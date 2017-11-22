% intersection/3
% intersection(E, A, B) shows if the element "E" belongs to the intersection of the lists "A" e "B"
intersection(E, A, B) :-
    belongs(E, A),
    belongs(E, B).

belongs(E, [E|_]) :- !.

belongs(E, [_|T]) :-
    belongs(E, T).


:- begin_tests(test).

    test(intersection) :-
        intersection(a, [a,b], [a,c]).

    test(intersection) :-
        intersection(a, [b,a], [a,c]).

    test(intersection) :-
        intersection(a, [b,a,b], [c,b,a]).

    test(intersection, [fail]) :-
        intersection(a, [b,c], [a,b]).

    test(intersection, [fail]) :-
        intersection(a, [b,c], [d,b]).

:- end_tests(test).
