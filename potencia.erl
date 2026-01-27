-module(potencia).
-export([potencia/2]).

%% Función recursiva para calcular la potencia de un número
%% potencia(Base, Exponente) -> Resultado

potencia(_, 0) ->
    1;

potencia(Base, Exponente) when Exponente > 0 ->
    Base * potencia(Base, Exponente - 1);

potencia(Base, Exponente) when Exponente < 0 ->
    1 / potencia(Base, -Exponente).
