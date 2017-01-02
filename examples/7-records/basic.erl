#!/usr/bin/escript

-module(basic).

-export([main/1]).

% record is sugar syntax for build and access tuple
-record(inverse_index, {term, documents = [] }).

main(_) -> 

    T = #inverse_index{term="casa", documents=[0,1,2] }
  , io:fwrite("~w~n", [T])

  % accesss "attribute"
  , io:fwrite("~s~n", [T#inverse_index.term])
  % uptating Term record
  , T2=T#inverse_index{term = "Casebre"}
  , io:fwrite("~s~n", [T2#inverse_index.term])

  % test record type
  , io:fwrite("is a inverse_index record? ~w~n", [is_record(T,inverse_index)])


  , Index = [ T, T2 ]
  , io:fwrite("~w~n", [Index])
.