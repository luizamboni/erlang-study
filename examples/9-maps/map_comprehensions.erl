#!/usr/bin/escript

-module(map_comprehensions).

-export([main/1]).

main(_) ->

    M0 = #{ 1 => 2 , 2 => 3 , 3 => 4, 4 => 6 }
  , io:fwrite("~w~n",[M0])

  % not works!
  % , M1 = [ K  || K := 2 <- M0 ],
  % , io:fwrite("~w~n",[M1])
.