rm -f *.beam

erlc receiver.erl main.erl 

erl -noshell -s main start