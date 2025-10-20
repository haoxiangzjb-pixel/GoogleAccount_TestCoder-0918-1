% База фактов о семье (Family facts database in Prolog)

% Мужчины (Males)
male(иван).
male(андрей).
male(сергей).
male(михаил).
male(алексей).

% Женщины (Females)
female(мария).
female(ольга).
female(анна).
female(екатерина).
female(татьяна).

% Родительские отношения (Parent relationships)
parent(иван, андрей).
parent(иван, анна).
parent(мария, андрей).
parent(мария, анна).
parent(андрей, сергей).
parent(андрей, екатерина).
parent(ольга, сергей).
parent(ольга, екатерина).
parent(сергей, миша).
parent(татьяна, миша).
parent(алексей, татьяна).

% Удовлетворяет отношение "отец" (Father relationship)
father(Father, Child) :-
    parent(Father, Child),
    male(Father).

% Удовлетворяет отношение "мать" (Mother relationship)
mother(Mother, Child) :-
    parent(Mother, Child),
    female(Mother).

% Удовлетворяет отношение "ребенок" (Child relationship)
child(Child, Parent) :-
    parent(Parent, Child).

% Удовлетворяет отношение "сын" (Son relationship)
son(Child, Parent) :-
    child(Child, Parent),
    male(Child).

% Удовлетворяет отношение "дочь" (Daughter relationship)
daughter(Child, Parent) :-
    child(Child, Parent),
    female(Child).

% Удовлетворяет отношение "брат" (Brother relationship)
brother(Person, Sibling) :-
    male(Person),
    parent(Parent, Person),
    parent(Parent, Sibling),
    Person \= Sibling.

% Удовлетворяет отношение "сестра" (Sister relationship)
sister(Person, Sibling) :-
    female(Person),
    parent(Parent, Person),
    parent(Parent, Sibling),
    Person \= Sibling.

% Удовлетворяет отношение "дедушка" (Grandfather relationship)
grandfather(Grandfather, Grandchild) :-
    parent(Grandfather, Parent),
    parent(Parent, Grandchild),
    male(Grandfather).

% Удовлетворяет отношение "бабушка" (Grandmother relationship)
grandmother(Grandmother, Grandchild) :-
    parent(Grandmother, Parent),
    parent(Parent, Grandchild),
    female(Grandmother).

% Удовлетворяет отношение "дядя" (Uncle relationship)
uncle(Uncle, NieceNephew) :-
    parent(Parent, NieceNephew),
    brother(Uncle, Parent).

% Удовлетворяет отношение "тетя" (Aunt relationship)
aunt(Aunt, NieceNephew) :-
    parent(Parent, NieceNephew),
    sister(Aunt, Parent).