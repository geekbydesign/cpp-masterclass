# Debugging Basics

Debugging means finding and understanding the cause of incorrect program behavior.

## Debug build

A debugger needs debug information to provide useful source-level details such as:

- source locations
- variable names
- function names
- line mappings

## Breakpoint

A breakpoint pauses execution at a selected line.

```cpp
int result = calculate(value); // breakpoint
```

## Step Over

Executes the current line without entering a called function.

## Step Into

Enters the called function.

## Step Out

Runs until the current function returns.

## Continue

Resumes execution until another breakpoint or debugger stop condition.

## Locals / Variables

Inspect:

- local variables
- parameters
- object members

## Watch

Monitor expressions such as:

```cpp
counter
ptr
array[index]
object.member
```

## Conditional breakpoint

Pause only when a condition is true:

```cpp
i == 50
```

Very useful inside loops.

## Exception debugging

Breaking when an exception is thrown can reveal the original problem before it propagates to a later catch block.

## Typical workflow

```text
Reproduce
   ↓
Set breakpoint
   ↓
Inspect variables
   ↓
Step through execution
   ↓
Check call stack
   ↓
Find incorrect state
   ↓
Fix root cause
   ↓
Verify
```

## Good habits

- Reproduce the issue reliably.
- Inspect state instead of guessing.
- Find where state first becomes incorrect.
- Check the call stack.
- Use conditional breakpoints for loops.
- Verify the fix with a test.

## Interview point

The goal is not merely to step through code. Find **where program state first becomes incorrect and why**.
