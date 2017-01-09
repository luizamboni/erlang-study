-module(receiver).

-export([
  loop/0,
  receive_and_halt/0,
  receive_and_stop_this/0
  ]).

loop() ->
  receive
    { From, Msg } ->
      io:fwrite("~s~n",[Msg]),
      loop();
   { Msg } ->
      io:fwrite("~s~n",[Msg]),
      loop()  
      % halt()
  end
.

receive_and_halt()->
  receive
    { From, Msg } ->
      io:fwrite("~s~n",[Msg]),
      halt();
    { Msg } ->
      io:fwrite("~s~n",[Msg]),
      halt() 
  end
.

receive_and_stop_this()->
  receive
    { From, Msg } ->
      io:fwrite("~s~n",[Msg]),
      exit(Msg);
    { Msg } ->
      io:fwrite("~s~n",[Msg]),
      erlang:error(Msg) 
  end
.