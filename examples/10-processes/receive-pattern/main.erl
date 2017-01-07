-module(main).

-export([start/0]).

-import(receiver,[loop/0]).

start() ->

    io:fwrite("START ...~n")
  , Pid = spawn(receiver,loop,[])
  , Pid ! { self(), "message in bottle" }
  , Msg = Pid ! { "only a message in bottle" }

  , io:fwrite("~w~n",[Msg])
.