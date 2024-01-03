:- op(700, xfx, iz).

',' iz comma :- !.
'$' iz dollar :- !.
'.' iz dot :- !.
' ' iz space :- !.

A iz A :- atom(A), !.

R iz E1+E2 :- R1 iz E1, R2 iz E2, atom_concat(R1, R2, R), !.

R iz E*N :- R1 iz E, R2 is N, length(List, R2), maplist(=(R1), List), atomic_list_concat(List, R), !.

R iz E / N :- R1 iz E, R2 is N, atom_chars(R1, List), helper2(R2, Result, List), atom_chars(R, Result), !.

R iz -E :- R1 iz E, atom_chars(R1, List), reverse(List, Reverse), atom_chars(R, Reverse), !.

R iz len(E) :- R1 iz E, atom_length(R1, Length), atom_number(R, Length), !.

R iz wrap(E, Wrap) :- R1 iz E, R2 iz Wrap, R iz R2+(R1+R2), !.

R iz wrap(E, First, Last) :- R iz First+(E+Last), !.

helper2(N, _, List) :- length(List, Length), AN is abs(N), AN>Length, fail, !.
helper2(0, [], _).
helper2(N, R, [H|T]) :- N>0, Next is N - 1, append([H], Rest, R), helper2(Next, Rest, T).
helper2(N, R, List) :- N<0, Next is N + 1, last(List, Last), append(Init, [Last], List), append(Rest, [Last], R), helper2(Next, Rest, Init).