-module(double_number).
-export([double/1]).

%% Doubles the given number
double(N) when is_number(N) ->
    N * 2.
