% База фактов о семье на языке Prolog

% Предикаты для родителей
parent(anna, maria).
parent(anna, ivan).
parent(petr, maria).
parent(petr, ivan).
parent(maria, oleg).
parent(maria, svetlana).
parent(ivan, andrey).
parent(ivan, ekaterina).
parent(oleg, dima).
parent(ekaterina, nina).

% Предикаты для пола
male(petr).
male(ivan).
male(oleg).
male(andrey).
male(dima).

female(anna).
female(maria).
female(sveta).
female(ekaterina).
female(nina).

% Предикат брака
married(anna, petr).
married(petr, anna).
married(maria, oleg).
married(oleg, maria).

% Правила для определения отношений
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
grandfather(X, Z) :- parent(X, Y), parent(Y, Z), male(X).
grandmother(X, Z) :- parent(X, Y), parent(Y, Z), female(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).