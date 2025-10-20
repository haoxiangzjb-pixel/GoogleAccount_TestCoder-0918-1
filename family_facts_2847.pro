% База фактов о семье (Family facts database in Prolog)

% Мужчины (Males)
male(иван).
male(пётр).
male(сергей).
male(андрей).
male(виталий).
male(олег).

% Женщины (Females)
female(мария).
female(ольга).
female(анна).
female(екатерина).
female(татьяна).
female(юлия).

% Родители (Parents)
% Иван - отец Петра и Сергея (Ivan is father of Petr and Sergey)
parent(иван, пётр).
parent(иван, сергей).

% Мария - мать Петра и Сергея (Maria is mother of Petr and Sergey)
parent(мария, пётр).
parent(мария, сергей).

% Сергей - отец Андрея и Виталия (Sergey is father of Andrey and Vitaly)
parent(сергей, андрей).
parent(сергей, виталий).

% Ольга - мать Андрея и Виталия (Olga is mother of Andrey and Vitaly)
parent(ольга, андрей).
parent(ольга, виталий).

% Андрей - отец Олега (Andrey is father of Oleg)
parent(андрей, олег).

% Екатерина - мать Олега (Ekaterina is mother of Oleg)
parent(екатерина, олег).

% Татьяна - мать Юлии (Tatyana is mother of Yulia)
parent(татьяна, юлия).

% Анна - мать Юлии (Anna is mother of Yulia)
parent(анна, юлия).

% Браки (Marriages)
married(иван, мария).
married(сергей, ольга).
married(андрей, екатерина).
married(анна, татьяна).

% Правила (Rules)
% Ребенок (Child)
child(X, Y) :- parent(Y, X).

% Отцы (Fathers)
father(X, Y) :- parent(X, Y), male(X).

% Матери (Mothers)
mother(X, Y) :- parent(X, Y), female(X).

% Бабушки (Grandmothers)
grandmother(X, Z) :- parent(X, Y), parent(Y, Z), female(X).

% Дедушки (Grandfathers)
grandfather(X, Z) :- parent(X, Y), parent(Y, Z), male(X).

% Братья (Brothers)
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \= Y.

% Сестры (Sisters)
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y.

% Дяди (Uncles)
uncle(X, Y) :- brother(X, Z), parent(Z, Y).
uncle(X, Y) :- married(X, W), sister(W, Z), parent(Z, Y).

% Тети (Aunts)
aunt(X, Y) :- sister(X, Z), parent(Z, Y).
aunt(X, Y) :- married(X, W), brother(W, Z), parent(Z, Y).

% Супруги (Spouses)
spouse(X, Y) :- married(X, Y).
spouse(X, Y) :- married(Y, X).