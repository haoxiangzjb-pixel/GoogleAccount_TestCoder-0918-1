% Family Facts Database

% Gender facts
male(ivan).
male(petr).
male(alexey).
female(maria).
female(olga).
female(ekaterina).

% Parent-child relationships
parent(ivan, petr).
parent(ivan, olga).
parent(maria, petr).
parent(maria, olga).
parent(petr, alexey).
parent(ekaterina, alexey).

% Family relations derived from parent facts
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
child(X, Y) :- parent(Y, X).
son(X, Y) :- child(X, Y), male(X).
daughter(X, Y) :- child(X, Y), female(X).

% Grandparent relationships
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
grandfather(X, Z) :- grandparent(X, Z), male(X).
grandmother(X, Z) :- grandparent(X, Z), female(X).
grandchild(X, Z) :- grandparent(Z, X).

% Sibling relationships
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).