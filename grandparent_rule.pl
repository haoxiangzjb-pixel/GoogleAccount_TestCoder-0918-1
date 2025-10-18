% Define parent-child relationships
% parent(X, Y) means X is a parent of Y
parent(tom, bob).
parent(bob, liz).
parent(pam, bob).
parent(pam, ann).
parent(bob, pat).
parent(pat, jim).

% Define grandparent relationship
% grandparent(X, Z) means X is a grandparent of Z if X is a parent of Y and Y is a parent of Z
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

% Define grandchild relationship (inverse of grandparent)
% grandchild(Z, X) means Z is a grandchild of X
grandchild(Z, X) :- grandparent(X, Z).

% Query examples:
% ?- grandparent(tom, liz).  % Should return true
% ?- grandparent(pam, liz).  % Should return true
% ?- grandparent(tom, ann).  % Should return true
% ?- grandchild(liz, tom).   % Should return true