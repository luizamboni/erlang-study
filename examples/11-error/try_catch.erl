#!/usr/bin/escript

-module(try_catch).

-export([main/1]).

main(_) -> 
    Msg = throw_error(any)
  , io:fwrite("success: ~s~n",[Msg])
  
  , try throw_error(custom) of
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


throw_error(custom) -> throw(custom_error);
throw_error(_) -> <<"message">>.