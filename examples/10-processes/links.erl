% HOW USE IT:
% c(links).
% process_flag(trap_exit, true) 
% links:main(x).
  
-module(links).
-export([main/1]).

main(_) ->
	link(spawn(fun() -> start_process(0) end)),
	spawn_link(fun() -> start_process(1) end),
	% if not catched, the error will throw to father proccess 
	% and it will stop all linked subprocesses
	% link(spawn(fun() -> catch(start_process(other)) end)),
  link(spawn(fun() -> start_process(other) end)),
  io:fwrite("end program~n")
.


start_process(0) -> 
  io:fwrite("~p~n",[ok]),
  timer:sleep(1000),
  start_process(0);

start_process(1) ->   
  io:fwrite("~p~n",[not_ok]),
  timer:sleep(1000),
  start_process(1);

start_process(_) -> 
  io:fwrite("~p~n",[error]),
  timer:sleep(500),
  exit("becouse i want")
.

