#!/usr/bin/escript

-module(macro_example).

-export([main/1]).

-ifndef(sum).
-define(sum(X,Y),{X+Y}). 
-endif.

-ifdef(sum).
-define(sub(X,Y),{X-Y}).
-endif.

main(_) -> 
    io:fwrite("macro examples~n")
  , io:fwrite("~p~n",[?sum(1,2)])
  , io:fwrite("~p~n",[?sub(1,5)])
.
