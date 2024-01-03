item(toaster, 'Deluxe Toast-a-matic').
item(antfarm, 'Ant Farm').
item(dip, 'French Onion Dip').
item(twinkies, 'Twinkies').
item(lips, 'Chicken Lips').
item(hamster, 'Hamster').
item(rocket, 'Model rocket w/ payload bay').
item(scissors, 'StaySharp Scissors').
item(rshoes, 'Running Shoes').
item(tiger, 'Sumatran tiger').
item(catnip, '50-pound bag of catnip').

price(toaster, 14.00).
price(antfarm, 7.95).
price(dip, 1.29).
price(twinkies, 0.75).
price(lips, 0.05).
price(hamster, 4.00).
price(rocket, 12.49).
price(scissors, 2.99).
price(rshoes, 59.99).
price(tiger, 749.95).
price(catnip, 19.95).

discount(antfarm, 20).
discount(lips, 40).
discount(rshoes, 10).

dontmix(scissors,rshoes).
dontmix(hamster,rocket).
dontmix(tiger,catnip).

convert_list(H:T, List) :- convert_list(T, Rest), append([H], Rest, List), !.
convert_list(Last, [Last]).

buy(X) :- convert_list(X, List), member(FirstP, List),
 member(SecondP, List), dontmix(FirstP, SecondP), sort([FirstP, SecondP], [FirstPS, SecondPS]), 
 item(FirstPS, Word1), item(SecondPS, Word2),
 format('State law prohibits same-day purchase of "~w" and "~w".', [Word1, Word2]), !.


buy(Input) :- buyHelper(Input), get_sum(Input, Sum), print_final(Sum), !.

buyHelper(Item:Rest) :-get_price(Item, FinalPrice), print_item(Item, FinalPrice), buyHelper(Rest), !.
buyHelper(empty).

get_sum(H:T, Sum) :- get_price(H, FinalPrice),  get_sum(T, RestSum), Sum is RestSum + FinalPrice, !.
get_sum(empty, 0).

get_price(Item, FinalPrice) :- discount(Item, Discount), price(Item, Price), get_discounted_price(Price, Discount, FinalPrice), !.
get_price(Item, FinalPrice) :- price(Item, FinalPrice).

get_discounted_price(Price, Discount, FinalPrice) :- FinalPrice is (1-Discount/100)*Price.

print_item(Item, Price) :- item(Item, Word), write(Word), sformat(PriceF, "~2f", Price), get_difference(Word, PriceF, Difference), write_n(Difference, '.'), write(PriceF), nl, !.

get_difference(Word, Price, Difference) :- atom_length(Word, L1), atom_length(Price, L2), Difference is 40 - L1 -L2, !.
write_n(L, Char) :- L>0, write(Char), Next is L-1, NewChar =Char, write_n(Next, NewChar), !.
write_n(0, _).

print_final(Sum) :- write_n(40, '-'), nl, write('Total'), sformat(PriceF, "~2f", Sum), get_difference('Total', PriceF, Difference),
 write_n(Difference-1, ' '), write('$'), write(PriceF), !.
