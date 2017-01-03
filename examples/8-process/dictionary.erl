#!/usr/bin/escript

-module(dictionary).

-export([main/1]).

main(_)->
  
    io:fwrite("~w~n",[get()])

  % Associates the Value with the Key, 
  % returning the previous value associated with the Key, 
  % or the atom undefined.
  , OldValue = put(test, "test value")
  % Returns the Value currently 
  % associated with the Key, or the atom undefined.

  , NewValue = get(test)

  % Returns a list of all Key/Value tuples.
  , io:fwrite("~w~n",[get()])
  % Returns a list of Keys having the given Value.
  , io:fwrite("~w~n",[get_keys(NewValue)])
  % Returns the Value currently associated with the Key, or the atom undefined, 
  % and removes the Key/Value pair from the process dictionary.

  , io:fwrite("erasing ~w~n",[erase(test)]) 
  % Returns a list of all Key/Value tuples, and erases the contents of the process dictionary.
  , put(test, "test 1")
  , put(test2, "test 2")
  , put(test3, "test 3")

  , io:fwrite("~w~n",[get()])
  
  , io:fwrite("erase all ~w~n",[erase()])

  , io:fwrite("~w~n",[get()])

.
