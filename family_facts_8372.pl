% База фактов о семье (Family facts database in Prolog)

% Родители (Parents)
parent(anna, maria).
parent(anna, ivan).
parent(petr, maria).
parent(petr, ivan).
parent(maria, oleg).
parent(maria, svetlana).
parent(ivan, dmitry).
parent(ivan, ekaterina).
parent(ivan, andrey).

% Муж/жена (Husband/Wife)
spouse(anna, petr).
spouse(petr, anna).
spouse(maria, oleg).
spouse(oleg, maria).

% Мужчина (Male)
male(petr).
male(ivan).
male(oleg).
male(dmitry).
male(andrey).

% Женщина (Female)
female(anna).
female(maria).
female(sveta).
female(ekaterina).

% Правила (Rules)
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
grandmother(X, Z) :- grandparent(X, Z), female(X).
grandfather(X, Z) :- grandparent(X, Z), male(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).