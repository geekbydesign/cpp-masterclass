# `co_await`

`co_await` suspends a coroutine while working with an awaitable operation.

```cpp
auto value = co_await operation;
```

Conceptually:

```text
check awaitable
      ↓
should suspend?
   ↙       ↘
 yes        no
 ↓          ↓
suspend    continue
 ↓
resume later
 ↓
obtain result
```

## Awaitable

An awaitable/awaiter determines how the coroutine interacts with the suspension point.

Important operations include:

```cpp
await_ready()
await_suspend(...)
await_resume()
```

Conceptually:

```cpp
struct Awaiter {
    bool await_ready();
    void await_suspend(std::coroutine_handle<> h);
    T await_resume();
};
```

The exact valid return types and behavior are defined by the coroutine protocol.

## `await_suspend`

This is commonly where a coroutine hands control to an asynchronous system or arranges a later resumption.

## `await_resume`

Provides the value/result after resumption.

## Important

`co_await` itself does not automatically make an operation asynchronous. The awaitable determines what suspension and resumption mean.
