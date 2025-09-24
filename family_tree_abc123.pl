% База фактов Prolog о семье

% Предикаты: parent(Parent, Child), male(Person), female(Person)

% Определение родителей
parent(ann, brian).
parent(ann, chris).
parent(ann, diana).
parent(david, brian).
parent(david, chris).
parent(david, diana).
parent(brian, emma).
parent(brian, fred).
parent(chris, george).
parent(diana, harry).
parent(diana, irene).

% Определение полов
male(brian).
male(chris).
male(fred).
male(george).
male(harry).
male(david).

female(ann).
female(diana).
female(emma).
female(irene).