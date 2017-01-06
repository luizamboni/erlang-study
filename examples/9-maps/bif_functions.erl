#!/usr/bin/escript

-module(bif_functions).

-export([]).


main(_) -> 
    M0 = #{ 1 => 2 , 2 => 3 , 3 => 4, 4 => 6 }

  , M1 = maps:filter(fun(K,V) -> V =:= K+1 end, M0)
  , io:fwrite("filter Y = X + 1 : ~w~n",[M1])

  , X = maps:find(fun(K,V) -> V =:= K+1 end, M0)
  , io:fwrite("first Y = X + 1 : ~w~n",[X])

.