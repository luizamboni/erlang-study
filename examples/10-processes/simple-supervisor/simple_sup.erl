-module(simple_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1,start/0]).

start_link() ->
 {ok, Pid} = supervisor:start_link({local, ?MODULE}, ?MODULE, []),
 {ok, Pid}
.

init(_Args) ->
  RestartStrategy = {
    simple_one_for_one, 
    4, % restart no more 4 times per one minute, replace 4->4000 for long working
    60
  }, 
                                                  
  ChildSpec = {
    ch1, 
    {ch1, start_link, []}, 
    permanent, 
    brutal_kill, 
    worker, 
    [ch1]
  },

 Children = [ChildSpec],
 {ok, {RestartStrategy, Children}}
.


start()->
  % Start empty supervisor
  {ok,SPid}=start_link(),
  io:fwrite("spid is ~p~n", [SPid]),

  % Start two children services
  % supervisor:start_child(Sup, ChildSpec)
  % Sup is PID , ChildSpec is'Child Specification'
  {ok, Child1Pid} = supervisor:start_child(SPid, [id1]),
  {ok, Child2Pid} = supervisor:start_child(SPid, [id2]),

  timer:sleep(500),

  % start loop for ticks
  spawn(fun() -> tick_loop() end),
  spawn(fun()-> status_loop() end)
.

tick(ID)->
  Pid=whereis(ID),
  gen_server:cast(Pid, tick)
.

tick_loop()->
  tick(id1),timer:sleep(500),
  tick(id2),timer:sleep(500),
  tick_loop()
.

% show status for id1 and id2 services every 2.9 sec
status_loop()->
  timer:sleep(2900),
  io:format("status ~p ~n",[{status,sys:get_status(id1),sys:get_status(id2)}]),
  status_loop()
. 