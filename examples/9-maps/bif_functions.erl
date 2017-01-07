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
  
  , io:fwrite(
    "get value of key x or default => ~w~n",
    [maps:get(x,M0,100)]
  )

  , io:fwrite("x is key ? ~w~n",[maps:is_key(x,M0)])

  , io:fwrite("Keys of M0 ? ~w~n",[maps:keys(M0)])

  , io:fwrite("map V*2 ~w~n",[maps:map(fun(K,V) -> V*2 end,M0)])

  , io:fwrite("maps mergeds: ~w~n",[maps:merge(#{ x => y },M0)])

  , io:fwrite("map values: ~w~n",[maps:values(M0)])

  , io:fwrite("map to list: ~w~n",[maps:to_list(M0)])


  , io:fwrite("update key 1: ~w~n",[maps:update(1,1000,M0)])

  , io:fwrite("remove key 1: ~w~n",[maps:remove(1,M0)])
  
  , io:fwrite("size of M0: ~w~n",[maps:size(M0)])

  , io:fwrite("put K,V in M0: ~w~n",[maps:put(xx,inserted,M0)])

  , io:fwrite("take key 1: ~w~n",[maps:take(1,M0)])

  , io:fwrite("update_with key 1: ~w~n",[
    maps:update_with(1,fun(K,V) ->  K*2 end,0,M0)
  ])

.