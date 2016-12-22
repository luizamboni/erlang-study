-module(receiver).

-export([loop/0]).


loop() ->
  receive
    { From, Msg } ->
      io:format(Msg),
      loop();
   { Msg } ->
      io:format(Msg),
      loop()  
  end.