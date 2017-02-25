#!/usr/bin/escript

-module(ets_example).

-export([main/1]).
% etc mean "Erlang Term Storage"
main(_)->

    % create a new table named "set_example" 
    % set example
    ets:new(set_example,[set, named_table])

    % insert one
  , ets:insert(set_example, { zamboni, 20 })

    % insert two
  , ets:insert(set_example, [
      {zamboni, 10}, 
      {zamboni, 1}
    ])

  , io:fwrite("inserts in set_example:  ~p~n",[ ets:lookup(set_example, zamboni) ])


  %  bag example
  , TabId = ets:new(bag_example, [bag])

  % insert one
  , ets:insert(TabId, {zamboni, 23})
  % insert two
  , ets:insert(TabId, [{zamboni, 12},{zamboni, 356}])
  
  , io:fwrite("~ninserts in bag_example:  ~p~n",[ ets:lookup(TabId, zamboni) ])


  % ordered_set example
  , ets:new(ordered_set_example, [ordered_set, named_table])

  , ets:insert(ordered_set_example, [
      { ketchup, "not much" }, 
      { mustard, "a lot" }, 
      { cheese, "yes", "goat" }, 
      { patty, "moose" }, 
      { onions, "a lot", "caramelized" }
    ])


  , Res1 = ets:first(ordered_set_example)

  , Res2 = ets:next(ordered_set_example, Res1)
  , Res3 = ets:next(ordered_set_example, Res2)

  , io:fwrite("~nitems ordered by alphanumeric:  ~p -> ~p -> ~p ~n",
      [ Res1, Res2, Res3 ]
    )
  
  , io:fwrite("last item is:  ~p ~n",
    [ ets:last(ordered_set_example) ]
  )

  , io:fwrite("last item is:  ~p ~n",
    [ ets:prev(ordered_set_example, ets:last(ordered_set_example)) ]
  )

.