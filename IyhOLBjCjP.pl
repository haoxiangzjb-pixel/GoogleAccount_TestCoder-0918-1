% База фактов о семье

% Родительские отношения
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% Мужчины
male(tom).
male(bob).
male(jim).

% Женщины
female(liz).
female(ann).
female(pat).

% Возраст (для определения старшинства)
age(tom, 70).
age(bob, 45).
age(liz, 40).
age(ann, 20).
age(pat, 25).
age(jim, 5).