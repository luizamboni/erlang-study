#!/usr/bin/escript

-module(patterns).

-export([main/1]).

main(_) -> 
  Original = {ok,{message,"mensagem"}, {description, "blabalblaba"}},

  {Status,_,_} = Original,

  io:fwrite("~nthe Status is: ~n~w~n", [Status] ),

  {_,{message,Message},_} = Original,

  io:fwrite("~nthe Message is: ~n~s~n", [Message] ),
  {_,_,{description,Description}} = Original,

  io:fwrite("~nthe Description is: ~n~s~n", [Description] )
.