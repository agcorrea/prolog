% not_belongs/2
% not_belongs(E, C) case the elemnt "E" is not a member of "C"

not_belongs(E, C) :-
    \+ belongs(E, C).

belongs(E, [E|_]) :- !.

belongs(E, [_|T]) :-
    belongs(E, T).


:- begin_tests(test).

    test(not_belongs) :-
        not_belongs(a, [b]).

    test(not_belongs) :-
        not_belongs(a, [b,c]).

    test(not_belongs, [fail]) :-
        not_belongs(a, [a,b,c]).

    test(not_belongs, [fail]) :-
        not_belongs(a, [b,a,c]).

:- end_tests(test).
