rotate(List, R) :- append(First, Rest, List), Rest\==[], append(Rest, First, R).