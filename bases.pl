bases(Start, End) :- format('~tDecimal~t~10|~tHex~t~20|~tBinary~t~35|\n'), get_numbers(Start, End).

get_numbers(Start, End) :-
    Start=<End,
    format('~t~d~6|~t~16R~16|~t~2R~30|\n', [Start, Start, Start]),
    Next is Start+1, get_numbers(Next, End), !.

get_numbers(_, _).
