-module(random_sup_12345).
-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, random_sup_12345).

%% API functions
start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% Supervisor callbacks
init([]) ->
    RestartStrategy = one_for_one,
    MaxRestarts = 1000,
    MaxTime = 3600,

    ChildSpecs = [
        {my_worker, {my_worker, start_link, []},
         permanent, 5000, worker, [my_worker]},
        {my_server, {my_server, start_link, []},
         permanent, 5000, worker, [my_server]}
    ],

    {ok, {{RestartStrategy, MaxRestarts, MaxTime}, ChildSpecs}}.