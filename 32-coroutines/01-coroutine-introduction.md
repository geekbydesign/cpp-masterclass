# Coroutine Introduction

A coroutine is a function that can suspend its execution and later resume from the suspension point.

C++20 introduced language support for coroutines.

Unlike a normal function:

```text
normal function
    call
      ↓
    execute
      ↓
   return
```

a coroutine can:

```text
call
 ↓
execute
 ↓
suspend
 ↓
resume
 ↓
execute
 ↓
complete
```

## Why Coroutines?

Coroutines are useful for:
- Generators.
- Lazy sequences.
- Asynchronous operations.
- Cooperative state machines.
- Event-driven workflows.

## Important

A coroutine is not automatically a thread.

It can suspend and resume without creating a new operating-system thread.

## Simple Concept

```cpp
Generator<int> numbers()
{
    co_yield 1;
    co_yield 2;
    co_yield 3;
}
```

Conceptually, each `co_yield` suspends the coroutine and allows the caller/consumer to obtain a value.

## C++ Version

Coroutines are a **C++20** language feature.

The standard provides coroutine language machinery, but it does not provide one universal high-level `std::generator` type in C++20. Library types can be built on top of the coroutine machinery.
