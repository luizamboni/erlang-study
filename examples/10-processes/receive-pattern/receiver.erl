-module(receiver).

-export([loop/0]).

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