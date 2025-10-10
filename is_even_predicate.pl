% Prolog predicate to check if a number is even
% The predicate is_even(N) succeeds if N is an even number.

is_even(N) :-
    % Check if N is an integer
    integer(N),
    % Calculate the remainder when N is divided by 2
    Remainder is N mod 2,
    % Check if the remainder is zero
    Remainder =:= 0.

% Example usage:
% ?- is_even(4).
% true.
%
% ?- is_even(5).
% false.
%
% ?- is_even(-2).
% true.
%
% ?- is_even(0).
% true.
