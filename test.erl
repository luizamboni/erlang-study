-module(test).

-export([sum/1,non_symetric/1, symetric/1]).

sum([]) -> 0;
sum([H|T]) -> H + sum(T).


non_symetric(L) -> [ {X,Y} || X <- L, Y <- L, X =/= Y ]. 

symetric(L) -> [{X,Y} || X <- L, Y <- L] -- non_symetric(L).