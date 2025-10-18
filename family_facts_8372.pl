% База фактов о семье (Family facts database in Prolog)

% Мужчины (Males)
male(иван).
male(пётр).
male(семён).
male(андрей).
male(фёдор).

% Женщины (Females)
female(мария).
female(анна).
female(екатерина).
female(ольга).
female(татьяна).

% Родители (Parents)
% parent(X, Y) означает, что X - родитель Y (X is parent of Y)
parent(иван, пётр).
parent(иван, екатерина).
parent(мария, пётр).
parent(мария, екатерина).
parent(пётр, анна).
parent(пётр, фёдор).
parent(ольга, анна).
parent(ольга, фёдор).
parent(семён, андрей).
parent(татьяна, андрей).

% Супруги (Spouses)
spouse(иван, мария).
spouse(пётр, ольга).
spouse(семён, татьяна).
% Симметричные отношения супружества (Making spouse relationship symmetric)
spouse(X, Y) :- spouse(Y, X).

% Правила (Rules)
father(X, Y) :- male(X), parent(X, Y).
mother(X, Y) :- female(X), parent(X, Y).
son(X, Y) :- male(X), parent(Y, X).
daughter(X, Y) :- female(X), parent(Y, X).
grandfather(X, Y) :- male(X), parent(X, Z), parent(Z, Y).
grandmother(X, Y) :- female(X), parent(X, Z), parent(Z, Y).
grandson(X, Y) :- male(X), parent(Z, X), parent(Y, Z).
granddaughter(X, Y) :- female(X), parent(Z, X), parent(Y, Z).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- male(X), sibling(X, Y).
sister(X, Y) :- female(X), sibling(X, Y).