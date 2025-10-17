% 定义父母关系的示例事实
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖父母关系规则：X是Z的祖父母，如果X是Y的父母，且Y是Z的父母
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义祖父关系规则：X是Z的祖父，如果X是男性且X是Z的祖父母
grandfather(X, Z) :-
    grandparent(X, Z),
    male(X).

% 定义祖母关系规则：X是Z的祖母，如果X是女性且X是Z的祖父母
grandmother(X, Z) :-
    grandparent(X, Z),
    female(X).

% 定义性别关系的示例事实
male(tom).
male(bob).
male(jim).
female(liz).
female(ann).
female(pat).

% 辅助规则：判断祖孙关系（不区分性别）
grandchild(X, Z) :-
    grandparent(Z, X).

% 测试示例
% ?- grandparent(tom, ann). % 应该返回 true
% ?- grandparent(tom, jim). % 应该返回 true
% ?- grandfather(tom, ann). % 应该返回 true (如果tom是男性)
% ?- grandmother(X, jim).   % 应该返回可能的祖母