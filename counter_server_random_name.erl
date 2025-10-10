-module(counter_server_random_name).
-behaviour(gen_server).

%% API
-export([start_link/1, stop/1, increment/1, decrement/1, get_count/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-record(state, {name, count = 0}).

%%%===================================================================
%%% API
%%%===================================================================

start_link(Name) ->
    gen_server:start_link({local, Name}, ?MODULE, [Name], []).

stop(Name) ->
    gen_server:call(Name, stop).

increment(Name) ->
    gen_server:cast(Name, increment).

decrement(Name) ->
    gen_server:cast(Name, decrement).

get_count(Name) ->
    gen_server:call(Name, get_count).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init([Name]) ->
    {ok, #state{name = Name}}.

handle_call(get_count, _From, State) ->
    {reply, State#state.count, State};
handle_call(stop, _From, State) ->
    {stop, normal, ok, State};
handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(increment, State) ->
    NewCount = State#state.count + 1,
    {noreply, State#state{count = NewCount}};
handle_cast(decrement, State) ->
    NewCount = State#state.count - 1,
    {noreply, State#state{count = NewCount}};
handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.