#!/usr/bin/escript

-module(macro_specials).

-export([main/1, test_function_marcros/1]).


main(_) -> 

    io:fwrite("macro special examples~n")
  , io:fwrite("module ~p~n",[?MODULE])
  , io:fwrite("module name as string ~s~n",[?MODULE_STRING])
  , io:fwrite("file name ~s~n",[?FILE])
  , io:fwrite("line number ~p~n",[?LINE])
  , io:fwrite("machine name  ~p~n",[?MACHINE])
  , test_function_macros(x)
.

% not implementeds :(
test_function_macros(X) -> 
  io:fwrite("function name ~p~n",[ ?FUNCTION_NAME ]),
  io:fwrite("function ariry ~p~n",[ ?FUNCTION_ARIRY ])
. 
