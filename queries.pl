%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% NOTE: The following queries should use only the facts in a5/things.pl
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% What foods are green?
q0(Food) :- thing(Food,green,yes).

% What are all the things?
q1(Thing) :- thing(Thing, _, _).

% What are the colors of non-foods?
q2(Color) :- thing(_, Color, no).
% What are colors that are a color of both a food and a non-food?
q3(Color) :- thing( _, Color, yes), thing(_,Color,no).

% What foods are not the same color as broccoli?
q4(Food) :- thing(broccoli, Color, _), thing(Food, Color2, yes), Color\=Color2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% NOTE: The following queries should use only the facts in a5/fcl.pl
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Who likes carrots?
q5(Who) :- likes(Who, carrot).

% Who likes baseball and a food?
q6(Who) :-  likes(Who, baseball), likes(Who, Food), food(Food).

% Who likes baseball and a red food?
q7(Who) :- likes(Who, baseball), likes(Who, Food), food(Food), color(Food, red).

% Who likes somebody who likes baseball?
q8(Who) :- likes(Who, Who2), likes(Who2, baseball), Who\=Who2.

% What foods cost more than a Big Mac?
q9(Food) :- food(Food), cost(Food, Cost), cost('Big Mac', Cost2), Cost>Cost2.

% What are things that somebody likes and that cost more than an apple?
q10(What) :- likes(Who, What), cost(apple, Cost), cost(What, CostW), CostW>Cost.

% What foods have a name that is the same length as their color?
q11(Food) :- color(Food, Color), food(Food), atom_length(Food, L), atom_length(Color, L).
% What are things that are liked by more than one person?
q12(Thing) :- likes(Person, Thing), likes(Person2, Thing), Person\=Person2.

% What are pairs of things that together cost less than an orange and are liked by the same person?
% Note: Put the two things in alphabetical order, like cheap(joe, lettuce, tomato).  The operator '@<'
% can be used to compare atoms, like ?- a @< b, write(ok).
%
q13(cheap(P,T1,T2)) :-  likes(P, T1), likes(P, T2), T1\=T2,  cost(orange, OrangeCost), cost(T1, TC1), cost(T2, TC2),
 TC1+TC2<OrangeCost, T1 @< T2.

% What are foods whose cost is the same?  Put the two foods in alphabetical order, as you did with things in q13.
%
q14(F1==F2:Cost) :-  food(F1), food(F2), cost(F1, Cost), cost(F2, Cost),F1\=F2, F1 @< F2.

:-[a5/fcl]. % consults a5/fcl.pl. (The .pl is assumed in this case.)
:-[a5/things].