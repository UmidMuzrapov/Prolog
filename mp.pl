mp(A, B, C) :- ground(A), ground(C), B is (A+C)/2, !.
mp(A, B, C) :- ground(B), ground(C), A is 2*B + -C, !.
mp(A, B, C) :- ground(A), ground(B), C is 2*B + -A, !.