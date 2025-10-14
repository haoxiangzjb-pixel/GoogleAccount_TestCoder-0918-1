-module(simple_cache_server).
-behaviour(gen_server).

%% API
-export([start_link/0, get/1, put/2, stop/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {cache = #{}}).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link(?MODULE, [], []).

get(Key) ->
    gen_server:call(?MODULE, {get, Key}).

put(Key, Value) ->
    gen_server:cast(?MODULE, {put, Key, Value}).

stop(Pid) ->
    gen_server:stop(Pid).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
    {ok, #state{}}.

handle_call({get, Key}, _From, State = #state{cache = Cache}) ->
    Value = maps:get(Key, Cache, undefined),
    {reply, Value, State};

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast({put, Key, Value}, State = #state{cache = Cache}) ->
    NewCache = maps:put(Key, Value, Cache),
    {noreply, State#state{cache = NewCache}};

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.