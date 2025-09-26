% База фактов о семье

% Предикаты: parent(Parent, Child), male(Person), female(Person)
% Отношения: father, mother, son, daughter, sibling, uncle, aunt

% Мужчины
male(alex).
male(bob).
male(charlie).
male(david).
male(edward).

% Женщины
female(anna).
female(beth).
female(cathy).
female(diana).
female(emma).

% Родители
parent(alex, bob).      % alex - родитель bob
parent(alex, beth).     % alex - родитель beth
parent(charlie, david). % charlie - родитель david
parent(charlie, diana). % charlie - родитель diana
parent(bob, edward).    % bob - родитель edward
parent(bob, emma).      % bob - родитель emma
parent(cathy, edward).  % cathy - родитель edward
parent(cathy, emma).    % cathy - родитель emma
