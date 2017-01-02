-module(dictyonary).

-export([main/1]).

main(_)->
  %Associates the Value with the Key, returning the previous value associated with the Key, or the atom undefined.
  put(Key, Value) -> OldValue
  %Returns the Value currently associated with the Key, or the atom undefined.

  get(Key) -> Value
  %Returns a list of all Key/Value tuples.
  get() -> [{Key, Value}, ..., {Key, Value}]
  %Returns a list of Keys having the given Value.
  get_keys(Value) -> [Key, ..., Key]
  %Returns the Value currently associated with the Key, or the atom undefined, and removes the Key/Value pair from the process dictionary.

  erase(Key) -> Value
  %Returns a list of all Key/Value tuples, and erases the contents of the process dictionary.
  erase() -> [{Key, Value}, ..., {Key, Value}]
.
