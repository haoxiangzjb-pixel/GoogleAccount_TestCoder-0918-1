% 定义父子关系的基本事实
parent(tom, bob).
parent(bob, liz).
parent(bob, pat).
parent(pat, ann).
parent(pat, jim).

% 定义祖先关系的规则
ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

% 定义祖孙关系的规则（祖父或祖母与孙子或孙女的关系）
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
greatgrandparent(X, Z) :- parent(X, Y), grandparent(Y, Z).

% 查询示例:
% ?- grandparent(tom, liz).  % true
% ?- ancestor(tom, ann).     % true
% ?- greatgrandparent(tom, ann).  % true