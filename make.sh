rm -f *.beam

erlc receiver.erl test.erl main.erl 

erl -noshell -s main start