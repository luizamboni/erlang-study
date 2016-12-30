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
  % all(Pred, List) -> bool() -- Returns true if Pred(Elem) returns true for all elements Elem in List, otherwise false.
  io:fwrite("all elements are less than 16 ?: ~w~n", [ lists:all(fun(X) -> X < 16 end,Original) ] ),
  io:fwrite("all elements are grether than 16 ?: ~w~n", [ lists:all(fun(X) -> X > 16 end,Original) ] )

  % any(Pred, List) -> bool() -- Returns true if Pred(Elem) returns true for at least one element Elem in List.
  % append(List1, List2) -> List3 -- Returns a new list List3 which is made from the elements of List1 followed by the elements of List2.
  % lists:append(A, B) is equivalent to A ++ B.
  % dropwhile(Pred, List1) -> List2 -- Drops elements Elem from List1 while Pred(Elem) returns true and returns the remaining list.
  % filter(Pred, List1) -> List2 -- List2 is a list of all elements Elem in List1 for which Pred(Elem) returns true.
  % Example: lists:filter(fun(X) -> X =< 3 end, [3, 1, 4, 1, 6]). % Result is [3,1,1]
  % flatmap(Fun, List1) -> List2 -- Maps Fun to List1 and flattens the result.
  % flatten(DeepList) -> List -- Returns a flattened version of DeepList.
  % foldl(Fun, Acc0, List) -> Acc1 -- Calls Fun(Elem, AccIn) on successive elements A of List, starting with AccIn == Acc0. Fun/2 must return a new accumulator which is passed to the next call. The function returns the final value of the accumulator. Acc0 is returned if the list is empty.
  % Example: lists:foldl(fun(X, Y) -> X + 10 * Y end, 0, [1, 2, 3, 4, 5]). % Result is 12345
  % foreach(Fun, List) -> void() -- Calls Fun(Elem) for each element Elem in List. This function is used for its side effects and the evaluation order is defined to be the same as the order of the elements in the list.
  % map(Fun, List1) -> List2 -- Takes a function from As to Bs, and a list of As and produces a list of Bs by applying the function to every element in the list. This function is used to obtain the return values. The evaluation order is implementation dependent.
  % Example: lists:map(fun(X) -> 2 * X end, [1, 2, 3]). % Result is [2,4,6]
  % member(Elem, List) -> bool() -- Returns true if Elem matches some element of List, otherwise false.
  % partition(Pred, List) -> {Satisfying, NonSatisfying} -- Partitions List into two lists, where the first list contains all elements for which Pred(Elem) returns true, and the second list contains all elements for which Pred(Elem) returns false.
  % reverse(List1) -> List2 -- Returns a list with the top level elements in List1 in reverse order, with the tail Tail appended.
  % seq(From, To) -> Seq -- Returns a sequence of integers from From to To, inclusive.
  % seq(From, To, Incr) -> Seq -- Returns a sequence of integers which starts with From and contains the successive results of adding Incr to the previous element, until To has been reached or passed (in the latter case, To is not an element of the sequence).
  % sort(List1) -> List2 -- Returns a list containing the sorted elements of List1.
  % takewhile(Pred, List1) -> List2 -- Takes elements Elem from List1 while Pred(Elem) returns true, that is, the function returns the longest prefix of the list for which all elements satisfy the predicate.
  % unzip(List1) -> {List2, List3} -- "Unzips" a list of two-tuples into two lists, where the first list contains the first element of each tuple, and the second list contains the second element of each tuple.
  % zip(List1, List2) -> List3 -- "Zips" two lists of equal length into one list of two-tuples, where the first element of each tuple is taken from the first list and the second element is taken from corresponding element in the second list.
.