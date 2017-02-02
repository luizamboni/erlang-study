#!/usr/bin/escript

-module(macro_example).

-export([main/1]).
-define(sum(X,Y),{X+Y}). 

main(_) -> 
    io:fwrite("macro examples~n")
  , io:fwrite("~p~n",[?sum(1,2)])
.