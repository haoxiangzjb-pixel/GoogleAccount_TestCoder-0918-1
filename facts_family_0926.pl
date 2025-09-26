% База фактов Prolog о семье

% Предикаты для родителей и детей
% parent(X, Y) означает "X - родитель Y"
parent(ann, james).
parent(ann, ross).
parent(fred, james).
parent(fred, ross).
parent(james, liz).
parent(james, paul).
parent(helen, liz).
parent(helen, paul).
parent(ross, ted).
parent(ross, jenny).
parent(mary, ted).
parent(mary, jenny).

% Предикаты для братьев и сестер
% sibling(X, Y) означает "X - брат или сестра Y"
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Предикаты для дедушек и бабушек
% grandparent(X, Y) означает "X - дедушка или бабушка Y"
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% Предикаты для пола
% male(X) означает "X - мужчина"
% female(X) означает "X - женщина"
male(fred).
male(james).
male(paul).
male(ross).
male(ted).

female(ann).
female(helen).
female(liz).
female(mary).
female(jenny).