-module(RWhj4UpUIE).
-behaviour(gen_server).

%% API
-export([start_link/0, get/1, put/2, delete/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {store = #{}}).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

get(Key) ->
    gen_server:call(?SERVER, {get, Key}).

put(Key, Value) ->
    gen_server:cast(?SERVER, {put, Key, Value}).

delete(Key) ->
    gen_server:cast(?SERVER, {delete, Key}).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
    {ok, #state{}}.

handle_call({get, Key}, _From, State = #state{store = Store}) ->
    Value = maps:get(Key, Store, undefined),
    {reply, Value, State}.

handle_cast({put, Key, Value}, State = #state{store = Store}) ->
    NewStore = Store#{Key => Value},
    {noreply, State#state{store = NewStore}};
handle_cast({delete, Key}, State = #state{store = Store}) ->
    NewStore = maps:remove(Key, Store),
    {noreply, State#state{store = NewStore}}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================