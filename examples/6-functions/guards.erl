#!/usr/bin/escript

-module(guards).

-export([main/1]).


main(_) -> 
  basic(42),
  basic(-4),
  basic(0),

  basic2(42),
  basic2(-4),
  basic2(0),

  basic3(42),
  basic3(-4),
  basic3(0)
.


% guards with overload function
basic(N) when N > 0 -> io:fwrite("(~.10B) is positive -> ~n",[N]);
basic(N) when N < 0 -> io:fwrite("(~.10B) is negative -> ~n",[N]);
basic(N) when N =:= 0 -> io:fwrite("(~.10B) is zero -> ~n",[N]).

% guards in case 
% Pattern1 [when GuardSeq] ->
basic2(N) -> 
  case N of
    N when N > 0 -> io:fwrite("(~.10B) is positive -> ~n",[N]);
    N when N < 0 -> io:fwrite("(~.10B) is negative -> ~n",[N]);
    N when N =:= 0 -> io:fwrite("(~.10B) is zero -> ~n",[N])
  end
.

% if pattern
% http://learnyousomeerlang.com/syntax-in-functions
basic3(N) -> 
  if N > 0 -> io:fwrite("(~.10B) is positive -> ~n",[N]);
     N < 0 -> io:fwrite("(~.10B) is negative -> ~n",[N]);
     N =:= 0 -> io:fwrite("(~.10B) is zero -> ~n",[N])
  end
.
