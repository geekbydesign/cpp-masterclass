# Call Stack

The **call stack** tracks active function calls during program execution.

```cpp
void functionC() { /* breakpoint */ }

void functionB() { functionC(); }

void functionA() { functionB(); }

int main() { functionA(); }
```

When execution reaches `functionC()`:

```text
functionC()
functionB()
functionA()
main()
```

The most recent call is at the top.

## Stack frame

Each active function call has a stack frame containing information such as:

- parameters
- local variables
- return information
- calling information

A debugger can show these frames in the **Call Stack** window.

## Why it matters

Use the call stack to:

- find the caller of a failing function
- understand execution flow
- inspect caller context
- debug crashes and exceptions

## Recursion

Recursive calls create multiple frames of the same function:

```text
factorial(4)
factorial(3)
factorial(2)
factorial(1)
```

Each invocation has its own parameters and local state.

## Stack overflow

Excessive recursion or large stack allocations can exhaust stack space.

```cpp
void recurse()
{
    recurse();
}
```

## Interview point

The call stack shows the **active chain of function calls**. Each stack frame represents one active function invocation.
