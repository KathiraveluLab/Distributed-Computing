-module(subscriber).
-export([start/1]).

start(PublisherPid) ->
    %% Subscribe to the publisher
    PublisherPid ! {subscribe, self()},
    loop().

loop() ->
    receive
        {notification, Message} ->
            io:format("Received message: ~p~n", [Message]),
            loop();

        stop ->
            io:format("Subscriber stopping.~n"),
            ok
    end.

