How use
===

```shell
$ erl
```

cover:compile_directory().

```erlang
  application:start(example_app).
```

show loaded applications
```erlang
  application:loaded_applications().
```

show started applications
```erlang
  application:which_applications().
  application:stop(example_app).
```

unload app

```erlang
  > application:which_applications().
  > application:unload(example_app).

```


# Usage
$ erl
cover:compile_directory().
application:start(example_app).
example_app:list().