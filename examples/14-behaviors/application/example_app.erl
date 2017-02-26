-module(example_app).

-behavior(application).

-export([start/2, stop/1,send_message/1,list/0]).

start(_StartType, _StartArgs) ->
  % start example_sup and link to this proccess
  io:fwrite("example_app start"),
  example_sup:start_link()
.

stop(_State) -> ok
.

send_message(Msg) -> 
  example_sup:send_message(Msg)
.

list() -> 
  example_sup:list()
.