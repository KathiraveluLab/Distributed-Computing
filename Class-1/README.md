# Homework before class 2
Please install Erlang and read a bit about it (https://www.erlang.org/doc/readme.html) before the next class.
In Ubuntu, the installation will be
````
$ sudo apt install erlang
````

To install in Windows, fetch the [installer](https://www.erlang.org/downloads) and install it. 

We are not mastering Erlang and its syntax here. Just using it as a vehicle to practice what we discuss in class.

In Linux distributions, such as Ubuntu, you can open the Erlang commandline by using the erl command, by running it from the same directory as your code.
````
$ erl
````

In Windows, after installing Erlang through the Installer, you can simply open the Erlang commandline using your Search bar (the same way you find any installed application).

This folder has the necessary erl files. Practice the code using the following commands.

% Compile the modules
2> c(publisher).
{ok,publisher}

3> c(subscriber).
{ok,subscriber}

% Start the publisher
4> PublisherPid = spawn(publisher, start, []).
<0.96.0>

% Start some subscribers
5> Subscriber1 = spawn(subscriber, start, [PublisherPid]).
<0.98.0>
6> Subscriber2 = spawn(subscriber, start, [PublisherPid]).
<0.100.0>

% Publish a message from the publisher to subscribers
7> PublisherPid ! {publish, "Hello, Subscribers!"}.
Received message: "Hello, Subscribers!"
Received message: "Hello, Subscribers!"
{publish,"Hello, Subscribers!"}

% Unsubscribe one subscriber
8> PublisherPid ! {unsubscribe, Subscriber1}.
{unsubscribe,<0.98.0>}

% Publish a message from the publisher to subscribers (the remaining one subscriber).
9> PublisherPid ! {publish, "Goodbye, Subscriber1!"}.
Received message: "Goodbye, Subscriber1!"
{publish,"Goodbye, Subscriber1!"}

% Stop a subscriber
10> Subscriber2 ! stop.
Subscriber stopping.
stop
11> 
````
