# Debugging in Visual Studio

Visual Studio provides an integrated debugger for C++ applications.

## Breakpoints

Click the left margin beside a source line.

Execution pauses when that line is reached.

## Debug controls

Important commands:

- Continue
- Step Over
- Step Into
- Step Out
- Restart
- Stop

## Locals

The **Locals** window displays variables in the current scope:

- local variables
- parameters
- object state

## Autos

The **Autos** window shows variables relevant to the current and nearby statements.

## Watch

Watch windows allow you to monitor expressions:

```cpp
index
buffer[index]
object.value
```

## Call Stack

The Call Stack window shows active calls:

```text
Worker::process()
Controller::run()
main()
```

Selecting another frame can allow inspection of that caller's context.

## Immediate Window

The Immediate window can evaluate expressions while debugging.

## Conditional breakpoints

Configure a breakpoint to stop only when a condition is true:

```cpp
index == 100
```

Useful inside large loops.

## Data breakpoints

Visual Studio supports data breakpoints for supported debugger/platform combinations. They can stop execution when a watched memory location changes.

## Exception settings

The debugger can be configured to break when exceptions are thrown instead of waiting until a later catch or failure.

## Workflow

```text
Breakpoint
    ↓
Start Debugging
    ↓
Inspect Locals
    ↓
Step Into / Step Over
    ↓
Inspect Call Stack
    ↓
Watch / Conditional breakpoint
    ↓
Find incorrect state
```

## Common issues

If a breakpoint is not hit, check:

- Debug configuration
- correct startup project
- correct executable
- source/executable synchronization
- compiler optimization

## Interview checklist

Know how to use:

```text
Breakpoints
Locals
Watch
Call Stack
Step Into
Step Over
Step Out
Exception settings
Conditional breakpoints
```
