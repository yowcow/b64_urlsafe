REBAR := rebar3

all:
	$(REBAR) compile

test:
	$(REBAR) do eunit,dialyzer,xref

clean:
	rm -rf _build

.PHONY: all test clean
