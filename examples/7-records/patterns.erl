#!/usr/bin/escript

-module(patterns).

-export([main/1]).

% record is sugar syntax for build and access tuple
-record(inverse_index, {term, documents = [] }).

main(_) -> 

    T = #inverse_index{term="casa", documents=[0,1,2] }
    
    % get a term 
  , #inverse_index{term = Name} = T, Name
  , io:fwrite("~s~n",[Name])
.