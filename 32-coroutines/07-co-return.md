# `co_return`

`co_return` completes a coroutine.

```cpp
Task<int> calculate()
{
    co_return 42;
}
```

It can also be used without a value:

```cpp
Task<void> process()
{
    co_return;
}
```

## Promise Interaction

For a coroutine return type, `co_return value` is associated with the promise's return-value handling.

Conceptually:

```cpp
promise.return_value(value);
```

For a void-like coroutine:

```cpp
promise.return_void();
```

The exact requirements depend on the coroutine return type.

## `co_return` vs `return`

Inside a coroutine, use `co_return` for coroutine completion.

```cpp
co_return result;
```

The coroutine then proceeds toward its final-suspension behavior.

## Important

Completing the coroutine is different from destroying its coroutine frame. The frame may remain alive until the owning coroutine handle/return object destroys it, depending on the coroutine design.
