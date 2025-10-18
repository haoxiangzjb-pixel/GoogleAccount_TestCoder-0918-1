% База фактов о семье (Family facts database in Prolog)

% Предикаты для родителей
parent(anna, maria).
parent(anna, ivan).
parent(boris, maria).
parent(boris, ivan).
parent(maria, dmitry).
parent(maria, ekaterina).
parent(ivan, alexei).
parent(ivan, olga).
parent(elena, dmitry).
parent(elena, ekaterina).
parent(dmitry, svetlana).
parent(dmitry, maksim).
parent(olga, pavel).
parent(olga, natalia).

% Предикаты для полов
male(boris).
male(ivan).
male(dmitry).
male(alexei).
male(maksim).
male(pavel).

female(anna).
female(maria).
female(ekaterina).
female(olga).
female(elena).
female(svetlana).
female(natalia).

% Предикат для супругов
spouse(anna, boris).
spouse(boris, anna).
spouse(maria, dmitry).
spouse(dmitry, maria).
spouse(ivan, olga).
spouse(olga, ivan).
spouse(elena, dmitry).
spouse(dmitry, elena).

% Правила
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
grandfather(X, Z) :- grandparent(X, Z), male(X).
grandmother(X, Z) :- grandparent(X, Z), female(X).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.
brother(X, Y) :- sibling(X, Y), male(X).
sister(X, Y) :- sibling(X, Y), female(X).