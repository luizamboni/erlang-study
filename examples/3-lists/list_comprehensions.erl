#!/usr/bin/escript

-module(list_comprehensions).

-export([]).

main(_) -> 
  Original = [1,2,3,4,6,7,9],

  io:fwrite("~w~n",[Original]),

  % X is gt 3
  io:fwrite("~w~n",[ [ X || X <- Original, X > 3 ] ]),

  % X is gt 3 and divisible by 3
  io:fwrite("~w~n",[ [ X || X <- Original, X > 3, X rem 3 =:= 0] ]),
  
  % mix 2 lists
  Original2 = [15,51,21,54,8,4,84,9,6],

  % anly when X and Y are equals
  io:fwrite("~w~n",[ [ {X,Y} || X <- Original, Y <- Original2, X =:= Y ] ]),

  % only when Y = X * 3
  io:fwrite("~w~n",[ [ {X,Y} || X <- Original, Y <- Original2, Y =:= X * 3 ] ])

.