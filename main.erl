-module(main).

-export([start/0]).

-import(receiver,[loop/0]).

start() ->

  io:fwrite("START ...\n"),
  Pid = spawn(receiver,loop,[]),
  Pid ! { self(), "message in bottle" },
  Pid ! { "only a message in bottle" }
.
