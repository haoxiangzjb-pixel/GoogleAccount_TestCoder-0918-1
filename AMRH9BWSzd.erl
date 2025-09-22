-module(AMRH9BWSzd).
-behaviour(gen_server).

%% API
-export([start_link/0, get_state/0, set_state/1, increment_counter/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

-record(state, {
    data = undefined :: term(),
    counter = 0 :: integer()
}).

%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

get_state() ->
    gen_server:call(?SERVER, get_state).

set_state(NewData) ->
    gen_server:cast(?SERVER, {set_state, NewData}).

increment_counter() ->
    gen_server:cast(?SERVER, increment_counter).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([]) ->
    {ok, #state{}}.

handle_call(get_state, _From, State) ->
    {reply, State, State}.

handle_cast({set_state, NewData}, State) ->
    NewState = State#state{data = NewData},
    {noreply, NewState};
handle_cast(increment_counter, State) ->
    NewCounter = State#state.counter + 1,
    NewState = State#state{counter = NewCounter},
    {noreply, NewState}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Internal functions
%%%===================================================================