% Family facts in Prolog
% Parents and children
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Gender facts
male(tom).
male(bob).
male(jim).
female(liz).
female(ann).
female(pat).

% Derived relationships
mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
grandmother(X, Z) :- grandparent(X, Z), female(X).
grandfather(X, Z) :- grandparent(X, Z), male(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.