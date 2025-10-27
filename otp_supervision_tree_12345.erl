%% OTP Supervision Tree Example
%% This file demonstrates a complete OTP supervision tree with application, supervisor, and worker

-module(otp_supervision_tree_12345).
-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% API
-export([start_worker/0, get_worker_state/0]).

%% Internal functions
-export([start_link/0]).

%% =============================================================================
%% Application callbacks
%% =============================================================================

start(_StartType, _StartArgs) ->
    start_link().

start_link() ->
    otp_supervisor:start_link().

stop(_State) ->
    ok.

%% =============================================================================
%% API functions
%% =============================================================================

start_worker() ->
    otp_worker ! {start, self()},
    receive
        Result -> Result
    after 5000 ->
        {error, timeout}
    end.

get_worker_state() ->
    otp_worker ! {get_state, self()},
    receive
        Result -> Result
    after 5000 ->
        {error, timeout}
    end.

%% =============================================================================
%% Supervisor and Worker modules included for completeness
%% =============================================================================

%% The supervisor module
-module(otp_supervisor).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    %% Define child specifications for the supervision tree
    ChildSpecs = [
        {otp_worker, 
         {otp_worker, start_link, []},
         permanent, 
         5000, 
         worker, 
         [otp_worker]}
    ],
    %% Return the supervision strategy
    {ok, {{one_for_one, 5, 10}, ChildSpecs}}.

%% The worker module
-module(otp_worker).
-behaviour(gen_server).

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

%% State record
-record(state, {
    name = "OTP Worker" :: string(),
    counter = 0 :: integer()
}).

%% =============================================================================
%% API functions
%% =============================================================================

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

%% =============================================================================
%% gen_server callbacks
%% =============================================================================

init([]) ->
    io:format("OTP Worker started~n"),
    {ok, #state{}}.

handle_call(get_state, _From, State) ->
    {reply, {ok, State}, State};

handle_call(_Request, _From, State) ->
    {reply, {error, unknown_request}, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info({start, Pid}, State) ->
    NewState = State#state{counter = State#state.counter + 1},
    Pid ! {started, self(), NewState},
    {noreply, NewState};

handle_info({get_state, Pid}, State) ->
    Pid ! {current_state, State},
    {noreply, State};

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    io:format("OTP Worker terminating~n"),
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.