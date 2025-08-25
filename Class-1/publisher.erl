-module(publisher).
-export([start/0]).

start() ->
    loop([]).

loop(Subscribers) ->
    receive
        {subscribe, Subscriber} ->
            NewSubscribers = [Subscriber | Subscribers],
            loop(NewSubscribers);

        {unsubscribe, Subscriber} ->
            NewSubscribers = lists:delete(Subscriber, Subscribers),
            loop(NewSubscribers);

        {publish, Message} ->
            %% Send the message to all subscribers
            [Subscriber ! {notification, Message} || Subscriber <- Subscribers],
            loop(Subscribers)
    end.

