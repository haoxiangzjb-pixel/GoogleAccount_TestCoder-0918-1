-module(my_app).
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% Application callbacks
start(_StartType, _StartArgs) ->
    random_sup_12345:start_link().

stop(_State) ->
    ok.