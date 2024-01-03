fsort([_], []).
fsort(List, []) :- how_many_to_ignore(List, N), length(List, N), !.
fsort(L, Flips) :- flip(L, FlipList, Flip), fsort(FlipList, RestFlips), append([Flip], RestFlips, Flips), !.

how_many_to_ignore(L, N) :- append(First, [Last], L), max_list(L, Last), how_many_to_ignore(First, Next), N is Next + 1, !.
how_many_to_ignore(_, 0).


flip(List, FlipList, Length) :- how_many_to_ignore(List, N), append(F, S, List), max_list(F, NewMax), append([NewMax],_, F), length(S, N), max_list(F, Max), nth0(MaxIndex, List,Max), length(F, LengthList), Length is LengthList - MaxIndex, append(First, Second, F), length(First, Length), reverse(First, Reversed), append(Reversed, Second, F2), append(F2, S, FlipList), !.
flip(List, FlipList, Length) :- how_many_to_ignore(List, N), append(F, S, List), length(S, N), max_list(F, Max), nth0(MaxIndex, List,Max), Length is MaxIndex+1, append(First, Second, F), length(First, Length),reverse(First, Reversed), append(Reversed, Second, F2), append(F2, S, FlipList), !.