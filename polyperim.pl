polyperim(Vertices, _) :- length(Vertices, Length), Length<4, write('At least a four-point path is required.'), fail.

polyperim(Vertices, _)  :- length(Vertices, Length), Length>3, last(Vertices, Last), append([Head], _, Vertices), Head\=Last, write('Path is not closed.'), fail.


polyperim(Vertices, Perim) :- ground(Vertices), length(Vertices, Length), Length>3, last(Vertices, Last),
	append([Last], _, Vertices), polyperimHelper(Vertices, Perim), !.

polyperimHelper([pt(X1, Y1), pt(X2, Y2)|T], Perim) :-
 Xdifference is X2 - X1, YDifference is Y2 - Y1, DistanceSq is (Xdifference**2 + YDifference**2),
 Distance is DistanceSq**0.5, polyperimHelper([pt(X2, Y2)|T], Rest), Perim is Distance + Rest, !.

polyperimHelper(_, 0).