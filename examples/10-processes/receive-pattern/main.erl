-module(main).

-export([start/0]).

-import(receiver,[loop/0,receive_and_halt/0]).

start() ->

    io:fwrite("START ...~n")
  , Pid = spawn(receiver,loop,[])

  , Pid ! { self(), "message in bottle" }
  , Pid ! { "only a message in bottle" }

  , Pid2 = spawn(receiver, receive_and_halt,[])
  , Pid3 = spawn(receiver, receive_and_stop_this,[])

  , io:fwrite("Pid is alive ? ~w~n",[is_process_alive(Pid)])
  , io:fwrite("Pid2 is alive ? ~w~n",[is_process_alive(Pid2)])
  , io:fwrite("Pid3 is alive ? ~w~n",[is_process_alive(Pid3)])

  % registering processes
  % Associates the name Name, an atom, with the process Pid.
  , register(loop, Pid)
  , register(halt_program, Pid2)
  , register(stop_process, Pid3)


  % Returns a list of names that have been registered using 
  % register/2. 
  , io:fwrite("processes registereds ~w~n",[registered()]) 

  , io:fwrite("PID for halt_program ~w~n",[whereis(halt_program)]) 
  
  , {Pid4,Msg2} = Pid3 ! { self(), "kill this" }
  , io:fwrite("msg in Msg2: ~s~n",[Msg2])
  , io:fwrite("H: ~w~n",[Pid4])

  , io:fwrite("Pid is alive ? ~w~n",[is_process_alive(Pid)])
  , io:fwrite("Pid2 is alive ? ~w~n",[is_process_alive(Pid2)])
  , io:fwrite("Pid3 is alive ? ~w~n",[is_process_alive(Pid3)])

  , Pid2 ! { "last message in bottle" }


  , io:fwrite("--------- terminate main process~n")

.