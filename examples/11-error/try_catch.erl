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

  , try throw_error(custom) of
      % pattern when guard -> expression
      Tuple -> io:fwrite("2) in try block ~w~n",[Tuple])
    catch
      % pattern when guard -> expression

      throw:custom_error -> io:fwrite("It is but a scratch.~n");
      error:cut_arm -> io:fwrite("I've had worse.~n");
      exit:cut_leg -> io:fwrite("Come on you pansy! ~n");
      _:_ -> io:fwrite("2) Just a flesh wound ~n")
    after
      % expression
      io:fwrite("2) after catch~n")
    end
.


throw_error(custom) -> throw(custom_error);
throw_error(_) -> <<"message">>.