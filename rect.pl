square(rect(X,X)).

landscape(rect(W,H)) :- W>H.

portrait(rect(W,H)) :- H>W.

classify(Rect, Which) :- square(Rect), Which=square,!.
classify(Rect, Which) :- landscape(Rect),Which=landscape, !.
classify(Rect, Which) :- portrait(Rect), Which=portrait, !.
classify(_, Which) :-Which=wat, !.

rotate(rect(X,Y), rect(Y, X)).

smaller(rect(H1, W1), rect(H2, W2)) :- H1<H2, W1<W2.

add(rect(H1, W1), rect(H2, W2), rect(H3, W3)) :- H3 is H1+H2, W3 is W1+W2.