# ZkgletOYNE - Erlang gen_server Example

This is a simple Erlang gen_server implementation that manages a counter state. The module name was randomly generated as `ZkgletOYNE`.

## Files

- `ZkgletOYNE.erl` - The main gen_server implementation
- `ZkgletOYNE_app.erl` - Application behavior module
- `ZkgletOYNE_sup.erl` - Supervisor for the gen_server
- `ZkgletOYNE.app` - Application specification file
- `Makefile` - Build file for compiling the application

## Prerequisites

You need to have Erlang installed on your system. For installation instructions, visit the [official Erlang website](https://www.erlang.org/downloads).

## Compilation

To compile the application, run:

```bash
make compile
```

## Usage

After compilation, you can start an Erlang shell and interact with the gen_server:

```erlang
% Start the application
application:start(ZkgletOYNE).

% Increment the counter
ZkgletOYNE:increment().

% Decrement the counter
ZkgletOYNE:decrement().

% Get the current count
ZkgletOYNE:get_count().

% Stop the server
ZkgletOYNE:stop().
```

## API

- `start_link()` - Starts the gen_server
- `increment()` - Increments the counter by 1
- `decrement()` - Decrements the counter by 1
- `get_count()` - Returns the current counter value
- `stop()` - Stops the gen_server

## Cleaning up

To remove compiled files:

```bash
make clean
```