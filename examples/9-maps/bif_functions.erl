#!/usr/bin/escript

-module(bif_functions).

-export([]).


main(_) -> 
    M0 = #{ 1 => 2 , 2 => 3 , 3 => 4, 4 => 6 }

  , M1 = maps:filter(fun(K,V) -> V =:= K+1 end, M0)
  , io:fwrite("filter Y = X + 1 : ~w~n",[M1])

  , X = maps:find(fun(K,V) -> V =:= K+1 end, M0)
  , io:fwrite("first Y = X + 1 : ~w~n",[X])

  , Acc = maps:fold(fun(K,V,AccIn) -> AccIn + V end,0, M0)
  , io:fwrite("sum of all Values is: ~w~n",[Acc])

  , L0 = [ {"a",ignored}, {1337,"value two"}, {42,value_three}, {"a",1} ]

  , io:fwrite("list to map : ~w~n",[maps:from_list(L0)])
  , io:fwrite("get value of key 4 => ~w~n",[maps:get(4,M0)])

.