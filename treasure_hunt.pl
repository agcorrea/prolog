move_from(street, hall).
move_from(hall, dungeon).
move_from(hall, kitchen).
move_from(hall, armoury).
move_from(armoury, bedroom).
move_from(bedroom, secret_chamber).

plan(find(treasure)) :- 
    find(treasure, Return),
    !,
    write(Return).

find(treasure, Return) :-
    local(treasure, X),
    deep_search([], street, X, R1),
    reverse(R1, Return).

% Deep search
deep_search(Path, End, End, [get(treasure)|Path]) :- !.
deep_search(Path, Start, End, Return):-
    move_from(Start, Next),
    \+ member(move_from(Start, Next), Path),
    deep_search([move_from(Start, Next)|Path], Next, End, Return).
