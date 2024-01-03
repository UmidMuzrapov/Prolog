getRest([H|T], H, T). 
getRest([H|T], Cable, Rest) :- H\==Cable, append([H], R, Rest), getRest(T, Cable, R).

try(Cable, RecentLeft, GoalLength, RightMost, SolutionCable) :- Cable=[Gender1, CableLength, Gender2], Difference is GoalLength - CableLength, Difference =<0, RightMost\==Gender2, RecentLeft\==Gender1, SolutionCable=Cable.
try(Cable, RecentLeft, GoalLength, RightMost, SolutionCable) :- Cable=[Gender1, CableLength, Gender2], Difference is GoalLength - CableLength, Difference =<0, RightMost\==Gender1, RecentLeft\==Gender2, reverse(Cable, SolutionCable).

try(Cable, RecentLeft, GoalLength, _, SolutionCable) :-  Cable=[Gender1, CableLength, _], Difference is GoalLength - CableLength, Difference >=0, RecentLeft\==Gender1, SolutionCable=Cable.
try(Cable, RecentLeft, GoalLength, _, SolutionCable) :- Cable=[_, CableLength, Gender2], Difference is GoalLength - CableLength, Difference >=0, RecentLeft\==Gender2, reverse(Cable, SolutionCable).


get_new_goal([_, CableLength, Gender2], GoalLength, Gender2, NewGoalLength) :- NewGoalLength is GoalLength - CableLength.

connect(CableList, LeftMostG, GoalLength, RightMostG) :- connectHelper(CableList, GoalLength, RightMostG, LeftMostG, SolutionCables), write_solution(SolutionCables), !.

connect(_, _, _, _) :- write('Cannot connect').

connectHelper(_, GoalLength, RightMostG, RecentLeft, []) :-
	GoalLength =< 0, RecentLeft\==RightMostG.

connectHelper(CableList, GoalLength, RightMostG, RecentLeft, SolutionCables) :-
	member(Cable, CableList), try(Cable, RecentLeft, GoalLength, RightMostG, SolutionCable),
	append([SolutionCable], SolutionRest, SolutionCables), getRest(CableList, Cable, Rest),
	get_new_goal(SolutionCable, GoalLength, NewLeftMostG, NewGoalLength), 
	connectHelper(Rest, NewGoalLength, RightMostG, NewLeftMostG, SolutionRest), !.

write_solution([[G1, L, G2]|T]) :- write_gender(G1), write_atom_n_times(-, L), write_gender(G2), write_solution(T).
write_solution([]). 

write_gender(f) :- write('F').
write_gender(m) :- write('M').

write_atom_n_times(Atom, N) :-
	N > 0,
      N1 is N - 1,
      write(Atom),
      write_atom_n_times(Atom, N1).

write_atom_n_times(_, 0).
