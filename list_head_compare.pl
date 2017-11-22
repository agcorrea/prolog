% p/2
% verifies if the head element is the same in both lists
p([H|_],[H|_]).


:- begin_tests(test).

test(p) :-
	p([a],[a]).

test(p) :-
        p([a,b],[a,c]).

test(p) :-
        p([c,b],[c,b]).

test(p, [fail]) :-
        p([b],[a]).

test(p, [fail]) :-
        p([b,a],[a,b]).

:- end_tests(test).
