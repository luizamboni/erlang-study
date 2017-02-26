-module(example_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1, send_message/1,list/0]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
  % start example and link to this proccess
  supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
% init([]) ->
%     {ok, { {one_for_all, 0, 1}, []} }.

init([]) ->
    Id = example_server % Id is a name that is used to identify the child specification internally by the supervisor.
  , StartFunc =  { example, start_link, [] }
  , RestartStrategyAndFrequency = { one_for_one, 1, 5 }
  , Processes = [
      { 
        Id, 
        StartFunc, 
        permanent, 5000, worker, 
        [example]
      }
    ]
  , NoProcesses = []
  , { ok, 
      {
        RestartStrategyAndFrequency,
        Processes
      }
    }
.
%%====================================================================
%% Internal functions
%%====================================================================

send_message(Msg) -> 

    [{Id,Pid,_,_}|_] = list()
    % catch in example:handle_info (other messages)
  , Pid ! { self(), test }
    % handle_call
  , gen_server:call(Pid, {message, test}) 
    % handle_cast
  , gen_server:cast(Pid, {message, test})
.

% list children processes
list() ->
  supervisor:which_children(example_sup)
.