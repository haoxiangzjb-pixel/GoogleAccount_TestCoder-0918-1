% 定义父子关系的事实
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

% 定义祖父/祖母关系规则（祖孙关系）
grandparent(X, Z) :-
    parent(X, Y),
    parent(Y, Z).

% 定义祖先关系（更一般的规则）
ancestor(X, Z) :-
    parent(X, Z).

ancestor(X, Z) :-
    parent(X, Y),
    ancestor(Y, Z).

% 测试查询示例：
% ?- grandparent(tom, ann).  % 应该返回 true
% ?- grandparent(tom, jim).  % 应该返回 true
% ?- grandparent(bob, jim).  % 应该返回 true
% ?- grandparent(liz, jim).  % 应该返回 false