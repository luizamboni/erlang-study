-module(example_app).

-behavior(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
  example_sup:start_link()
.

stop(_State) -> ok
.