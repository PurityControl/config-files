all: compile

compile:
	erlc -o ebin src/*.erl

shell:
	erl -pa ebin

docs:
	erl -pa ebin -noshell -eval 'edoc:application(**MY_APP**, ".", [])' -s init stop

