# `co_yield`

`co_yield` is used to produce a value from a coroutine, commonly for generator-style coroutines.

```cpp
Generator<int> numbers()
{
    co_yield 10;
    co_yield 20;
    co_yield 30;
}
```

Conceptually:

```text
produce 10 → suspend
resume
produce 20 → suspend
resume
produce 30 → suspend
resume
complete
```

## Relationship to `co_await`

`co_yield` is closely connected to the coroutine promise.

Conceptually, yielding a value involves the promise's yield mechanism:

```cpp
promise.yield_value(value);
```

The returned awaiter determines suspension behavior.

## Generator Pattern

A consumer might use:

```cpp
for (int value : numbers()) {
    std::cout << value;
}
```

The exact syntax depends on the generator type.

## Important

`co_yield` does not return from the coroutine permanently. It suspends it so execution can later continue after the yield point.
