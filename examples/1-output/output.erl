#!/usr/bin/escript
-module(output).

-export([main/1]).
% script need to have a main/1 funcion

% a main with no argment
main(_) ->
  % ~n is break line
  io:fwrite("formated~n"),
  % ~s is string format
  io:fwrite("formated ~s~n",["Teste"]),
  % ~w is erlang default format
  io:fwrite("formated ~w~n",["Teste"]),

  io:fwrite("formated ~w ~w ~n",[15.5, 10]),
  io:fwrite("formated ~s ~s ~n",["bla", "bli"]),

  % base 2
  io:fwrite("formated ~.2B ~n",[10]),
  % base 16
  io:fwrite("formated ~.16B ~n",[10])
.