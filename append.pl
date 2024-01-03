head(List, Elem) :- append([Elem], _ , List).

% gets the last element of the list.
lst(List, Elem) :- append(_, [Elem], List).

% gets all elements except for the last.
init(List, Init) :- append(Init, [_], List).

% gets all elements except for the first.
tail(List, Tail) :- append([_], Tail, List).

% checks if the list is at least of length two.
min2(List) :- append([_, _], _, List).

mem(Elem, List) :- append(FirstPart, _, List), append(_, [Elem], FirstPart).

contains(List, Sublist) :- append(FirstPart, _, List), append(_, Sublist, FirstPart).

firstlast(List, FL) :- length(First, 1), length(Last, 1), append(First, _, List), append(_, Last, List), append(First, Last, FL).

halves(List, First, Last) :-  append(First, Last, List), length(First, Half), length(Last, Half).


