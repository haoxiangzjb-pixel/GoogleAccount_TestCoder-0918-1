% Определения родителей
parent(tom, bob).
parent(pam, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Определения мужчин
male(tom).
male(bob).
male(jim).

% Определения женщин
female(pam).
female(liz).
female(ann).
female(pat).

% Правило для определения отца
father(X, Y) :-
    parent(X, Y),
    male(X).

% Правило для определения матери
mother(X, Y) :-
    parent(X, Y),
    female(X).

% Правило для определения бабушки
grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% Правило для определения дедушки
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

% Правило для определения бабушки или дедушки
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% Правило для определения брата
sibling(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    X \= Y.

brother(X, Y) :-
    sibling(X, Y),
    male(X).

% Правило для определения сестры
sister(X, Y) :-
    sibling(X, Y),
    female(X).

% Правило для определения потомка
descendant(X, Y) :-
    parent(Y, X).
descendant(X, Y) :-
    parent(Z, X),
    descendant(Z, Y).