#!/usr/bin/escript

-module(bug).

-export([main/1]).

% note that is wrong, but not affect functionality
-spec make_bug(Str::string()) -> boolean().

make_bug(Str) -> 
  string:concat("going on direction ", Str)
.

main(_) -> 
  A = make_bug("test"),
  io:fwrite("concat has not return boolean: ~s~n",[A])
.