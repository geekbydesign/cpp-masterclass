# `noexcept`

`noexcept` specifies that a function is not expected to let exceptions escape.

```cpp
void process() noexcept
{
    // ...
}
```

If an exception propagates out of a `noexcept` function, `std::terminate()` is called.

## Conditional `noexcept`

```cpp
template <typename T>
void move_item(T& value) noexcept(noexcept(T(std::move(value))))
{
}
```

The inner `noexcept(...)` operator checks whether an expression is non-throwing.

## Common Use

Move constructors and move operations are often marked `noexcept` when they truly cannot throw:

```cpp
class Buffer {
public:
    Buffer(Buffer&& other) noexcept;
};
```

This can allow standard containers to prefer moving during reallocation.

## Important
Do not mark a function `noexcept` merely for performance. It is a correctness contract.
