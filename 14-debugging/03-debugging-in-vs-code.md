# Debugging in VS Code

VS Code uses a C++ debugger appropriate for the selected toolchain.

Common combinations include:

- MSVC on Windows
- GDB
- LLDB

## Basic setup

Install the Microsoft C/C++ extension and ensure the compiler/debugger are available.

A typical project may contain:

```text
project/
├── main.cpp
└── .vscode/
    └── launch.json
```

## Breakpoints

Click the gutter beside a source line to create a breakpoint.

Use **Run and Debug** to start a debug session.

## Debug controls

```text
Continue
Step Over
Step Into
Step Out
Restart
Stop
```

## Debug sidebar

Common sections include:

- Variables
- Watch
- Call Stack
- Breakpoints

## Watch expressions

Useful examples:

```cpp
i
values[index]
object.member
```

## Conditional breakpoint

Right-click a breakpoint and add a condition such as:

```cpp
i == 100
```

This prevents stopping on every iteration.

## Debug Console

Use the Debug Console to inspect expressions supported by the debugger.

## Example

```cpp
int sum = 0;

for (int i = 0; i < 10; ++i)
{
    sum += i; // breakpoint
}
```

Inspect:

```text
i
sum
```

Then Step Over to observe changes.

## Breakpoint not hit

Check:

- debug information is generated
- correct executable is launched
- source matches the executable
- optimization is not interfering with source-level debugging
- debugger configuration is correct

## Unexpected variable values

Check:

- optimization level
- variable lifetime/scope
- current stack frame
- whether undefined behavior already occurred

## Interview checklist

```text
Breakpoint → pause
Step Over  → execute current line
Step Into  → enter function
Step Out   → leave function
Continue   → resume
Call Stack → inspect callers
Watch      → monitor expressions
```
