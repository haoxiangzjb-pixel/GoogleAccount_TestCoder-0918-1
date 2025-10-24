% База фактов о семье

% Мужчины
male(иван).
male(пётр).
male(андрей).
male(олег).
male(виктор).
male(дмитрий).

% Женщины
female(мария).
female(ольга).
female(анна).
female(екатерина).
female(наталия).
female(алёна).

% Родители и дети
% Иван и Мария - родители Петра
parent(иван, пётр).
parent(мария, пётр).
parent(иван, анна).
parent(мария, анна).

% Олег и Екатерина - родители Андрея
parent(олег, андрей).
parent(екатерина, андрей).

% Андрей и Наталия - родители Дмитрия
parent(андрей, дмитрий).
parent(наталия, дмитрий).

% Виктор и Алёна - родители Ольги
parent(виктор, ольга).
parent(алёна, ольга).

% Браки
married(иван, мария).
married(олег, екатерина).
married(андрей, наталия).
married(виктор, алёна).

% Правила
father(Father, Child) :- male(Father), parent(Father, Child).
mother(Mother, Child) :- female(Mother), parent(Mother, Child).
grandfather(Grandpa, Grandchild) :- male(Grandpa), parent(Grandpa, X), parent(X, Grandchild).
grandmother(Grandma, Grandchild) :- female(Grandma), parent(Grandma, X), parent(X, Grandchild).
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \\= Y.
brother(Bro, Sib) :- male(Bro), sibling(Bro, Sib).
sister(Sis, Sib) :- female(Sis), sibling(Sis, Sib).