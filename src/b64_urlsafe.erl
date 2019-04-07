-module(b64_urlsafe).

-export([
    encode/1,
    decode/1
]).

-define(PADDING, 4).
-define(PAD, <<"====">>).

-spec padding(integer()) -> binary().
padding(0)    -> <<>>;
padding(Size) -> binary:part(?PAD, {0, ?PADDING - Size}).

-spec encode(binary()) -> binary().
encode(Bin) ->
    Encoded0 = base64:encode(Bin),
    Encoded1 = binary:replace(Encoded0, <<"=">>, <<>>, [global]),
    Encoded2 = binary:replace(Encoded1, <<"+">>, <<"-">>, [global]),
    Encoded3 = binary:replace(Encoded2, <<"/">>, <<"_">>, [global]),
    Encoded3.

-spec decode(binary()) -> binary().
decode(Bin) ->
    Bin0 = binary:replace(Bin, <<"_">>, <<"/">>, [global]),
    Bin1 = binary:replace(Bin0, <<"-">>, <<"+">>, [global]),
    Padding = padding(byte_size(Bin1) rem ?PADDING),
    Bin2 = <<Bin1/binary, Padding/binary>>,
    base64:decode(Bin2).
