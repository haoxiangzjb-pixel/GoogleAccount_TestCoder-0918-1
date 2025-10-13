% База фактов о семье

% Предикаты: parent(Parent, Child), male(Person), female(Person)

% Определение полов
male(john).
male(mike).
male(dave).
female(eve).
female(ann).
female(tina).

% Отношения родитель-ребенок
parent(john, mike).
parent(john, ann).
parent(eve, mike).
parent(eve, ann).
parent(mike, dave).
parent(mike, tina).