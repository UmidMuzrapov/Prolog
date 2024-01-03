repl(Elem, Num, List) :- Num>0, Next is Num - 1, repl(Elem, Next, Rest), append([Elem], Rest, List).
repl(_, 0, []). 

