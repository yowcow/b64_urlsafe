-module(b64_urlsafe_tests).

-include_lib("eunit/include/eunit.hrl").

encode_decode_test_() ->
    Cases = [
        {
            "0000000 <-> MDAwMDAw",
            <<"000000">>,
            <<"MDAwMDAw">>
        },
        {
            "\\0\\0\\0\\0 <-> AAAAAA",
            <<"\0\0\0\0">>,
            <<"AAAAAA">>
        },
        {
            "\\xff <-> _w",
            <<"\xff">>,
            <<"_w">>
        },
        {
            "\\xff\\xff <-> __8",
            <<"\xff\xff">>,
            <<"__8">>
        },
        {
            "\\xff\\xff\\xff <-> ____",
            <<"\xff\xff\xff">>,
            <<"____">>
        },
        {
            "\\xff\\xff\\xff\\xff <-> _____w",
            <<"\xff\xff\xff\xff">>,
            <<"_____w">>
        },
        {
            "\\xfb <-> -w",
            <<"\xfb">>,
            <<"-w">>
        }
    ],
    F = fun({Name, Decoded, Encoded}) ->
        ActualEncoded = b64_urlsafe:encode(Decoded),
        ActualDecoded = b64_urlsafe:decode(Encoded),
        {Name, [
            ?_assertEqual(Decoded, ActualDecoded),
            ?_assertEqual(Encoded, ActualEncoded)
        ]}
    end,
    lists:map(F, Cases).
