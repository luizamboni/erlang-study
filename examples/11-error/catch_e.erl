#!/usr/bin/escript

-module(catch_e).

-export([main/1]).

main(_) -> 
    io:fwrite("error catch: ~w~n",[error()])
  , X = (catch 4/0)
  , io:fwrite("X is: ~w~n",[X])
.

error() -> 
  catch erlang:error(custom)
.