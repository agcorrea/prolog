% any graph
move(a, b).
move(b, c).
move(b, d).
move(b, e).
move(e, f).
move(f, g).

deep_search(InitialPosition, EndPosition, Return) :-
    do_deep_search([], InitialPosition, EndPosition, R1),
    reverse(R1, Return).

do_deep_search(Path, EndPosition, EndPosition, [EndPosition|Path]) :- !.
do_deep_search(Path, InitialPosition, EndPosition, Return):-
    move(InitialPosition, Next),
    \+ member(InitialPosition, Path),
    do_deep_search([InitialPosition|Path], Next, EndPosition, Return),
    !.


:- begin_tests(test).
    
    test(deep_search) :-
        deep_search(a, g, X),
        =(X, [a, b, e, f, g]).
    
    test(deep_search) :-
        deep_search(a, c, X),
        =(X, [a, b, c]).

:- end_tests(test).