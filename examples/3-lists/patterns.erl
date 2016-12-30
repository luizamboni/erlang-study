#!/usr/bin/escript

-module(patterns).

-export([main/1]).


main(_) -> 
  Original = [10,2,3,4,6],

  % get fist term, in different approaches
  % full pattern
  [First,_,_,_,_] = Original,
  io:fwrite("~nthe First is: ~n~w~n", [First] ),
  
  % [Head|Tail] pattern
  [Fist2|_] = Original,
  io:fwrite("~nthe First is: ~n~w~n", [Fist2] ),
 
  % [Head,X...|Tail] pattern
  [Fist3,_|_] = Original,
  io:fwrite("~nthe First is: ~n~w~n", [Fist3] ),


  % get Last term
  % full pattern
  [_,_,_,_,Last] = Original,
  io:fwrite("~nthe Last is: ~n~w~n", [Last] ),

  % with reverse
  [Last2,_,_,_,_] = lists:reverse(Original),
  io:fwrite("~nthe Last is: ~n~w~n", [Last2] ),

  % [Head|Tail] pattern
  [Last3|_] = lists:reverse(Original),
  io:fwrite("~nthe Last is: ~n~w~n", [Last3] ),

  % get the secund list
  % [H,H2|T] pattern
  [_, Second |_] = Original,
  io:fwrite("~nthe Second is: ~n~w~n", [Second]),


  % [H|[H2|T]] pattern
  [_|[Second2|_]] = Original ,
  io:fwrite("~nthe Second is: ~n~w~n", [Second2])
.