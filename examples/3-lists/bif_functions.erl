#!/usr/bin/escript

-module(bif_functions).

-export([]).


main(_) -> 
  Original = [15,2,3,4,6],
  % hd(List) -> Element-- Returns the first element of the list.
  io:fwrite("first element ~w~n", [ hd(Original) ] ),
  % tl(List) -> List -- Returns the list minus its first element.
  io:fwrite("the tails is ~w~n", [ tl(Original) ] ),
  % length(List) -> Integer -- returns the length of the list.
  io:fwrite("the length is ~w~n", [ length(Original) ] ),

  % The following functions are in the lists module.
  % To call them, either first import them, or prepend lists: to the function call.The definitions are 
  % copied from http://www.erlang.org/doc/man/lists.html. Of these, the operations map, filter, foldl, and seq 
  % are the most commonly used.
  % all(Pred, List) -> bool() 
  % -- Returns true if Pred(Elem) returns true for all elements Elem in List, otherwise false.
  io:fwrite("all elements are less than 16 ?: ~w~n",    [ lists:all(fun(X) -> X < 16 end,Original) ] ),
  io:fwrite("all elements are grether than 16 ?: ~w~n", [ lists:all(fun(X) -> X > 16 end,Original) ] ),

  % any(Pred, List) -> bool() 
  % -- Returns true if Pred(Elem) returns true for at least one element Elem in List.
  io:fwrite("any element are grether than 14 ?: ~w~n", [ lists:any(fun(X) -> X > 14 end,Original) ] ),
  io:fwrite("any element are grether than 15 ?: ~w~n", [ lists:any(fun(X) -> X > 15 end,Original) ] ),

  % append(List1, List2) -> List3 
  % -- Returns a new list List3 which is made from the elements of List1 followed by the elements of List2.
  io:fwrite("append(Original, Original)  is ~w~n", [ lists:append(Original,Original) ] ),

  % lists:append(A, B) is equivalent to A ++ B.
  io:fwrite("is the same as Original ++ Original is ~w~n", [ Original ++ Original ] ),

  % dropwhile(Pred, List1) -> List2 
  % -- Drops elements Elem from List1 while Pred(Elem) returns true and returns the remaining list.
  io:fwrite("remove odd from Original: ~w~n", [ lists:dropwhile(fun(X) -> X rem 2 =/= 0 end,Original) ] ),

  % filter(Pred, List1) -> List2 
  % -- List2 is a list of all elements Elem in List1 for which Pred(Elem) returns true.
  % Example: lists:filter(fun(X) -> X =< 3 end, [3, 1, 4, 1, 6]). % Result is [3,1,1]
  io:fwrite("only odds from Original: ~w~n", [ lists:filter(fun(X) -> X rem 2 =/= 0 end,Original) ] ),

  % flatmap(Fun, List1) -> List2 
  % -- Maps Fun to List1 and flattens the result.

  % flatten(DeepList) -> List 
  % -- Returns a flattened version of DeepList.
  io:fwrite("flatten: ~w~n", [ lists:flatten( [[1,2,3],Original] ) ]),

  % foldl(Fun, Acc0, List) -> Acc1 
  % -- Calls Fun(Elem, AccIn) on successive elements A of List, starting with AccIn == Acc0. Fun/2 must return a new accumulator which is passed to the next call. The function returns the final value of the accumulator. Acc0 is returned if the list is empty.
  % Example: lists:foldl(fun(X, Y) -> X + 10 * Y end, 0, [1, 2, 3, 4, 5]). % Result is 12345
  io:fwrite("foldl: ~w~n", [lists:foldl(fun(X, Sum) -> X + Sum end, 0, Original )]),


  % foreach(Fun, List) -> void() 
  % -- Calls Fun(Elem) for each element Elem in List. This function is used for its side effects and the evaluation order is defined to be the same as the order of the elements in the list.
  lists:foreach(fun(X) -> io:fwrite("element -> ~w~n",[X]) end, Original),

  % map(Fun, List1) -> List2 
  % -- Takes a function from As to Bs, and a list of As and produces a list of Bs by applying the function to every element in the list. This function is used to obtain the return values. The evaluation order is implementation dependent.
  % Example: lists:map(fun(X) -> 2 * X end, [1, 2, 3]). % Result is [2,4,6]
  io:fwrite("duble map ~w~n", [lists:map(fun(X) -> X*2 end, Original)]),

  % member(Elem, List) -> bool() 
  % -- Returns true if Elem matches some element of List, otherwise false.
  io:fwrite("15 is element of Original ? ~w~n", [lists:member(30,Original)]),
  io:fwrite("50 is element of Original ? ~w~n", [lists:member(50,Original)]),

  % partition(Pred, List) -> {Satisfying, NonSatisfying} 
  % Partitions List into two lists, where the first list contains all elements for which Pred(Elem) returns true, and the second list contains all elements for which Pred(Elem) returns false.
  io:fwrite(
    "part Original in Odd AND Even: ~w~n", 
    [lists:partition(fun(X) -> X rem 2 =:= 0 end,Original)]
  ),

  % reverse(List1) -> List2 
  % -- Returns a list with the top level elements in List1 in reverse order, with the tail Tail appended.
  io:fwrite("reverse Original:  ~w~n", [lists:reverse(Original)]),
  
  % seq(From, To) -> Seq 
  % -- Returns a sequence of integers from From to To, inclusive.
  io:fwrite("range from -5 to 10:  ~w~n", [lists:seq(-5,10)]),

  % seq(From, To, Incr) -> Seq 
  % -- Returns a sequence of integers which starts with 
  % From and contains the successive results of adding Incr to the previous element, until To has been reached or passed (in the latter case, To is not an element of the sequence).
  io:fwrite("range from -5 to 10 with 2 increments:  ~w~n", [lists:seq(-5,10,2)]),

  % sort(List1) -> List2 -- Returns a list containing the sorted elements of List1.
  io:fwrite("sort Original:  ~w~n", [lists:sort(Original)]),

  % takewhile(Pred, List1) -> List2 -- Takes elements Elem from List1 while 
  % Pred(Elem) returns true, that is, the function returns the longest prefix 
  % of the list for which all elements satisfy the predicate.
  io:fwrite(
    "take odds from Original:  ~w~n", 
    [lists:takewhile(fun(X) -> X rem 2 =/= 0 end,Original)]
  ),
  % unzip(List1) -> {List2, List3} 
  % -- "Unzips" a list of two-tuples into two lists, 
  % where the first list contains the first element of each tuple,
  % and the second list contains the second element of each tuple.
  io:fwrite("unzip Tuple-2:  ~w~n", [lists:unzip([{1,2},{51,4}])]),
  % zip(List1, List2) -> List3 
  % -- "Zips" two lists of equal length into one list of two-tuples, where the first element of each tuple is taken from the first list and the second element is taken from corresponding element in the second list.
  io:fwrite(
    "zip Original from other List:  ~w~n", 
    [ lists:zip(Original,[1,2,3,4,5]) ]
  ),

  io:fwrite(
    "take a 5 item from Original:  ~w~n", 
    [ lists:nth(5,Original) ]
  )
.