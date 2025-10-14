% is_even/1: Succeeds if the number N is even.
% This predicate checks if N is an integer and if the remainder of N divided by 2 is zero.
is_even(N) :-
    integer(N),      % Ensure N is an integer
    0 is N mod 2.    % Calculate N mod 2 and check if it unifies with 0
