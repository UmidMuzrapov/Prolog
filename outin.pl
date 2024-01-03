outin(L, R) :- helper(L, FinalList), member(R, FinalList).


helper([], []).
helper([X], [X]).
helper([X|T], FinalList) :- append(Rest, [Last], T), helper(Rest, R), append([X, Last], R, FinalList).
