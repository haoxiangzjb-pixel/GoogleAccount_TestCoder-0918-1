% База фактов о семье

% Предикат 'parent(Parent, Child)' означает, что Parent - родитель Child
parent(anna, boris).
parent(anna, clara).
parent(dmitriy, boris).
parent(dmitriy, clara).
parent(boris, evgeniy).
parent(boris, fedor).
parent(maria, evgeniy).
parent(maria, fedor).
parent(clara, georgiy).
parent(clara, hanna).
parent(ivan, georgiy).
parent(ivan, hanna).

% Предикат 'male(Person)' указывает, что Person - мужчина
male(boris).
male(dmitriy).
male(evgeniy).
male(fedor).
male(ivan).
male(georgiy).

% Предикат 'female(Person)' указывает, что Person - женщина
female(anna).
female(clara).
female(maria).
female(hanna).

% Правило 'father(Father, Child)' - отец
father(Father, Child) :-
    parent(Father, Child),
    male(Father).

% Правило 'mother(Mother, Child)' - мать
mother(Mother, Child) :-
    parent(Mother, Child),
    female(Mother).

% Правило 'grandparent(Grandparent, Grandchild)' - бабушка/дедушка
grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

% Правило 'sibling(Person1, Person2)' - брат или сестра
sibling(Person1, Person2) :-
    parent(Parent, Person1),
    parent(Parent, Person2),
    Person1 \= Person2.

% Правило 'uncle(Uncle, Person)' - дядя
uncle(Uncle, Person) :-
    parent(Parent, Person),
    sibling(Uncle, Parent),
    male(Uncle).

% Правило 'ancestor(Ancestor, Descendant)' - предок
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Descendant).
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Parent),
    ancestor(Parent, Descendant).