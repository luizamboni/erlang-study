#!/usr/bin/escript

-module(catch_e).

-export([main/1]).

main(_) -> 
  io:fwrite("error catch: ~w~n",[error()])
.

error() -> 
  catch erlang:error(custom)
.