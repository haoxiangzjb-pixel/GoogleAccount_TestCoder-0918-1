MODULES = ZkgletOYNE ZkgletOYNE_app ZkgletOYNE_sup
ERLC_FLAGS = +debug_info

all: compile

compile:
	erlc $(ERLC_FLAGS) $(MODULES:=.erl)

clean:
	rm -f *.beam

run: compile
	erl -pa . -eval 'application:start(ZkgletOYNE)' -noshell

stop:
	pkill -f beam