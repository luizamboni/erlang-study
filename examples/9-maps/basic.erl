#!/usr/bin/escript

-module(basic).

-export([main/1]).


main(_) ->

    A = "a"
  , B = "b"
  
  , M1 = #{}                   % empty map
  , io:fwrite("~w~n",[M1])
 
  , M2 = #{ a => <<"hello">> } % single association with literals
  , io:fwrite("~w~n",[M2])
 
  , M3 = #{ 1 => 2, b => b }   % multiple associations with literals
  , io:fwrite("~w~n",[M3])
  
  , M4 = #{ A => B }           % single association with variables
  , io:fwrite("~w~n",[M4])
  
  , M5 = #{ {A, B} => f() }    % compound key associated to an evaluated expression
  , io:fwrite("~w~n",[M5])
 
  , M6 = #{ a => 2, a => b }   % multiple associations in same key, last remains
  , io:fwrite("~w~n",[M6])
 
  % updating
  , M7 = M6#{ b => a}
  , io:fwrite("~w~n",[M7])
  % only update if key exists
  % , M8 = M7#{ c := c} % it will raise error
  , M8 = M7#{ b := c}
  , io:fwrite("~w~n",[M8])

  , M9 = #{ a => {1,2} }

  % example of pattern
  , #{ a := {1,C}} = M9
  , io:fwrite("~w~n",[C])

  , X = 5
  , io:fwrite("~w~n",[ #{ X => X - 1 } ])

  % this pattern not works
  % , M10 = #{ a => 1, c => 3 }
  % , X = M10#{ c }
  % , io:fwrite("~w~n",[ X ])
. 

f() ->
  io:fwrite("~w~n",[<<"func test">>])
.