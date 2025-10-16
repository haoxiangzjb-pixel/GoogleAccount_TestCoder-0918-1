% 定义父子/父女关系的基本事实
parent(john, mary).
parent(john, tom).
parent(mary, ann).
parent(mary, sam).
parent(tom, lisa).
parent(tom, jack).
parent(ann, kate).
parent(sam, paul).

% 定义祖父关系规则：X是Y的祖父，如果X是Z的父亲且Z是Y的父亲
grandfather(X, Y) :-
    parent(X, Z),
    parent(Z, Y),
    male(X).

% 定义祖母关系规则：X是Y的祖母，如果X是Z的母亲且Z是Y的母亲
grandmother(X, Y) :-
    parent(X, Z),
    parent(Z, Y),
    female(X).

% 定义祖父或祖母关系（统称祖父母）规则
grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

% 定义男性和女性的基本事实
male(john).
male(tom).
male(sam).
male(jack).
male(paul).

female(mary).
female(ann).
female(lisa).
female(kate).