% 定义父-子关系的示例事实
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖父母关系规则
% X是Z的祖父/祖母，如果X是Y的父母，且Y是Z的父母
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义祖先关系（更通用的规则）
% X是Z的祖先，如果X是Z的直接父母
ancestor(X, Z) :-
    parent(X, Z).

% X是Z的祖先，如果X是Y的祖先，且Y是Z的父母
ancestor(X, Z) :-
    ancestor(X, Y),
    parent(Y, Z).