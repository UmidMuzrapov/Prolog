tenth(twenty, 20).
tenth(thirty, 30).
tenth(forty, 40).
tenth(fifty, 50).
tenth(sixty, 60).
tenth(seventy, 70).
tenth(eighty, 80).
tenth(ninety, 90).

word_digit(one, 1).
word_digit(two, 2).
word_digit(three, 3).
word_digit(four, 4).
word_digit(five, 5).
word_digit(six, 6).
word_digit(seven, 7).
word_digit(eight, 8).
word_digit(nine, 9).
word_digit(ten, 10).
word_digit(eleven, 11).
word_digit(twelve, 12).
word_digit(thirteen, 13).
word_digit(fourteen, 14).
word_digit(fifteen, 15).
word_digit(sixteen, 16).
word_digit(seventeen, 17).
word_digit(eighteen, 18).
word_digit(nineteen, 19).

grid(Input1, Input2) :- valid_input(Input1), valid_input(Input2), get_number(Input1, NumberOne),
 get_number(Input2, NumberTwo), print_grid(NumberOne, NumberTwo), !.
grid(Input1, _) :- english(Input1), write('Use English, please!'), !.
grid(Input1, Input2) :- valid_input(Input1), english(Input2), write('Use English, please!'), !.
grid(_, _) :- write('Huh?'), !.
grid(_,_).

valid_input(X-Y) :- tenth(X, _), word_digit(Y, _), !.
valid_input(X) :- word_digit(X, _), !.

english(X-_) :- tenth(_,X).
english(X-Y) :- tenth(X, _), word_digit(_, Y).
english(X) :- word_digit(_, X).

get_number(X-Y, Number) :- tenth(X, Tenth), word_digit(Y, Digit), Number is Tenth + Digit. 
get_number(X, Number) :- word_digit(X, Number).

print_grid(Row, Col) :- Row>0, print_row1(Col), print_row2(Col), Next is Row-1, print_grid(Next, Col), !.
print_grid(0, Col) :- print_row1(Col).

print_row1(X) :- X>0, write('+--'), Next is X-1, print_row1(Next), !.
print_row1(0) :- write(+), nl.

print_row2(X) :- X>0, write('|  '), Next is X-1, print_row2(Next), !.
print_row2(0) :- write('|'), nl.