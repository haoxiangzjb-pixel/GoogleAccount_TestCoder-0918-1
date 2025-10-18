% Prolog predicate to check if a number is even
% even(X) succeeds if X is an even number

even(X) :-
    integer(X),           % Ensure X is an integer
    X mod 2 =:= 0.        % Check if X modulo 2 equals 0

% Alternative implementation using recursion
% even(0).
% even(X) :- X > 0, X1 is X - 2, even(X1).
% even(X) :- X < 0, X1 is X + 2, even(X1).