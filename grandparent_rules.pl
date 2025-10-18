% 定义父母关系
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖父关系规则：X是Z的祖父，如果X是Y的父亲且Y是Z的父亲
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义祖母关系规则（如果需要区分的话）
% 这里我们使用相同的规则，但可以添加性别信息来区分
grandfather(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    male(X).

grandmother(X, Z) :-
    parent(X, Y),
    parent(Y, Z),
    female(X).

% 可选的性别定义
male(tom).
male(bob).
male(jim).
female(liz).
female(ann).
female(pat).