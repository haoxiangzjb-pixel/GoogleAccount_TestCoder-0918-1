-module(state_server).
-behaviour(gen_server).

%% API
-export([start_link/1, stop/1, get_state/1, update_state/2, reset_state/1]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

%% Records
-record(state, {data = #{}}).

%%%===================================================================
%%% API
%%%===================================================================

start_link(InitialState) ->
    gen_server:start_link(?MODULE, InitialState, []).

stop(Pid) ->
    gen_server:call(Pid, stop).

get_state(Pid) ->
    gen_server:call(Pid, get_state).

update_state(Pid, NewData) ->
    gen_server:call(Pid, {update_state, NewData}).

reset_state(Pid) ->
    gen_server:call(Pid, reset_state).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

init(InitialState) ->
    State = #state{data = InitialState},
    {ok, State}.

handle_call(get_state, _From, State = #state{data = Data}) ->
    {reply, {ok, Data}, State};

handle_call({update_state, NewData}, _From, State = #state{data = Data}) ->
    NewState = State#state{data = maps:merge(Data, NewData)},
    {reply, ok, NewState};

handle_call(reset_state, _From, _State) ->
    NewState = #state{data = #{}},
    {reply, ok, NewState};

handle_call(stop, _From, State) ->
    {stop, normal, ok, State};

handle_call(_Request, _From, State) ->
    {reply, {error, unknown_request}, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.