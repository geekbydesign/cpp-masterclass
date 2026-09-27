# Coroutines

C++20 introduced language support for coroutines.

Coroutines allow a function to suspend and later resume execution.

## Core Keywords

```cpp
co_await
co_yield
co_return
```

A function containing these keywords can become a coroutine.

## `co_yield`

Conceptually useful for generators:

```cpp
Generator<int> numbers()
{
    co_yield 1;
    co_yield 2;
    co_yield 3;
}
```

The exact `Generator` type is a library abstraction; C++20 provides the coroutine machinery rather than a universal standard generator type.

## `co_return`

Ends a coroutine and optionally provides a result to the coroutine's promise machinery.

```cpp
co_return;
```

## `co_await`

Suspends execution according to an awaitable/awaiter protocol:

```cpp
co_await some_operation();
```

## Coroutine Infrastructure

Important types/concepts include:

```cpp
std::coroutine_handle<>
```

and a user-defined:

```cpp
promise_type
```

The compiler transforms the coroutine into machinery involving:
- Coroutine frame.
- Promise object.
- Suspension points.
- Resume/destroy operations.

## Important

Coroutines are **not threads**.

A coroutine can suspend and resume on the same thread unless a surrounding scheduler/asynchronous framework arranges otherwise.

## Common Uses

- Generators.
- Asynchronous workflows.
- Event-driven code.
- Cooperative state machines.

## Interview Point

Know the distinction:

```text
thread    → execution resource
coroutine → suspendable/resumable execution mechanism
```
