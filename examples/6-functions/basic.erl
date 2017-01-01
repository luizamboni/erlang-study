#!/usr/bin/escript

-module(types).

-export([main/1]).


main(_) -> 
  basic("message..."),
  basic({"message..."}),
  basic({msg,"message..."})
.


% 3 differente patterns to same function
basic({msg, Message}) ->
  io:fwrite("basic1 -> ~s~n",[Message]);

basic({Message}) ->
  io:fwrite("basic2 -> ~s~n",[Message]);

basic(Message) ->
  io:fwrite("basic3 -> ~s~n",[Message])
.

