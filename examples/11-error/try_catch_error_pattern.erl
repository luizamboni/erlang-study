#!/usr/bin/escript

-module(try_catch_error_pattern).

-export([main/1]).

main(_) -> 
    slash(0)
  , slash(1)
  , slash(2)
  , slash(3)
  , slash(4)
  , slash(5)
.


slash(N) -> 
  try sword(N) of
    {ok,Hooo} -> io:fwrite("~s~n",[Hooo]);
    {ko,Hooo} -> io:fwrite("~s~n",[Hooo])
  catch

    throw:custom_error -> io:fwrite("for custom_error throwed.~n");
    error:custom -> io:fwrite("for custom_error ~n");
    exit:custom -> io:fwrite("exit error~n");
    _:_ -> io:fwrite("not matched expception ~n")
  end
.

% are 3 types os expections -> errors, throws and exits
sword(0) -> throw(custom_error);
sword(1) -> erlang:error(custom);
sword(2) -> erlang:exit(custom);
sword(3) -> throw(throw_error);
sword(4) -> {ok, "hoooo !"};
sword(5) -> {ko, "slaaaaash !"}
.
