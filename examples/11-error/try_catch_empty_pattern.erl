#!/usr/bin/escript

-module(try_catch_empty_pattern).

-export([main/1]).

main(_) -> 

  
 try throw_error(custom) of
    % pattern when guard -> expression
    _ -> io:fwrite("in try block~n")
  catch
    % pattern when guard -> expression
    _ -> io:fwrite("in catch block~n")
  after
    % expression
    io:fwrite("after catch~n")
  end
.


throw_error(custom) -> throw(custom_error).