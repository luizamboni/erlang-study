#!/usr/bin/escript

-module(types).

-export([main/1]).

-type direction() :: north |  south | east | west.
-type point() :: {integer(), integer()}.
-type route() :: {go, direction(), point()}.

-type coringa() :: direction() | point() | route().

-spec goto(direction()) -> none(); % note that is wrong, but not affect functionality
          (point()) -> none();
          (route()) -> none()
.
% or can bo also above format with name of Argments 
% -spec goto(Direction::direction()) -> none();
%           (Direction::point()) -> none();
%           (Direction::route()) -> none()
% .

goto(Direction) ->
  io:fwrite("going on direction ~w~n",[Direction])
.

main(_) -> 
  goto(north),
  goto({15,154}),
  goto({ go, north, {15,157} }),
  goto(23)
.