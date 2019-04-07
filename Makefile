REBAR := rebar3

all:
	$(REBAR) compile

test:
	$(REBAR) dialyzer
	$(REBAR) eunit

clean:
	rm -rf _build

.PHONY: all test clean
