# `if constexpr`

C++17 introduced `if constexpr` for compile-time conditional compilation inside templates.

## Basic Example

```cpp
template <typename T>
void print(T value)
{
    if constexpr (std::is_integral_v<T>)
    {
        std::cout << "integer";
    }
    else
    {
        std::cout << "non-integer";
    }
}
```

## Normal `if` vs `if constexpr`

With a normal `if`, both branches generally have to be valid after template instantiation.

With `if constexpr`, the discarded branch is not instantiated for the selected condition.

```cpp
template <typename T>
void process(T value)
{
    if constexpr (std::is_pointer_v<T>)
    {
        std::cout << *value;
    }
    else
    {
        std::cout << value;
    }
}
```

For a non-pointer type, the pointer branch is discarded.

## Why Useful?

It replaces many cases where older C++ code needed:
- Template specialization.
- SFINAE.
- Helper overloads.

## Compile-Time Condition

The condition must be a constant expression.

```cpp
if constexpr (sizeof(T) > 4)
{
}
```

## Important

`if constexpr` is especially useful when different types require different valid operations.

## Interview Point

The key distinction is:

```text
if          → runtime selection
if constexpr → compile-time selection
```

The discarded branch of an `if constexpr` is not instantiated for the specialization.
