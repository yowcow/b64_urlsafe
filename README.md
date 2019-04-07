b64_urlsafe
===========

Erlang-port of Perl module [MIME::Base64::URLSafe](https://metacpan.org/pod/MIME::Base64::URLSafe).

Build
-----

    $ rebar3 compile
    $ rebar3 dialyzer
    $ rebar3 eunit

How to Use
----------

    1> Msg = b64_urlsafe:encode(<<"Original Message">>).
    <<"T3JpZ2luYWwgTWVzc2FnZQ">>

    2> b64_urlsafe:decode(Msg).
    <<"Original Message">>

See Also
--------

* https://metacpan.org/pod/MIME::Base64::URLSafe
* https://packagist.org/packages/yowcow/mime-base64-urlsafe
