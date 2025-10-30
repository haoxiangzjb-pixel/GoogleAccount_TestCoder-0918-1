-module(power_calc).
-export([power/2]).

%% Recursive function to calculate Base raised to the Power
power(_, 0) ->
    1;
power(Base, 1) ->
    Base;
power(Base, Power) when Power > 1 ->
    Base * power(Base, Power - 1);
power(Base, Power) when Power < 0 ->
    1 / power(Base, -Power).