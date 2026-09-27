# Coroutine Infrastructure

C++ coroutine support is built around a few important types and customization points.

## `promise_type`

The coroutine's return type provides a nested `promise_type`.

Conceptually:

```cpp
struct Generator {
    struct promise_type {
        // coroutine policy/state
    };
};
```

The promise controls important parts of coroutine behavior.

## `std::coroutine_handle`

The handle represents a reference to a coroutine's execution state.

```cpp
std::coroutine_handle<promise_type> handle;
```

Common operations include:

```cpp
handle.resume();
handle.done();
handle.destroy();
```

## `std::suspend_always`

An awaiter that always suspends.

```cpp
std::suspend_always initial_suspend() noexcept;
```

## `std::suspend_never`

An awaiter that never suspends at that point.

```cpp
std::suspend_never final_suspend() noexcept;
```

## Simplified Structure

```text
Coroutine return object
        ↓
   promise_type
        ↓
 coroutine frame
        ↑
coroutine_handle
```

## Important

The standard coroutine machinery is low-level infrastructure. Most application code should normally use a higher-level coroutine abstraction rather than manually managing every detail.
