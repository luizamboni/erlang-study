#!/usr/bin/escript

-module(backtrace).

-export([main/1]).

main(_) -> 
  io:fwrite("error catch: ~w~n",[slash()])
.

slash() -> 
  try sword() of
    _ -> io:fwrite("success~n")
  catch
    error:X ->  { X, erlang:get_stacktrace() }
  end
.

sword() -> 
  erlang:error(custom)
.