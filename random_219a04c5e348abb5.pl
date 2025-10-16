% Prolog predicate to check if a number is even
is_even(X) :-
    X mod 2 =:= 0.

% Alternative implementation using recursion for non-negative integers
is_even_recursive(0).
is_even_recursive(X) :-
    X > 0,
    X mod 2 =:= 0.

% Example usage:
% ?- is_even(4).  % returns true
% ?- is_even(5).  % returns false