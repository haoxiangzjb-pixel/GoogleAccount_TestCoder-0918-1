-module(ZkgletOYNE).
-behaviour(gen_server).

%% API
-export([start_link/0, increment/0, decrement/0, get_count/0, stop/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {count = 0}).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

increment() ->
    gen_server:call(?SERVER, increment).

decrement() ->
    gen_server:call(?SERVER, decrement).

get_count() ->
    gen_server:call(?SERVER, get_count).

stop() ->
    gen_server:stop(?SERVER).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
    {ok, #state{}}.

handle_call(increment, _From, State = #state{count = Count}) ->
    NewCount = Count + 1,
    {reply, {ok, NewCount}, State#state{count = NewCount}};
handle_call(decrement, _From, State = #state{count = Count}) ->
    NewCount = Count - 1,
    {reply, {ok, NewCount}, State#state{count = NewCount}};
handle_call(get_count, _From, State = #state{count = Count}) ->
    {reply, {ok, Count}, State};
handle_call(_Request, _From, State) ->
    {reply, {error, unknown_call}, State}.

handle_cast(_Request, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================