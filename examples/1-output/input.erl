#!/usr/bin/escript

-module(input).

-export([main/1]).

main(_) ->
  % ~s is string
  {ok,[In]} = io:fread("entre aqui > ", "~s"),
  io:fwrite("the input is ~s~n",[In]),

  % ~d is digit
  In1 = io:fread("entre aqui um digito > ", "~d"),
  io:fwrite("the raw input is ~w~n",[In1]),

  {ok,[Digit]} = In1,
  % can not output simple ~d
  io:fwrite("the digit is is ~.10B~n",[Digit]),
  % ~f is a float
  io:fwrite("the digit is is ~f~n",[Digit])

.