#!/usr/bin/escript

-module(sets).

-export([sum/1,non_symetric/1, symetric/1]).

sum([]) -> 0;
sum([H|T]) -> H + sum(T).

non_symetric(L) -> [ {X,Y} || X <- L, Y <- L, X =/= Y ]. 

symetric(L) -> [{X,Y} || X <- L, Y <- L] -- non_symetric(L).

main(_) -> 
  Original = [1,2,3,4,6],
  io:fwrite("~nthe Original list is: ~n~w~n", [Original]),
  io:fwrite("~nthe non Simetric product is: ~n~w~n", [non_symetric(Original)]),
  io:fwrite("~nthe Simetric product is: ~n~w~n", [symetric(Original)]),
  io:fwrite("~nthe sum of all terms is: ~w~n", [sum(Original)])

.