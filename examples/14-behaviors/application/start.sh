#!/bin/bash

erl -eval "cover:compile_directory()." -eval "example_app:start(x,x)."\
-eval "example_app:send_message(test)"