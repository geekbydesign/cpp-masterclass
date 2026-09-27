# Coroutine Keywords

C++20 introduces three coroutine keywords.

## `co_await`

Suspends the coroutine until an awaitable operation reaches its required state.

```cpp
co_await operation;
```

## `co_yield`

Produces a value and normally suspends the coroutine.

```cpp
co_yield value;
```

It is commonly used to implement generators.

## `co_return`

Completes the coroutine and optionally provides a final result.

```cpp
co_return value;
```

or:

```cpp
co_return;
```

## Important

A function containing one of these coroutine keywords is treated as a coroutine according to the language rules.

The return type must provide the appropriate coroutine interface through its `promise_type`.

## Quick Comparison

| Keyword | Purpose |
|---|---|
| `co_await` | Await/suspend around an awaitable operation |
| `co_yield` | Produce a value and suspend |
| `co_return` | Complete the coroutine |
