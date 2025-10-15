% 定义基本的家庭关系事实
parent(tom, bob).
parent(tom, liz).
parent(bob, pat).
parent(bob, jim).
parent(pat, jim).

% 定义祖孙关系规则
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% 可选：定义其他相关关系
ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).