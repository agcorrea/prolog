% p/1
p(a).
p(b):-
    !.
    p(c).


:- begin_tests(test).

    % When I query for all possible values, only "a" and "b" are returned because of the cut operator found after "b".
    test(p) :-
        findall(X, p(X), L),
        =(L, [a,b]).

    % In the other hand, if I query just for the value "c", it's valid.
    test(p) :-
        p(c).

:- end_tests(test).
